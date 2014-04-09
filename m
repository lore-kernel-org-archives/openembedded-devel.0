Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 72B3965E31
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 18:26:40 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id i7so3231357oag.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 11:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uqy/6lUGOEdw6ExDYHKaasy8JP/6k17jvxE+LLSlK40=;
	b=VaUQOA0X+P6UYAptPqcuyWTvxjS8psK5FUOt0z48HI168z5ar33vI0fzb0JR+2YcNQ
	+9J0xjPOJIbl4EaXc3uz8jpOwBCOU0x0cXlHScjqqZ/exWtzO9lOa+CYIQlHF+lVdu1T
	ouhlqtkoMhD7Hn1DUkWDe1B2H/wr1m3QfR15pOrU7H+G9JESwV+QISjD+w8UVDXl9Z7W
	ca+VaynaQK5ynZjtpFvHX1u1hp58H2FeLJBEnJPk8xupcDRlHSRXS+vL+TqXlXPEwzcf
	qgjo68e1uPcS+QlTOdbZvZ/2Uh97MoDadvHFEuoEcHzhaqXWuiUsUFGYJfiLYaoj7G9k
	S32Q==
X-Gm-Message-State: ALoCoQloz4awLqJq/NbXRUeaKcyKNLyGmnWV+AfcmZ3outBHk7VZeXbSsnYv2dxbCNCZr8gGbtQM
X-Received: by 10.60.102.37 with SMTP id fl5mr2657281oeb.65.1397068001091;
	Wed, 09 Apr 2014 11:26:41 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id or12sm2739233obc.0.2014.04.09.11.26.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 11:26:40 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 14:26:31 -0400
Message-Id: <1397067991-1308-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397067991-1308-1-git-send-email-trevor.woerner@linaro.org>
References: <1397067991-1308-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-gpe][PATCH] fbreader: remove old, non-building version
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
X-List-Received-Date: Wed, 09 Apr 2014 18:26:40 -0000

The download for fbreader-0.12.10 doesn't exist at the location provided by
this recipe. Most of the downloads appear to have moved to
fbreader.org/files/desktop, but trying to retrieve version 0.12.10 from that
location fails too.

There is a _git version of this recipe which builds just fine.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../fbreader/fbreader-0.12.10/Makefile.patch       | 22 ------------
 .../fbreader/fbreader-0.12.10/gcc45.patch          | 20 -----------
 .../recipes-support/fbreader/fbreader_0.12.10.bb   | 42 ----------------------
 3 files changed, 84 deletions(-)
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb

diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
deleted file mode 100644
index 0e498c7..0000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/Makefile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff -uri fbreader-0.12.1.orig/fbreader/Makefile fbreader-0.12.1/fbreader/Makefile
---- fbreader-0.12.1.orig/fbreader/Makefile	2009-12-13 09:03:11.000000000 +0100
-+++ fbreader-0.12.1/fbreader/Makefile	2009-12-14 17:18:47.548638783 +0100
-@@ -37,7 +37,6 @@
- 	@install $(TARGET) $(DESTDIR)$(BINDIR)/FBReader
- 	@install -d $(FBSHAREDIR)
- 	@install -d $(FBSHAREDIR)/help
--	@./scripts/install_help.sh $(VARIANT) $(FBSHAREDIR)/help
- 	@install -d $(FBSHAREDIR)/network
- 	@install -m 0644 $(wildcard data/network/*.xml) $(FBSHAREDIR)/network
- 	@install -d $(FBSHAREDIR)/network/certificates
-@@ -58,8 +57,8 @@
- 	@install -d $(FBSHAREDIR)/resources
- 	@install -m 0644 $(wildcard data/resources/*.xml) $(FBSHAREDIR)/resources
- 	@install -d $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/toolbar/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
--	@install -m 0644 $(wildcard data/icons/filetree/$(VARIANT)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/toolbar/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
-+	@install -m 0644 $(wildcard data/icons/filetree/$(TARGET_ARCH)/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@install -m 0644 $(wildcard data/icons/booktree/new/*.*) $(DESTDIR)$(APPIMAGEDIR_REAL)
- 	@make -C $(TARGET_ARCH) RESOLUTION=$(RESOLUTION) install
- 
diff --git a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch b/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
deleted file mode 100644
index 00cba10..0000000
--- a/meta-gpe/recipes-support/fbreader/fbreader-0.12.10/gcc45.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-  Fix compilation with gcc 4.5
-
-  [FBreader Ticket #340] -- http://old.fbreader.org/mantis/view.php?id=340
-
-  Without that patch we have:
-    Compiling Library.o ...Library.cpp:42:1: error: 'Library::Library' names the constructor, not the type
-
-  Upstream-Status: Accepted [Fixed in Version 0.14.0]
-
---- fbreader-0.12.10-orig/fbreader/src/library/Library.cpp	2010-04-01 15:14:24.000000000 +0200
-+++ fbreader-0.12.10/fbreader/src/library/Library.cpp	2010-04-13 13:34:06.000000000 +0200
-@@ -39,7 +39,7 @@
- shared_ptr<Library> Library::ourInstance;
- const size_t Library::MaxRecentListSize = 10;
- 
--Library::Library &Library::Instance() {
-+Library &Library::Instance() {
- 	if (ourInstance.isNull()) {
- 		ourInstance = new Library();
- 	}
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
deleted file mode 100644
index e9ead0f..0000000
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "FBreader is an ebook reader"
-HOMEPAGE = "http://www.fbreader.org"
-SECTION = "x11/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
-
-PR = "r1"
-
-SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
-file://Makefile.patch \
-file://gcc45.patch"
-
-# Set the defaults
-READER_RESOLUTION ?= "1024x600"
-READER_ARCH       ?= "desktop"
-READER_UI         ?= "gtk"
-READER_STATUS     ?= "release"
-
-FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
-FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
-
-CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=${prefix}"
-EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' LDFLAGS='${LDFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
-
-inherit pkgconfig
-
-do_configure() {
-    cd ${WORKDIR}/${PN}-${PV}
-    mv makefiles/target.mk makefiles/target.mk.orig
-
-    echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
-    echo "UI_TYPE = ${READER_UI}" >> makefiles/target.mk
-    echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} RESOLUTION=${READER_RESOLUTION}
-}
-
-SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
-SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
-- 
1.9.0


