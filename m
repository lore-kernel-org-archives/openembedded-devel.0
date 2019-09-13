Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1026B07E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 07:29:56 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l3so8252440wru.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1qZ+fzDGbuxaJdKRX9Ejai3RzQjyE07kOtd6lTjx8ig=;
	b=ayYEAQyYUGEVnQIizOgwMJ7cxHvOC+pVMHvIKvMJUiJnQQCIAeemmifrZ/53sdv3e6
	IuZdNudxbZtKUkZpfQ9An/CXwiWG5kEA+fHMxBy/M3hj76H5Af32z6si2Pkjti7YXCuW
	eAf6so8vID2srwq9aHyll7UpsZGXc7hS7goCVkLXa16DunzMpbEOQU9F8acKoeH8LnAK
	wc3tQbHNr5iOoJGb/KawkvPnNAqq8762LrkpxGvbgA2JdOOXlfgKS5KBW6hAc3HOyL5h
	8ffEss3pfaX5Fza8x2j8FL715p+xu/ZFsFVFpnIeOicFgMrwG2Fe3veod7e02FKSd7lY
	oP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1qZ+fzDGbuxaJdKRX9Ejai3RzQjyE07kOtd6lTjx8ig=;
	b=jbT7OpgjcR7uOqauvgxFHZ38TxtQ138qWJRuSn6+p/a9xZ37hUJNa07G5JYElu50nY
	8dTcGJC6WkI0hC/k+kCN2lNWZvcaOt3x3t0cIH7IFEABq44EHdfA/Ic7lZFw89m9Vi9R
	WTQC03AxzcPAqHX9zuUdCxxWkhCzKRIqQ+3fuzUgcojPB7352bXfdBXcjVvOZ3M0gQUU
	0/kp5MRWcr6ypHqpmI63RtUiJLOBYGnaJ2NH0sIIGH/dtvNxgCCPQqhHywv0KE6qXJDV
	a/7rH+JErHaP8ExRp4GcH3Vdu8KZggAFBzsPHG8LQi8u7flGzj2nQHKBxyzFemrVureH
	NeOg==
X-Gm-Message-State: APjAAAX3vrnsTLoxek3MgzyHezxvFDbab++gM7FChQ/FPyu30vEP5kRc
	7FDul+7NsKDdJ9L59ZV9JwXz2w==
X-Google-Smtp-Source: APXvYqz6x9nm+BVCfIxogn41Eo7dC+2lajVBqC5IQBo1GYtgEhVvK1OiJMBM4rPf5fmyxGlX0yclYQ==
X-Received: by 2002:a5d:6844:: with SMTP id o4mr6944290wrw.188.1568359796844; 
	Fri, 13 Sep 2019 00:29:56 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id
	o12sm4074371wrm.23.2019.09.13.00.29.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 00:29:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 09:29:53 +0200
Message-Id: <20190913072953.9844-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-gnome][PATCH] zenity: new package
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
X-List-Received-Date: Fri, 13 Sep 2019 07:29:56 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for zenity - GNOME's utility for displaying dialog
boxes from the command line and shell scripts.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../0001-build-don-t-generate-manual.patch    | 50 +++++++++++++++++++
 .../recipes-gnome/zenity/zenity_3.32.0.bb     | 24 +++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
 create mode 100644 meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb

diff --git a/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch b/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
new file mode 100644
index 000000000..488548667
--- /dev/null
+++ b/meta-gnome/recipes-gnome/zenity/zenity/0001-build-don-t-generate-manual.patch
@@ -0,0 +1,50 @@
+From 38eeb345fdfca0298b11427aa942b68e627ba10e Mon Sep 17 00:00:00 2001
+From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+Date: Thu, 12 Sep 2019 13:14:55 +0200
+Subject: [PATCH] build: don't generate manual
+
+We don't have yelp in yocto and even if we did it would pull in
+webkitgtk just to generate help. Just remove the manual generation
+altogether.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+---
+ Makefile.am  | 3 +--
+ configure.ac | 5 -----
+ 2 files changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 81ae6a7..bd073dd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,8 +4,7 @@ AM_CPPFLAGS = src
+ SUBDIRS = \
+ 	src	\
+ 	po	\
+-	data	\
+-	help
++	data
+ 
+ EXTRA_DIST = \
+ 	autogen.sh		\
+diff --git a/configure.ac b/configure.ac
+index 5dccdb0..f88b2c0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -115,11 +115,6 @@ GETTEXT_PACKAGE=zenity
+ AC_SUBST([GETTEXT_PACKAGE])
+ AC_DEFINE_UNQUOTED([GETTEXT_PACKAGE],["$GETTEXT_PACKAGE"],[Gettext domain])
+ 
+-# *******************************
+-# User manual
+-# *******************************
+-YELP_HELP_INIT
+-
+ # *******************************
+ 
+ AC_SUBST([AM_CPPFLAGS])
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
new file mode 100644
index 000000000..295288bfb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Display dialog boxes from the command line and shell scripts"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+inherit distro_features_check gnomebase gettext
+
+DEPENDS = "gtk+3"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+    file://0001-build-don-t-generate-manual.patch \
+"
+
+SRC_URI[archive.md5sum] = "ba2b2a13248773b4ec0fd323d95e6d5a"
+SRC_URI[archive.sha256sum] = "e786e733569c97372c3ef1776e71be7e7599ebe87e11e8ad67dcc2e63a82cd95"
+GNOME_COMPRESS_TYPE="xz"
+
+do_install_append() {
+    # Remove gdialog compatibility helper - we don't want to pull in perl
+    rm ${D}${bindir}/gdialog
+}
-- 
2.21.0


