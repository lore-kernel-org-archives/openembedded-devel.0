Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id E73F861691
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 13:33:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l5so6149469wrx.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wN2LLU0Pf43W40x+jYNcQJNJgSCWobl2wbTmITK9+ts=;
	b=X/iTqM8GJEO16YQcjLfmDq9ChZOFtd8uvNrXPtacu/x94PdrjwcfrMA8KS8aoZoRGG
	ojlzsk36f8Z7E3yZ+6nnzQytw9MqB/1lKIpH0Ekiz7r3w/QtZ/wtRZTA1F5ioGqNLS5y
	5RICaDdjl0L6osUzDTjFsQuZTqBideNLFM/85bmJ15nIUeZwtGC92fmAm+qW/mIuRyzg
	zUmP6D2bFu7/sSFOhgEMLLTdybwl4o6FL2kuJMot88DbzwpAbD8NpB/rtkOu5Wg0GFED
	N6p8zyOciQh/tyaxVK+8Kdzmma2eJBP2DKZxbcOuXprPoUUMIhixmBoSZUUOevDomObJ
	eX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wN2LLU0Pf43W40x+jYNcQJNJgSCWobl2wbTmITK9+ts=;
	b=qC9GgNEsx4l05g+/G4wZ8gwY3WuAk/pQjKh7UzMoOGU28ItBZyIt8pGIqjQazI808O
	mAEi+e2aDSimH/XGHdgB7MI5IGmVIH4/4IxMAnDEod5td6YWs9vwqy2RpSNFYY0eG9l0
	lNKD/sVD53ymslek4spCxFoFFwQChPjCp+MWnHHjcspkOjyLBxuWs42bs0g5RCajg3w4
	7cUKQUa8ZDoQ4288vEcbkTQweCbXbWPstOOw52AoQIojusg+/wNccgFhLqAjfyJ6YHOP
	Eix/OPFxs6hu1AV8WnuSt00FyfuPZcAAieCKEQblzd5A7CWBCUJxLRRaKzK4Vh2q/S+F
	bb7A==
X-Gm-Message-State: APjAAAXzMI8o9MHDwpdgfR6w4+Klzvgf3intjfce3XtknxTywcfey5A7
	245OZhHIIcc9lfy8rT2KHGsWk/nLTyc=
X-Google-Smtp-Source: APXvYqwHwJuVLEoUQC7h9qPW1Th/fk0E6Y2cETdmcKKbJEM6l4RhZ2Xxq3G7iBg/XpfRTnLYu0pirg==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr404401wrq.153.1582551236189;
	Mon, 24 Feb 2020 05:33:56 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0C8C561445DB707649E5F9.dip0.t-ipconnect.de.
	[2003:f0:7f0c:8c56:1445:db70:7649:e5f9])
	by smtp.gmail.com with ESMTPSA id
	q12sm3308572wrg.71.2020.02.24.05.33.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 05:33:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 14:33:44 +0100
Message-Id: <20200224133344.15280-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200224133344.15280-1-schnitzeltony@gmail.com>
References: <20200224133344.15280-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] xfce4-sensors-plugin: Change defaults to useful ones
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
X-List-Received-Date: Mon, 24 Feb 2020 13:33:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every time I added xfce4-sensors-plugin to panel xfce4-sensors-plugin suggested
sensors not exactly useful. So change defaults:

* remove lmsensors
* make sysfsacpi work and don't disable it because that's where embedded
  machines drop useful information

Background: Have spent lots of efforts to get Raspi4 cooled properly while
running at gouvernor 'performance' and rendering music. Would like to see if it
really wears a cool hat [1]

[1] https://github.com/schnitzeltony/rpi-cool-hat

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-sys-class-power_supply-we-are-cross.patch | 44 +++++++++++++++++++
 .../sensors/xfce4-sensors-plugin_1.3.92.bb    |  3 +-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch
new file mode 100644
index 000000000..ac1d603b2
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch
@@ -0,0 +1,44 @@
+From 9b7e1beca872ca4a5fce8938c58379103787f79a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sun, 23 Feb 2020 22:06:32 +0100
+Subject: [PATCH] Do not check for /sys/class/power_supply - we are cross
+ compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 12 +-----------
+ 1 file changed, 1 insertion(+), 11 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c281af9..60ba0c0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -209,19 +209,9 @@ dnl Check for interface for /sys/class/power_supply to be used
+ AC_ARG_ENABLE([sysfsacpi], [AC_HELP_STRING([--enable-sysfsacpi], [Use /sys/class/power_supply to read your battery value @<:@default=auto@:>@])],
+ [],
+ [
+-    enable_sysfsacpi=auto
++    enable_sysfsacpi=yes
+ ])
+ 
+-if test x"$enable_sysfsacpi" = x"auto"; then
+-    AC_CHECK_FILE([/sys/class/power_supply],
+-    [
+-        enable_sysfsacpi=yes
+-    ],
+-    [
+-        enable_sysfsacpi=no
+-    ])
+-fi
+-
+ if test x"$enable_sysfsacpi" = x"yes"; then
+     AC_DEFINE([HAVE_SYSFS_ACPI], [1], [Define to 1 if /sys/class/power_supply is found])
+     enable_procacpi=yes
+-- 
+2.21.0
+
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
index 8b650143f..3fd0ff6cf 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
@@ -7,10 +7,10 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "7327c4c316ebd5d93665e77b432b8d89"
 SRC_URI[sha256sum] = "3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112"
+SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-    --disable-sysfsacpi \
     --disable-xnvctrl \
 "
 
@@ -18,7 +18,6 @@ do_configure_prepend() {
     sed -i 's:LIBSENSORS_CFLAGS=.*:LIBSENSORS_CFLAGS=-I${STAGING_INCDIR}:g' ${S}/configure.ac
 }
 
-PACKAGECONFIG ??= "libsensors"
 PACKAGECONFIG[libsensors] = "--enable-libsensors,--disable-libsensors, lmsensors"
 PACKAGECONFIG[hddtemp]    = "--enable-hddtemp,--disable-hddtemp, hddtemp"
 PACKAGECONFIG[netcat]     = "--enable-netcat,--disable-netcat, netcat"
-- 
2.21.0


