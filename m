Return-Path: <craig@unreasonablefarm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B020C636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 17:17:44 +0000 (UTC)
Received: from chi3.army.rockhost.com (chi3.army.rockhost.com [173.236.42.122])
 by mx.groups.io with SMTP id smtpd.web10.20.1676654260311468243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 09:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@unreasonablefarm.org header.s=default header.b=d6K5Dnaa;
 spf=pass (domain: unreasonablefarm.org, ip: 173.236.42.122, mailfrom: craig@unreasonablefarm.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unreasonablefarm.org; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6AuqqpOL6sSzshWJ9IoK5OQnhdF82Xg53wETeb2AkFY=; b=d6K5DnaafTqL5jPRt3hb1dgIHL
	rUAZHRjndaGZlrDs3vmxfQSD8+Nd1xLA2KonGBzCth5o0N6fP8n9/xjhyC+AaK8zp7hZVosVnYcI8
	i3Eq03vWQG2oQhwSqswcj6qPNyFYt76PU4GyFdePGXxWIiHDNEmazoMVVFq+LvN55CxpH4t3mVBwC
	NQpc6qC1QGsi9WLtbnpl2cm2AtV3kx0dZGX6ToirUfsyFa0lTVEQIlO+9XvmPhqBMYrBs5NlHgyDb
	chS0TozqQXrEludlSg056qbr1Hzzz9t/PmmjplHIuJjjdyZwOlsC/ayhGtFdHuWXIIa8VW3RaPvDu
	CdFtjlgw==;
Received: from 24-56-146-54-static.midco.net ([24.56.146.54]:36678 helo=mbp.lan)
	by chi3.army.rockhost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <craig@unreasonablefarm.org>)
	id 1pT4MX-004rdN-3B;
	Fri, 17 Feb 2023 11:17:38 -0600
From: craig@unreasonablefarm.org
To: openembedded-devel@lists.openembedded.org
Cc: Craig Comstock <craig@unreasonablefarm.org>
Subject: [PATCH] cfengine: upgrade to 3.21.0
Date: Fri, 17 Feb 2023 11:17:22 -0600
Message-Id: <20230217171722.71333-1-craig@unreasonablefarm.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - chi3.army.rockhost.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - unreasonablefarm.org
X-Get-Message-Sender-Via: chi3.army.rockhost.com: authenticated_id: craig@unreasonablefarm.org
X-Authenticated-Sender: chi3.army.rockhost.com: craig@unreasonablefarm.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Feb 2023 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101122

From: Craig Comstock <craig@unreasonablefarm.org>

Also fixed --with-libxml2=no case in configure.ac
The CF3_WITH_LIBRARY and AC_CHECK_HEADERS were moved to outside of the check for with-libxml2=no
This fix is already merged in cfengine master but will need some time to cherry-pick and arrive in a 3.21.x LTS release.

Ticket: CFE-4023
Changelog: title

Signed-off-by: Craig Comstock <craig@unreasonablefarm.org>
---
 .../cfengine-masterfiles/python3.patch        | 16 ----
 ...15.0.bb => cfengine-masterfiles_3.21.0.bb} |  7 +-
 ...with-libxml2-no-case-in-configure.ac.patch | 87 +++++++++++++++++++
 ...{cfengine_3.15.0.bb => cfengine_3.21.0.bb} | 10 ++-
 4 files changed, 96 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.15.0.bb => cfengine-masterfiles_3.21.0.bb} (81%)
 create mode 100644 meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.15.0.bb => cfengine_3.21.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
deleted file mode 100644
index a6f670126..000000000
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles/python3.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- a/modules/packages/apt_get
-+++ b/modules/packages/apt_get
-@@ -1,4 +1,4 @@
--#!/var/cfengine/bin/python
-+#!/var/cfengine/bin/python3
- 
- import sys
- import os
---- a/modules/packages/apt_get.in
-+++ b/modules/packages/apt_get.in
-@@ -1,4 +1,4 @@
--#!@bindir@/python
-+#!@bindir@/python3
- 
- import sys
- import os
diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb
similarity index 81%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb
index 4ef3fc15a..68d404255 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.0.bb
@@ -18,13 +18,12 @@ or wherever `$(sys.masterdir)` points. \
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f76426f9ef8c6f6739fadd21d817a4f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb843e794feb6890f7697637b461c36e"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
-           file://python3.patch \
            "
