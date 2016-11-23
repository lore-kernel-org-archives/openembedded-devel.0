Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A35271AA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c4so445285pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3bO+pStVTc4TWYr8FBszMPbLeFieY2HhtygIB43PGnw=;
	b=MYwaRnSjwtxWaFU8guLFP4lFk2qjsrmTNhD5yXvmOa1ikD+tTl4PGI0YJBj5EblJil
	1iCkeJ7avKI48kTpCTczNhNJFWMCGac6Un7BW+f/digugT3FsTZjD2iRmqKOg8WBT+Ps
	XJKX0jBXUoTAs76uzU1Fdq05mfzYy63BUdo7I8PjJ3YaqFdAdcRHH89PRlXMqrkUe2TH
	JHMeBoc7cK7IAF7hMt5Hr7A+IuXmT5xAleUFTyOKMKcR9BLmnVMvdos8SfOFlT7DoNX4
	kkiJ04aXbqVxpWconKqz2ZTWRpFVstaBZXolIDNrxeo5Cpt0LC0ROs98UFcE61lJKcZ/
	IDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3bO+pStVTc4TWYr8FBszMPbLeFieY2HhtygIB43PGnw=;
	b=dptV1LCUQrNvgXThS2XhQO8j9cqMsgHjxNdKz1N33M90kss/y590n8TvbEqPrfxCSp
	xjSPGaGxts4MVxdP67EUJeZ/SKVLPmpZt/XLRUM9g1FN9HUyxQQU1r3tbK8oFSH3qrIz
	dQFNkLDpAJXDo3pBE3ymoXt6CtXgqiGOCNrdVoWuU5mUHkQIsFH4ySbLQhmnhtTd1g6V
	SIFAFdJjunkXTItfwgvKm3XmNbmDNiR4r0ZTX8xZlXDmEEUieYMng3E7dY5OVxLqmNdG
	4Bc/MHcXx+GT/ivDUU6/Lu1EUxtUz5GtlWa/4Eh2DuF5L/JeLF3wz/WzEVmLd1kQmQRt
	MM6g==
X-Gm-Message-State: AKaTC00hJSR5UbLhdWrJNI29Cl0mu6uF/LbQ+3jE1O4A1VZM2hFR3gevmntuhHnpGmiisQ==
X-Received: by 10.99.66.198 with SMTP id p189mr3616464pga.30.1479892969695;
	Wed, 23 Nov 2016 01:22:49 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:02 -0800
Message-Id: <20161123092209.23699-42-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 42/49] libmad: Fix build with clang
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...4-Remove-clang-unsupported-compiler-flags.patch | 43 ++++++++++++++++++++++
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
new file mode 100644
index 0000000..5bfce4d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
@@ -0,0 +1,43 @@
+From 3d3fce9b8b927a817b89dd78a60b5cf7d978f64c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 16 Sep 2014 12:28:47 +0300
+Subject: [PATCH 4/4] Remove clang unsupported compiler flags
+
+---
+ configure.ac | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4fcd48b..40302db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -140,20 +140,20 @@ then
+     case "$optimize" in
+ 	-O|"-O "*)
+ 	    optimize="-O"
+-	    optimize="$optimize -fforce-addr"
++	    : #optimize="$optimize -fforce-addr"
+ 	    : #x optimize="$optimize -finline-functions"
+ 	    : #- optimize="$optimize -fstrength-reduce"
+-	    optimize="$optimize -fthread-jumps"
+-	    optimize="$optimize -fcse-follow-jumps"
+-	    optimize="$optimize -fcse-skip-blocks"
++	    : #optimize="$optimize -fthread-jumps"
++	    : #optimize="$optimize -fcse-follow-jumps"
++	    : #optimize="$optimize -fcse-skip-blocks"
+ 	    : #x optimize="$optimize -frerun-cse-after-loop"
+ 	    : #x optimize="$optimize -frerun-loop-opt"
+ 	    : #x optimize="$optimize -fgcse"
+ 	    optimize="$optimize -fexpensive-optimizations"
+-	    optimize="$optimize -fregmove"
++	    : #optimize="$optimize -fregmove"
+ 	    : #* optimize="$optimize -fdelayed-branch"
+ 	    : #x optimize="$optimize -fschedule-insns"
+-	    optimize="$optimize -fschedule-insns2"
++	    : #optimize="$optimize -fschedule-insns2"
+ 	    : #? optimize="$optimize -ffunction-sections"
+ 	    : #? optimize="$optimize -fcaller-saves"
+ 	    : #> optimize="$optimize -funroll-loops"
+-- 
+2.1.0
+
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 3a647bf..8d9246a 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -17,6 +17,7 @@ SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
     file://obsolete_automake_macros.patch \
     file://automake-foreign.patch \
 "
+SRC_URI_append_toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 
 SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
 SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
-- 
2.10.2


