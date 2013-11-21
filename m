Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4BE96C741
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2013 03:27:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL3RZox025605
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 19:27:35 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 19:27:34 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Nov 2013 11:27:40 +0800
Message-ID: <1385004460-3166-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] quagga: Backport a patch to fix extract.pl for cross compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2013 03:27:37 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...uild-fix-extract.pl-for-cross-compilation.patch |   31 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
new file mode 100644
index 0000000..e3ccc2a
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl-for-cross-compilation.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Backport
+
+From ed6e297972318a0070ad4d973401fbc6e0def558 Mon Sep 17 00:00:00 2001
+From: Serj Kalichev <serj.kalichev@gmail.com>
+Date: Fri, 7 Sep 2012 13:29:42 +0400
+Subject: [PATCH] build: fix extract.pl for cross compilation
+
+extract.pl should invoke the C preprocessor for the target system, not the
+host.
+
+* vtysh/extract.pl.in: use @CPP@ to get target cpp
+---
+ vtysh/extract.pl.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/vtysh/extract.pl.in b/vtysh/extract.pl.in
+index 7612aff..4c3a47f 100755
+--- a/vtysh/extract.pl.in
++++ b/vtysh/extract.pl.in
+@@ -63,7 +63,7 @@ $ignore{'"show history"'} = "ignore";
+ foreach (@ARGV) {
+     $file = $_;
+ 
+-    open (FH, "cpp -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
++    open (FH, "@cpp@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
+     local $/; undef $/;
+     $line = <FH>;
+     close (FH);
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index 10740bc..ae93952 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -3,7 +3,9 @@ require quagga.inc
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
-            file://lingering-IP-address-after-deletion-BZ-486.patch"
+            file://lingering-IP-address-after-deletion-BZ-486.patch \
+            file://build-fix-extract.pl-for-cross-compilation.patch \
+"
 
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
 SRC_URI[quagga-0.99.21.sha256sum] = "9b8aea9026b4771a28e254a66cbd854723bcd0d71eebd0201d11838d4eb392ee"
-- 
1.7.10.4


