Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 79C0165D34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 15:13:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,458,1400018400"; d="scan'208";a="52690934"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 11 Jun 2014 17:13:49 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 11 Jun 2014 17:13:49 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 11 Jun 2014 17:13:49 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jun 2014 17:13:51 +0200
Message-ID: <1402499631-12101-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] id3lib: fix autoheader warning due to missing AC_DEFINE template
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
X-List-Received-Date: Wed, 11 Jun 2014 15:14:01 -0000
Content-Type: text/plain

For more information:
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg36641.html

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../id3lib/id3lib/acdefine.patch                   | 42 ++++++++++++++++++++++
 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch b/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch
new file mode 100644
index 0000000..09edecc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib/acdefine.patch
@@ -0,0 +1,42 @@
+Add a description to the AC_DEFINE statements so that it appears in config.h and silences a fatal warning.
+
+Upstream-Status:Pending
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ configure.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index abfe4cd..ce0d380 100644
+--- a/configure.in
++++ b/configure.in
+@@ -168,7 +168,7 @@ if test $has_iconv = 1; then
+ 		iconv_oldstyle=1, iconv_oldstyle=0)
+   if test $iconv_oldstyle = 1; then
+     AC_MSG_RESULT(const char **)
+-    AC_DEFINE(ID3LIB_ICONV_OLDSTYLE)
++    AC_DEFINE(ID3LIB_ICONV_OLDSTYLE,[1],[Old iconv prototype definition in iconv.h])
+     #we'll check out the need of
+     #typecast in the call of iconv_open
+     AC_MSG_CHECKING(whether to typecast in iconv)
+@@ -184,7 +184,7 @@ if test $has_iconv = 1; then
+                    iconv_cast=0, iconv_cast=1)
+     if test $iconv_cast = 1; then
+       AC_MSG_RESULT(yes)
+-      AC_DEFINE(ID3LIB_ICONV_CAST_OK)
++      AC_DEFINE(ID3LIB_ICONV_CAST_OK,[1],[Accepting const char ** in iconv prototype])
+     else
+       AC_MSG_RESULT(no)
+     fi
+@@ -206,7 +206,7 @@ if test $has_iconv = 1; then
+                    iconv_cast=0, iconv_cast=1)
+     if test $iconv_cast = 1; then
+       AC_MSG_RESULT(yes)
+-      AC_DEFINE(ID3LIB_ICONV_CAST_OK)
++      AC_DEFINE(ID3LIB_ICONV_CAST_OK,[1],[Accepting const char ** in iconv prototype])
+     else
+       AC_MSG_RESULT(no)
+     fi
+-- 
+2.0.0
+
diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index 3089b8e..fc80cc0 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -8,6 +8,7 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
+           file://acdefine.patch \
 "
 SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
-- 
2.0.0