-SRC_URI[md5sum] = "6d456fdd9bd24ff6617eeaa05efae602"
-SRC_URI[sha256sum] = "4a071c0c4ba7df9bad93144cff5fbc0566e5172afd66201072e3193b76c55a38"
+#SRC_URI[md5sum] = "5df2f85c75efc351ffadebcc11046a98"
+SRC_URI[sha256sum] = "013ebe68599915cedb4bf753b471713d91901a991623358b9a967d9a779bcc16"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch b/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
new file mode 100644
index 000000000..01d470b83
--- /dev/null
+++ b/meta-oe/recipes-extended/cfengine/cfengine/0001-Fixed-with-libxml2-no-case-in-configure.ac.patch
@@ -0,0 +1,87 @@
+From a08acdfadb5eba2a3201209c6da3ad6f2ca4ae79 Mon Sep 17 00:00:00 2001
+From: Craig Comstock <craig.comstock@northern.tech>
+Date: Fri, 27 Jan 2023 15:19:48 -0600
+Subject: [PATCH] Fixed --with-libxml2=no case in configure.ac
+
+The CF3_WITH_LIBRARY and AC_CHECK_HEADERS were moved to outside of the check for with-libxml2=no
+
+Ticket: CFE-4023
+Changelog: title
+---
+ configure.ac          | 21 +++++++++++----------
+ libntech/configure.ac | 21 +++++++++++----------
+ 2 files changed, 22 insertions(+), 20 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e189b10..f6b8226 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -659,19 +659,20 @@ if test "x$with_libxml2" != "xno"; then
+             LIBXML2_CPPFLAGS=-I$with_libxml2/include/libxml2
+         fi
+     fi
+-fi
+ 
+-CF3_WITH_LIBRARY(libxml2,
+-    [AC_CHECK_LIB(xml2, xmlFirstElementChild,
+-    [],
+-    [if test "x$with_libxml2" != xcheck; then
+-        AC_MSG_ERROR(Cannot find libxml2); fi]
+-    )
+-    AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
++    CF3_WITH_LIBRARY(libxml2,
++        [AC_CHECK_LIB(xml2, xmlFirstElementChild,
++        [],
+         [if test "x$with_libxml2" != xcheck; then
+             AC_MSG_ERROR(Cannot find libxml2); fi]
+-    )]
+-)
++        )
++        AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
++            [if test "x$with_libxml2" != xcheck; then
++                AC_MSG_ERROR(Cannot find libxml2); fi]
++        )]
++    )
++    
++fi
+ 
+ AM_CONDITIONAL([HAVE_LIBXML2],
+     [test "x$with_libxml2" != xno &&
+diff --git a/libntech/configure.ac b/libntech/configure.ac
+index 7bb8787..28b3683 100644
+--- a/libntech/configure.ac
++++ b/libntech/configure.ac
+@@ -571,19 +571,20 @@ if test "x$with_libxml2" != "xno"; then
+             LIBXML2_CPPFLAGS=-I$with_libxml2/include/libxml2
+         fi
+     fi
+-fi
+ 
+-CF3_WITH_LIBRARY(libxml2,
+-    [AC_CHECK_LIB(xml2, xmlFirstElementChild,
+-    [],
+-    [if test "x$with_libxml2" != xcheck; then
+-        AC_MSG_ERROR(Cannot find libxml2); fi]
+-    )
+-    AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
++    CF3_WITH_LIBRARY(libxml2,
++        [AC_CHECK_LIB(xml2, xmlFirstElementChild,
++        [],
+         [if test "x$with_libxml2" != xcheck; then
+             AC_MSG_ERROR(Cannot find libxml2); fi]
+-    )]
+-)
++        )
++        AC_CHECK_HEADERS([libxml/xmlwriter.h], [break],
++            [if test "x$with_libxml2" != xcheck; then
++                AC_MSG_ERROR(Cannot find libxml2); fi]
++        )]
++    )
++
++fi
+ 
+ AM_CONDITIONAL([HAVE_LIBXML2],
+     [test "x$with_libxml2" != xno &&
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
index 1566f8a88..6fa5d2743 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.15.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.21.0.bb
@@ -15,13 +15,15 @@ SKIP_RECIPE[cfengine] ?= "Needs porting to openssl 3.x"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=233aa25e53983237cf0bd4c238af255f"
 
-DEPENDS = "attr tokyocabinet bison-native"
+DEPENDS += "attr tokyocabinet bison-native libxml2"
+#RDEPENDS:cfengine += "attr tokyocabinet bison-native libxml2"
 
-SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
+SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
+           file://0001-Fixed-with-libxml2-no-case-in-configure.ac.patch \
            file://set-path-of-default-config-file.patch \
            "
-SRC_URI[md5sum] = "d4dabfa46d8afa151be5610f184354e7"
-SRC_URI[sha256sum] = "fa53e137f850eb268a8e7ae4578b5db5dc383656341f5053dc1a353ed0288265"
+#SRC_URI[md5sum] = "5318e40702bc66a3ece44ec4ad77712b"
+SRC_URI[sha256sum] = "911778ddb0a4e03a3ddfc8fc0f033136e1551849ea2dcbdb3f0f14359dfe3126"
 
 inherit autotools-brokensep systemd
 
-- 
2.39.2


