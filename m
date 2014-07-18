Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C13D7068C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h2sr030271; Fri, 18 Jul 2014 09:43:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zxw6Azjg593d; Fri, 18 Jul 2014 09:43:02 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gv4a030239
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83ki-0006iE-KE; Fri, 18 Jul 2014 09:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:20 +0100
Message-Id: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/27] onig: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:06 -0000

---
 meta-oe/recipes-support/onig/files/configure.patch | 13 +++++++++++++
 meta-oe/recipes-support/onig/onig_5.9.3.bb         |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/onig/files/configure.patch

diff --git a/meta-oe/recipes-support/onig/files/configure.patch b/meta-oe/recipes-support/onig/files/configure.patch
new file mode 100644
index 0000000..5fa700f
--- /dev/null
+++ b/meta-oe/recipes-support/onig/files/configure.patch
@@ -0,0 +1,13 @@
+Index: onig-5.9.3/configure.in
+===================================================================
+--- onig-5.9.3.orig/configure.in	2012-10-26 07:06:14.000000000 +0000
++++ onig-5.9.3/configure.in	2014-07-18 08:02:52.701574484 +0000
+@@ -3,7 +3,7 @@
+ 
+ AC_CONFIG_MACRO_DIR([m4])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_HEADER(config.h)
+ 
+ 
diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.3.bb
index f67ceed..22db78a 100644
--- a/meta-oe/recipes-support/onig/onig_5.9.3.bb
+++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
@@ -6,7 +6,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
 
 SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz \
-           file://do-not-use-system-headers.patch"
+           file://do-not-use-system-headers.patch \
+           file://configure.patch"
 
 SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
 SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
-- 
2.0.2


