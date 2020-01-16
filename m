Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD2147F489
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 18:43:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00GIh8Vv015147
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 10:43:24 -0800
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 16 Jan 2020 10:43:10 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 13:43:07 -0500
Message-ID: <874kwvkzt0.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [PATCH] openssh: applied upstream fix for "cert not yet valid" test
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
X-List-Received-Date: Thu, 16 Jan 2020 18:43:33 -0000
Content-Type: text/plain


applied upstream fix for openssh's "cert not yet valid" test

Upstream Status: Backport:
    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381

Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>

---
 ...pplied-upstream-fix-for-openssh-test.patch | 60 +++++++++++++++++++
 .../openssh/openssh_8.1p1.bb                  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
new file mode 100644
index 0000000000..64cd2fe717
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
@@ -0,0 +1,60 @@
+From 0a68d6cfe255f8bcdd5f9db0d008a8f0a60b237a Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
+Date: Wed, 15 Jan 2020 15:51:42 -0500
+Subject: [PATCH] Manually applied upstream fix for openssh test
+
+Upstream Status: Backport:
+    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381
+
+Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
+---
+ regress/cert-hostkey.sh | 4 ++--
+ regress/cert-userkey.sh | 5 ++---
+ 2 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
+index 86ea6250..60e3ec02 100644
+--- a/regress/cert-hostkey.sh
++++ b/regress/cert-hostkey.sh
+@@ -1,4 +1,4 @@
+-#	$OpenBSD: cert-hostkey.sh,v 1.18 2019/07/25 08:28:15 dtucker Exp $
++#	$OpenBSD: cert-hostkey.sh,v 1.23 2020/01/03 03:02:26 djm Exp $
+ #	Placed in the Public Domain.
+
+ tid="certified host keys"
+@@ -252,7 +252,7 @@ test_one() {
+ test_one "user-certificate"	failure "-n $HOSTS"
+ test_one "empty principals"	success "-h"
+ test_one "wrong principals"	failure "-h -n foo"
+-test_one "cert not yet valid"	failure "-h -V20200101:20300101"
++test_one "cert not yet valid"	failure "-h -V20300101:20320101"
+ test_one "cert expired"		failure "-h -V19800101:19900101"
+ test_one "cert valid interval"	success "-h -V-1w:+2w"
+ test_one "cert has constraints"	failure "-h -Oforce-command=false"
+diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
+index 38c14a69..f0e30945 100644
+--- a/regress/cert-userkey.sh
++++ b/regress/cert-userkey.sh
+@@ -1,4 +1,4 @@
+-#	$OpenBSD: cert-userkey.sh,v 1.21 2019/07/25 08:28:15 dtucker Exp $
++#	$OpenBSD: cert-userkey.sh,v 1.25 2020/01/03 03:02:26 djm Exp $
+ #	Placed in the Public Domain.
+
+ tid="certified user keys"
+@@ -338,7 +338,7 @@ test_one() {
+ test_one "correct principal"	success "-n ${USER}"
+ test_one "host-certificate"	failure "-n ${USER} -h"
+ test_one "wrong principals"	failure "-n foo"
+-test_one "cert not yet valid"	failure "-n ${USER} -V20200101:20300101"
++test_one "cert not yet valid"	failure "-n ${USER} -V20300101:20320101"
+ test_one "cert expired"		failure "-n ${USER} -V19800101:19900101"
+ test_one "cert valid interval"	success "-n ${USER} -V-1w:+2w"
+ test_one "wrong source-address"	failure "-n ${USER} -Osource-address=10.0.0.0/8"
+@@ -399,4 +399,3 @@ done
+
+ rm -f $OBJ/authorized_keys_$USER $OBJ/user_ca_key* $OBJ/cert_user_key*
+ rm -f $OBJ/authorized_principals_$USER
+-
+--
+2.24.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
index f8be7ba178..8e7896cf4a 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://openssh-8.1p1-seccomp-nanosleep.patch \
            file://0001-seccomp-Allow-clock_gettime64-in-sandbox.patch \
+           file://0001-Manually-applied-upstream-fix-for-openssh-test.patch \
            "
 SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
 SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
--
2.24.0

