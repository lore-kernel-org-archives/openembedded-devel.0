Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOFwO-0006pf-Q2
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:21:09 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1500455eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=h2HcP1ZQZ5ztoiBOtf+8zSvj1Ag6OE/41xJnp8rU2x4=;
	b=I4zWGU7rBM9jJq/alzIoCQPhJ+cpzG1WER+xtlHgOBEUrbx5lEkB359RSwGD294v6J
	BXZr02gqdN7EuHsZtHk/NIIosBQ/dyGCs6So60EXAjXOdCXyYeOir6Ib+V6x9qFQ1NnI
	wf0mvtfK/O+b4lHjHwHQCcJ/iScAd9Xp+110LBUuV16J9DXcg35xuIhTH25nj2c4m2AE
	AHe/bFLFn8TzLdn+WkmFeVhfSr00+QRZitBqdtvf++04bM6Re/lg+M0YflDSKxmszNNu
	VXeJ0zCInWl/oRoHIhP72wayS0j/KSuaZmYlLDPoB8C7uJhU9s97iqxPUPOLtxz2zVcI
	+Gqg==
X-Received: by 10.14.5.6 with SMTP id 6mr23751238eek.42.1365203030082;
	Fri, 05 Apr 2013 16:03:50 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2C0A.dip.t-dialin.net.
	[91.10.44.10])
	by mx.google.com with ESMTPS id a1sm18010579eep.2.2013.04.05.16.03.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 16:03:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 01:03:32 +0200
Message-Id: <1365203016-17804-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
References: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce++ 2/6] exo: remove gnome-mount wrapper
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 23:21:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

exo-mount was removed long time ago [1]

[1] http://git.xfce.org/xfce/exo/commit/?id=5d698bf98b190d7c76a6b406bd5f542b915d0bd1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/exo/exo/gnome-mount |   64 ----------------------------
 meta-xfce/recipes-xfce/exo/exo_0.10.2.bb   |    9 +----
 2 files changed, 1 insertions(+), 72 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/gnome-mount

diff --git a/meta-xfce/recipes-xfce/exo/exo/gnome-mount b/meta-xfce/recipes-xfce/exo/exo/gnome-mount
deleted file mode 100644
index 85fdb25..0000000
--- a/meta-xfce/recipes-xfce/exo/exo/gnome-mount
+++ /dev/null
@@ -1,64 +0,0 @@
-#!/bin/sh
-#
-# gnome-mount - wrapper script for use with exo-mount
-#
-# Copyright 2009 Enrico Tröger <enrico(at)xfce(dot)org>
-# Licence: GPLv2
-#
-#
-# This script aims to be a wrapper script to provide the
-# gnome-mount utility on envrionments which only have
-# exo-mount (e.g. Xfce). It accepts all command line arguments
-# which are passed but ignores all which are not supported by
-# exo-mount.
-#
-# (This script was tested with Bash and Dash.)
-#
-# Possible use case is as a drop-in replacement to get mounting
-# local resources with GVfs working, e.g. mounting disks in CD drives.
-#
-# Usage:
-# Save this script as 'gnome-mount' in a directory in your path,
-# e.g. /usr/local/bin or ~/bin and make it executable.
-#
-
-
-
-OPTS=""
-
-# first catch all passed arguments and keep those exo-mount supports,
-# ignore all other arguments
-while [ -n "$*" ]
-do
-	case $1 in
-		-\?|--help)
-		OPTS="$OPTS --help"
-		;;
-		-e|--eject)
-		OPTS="$OPTS --eject"
-		;;
-		-u|--unmount)
-		OPTS="$OPTS --unmount"
-		;;
-		-h|--hal-udi)
-		OPTS="$OPTS --hal-udi"
-		shift
-		OPTS="$OPTS $1"
-		;;
-		-d|--device)
-		OPTS="$OPTS --device"
-		shift
-		OPTS="$OPTS $1"
-		;;
-		-n|--no-ui)
-		OPTS="$OPTS --no-ui"
-		;;
-		-V|--version)
-		OPTS="$OPTS --version"
-		;;
-	esac
-	shift
-done
-
-# now run exo-mount and hope things go well
-exo-mount $OPTS
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
index ff529db..5e6b5ac 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
-PR = "r3"
+PR = "r4"
 
 inherit xfce pythonnative perlnative
 
@@ -12,7 +12,6 @@ inherit xfce pythonnative perlnative
 SRC_URI += " \
     file://exo-no-tests-0.8.patch \
     file://configure.patch \
-    file://gnome-mount \
 "
 
 SRC_URI_append_class-native = " \
@@ -22,12 +21,6 @@ SRC_URI_append_class-native = " \
 SRC_URI[md5sum] = "c70f2a217811bfba2e62f938d4b8f748"
 SRC_URI[sha256sum] = "b385828bf8a38204da3254b57fdfa25a72694495aa189fabd5040f707eec76ce"
 
-# see http://wiki.xfce.org/gnomemount-replacement
-do_install_append () {
-	install -m 755 -d ${D}${bindir}/exo-mount-wrapper
-	install -m 755 ${WORKDIR}//gnome-mount ${D}${bindir}/exo-mount-wrapper
-}
-
 PACKAGES =+ "exo-csource"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
-- 
1.7.4.4



