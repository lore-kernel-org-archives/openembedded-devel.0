Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 234B56093B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:38:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y43so3299645wrd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b1S/KzcG1EJQ4Irf5OLxLJC6SWQK/HxJ7Y+hBeRxrZw=;
	b=uU8j2uicydZLtgW2XOYwukS4LtbPT6YBkaYozHB5y3f6QukvWXjL56+wREkLvzYh4T
	fMvGid1UjP/IRsmh/yEJPer375HRB3SZVyhNSCuYh6z4erZm40W/0W/G+1tIN8tso47W
	Xcrz8YM8MpaUAqhcRphOKvuoLPs/468oBqgKQyknBatiJwnIWCR8Snypakl2aWf+72TM
	yxu6qs6kN+hiLQN6HYFUgf2p/wp2HAYB4BgvgYvb1G1rFCYqDzGG33V9+w2b5gir3gDy
	VAg/Eg0Q9JW0GQ3vNOR42TysI+4out+PyZseURBCp3KRcC8Fdj0VwRNMSXO6I1gKjW8Q
	zYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b1S/KzcG1EJQ4Irf5OLxLJC6SWQK/HxJ7Y+hBeRxrZw=;
	b=Zbepaq+yODBnP2ppk8X/uDzsvMuaj0CGRJOU139QKqNL4U0J+jEzyE00npVLsUP1fm
	+i8Gxlj6Gj+Hvk1tkbvGlRXCSneL/xeD7kHdg6DQDtruBPim4Hb8gcS7+LMkYvBwUS5T
	Ayz+HovcDM0Ux3NEDnjSHYfTLGSS9zsLFhywT9ulyszWLLhL19NqLa4UsPPetGHPljWU
	VB2eFDklhZkVVrBd0aagArBnOvVFRXBQ9y4iL6F5uEMoZ/2ZZJA28N08D+lBSZoLMjTZ
	b3LGbOJva3XYuRHabMk+YcWB/MqqLazFCW4h/EjmRQo7L6GSkKB3b/5kPwPEPfQ4bMSv
	reLw==
X-Gm-Message-State: AHYfb5hxk6GnMEYxEBls4fQxqju6B9gnxCVwR59ycRA0uduqWrC61FOz
	uDaFdLU5OyRSANn5
X-Received: by 10.223.134.221 with SMTP id 29mr4775147wry.63.1502228314464;
	Tue, 08 Aug 2017 14:38:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E90C29881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e90c:2988:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	p68sm14587855wmf.0.2017.08.08.14.38.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:38:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:38:13 +0200
Message-Id: <20170808213821.17561-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH 1/9] exo: update 0.11.2 -> 0.11.5
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
X-List-Received-Date: Tue, 08 Aug 2017 21:38:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../exo/exo/reduce-build-to-exo-csource-only.patch | 40 ++++++++--------------
 .../exo/{exo_0.11.2.bb => exo_0.11.5.bb}           |  4 +--
 2 files changed, 17 insertions(+), 27 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.11.2.bb => exo_0.11.5.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
index 8073fca..99318d5 100644
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
+++ b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  Makefile.am  | 10 +---------
- configure.ac | 26 --------------------------
- 2 files changed, 1 insertion(+), 35 deletions(-)
+ configure.ac | 22 ----------------------
+ 2 files changed, 1 insertion(+), 31 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9979b36..05d594e 100644
+index 62ad18d..bdc5fae 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,15 +1,7 @@
@@ -40,7 +40,7 @@ index 9979b36..05d594e 100644
  distclean-local:
  	rm -rf *.cache *~
 diff --git a/configure.ac b/configure.ac
-index b66c92b..5243132 100644
+index ba5395d..2605067 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -116,15 +116,6 @@ AC_PROG_CC()
@@ -59,36 +59,26 @@ index b66c92b..5243132 100644
  
  dnl ***************************************
  dnl *** Check for standard header files ***
-@@ -171,29 +162,12 @@ dnl ***********************************
+@@ -171,19 +162,6 @@ dnl ***********************************
  dnl *** Check for required packages ***
  dnl ***********************************
- XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.30.0])
--XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.30.0])
+ XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
+-XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.24.0])
--XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.30.0])
+-XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.20.0])
+-XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
 -XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.10.0])
--XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.30.0], [gio-unix], [GIO-Unix features])
- 
- dnl ***********************************************************
- dnl *** Optional support for a GTK+3 version of the library ***
- dnl ***********************************************************
--XDT_CHECK_OPTIONAL_PACKAGE([GTK3],
--                           [gtk+-3.0], [3.6.0], [gtk3],
--                           [GTK+ 3 support])
--XDT_CHECK_OPTIONAL_PACKAGE([LIBXFCE4UI2],
--                           [libxfce4ui-2], [4.12.0], [libxfce4ui2],
--                           [GTK+ 3 support: libxfce4ui-2])
- AM_CONDITIONAL([ENABLE_GTK3_LIBRARY], [test "x$GTK3_FOUND" = "xyes" && test "x$LIBXFCE4UI2_FOUND" = "xyes" ])
- 
+-XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.12.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
+-XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-unix], [GIO-Unix features])
+-
 -dnl *********************
 -dnl *** Check for X11 ***
 -dnl *********************
 -XDT_CHECK_LIBX11_REQUIRE()
--
+ 
  dnl *************************
  dnl *** Check for gtk-doc ***
- dnl *************************
 -- 
-2.5.5
+2.9.4
 
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.11.5.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_0.11.2.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.11.5.bb
index cb29c34..d5508c0 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.11.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.11.5.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "0b036c8042a2ed5d3767d1177a4213a2"
-SRC_URI[sha256sum] = "76bd1c4229503ff3c301485de3a41c55dec93e98de1a9eef1be77fe502ca4f77"
+SRC_URI[md5sum] = "2e560edfa8ddf77e21c4787a6f600171"
+SRC_URI[sha256sum] = "8e8629f33783eba1ce6d092a42c28217458a0cc3d1ad7474097b9187054955c1"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.9.4


