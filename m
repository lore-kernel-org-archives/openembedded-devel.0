Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1E7F7D264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 13:09:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so9320388wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4L8A+z0rqdX/CKDMSKVLSufq2UJt100KwlqWbzJQK3A=;
	b=cs2aINbQYzLT0TMJmbig7A9Jygh7MLL2jC0yyurt2Q/ZQgbM0gibmNrWUIZw7MGSnl
	a9VbJtosMhr0dKJfOcYBk3KxfIP8PWiYsk6jgjfghHgDRa7z33cYXGuJKWQOR4XR5U3T
	WQ/JEJJPp4xewY3aKjFPdhNabAbrJxmXiW3Txt9Ry+nVPtoTUevUPVNr+AgGQkVt1FnD
	cUXYUEJSwJUHvvMoFiB6X4sBGf76cI8GiR8SssBO79ZTsFNb0Dev97Yn/gVVQ1qKEGFB
	+srqAv5mjqLPh8+rdvTlsd7qceBreobD9abNfkauvadQujZIf7MJwURzIODjUSsOSViw
	lbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4L8A+z0rqdX/CKDMSKVLSufq2UJt100KwlqWbzJQK3A=;
	b=BPKg4QDXgXqEEJaV30BATUVwH2owGw2vOlVa6gHewhCO09/nZeFb3oNAF6zsroifyA
	icrX+3LrvjN+EA+WrCmMEoHsWSO1t03ICwONgevOGm1yWkKJeOxZVPSBQLVzZGt+Qqlz
	5h0iNN05kgqJkzForco0cWZ49nug7IlyOl1W4veufqqVcH9wCJ9dAr3VlOEgHqzrLvJV
	B0zsPJ0swg4iyKq+TvgzcGQYDJ8j1GOG67L8A69BLx8907SdlecvDK1yWy/Ou8yQUkUY
	Es3gFHB5ONmxA8BWIzUrVDVHWG5ZIzW45RhjQMLtk4FQ+zu+gK2NPYf33Ub0jRaIOiiZ
	mFrA==
X-Gm-Message-State: APjAAAWPNy/oX8yGKIoevhfKN1movpPcnUsCYtuxy92rjwoyiqi9PYXE
	j9sEdlRcvSS9ggpZjagr7DST/30qPQA=
X-Google-Smtp-Source: APXvYqxYx03K9/aFOBLXEPzHMRH+8WR+3SXMm6lRsZkriN2eb5V9gdXvym/mL/Herd9Vcr3yxsTLqw==
X-Received: by 2002:a5d:428c:: with SMTP id k12mr15142489wrq.57.1576847346839; 
	Fri, 20 Dec 2019 05:09:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	t190sm9706313wmt.44.2019.12.20.05.09.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 05:09:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 14:09:01 +0100
Message-Id: <20191220130901.113655-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] enscript/indent/sharutils: fix build with gettext 0.20.x
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
X-List-Received-Date: Fri, 20 Dec 2019 13:09:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-builds-with-recent-gettext.patch | 24 +++++++++++++++++++
 .../enscript/enscript_1.6.6.bb                |  3 ++-
 .../0001-Fix-builds-with-recent-gettext.patch | 24 +++++++++++++++++++
 .../recipes-extended/indent/indent_2.2.12.bb  |  3 ++-
 .../0001-Fix-build-with-recent-gettext.patch  | 22 +++++++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |  3 ++-
 6 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/enscript/enscript/0001-Fix-builds-with-recent-gettext.patch
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-recent-gettext.patch

diff --git a/meta-oe/recipes-extended/enscript/enscript/0001-Fix-builds-with-recent-gettext.patch b/meta-oe/recipes-extended/enscript/enscript/0001-Fix-builds-with-recent-gettext.patch
new file mode 100644
index 000000000..ecfafce1a
--- /dev/null
+++ b/meta-oe/recipes-extended/enscript/enscript/0001-Fix-builds-with-recent-gettext.patch
@@ -0,0 +1,24 @@
+From 771cd2a12db8b8c9a558f1a04958df8ed614f2e0 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 14:06:50 +0100
+Subject: [PATCH] Fix builds with recent gettext
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index dedabd6..8833ac9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -22,7 +22,7 @@
+ # along with Enscript.  If not, see <http://www.gnu.org/licenses/>.
+ #
+ 
+-SUBDIRS = intl compat afm afmlib lib scripts src po states docs w32
++SUBDIRS = compat afm afmlib lib scripts src po states docs w32
+ 
+ EXTRA_DIST = README.ESCAPES README.DOS ascii.txt			\
+ asciifise.txt asciidkno.txt 88591.txt 88592.txt 88593.txt 88594.txt	\
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 2b6d14e6c..82791f579 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://enscript-autoconf.patch \
-"
+           file://0001-Fix-builds-with-recent-gettext.patch \
+           "
 
 inherit autotools gettext
 
diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch b/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
new file mode 100644
index 000000000..e48dfb33c
--- /dev/null
+++ b/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
@@ -0,0 +1,24 @@
+From 3349812de0598ca7722e0b7c7b7e5d48bd79bea9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 14:01:18 +0100
+Subject: [PATCH] Fix builds with recent gettext
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 548fea7..cf01c5e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+ AUTOMAKE_OPTIONS = no-texinfo.tex
+ 
+-SUBDIRS = intl src doc po man
++SUBDIRS = src doc po man
+ 
+ BUILT_SOURCES = 
+ 
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index f2891df50..f8d63d43c 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -14,7 +14,8 @@ DEPENDS = "virtual/gettext"
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
            file://0001-Makefile.am-remove-regression-dir.patch \
-"
+           file://0001-Fix-builds-with-recent-gettext.patch \
+           "
 SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
 
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-recent-gettext.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-recent-gettext.patch
new file mode 100644
index 000000000..7924fa55e
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-build-with-recent-gettext.patch
@@ -0,0 +1,22 @@
+From 7a2fe915dded27630a345762628cdd542ea5d58a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 13:56:16 +0100
+Subject: [PATCH] Fix build with recent gettext
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 03d1131..65609e7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -17,5 +17,5 @@
+ ## Process this file with automake to produce Makefile.in.
+ 
+ EXTRA_DIST      = config.rpath m4 $(DIST_ALPHA)
+-SUBDIRS         = intl lib libopts src doc po tests
++SUBDIRS         = lib libopts src doc po tests
+ ACLOCAL_AMFLAGS = -I m4
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 8f39fde82..930922ed4 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -9,7 +9,8 @@ inherit gettext autotools
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
            file://CVE-2018-1000097.patch \
-"
+           file://0001-Fix-build-with-recent-gettext.patch \
+           "
 SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 
-- 
2.17.1


