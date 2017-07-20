Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 32FCD6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:19 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id f21so15891994wrf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=hrKwKccxVyUzYrxDS+w6qMBWP841RpwYcKoqAtomCq8=;
	b=cMvzNGf28ri2E969WYGL8AgOyKZbUpBttttyZA8HkcPYK1V1CQEMTntz1+QU4y6wMQ
	a4gs6QQ7J89kkgJNCgxFP3EJiULWd3B3yG0s5MEs8moiDkM88XR7vAhl/4bkaQOHXZDd
	ehvlvloId9JzstjUqfYSebSU9cMl82LgqD8rtrv4E+EeVMzmr5ZxE2IK6NDcXLB1FQlt
	i073vJ2wsSaMVmLBSTX8GA0moTlJCarorsUA5EZ2ta+QqejMap5ZlggqeI3aw+JALhca
	xkiW6KDykVDOK94Lo9pbcgNCVr0DspHMXj7MAVrP2Lmkikq5WqY1xbXD8dWoIefGfoUP
	OS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hrKwKccxVyUzYrxDS+w6qMBWP841RpwYcKoqAtomCq8=;
	b=WBdmRxIYgCb5HgUevwCApKDdJ6r5nyslTWhWsTmlm/RxyDizicbCi8uKrGqO+Gf6jA
	CSBJIfJ7m0FzumC0+iq8XU0m960QY8SS4k/HvYuj+Go8w4tmwchBara73ik/fzE+K/yb
	OAge1eeM2Qc37jDPqi5CaSzrSZ8K44LuRdPfmd9BkQjJFxajr73+aqXwf/Fb0QHyDj1q
	oYdkr5CwZDK12lxhCvqpP8kjD8N75MwhWFToPVg0X5XpWkx2fiiSnV5Vi2mK8yRPxmTq
	GHW3d/PNcEUJQldLOj2rWlkImfldljV6oxYb+GjC+Fe562aSTeHcDMvV4KEUVcMwenup
	EVIg==
X-Gm-Message-State: AIVw113uw7WP5KBVFl9goZ5FLEZqN23UmMY1+QwZNoETff0zMlwDOe1W
	kwhOuAQ7JtPaD4kcQ/M=
X-Received: by 10.223.151.206 with SMTP id t14mr3774317wrb.229.1500564920563; 
	Thu, 20 Jul 2017 08:35:20 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:04 +0100
Message-Id: <20170720153508.23113-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH][meta-gnome 5/9] zenity: remove
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Zenity 2.32.1 is from 2010 and is blacklisted, so remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/0001-Makefile.am-don-t-build-help.patch  | 39 ----------------------
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   | 21 ------------
 2 files changed, 60 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch b/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch
deleted file mode 100644
index 50c9cb99f..000000000
--- a/meta-gnome/recipes-gnome/zenity/files/0001-Makefile.am-don-t-build-help.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 17e5606f8c4c8ff26ba18489aad4c484cf8e2949 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 29 Apr 2013 11:34:27 +0200
-Subject: [PATCH] Makefile.am: don't build help
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-it crashes with:
-
-| warning: failed to load external entity "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
-| cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
-| make[2]: *** [zenity-bg.omf] Error 1
-| make[2]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/zenity/2.32.1-r2/zenity-2.32.1/help'
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- Makefile.am |    3 +--
- 1 files changed, 1 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 03accc1..caec7f0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,8 +1,7 @@
- SUBDIRS = \
- 	src	\
- 	po	\
--	data	\
--	help
-+	data
- 
- EXTRA_DIST = \
- 	autogen.sh		\
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
deleted file mode 100644
index bd9f7a0ab..000000000
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Display dialog boxes from the commandline and shell scripts"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r2"
-
-PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
-
-inherit gnomebase
-SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch"
-SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
-SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-# remove -I/usr/include from zenity_CPPFLAGS
-do_configure_prepend() {
-    sed -i -e '/-I$(includedir)/d' src/Makefile.am
-}
-
-- 
2.11.0


