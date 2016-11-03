Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A544D71B01
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 21:01:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so874247wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 14:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NUBk/OVfHA7P3LeUYT+4+xbwJH+RoVOrvSkJKC5CmZI=;
	b=I+SGj8uv370xLzgFAVZtZ8k8BiFRRv9ZgyXA+sJFClsUDXiiSmRnW/sZ6OE/UTF4XH
	/1zdNTmbXYLELXcypUNGG/iuyyxYLRuGyijkQUrfHG1Yos0KQddjZlwULeJpyoJpnsvw
	a0LYNvsvZWxGsaKwyxWubL+o7LQpPh8p7gRj0bdnCNz9HJyg1G26/BzxZAx07bFtC7Kx
	QGeyNFA+eCsxDAutuEgVTaJM5beeAP/7pRtuDbabai9SMagfEGmZ8ePyoz7lyfbI7vYr
	IcNe0Td35VUXuvgZcGclwULflG4qBSNdsIUs7LYWtr4EPie9AguJcuhJy6yuzrjyKxk4
	ldug==
X-Gm-Message-State: ABUngvfbOf8Ttm76IGY1pDxNQnvXdzL9vOo0Kfhwi+w9XEhjjqS2wes487aRBuMcB24XBw==
X-Received: by 10.28.227.9 with SMTP id a9mr9656512wmh.85.1478206881008;
	Thu, 03 Nov 2016 14:01:21 -0700 (PDT)
Received: from tfsielt31850.fritz.box (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	hb5sm10657971wjc.5.2016.11.03.14.01.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 14:01:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 21:01:19 +0000
Message-Id: <20161103210119.27391-1-git@andred.net>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161103210006.26936-1-git@andred.net>
References: <20161103210006.26936-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH v3] streamripper: add v1.64.6
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
X-List-Received-Date: Thu, 03 Nov 2016 21:01:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 ...build-these-are-foreign-automake-projects.patch | 49 ++++++++++++++++++++++
 ...ld-don-t-ignore-CPPFLAGS-from-environment.patch | 30 +++++++++++++
 .../0003-ripstream-fix-compilation.patch           | 42 +++++++++++++++++++
 .../streamripper/streamripper_1.64.6.bb            | 29 +++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-build-these-are-foreign-automake-projects.patch
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper/0002-build-don-t-ignore-CPPFLAGS-from-environment.patch
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper/0003-ripstream-fix-compilation.patch
 create mode 100644 meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-build-these-are-foreign-automake-projects.patch b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-build-these-are-foreign-automake-projects.patch
