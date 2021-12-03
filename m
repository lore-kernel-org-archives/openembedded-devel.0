Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A94EC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:37:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.10247.1638527828319497633
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msYcwPHg;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id p18so1946692wmq.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 02:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90sw2NFbvg+EUgYQXp65Hu8S7dpxhpUhP0wo1UCOrKM=;
        b=msYcwPHglOE0o1PCoHaNEV/eQ5l7pKbYVWkX8xNJbtUpBP/FJSLF4PG4pb83iLWVqh
         +wWz5qATQglZLpGvafpNE5FNihRg+k29+iJsfA/V1lT+7VzLho9XgkndYsYUiZ6udXnU
         J2CeG3s7L/29fogDxfYPlAoWDKSzwpdqe3B1gCMr285HrLWw2EKapMrIEO9mPzx0qQvK
         bsuJkpJBHHYcrYt8mLhCxwi+strWP8r0Y8YgMb00BiKjYjJPLG2/M8rgj/nAaD78YJaY
         O985YLQRW3QtYFHhegwZz5ddLY6qTT8McaY10fRAmr1/egUwAwL+PRxq5TNkWxJXu/d7
         isbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90sw2NFbvg+EUgYQXp65Hu8S7dpxhpUhP0wo1UCOrKM=;
        b=TKcZMWuvTwNMbRqKitnad80uvkk1B0po90KgRpyaNBh78EU33kOwhgyEEMPssXCFPC
         u7OEHM51b/ne43k8pQazxOabrISE02TaLQ816vXQgFYKb6/QXR8O7DHf3MueG/xZSWwh
         6e2dOLQqc03zP0K2viES2Bem3jepAdDMSBQBqcpqdtUsLwScvdOdMV3SYSR4T5YN9R8e
         VM7T8tGiPba8Gw2vk267We0WGd6gPurkNbCuDLvOVkWPFa8+L830PeziAhbPIE4yER3o
         46La9lyCEI2U+E3S+WlQlLUf7wnEY743x8X8fTHlkIXGWT8xh9D9eCd6h8AOlRgLdwek
         T78Q==
X-Gm-Message-State: AOAM5325AWgrmN2Wf9gowM+waTtIu1Gj0Gpk5NUNV5ECAGHiScleo6qH
	NOfmY5ZZamPQa0VpSmF3IB38aPThpX9DaQ==
X-Google-Smtp-Source: 
 ABdhPJwYdXrX/XLF5dkaca7sW0yBxc321rHSIJhY2jIj6QJ9J35Vbt2P2U8kwWaE8pEYzTthqjZx3A==
X-Received: by 2002:a1c:2:: with SMTP id 2mr14132473wma.41.1638527826678;
        Fri, 03 Dec 2021 02:37:06 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w7sm2252077wru.51.2021.12.03.02.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 02:37:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libid3tag: add from oe-core
Date: Fri,  3 Dec 2021 11:36:53 +0100
Message-Id: <20211203103653.1099149-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 10:37:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94198

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-gperf-3.1-incompatibility.patch  | 40 +++++++++++++++++
 .../libid3tag/libid3tag/10_utf16.patch        | 34 +++++++++++++++
 .../libid3tag/libid3tag/addpkgconfig.patch    | 43 +++++++++++++++++++
 .../libid3tag/libid3tag/cflags_filter.patch   | 19 ++++++++
 .../libid3tag/obsolete_automake_macros.patch  | 15 +++++++
 .../libid3tag/unknown-encoding.patch          | 39 +++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb            | 28 ++++++++++++
 7 files changed, 218 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
 create mode 100644 meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb

diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
new file mode 100644
index 000000000..54f49f6f2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/0001-Fix-gperf-3.1-incompatibility.patch
@@ -0,0 +1,40 @@
+From 91fcf66b9182c75cd2b96d88991d5a1c6307d4b4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Aug 2017 16:27:52 +0300
+Subject: [PATCH] Fix gperf 3.1 incompatibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ compat.h    | 2 +-
+ frametype.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/compat.h b/compat.h
+index 8af71ec..b3d80d9 100644
+--- a/compat.h
++++ b/compat.h
+@@ -34,7 +34,7 @@ struct id3_compat {
+ };
+ 
+ struct id3_compat const *id3_compat_lookup(register char const *,
+-					   register unsigned int);
++					   register size_t);
+ 
+ int id3_compat_fixup(struct id3_tag *);
+ 
+diff --git a/frametype.h b/frametype.h
+index dd064b2..b5b7593 100644
+--- a/frametype.h
++++ b/frametype.h
+@@ -37,6 +37,6 @@ extern struct id3_frametype const id3_frametype_unknown;
+ extern struct id3_frametype const id3_frametype_obsolete;
+ 
+ struct id3_frametype const *id3_frametype_lookup(register char const *,
+-						 register unsigned int);
++						 register size_t);
+ 
+ # endif
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
new file mode 100644
index 000000000..10e089018
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
@@ -0,0 +1,34 @@
+libid3tag: patch for CVE-2004-2779
+
+The patch comes from
+https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
+
+Upstream-Status: Pending
+
+CVE: CVE-2004-2779
+CVE: CVE-2017-11551
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff -urNad libid3tag-0.15.1b/utf16.c /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c
+--- libid3tag-0.15.1b/utf16.c	2006-01-13 15:26:29.000000000 +0100
++++ /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c	2006-01-13 15:27:19.000000000 +0100
+@@ -282,5 +282,18 @@
+ 
+   free(utf16);
+ 
++  if (end == *ptr && length % 2 != 0)
++  {
++     /* We were called with a bogus length.  It should always
++      * be an even number.  We can deal with this in a few ways:
++      * - Always give an error.
++      * - Try and parse as much as we can and
++      *   - return an error if we're called again when we
++      *     already tried to parse everything we can.
++      *   - tell that we parsed it, which is what we do here.
++      */
++     (*ptr)++;
++  }
++
+   return ucs4;
+ }
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
new file mode 100644
index 000000000..38d40c363
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: libid3tag-0.15.1b/Makefile.am
+===================================================================
+--- libid3tag-0.15.1b.orig/Makefile.am	2009-07-29 09:29:20.000000000 +0100
++++ libid3tag-0.15.1b/Makefile.am	2009-07-29 09:29:47.000000000 +0100
+@@ -27,6 +27,9 @@
+ lib_LTLIBRARIES =	libid3tag.la
+ include_HEADERS =	id3tag.h
+ 
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = id3tag.pc
++
+ ## From the libtool documentation on library versioning:
+ ##
+ ## CURRENT
+Index: libid3tag-0.15.1b/configure.ac
+===================================================================
+--- libid3tag-0.15.1b.orig/configure.ac	2009-07-29 09:27:15.000000000 +0100
++++ libid3tag-0.15.1b/configure.ac	2009-07-29 09:27:45.000000000 +0100
+@@ -201,5 +201,5 @@
+ dnl AC_SUBST(LTLIBOBJS)
+ 
+ AC_CONFIG_FILES([Makefile msvc++/Makefile  \
+-	libid3tag.list])
++	libid3tag.list id3tag.pc])
+ AC_OUTPUT
+Index: libid3tag-0.15.1b/id3tag.pc.in
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libid3tag-0.15.1b/id3tag.pc.in	2009-07-29 09:29:10.000000000 +0100
+@@ -0,0 +1,11 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: id3tag
++Description: ID3 tag reading library
++Requires:
++Version: @VERSION@
++Libs: -L${libdir} -lid3tag -lz
++Cflags: -I${includedir}
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
new file mode 100644
index 000000000..1895748d1
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/cflags_filter.patch
@@ -0,0 +1,19 @@
+configure contains CFLAGS filtering code which was removing our prefix-map
+flags. We need those to generate reproducible binaries. Allow them through.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -99,6 +99,10 @@ do
+ 	-mno-cygwin)
+ 	    shift
+ 	    ;;
++	-fmacro-prefix-map*|-fdebug-prefix-map*|-ffile-prefix-map*)
++	    CFLAGS="$CFLAGS $1"
++	    shift
++	    ;;
+ 	-m*)
+ 	    arch="$arch $1"
+ 	    shift
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
new file mode 100644
index 000000000..2845fb1d3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3599280&group_id=12349&atid=112349]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libid3tag-0.15.1b/configure.ac libid3tag-0.15.1b/configure.ac
+--- libid3tag-0.15.1b/configure.ac	2004-01-24 01:22:46.000000000 +0200
++++ libid3tag-0.15.1b/configure.ac	2013-01-03 06:41:02.734835014 +0200
+@@ -28,7 +28,7 @@
+
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+
+-AM_CONFIG_HEADER([config.h])
++AC_CONFIG_HEADERS([config.h])
+
+ dnl System type.
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch b/meta-oe/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
new file mode 100644
index 000000000..f0867b5f0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
@@ -0,0 +1,39 @@
+In case of an unknown/invalid encoding, id3_parse_string() will
+return NULL, but the return value wasn't checked resulting
+in segfault in id3_ucs4_length().  This is the only place
+the return value wasn't checked.
+
+Patch taken from Debian:
+https://sources.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/
+
+CVE: CVE-2017-11550
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff -urNad libid3tag-0.15.1b~/compat.gperf libid3tag-0.15.1b/compat.gperf
+--- libid3tag-0.15.1b~/compat.gperf	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/compat.gperf	2007-01-14 14:36:53.000000000 +0000
+@@ -236,6 +236,10 @@
+ 
+     encoding = id3_parse_uint(&data, 1);
+     string   = id3_parse_string(&data, end - data, encoding, 0);
++    if (!string)
++    {
++	continue;
++    }
+ 
+     if (id3_ucs4_length(string) < 4) {
+       free(string);
+diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c
+--- libid3tag-0.15.1b~/parse.c	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/parse.c	2007-01-14 14:37:34.000000000 +0000
+@@ -165,6 +165,9 @@
+   case ID3_FIELD_TEXTENCODING_UTF_8:
+     ucs4 = id3_utf8_deserialize(ptr, length);
+     break;
++  default:
++  	/* FIXME: Unknown encoding! Print warning? */
++	return NULL;
+   }
+ 
+   if (ucs4 && !full) {
diff --git a/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
new file mode 100644
index 000000000..80581765a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Library for interacting with ID3 tags in MP3 files"
+HOMEPAGE = "http://sourceforge.net/projects/mad/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+			file://COPYRIGHT;md5=5e6279efb87c26c6e5e7a68317a6a87a \
+			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
+SECTION = "libs"
+DEPENDS = "zlib gperf-native"
+PR = "r7"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
+           file://addpkgconfig.patch \
+           file://obsolete_automake_macros.patch \
+           file://0001-Fix-gperf-3.1-incompatibility.patch \
+           file://10_utf16.patch \
+           file://unknown-encoding.patch \
+           file://cflags_filter.patch \
+           "
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
+UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
+
+SRC_URI[md5sum] = "e5808ad997ba32c498803822078748c3"
+SRC_URI[sha256sum] = "63da4f6e7997278f8a3fef4c6a372d342f705051d1eeb6a46a86b03610e26151"
+
+S = "${WORKDIR}/libid3tag-${PV}"
+
+inherit autotools pkgconfig
-- 
2.20.1


