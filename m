Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADFA71A5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 02:59:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAU2x1JA005200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:59:02 -0800 (PST)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 29 Nov 2016 18:59:01 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Date: Wed, 30 Nov 2016 10:56:38 +0800
Message-ID: <1480474598-8680-2-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1480474598-8680-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1480474598-8680-1-git-send-email-Haiqing.Bai@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] crda: check the word size of target instead of host machine.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2016 02:59:01 -0000
Content-Type: text/plain

Issue: LIN8-5177

When 'USE_OPENSSL=1' is configured for crda, key2pub.py doesn't
create "keys-ssl.c" with target's word size. Pass 'SITEINFO_BITS'
from building system to key2pub.py.

(LOCAL REV: NOT UPSTREAM) -- sent to oe-devel on 20161130

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch  | 58 ++++++++++++++++++++++
 .../use-target-word-size-instead-of-host-s.patch   | 34 +++++++++++++
 .../recipes-connectivity/crda/crda_3.18.bb         |  7 ++-
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
 create mode 100644 meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch

diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
new file mode 100644
index 0000000..93c836c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
@@ -0,0 +1,58 @@
+From 8d2164a090f17286ea8291f30a123595cf447dc3 Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Wed, 30 Nov 2016 10:27:36 +0800
+Subject: [PATCH] crda: fix issues when 'USE_OPENSSL=1'.
+
+Fxed the below issues if configured with 'USE_OPENSSL=1':
+a. keys-ssl.c uses BN_ULONG but doesn't include the openssl headers leading
+   to build failures:
+   keys-ssl.c:2:8: error: unknown type name 'BN_ULONG'
+   static BN_ULONG e_0[1] = {
+
+b. The large unqualified constants also break building:
+   keys-ssl.c:8:2: warning: overflow in implicit constant conversion [-Woverflow]
+     0x63a2705416a0d8e1, 0xdc9fca11c8ba757b,
+
+c. keys-ssl.c: error: 'keys' defined but not used [-Werror=unused-variable]
+   static struct pubkey keys[] = {
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Upsteam-Status: Pending
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ utils/key2pub.py | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/utils/key2pub.py b/utils/key2pub.py
+index 401d58a..3ae00b8 100755
+--- a/utils/key2pub.py
++++ b/utils/key2pub.py
+@@ -24,7 +24,7 @@ def print_ssl_64(output, name, val):
+     for v1, v2, v3, v4, v5, v6, v7, v8 in vnew:
+         if not idx:
+             output.write('\t')
+-        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2x, ' % (ord(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
++        output.write('0x%.2x%.2x%.2x%.2x%.2x%.2x%.2x%.2xULL, ' % (ord(v1), ord(v2), ord(v3), ord(v4), ord(v5), ord(v6), ord(v7), ord(v8)))
+         idx += 1
+         if idx == 2:
+             idx = 0
+@@ -60,6 +60,7 @@ def print_ssl_32(output, name, val):
+ def print_ssl(output, name, val):
+     import os
+     output.write('#include <stdint.h>\n')
++    output.write('#include <openssl/bn.h>\n')
+     if os.getenv('TARGET_BITS') == '64':
+         return print_ssl_64(output, name, val)
+     else:
+@@ -78,7 +79,7 @@ struct pubkey {
+ 
+ #define KEYS(e,n)	{ KEY(e), KEY(n), }
+ 
+-static struct pubkey keys[] = {
++static struct pubkey keys[] __attribute__((unused))= {
+ ''')
+     for n in xrange(n + 1):
+         output.write('	KEYS(e_%d, n_%d),\n' % (n, n))
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
new file mode 100644
index 0000000..100b765
--- /dev/null
+++ b/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
@@ -0,0 +1,34 @@
+From c1c42513edd27c97341f2033af77c13a4724eb8f Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 25 Nov 2016 16:48:01 +0800
+Subject: [PATCH] crda: Use target word size instead of host's.
+
+In key2pub.py, the codes check the wordsize
+of the host machine but not the target's, this fix
+fetches the wordsize of target from the build system.
+
+Upstream-Status: Pending
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ utils/key2pub.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/utils/key2pub.py b/utils/key2pub.py
+index 3e84cd2..401d58a 100755
+--- a/utils/key2pub.py
++++ b/utils/key2pub.py
+@@ -58,9 +58,9 @@ def print_ssl_32(output, name, val):
+     output.write('};\n\n')
+ 
+ def print_ssl(output, name, val):
+-    import struct
++    import os
+     output.write('#include <stdint.h>\n')
+-    if len(struct.pack('@L', 0)) == 8:
++    if os.getenv('TARGET_BITS') == '64':
+         return print_ssl_64(output, name, val)
+     else:
+         return print_ssl_32(output, name, val)
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
index 4d8824a..fd68ca6 100644
--- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
@@ -5,12 +5,14 @@ LICENSE = "copyleft-next-0.3.0 & ISC"
 LIC_FILES_CHKSUM = "file://copyleft-next-0.3.0;md5=8743a2c359037d4d329a31e79eabeffe \
                     file://${WORKDIR}/wireless-regdb-2014.11.18/LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
-DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
+DEPENDS = "python-m2crypto-native python-native libgcrypt libnl openssl"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/crda/${BP}.tar.xz;name=crda \
            https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2014.11.18.tar.xz;name=bin \
            file://do-not-run-ldconfig-if-destdir-is-set.patch \
            file://fix-linking-of-libraries-used-by-reglib.patch \
+           file://use-target-word-size-instead-of-host-s.patch \
+           file://fix-issues-when-USE_OPENSSL-1.patch \
 "
 SRC_URI[crda.md5sum] = "0431fef3067bf503dfb464069f06163a"
 SRC_URI[crda.sha256sum] = "43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf"
@@ -21,6 +23,9 @@ SRC_URI[bin.sha256sum] = "eab6b50f30748a8b0065ba38cf3df05aac161a5861ae0a6c3cfd01
 inherit python-dir pythonnative
 # Recursive make problem
 EXTRA_OEMAKE = "MAKEFLAGS= DESTDIR=${D} LIBDIR=${libdir}/crda LDLIBREG='-Wl,-rpath,${libdir}/crda -lreg'"
+EXTRA_OEMAKE_append = " USE_OPENSSL=1"
+TARGET_BITS = "${SITEINFO_BITS}"
+export TARGET_BITS
 
 do_compile() {
     oe_runmake all_noverify
-- 
1.9.1


