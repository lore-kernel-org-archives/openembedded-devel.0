Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 279A477E13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:02 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k67so1090394wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JZiD85a07MeGa/4LrKK+c3+EjqqcZk5RQ18AaJVJuto=;
	b=cRKmwGBfMGoLFReo04cSadwwGmVBaTlI5Y1bAJIZOlvSUj5RV1C/3aV8hcV24PgOdw
	T3I9bij/j8dTDEGeYH5rbvTn6qj/o1ShSAPBepFhG45Q8gwHIfZ2aGtK9PwIaY9sZAgE
	SBNVcpnjUfbFqZ4jWtapYvAOacPOFEL+v9aWrUY5zl4iPsJhUwLvovkotQC848NpbwMt
	e79XrB0IGBuYsQhX+qgBCyF7ILSG63HCpii1jF1/IVDNRkgY3VqCpPxByaCFo6+I/epb
	xuXSQli1dtYltT5GozYjjQghainHejUXlsAbAW/A7yEgfliGtWeIBkkmpeh1r8mVA/I1
	GM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JZiD85a07MeGa/4LrKK+c3+EjqqcZk5RQ18AaJVJuto=;
	b=sVzDO/hirOqhz/S9IhQdLm7Td3msip9kcFMC6yYbtAdLTyWofsZcg/VGrUvATETROM
	oWiqN74+/9r+IUw6ISVpvmcokK2IYx5A/fvl5REjHkzc/lAeIw7Hl6JeiVI40Kwj20bQ
	SsKU0lFqJxx5vp+tJehJrup/XW+MFBe7wShI9CXP4mDRn+/PR+FM6m3G05G+ATz10mpg
	DZI0WwVCH0+uKsIF2AIP/bXSdMBt7Jw+8r+7UJMz6WEwvfSF/Emmic7QelIdlOzXOv9X
	OvayyVU/ZnhYXMWRBLxdHwoR4esIs+PZPEGh/xqqUKH/Arz4KNje9SPosTjiY5ryx8ng
	kxxQ==
X-Gm-Message-State: AIVw113A3STiNUFciwf0Xg3bq0z2bkPfqwP/LNpv9FXBbhWvVX0OUNsA
	G40KXeuXYca9wGyw
X-Received: by 10.80.175.198 with SMTP id h64mr3222671edd.131.1499791503796;
	Tue, 11 Jul 2017 09:45:03 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:03 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:31 +0200
Message-Id: <1499791478-2407-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 1/8] libsombok3: add recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:03 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Sombok - Unicode Text Segmentation Package.

It's being depended by libunicode-linebreak-perl.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 ...01-configure.ac-fix-cross-compiling-issue.patch | 31 ++++++++++++++++++++++
 .../libsombok3/libsombok3_2.4.0.bb                 | 25 +++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch
 create mode 100644 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb

diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch
new file mode 100644
index 0000000..1a69287
--- /dev/null
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross-compiling-issue.patch
@@ -0,0 +1,31 @@
+From 9c2ffe825e28d63e2a771135f297e8ffac0dbe81 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Tue, 11 Jul 2017 14:35:30 +0200
+Subject: [PATCH] configure.ac: fix cross-compiling issue
+
+Avoid checking for file existence when cross compiling.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ configure.ac | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9978852..06b16e3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,9 +120,6 @@ AC_ARG_WITH(unicode-version,
+   AC_HELP_STRING(--with-unicode-version=VERSION,
+   [version of Unicode Standard @<:@default=current version@:>@]),
+   UNICODE_VERSION=$withval,UNICODE_VERSION=$DEFAULT_UNICODE_VERSION)
+-AC_CHECK_FILE([lib/$UNICODE_VERSION.c],
+-  AC_MSG_RESULT($UNICODE_VERSION),
+-  AC_MSG_ERROR(Unknown Unicode version $UNICODE_VERSION.))
+ AC_SUBST(UNICODE_VERSION)
+ 
+ # check if code to debug memory allocation is enabled.
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
new file mode 100644
index 0000000..b83e86a
--- /dev/null
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Sombok - Unicode Text Segmentation Package."
+DESCRIPTION = "Sombok library package performs Line Breaking Algorithm described in \
+Unicode Standard Annex #14 (UAX #14).  East_Asian_Width informative \
+properties defined by Annex #11 (UAX #11) may be concerned to determin \
+breaking positions.  This package also implements "default" Grapheme \
+Cluster segmentation described in Annex #29 (UAX #29)."
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
+
+SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https \
+           file://0001-configure.ac-fix-cross-compiling-issue.patch \
+          "
+
+inherit autotools pkgconfig
+
+# sombok-2.4.0
+SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+# Disable libthai support
+EXTRA_OECONF = "--disable-libthai"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