new file mode 100644
index 0000000..c0f4692
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0001-build-these-are-foreign-automake-projects.patch
@@ -0,0 +1,49 @@
+From 4c7165b3fbc0e99e7cdd77031e8a001440d0629d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Thu, 3 Nov 2016 20:53:21 +0000
+Subject: [PATCH 1/3] build: these are 'foreign' automake projects
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In order to prevent automake from complaining about missing
+
+files ChangeLog, AUTHORS, etc., use the 'foreign' automake
+option to instruct it so.
+
+Upstream-Status: Inappropriate [no upstream activity for 7+ years]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ configure.ac                | 2 +-
+ libmad-0.15.1b/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b12d11f..96300d6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -11,7 +11,7 @@ dnl   AC_CHECK_FUNC:  defines a shell variable
+ 
+ AC_PREREQ(2.59)
+ AC_INIT(streamripper,1.64.6)
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AC_CONFIG_HEADERS([lib/config.h])
+ 
+diff --git a/libmad-0.15.1b/configure.ac b/libmad-0.15.1b/configure.ac
+index 8fb35ee..ab116a6 100644
+--- a/libmad-0.15.1b/configure.ac
++++ b/libmad-0.15.1b/configure.ac
+@@ -26,7 +26,7 @@ AC_PREREQ(2.53)
+ 
+ AC_CONFIG_SRCDIR([decoder.h])
+ 
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AM_CONFIG_HEADER([config.h])
+ 
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper/0002-build-don-t-ignore-CPPFLAGS-from-environment.patch b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0002-build-don-t-ignore-CPPFLAGS-from-environment.patch
new file mode 100644
index 0000000..58473f6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0002-build-don-t-ignore-CPPFLAGS-from-environment.patch
@@ -0,0 +1,30 @@
+From 2fcf2b164e25c4b2523dea4b04094916e57ba19e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Thu, 3 Nov 2016 20:53:26 +0000
+Subject: [PATCH 2/3] build: don't ignore CPPFLAGS from environment
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [no upstream activity for 7+ years]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 96300d6..1600c88 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,7 @@ AC_ARG_WITH(curses,
+   [  --with-curses(=XXX) compile curses front-end (XXX is curses (default), ncurses, ncursesw, pdcurses or slang)])
+ 
+ 
+-CPPFLAGS="-D__UNIX__"
++CPPFLAGS="$CPPFLAGS -D__UNIX__"
+ AC_SUBST(CPPFLAGS)
+ 
+ 
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper/0003-ripstream-fix-compilation.patch b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0003-ripstream-fix-compilation.patch
new file mode 100644
index 0000000..065254e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper/0003-ripstream-fix-compilation.patch
@@ -0,0 +1,42 @@
+From 6d59b60ff5108357ad2c2951a97112e713ee5368 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Thu, 3 Nov 2016 20:53:32 +0000
+Subject: [PATCH 3/3] ripstream: fix compilation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../../streamripper-1.64.6/lib/ripstream.c: In function 'write_id3v2_frame':
+| ../../streamripper-1.64.6/lib/ripstream.c:717:5: error: unknown type name '__uint32_t'
+|      __uint32_t framesize = 0;
+|      ^~~~~~~~~~
+
+The already included srtypes.h does the right thing for all
+platforms (I think). It certainly works well here.
+
+Upstream-Status: Inappropriate [no upstream activity for 7+ years]
+Signed-off-by: André Draszik <git@andred.net>
+---
+ lib/ripstream.c | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/lib/ripstream.c b/lib/ripstream.c
+index c671e18..7f311c6 100644
+--- a/lib/ripstream.c
++++ b/lib/ripstream.c
+@@ -713,11 +713,7 @@ write_id3v2_frame(RIP_MANAGER_INFO* rmi, char* tag_name, mchar* data,
+     int rc;
+     char bigbuf[HEADER_SIZE] = "";
+     ID3V2frame id3v2frame;
+-#ifndef WIN32
+-    __uint32_t framesize = 0;
+-#else
+-    unsigned long int framesize = 0;
+-#endif
++    uint32_t framesize = 0;
+ 
+     memset(&id3v2frame, '\000', sizeof(id3v2frame));
+     strncpy(id3v2frame.id, tag_name, 4);
+-- 
+2.10.1
+
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
new file mode 100644
index 0000000..94355b6
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -0,0 +1,29 @@
+SUMMARY = "download online streams into audio files"
+DESCRIPTION = "This command-line tool can be used to record MPEG III \
+and OGG online radio-streams into track-separated audio files."
+HOMEPAGE = "http://streamripper.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "glib-2.0 libmad libogg libvorbis"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+    file://0001-build-these-are-foreign-automake-projects.patch \
+    file://0002-build-don-t-ignore-CPPFLAGS-from-environment.patch \
+    file://0003-ripstream-fix-compilation.patch \
+"
+SRC_URI[mdsum] = "a37a1a8b8f9228522196a122a1c2dd32"
+SRC_URI[sha256sum] = "c1d75f2e9c7b38fd4695be66eff4533395248132f3cc61f375196403c4d8de42"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-included-argv=yes --with-included-libmad=no"
+EXTRA_OECONF += "\
+    --with-ogg-includes=${STAGING_INCDIR} \
+    --with-ogg-libraries=${STAGING_LIBDIR} \
+    --with-vorbis-includes=${STAGING_INCDIR} \
+    --with-vorbis-libraries=${STAGING_LIBDIR} \
+"
+
+# the included argv library needs this
+CPPFLAGS_append = " -DANSI_PROTOTYPES"
-- 
2.10.1


