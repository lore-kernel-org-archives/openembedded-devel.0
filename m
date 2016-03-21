Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6666FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 14:00:09 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so152765039wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HBuDA56pTCXOSKl9IV8zBX/vg6AGDnqsH7fR2AKMtpY=;
	b=HAC2m/kj+ROAxK1mHN7js/znrxT0xbtdNtQk3wO6SOSrr+EEQlshq1d2vrIj6YxbkC
	eSxU/fiBktG/5+KZxsBQ9xgMe6CsPPNtxVUUlKHXuRIwE6KqwkCwrTc3/FjW+ZrrVNeN
	GjbC/teatavh0Nd6l58LVMfAw173NalIabHRwcWvldmhhFdR46+88Myn680NYW/Is9sv
	8wGQSKjfmmOakTLTJ37w3ZBlgnqNM7t9HtDkcLChENWVjvNgRQqXZmx6nAA5jfC4QB4q
	6r8L8My33ESTxXy7DT8Lr6GpQud3/shmPDil94KvJJrRsKrTMjSJD0njPEMPpTRmNvIe
	NN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HBuDA56pTCXOSKl9IV8zBX/vg6AGDnqsH7fR2AKMtpY=;
	b=ZHF8zi3UKfSNNKjR3bEuVbcNze/eemdshmD61r/3WOAGi1LOz2emmz2LtPvDXFLlNI
	LkeklB0Dp5EXgPnMGuvpvcGx4Z0/O1e86Eg3vh3fslJLO/1Vixi7wSlqB908Gf8MVXY8
	vw8ZssMkYwlJf8k2qtRTpzZyGaIIu757oU5WConkWJmMWWwByYIjPmG15UAL0XFypbKx
	39NkIy4A68GtjfG61Ji/f/jsSOwqYV6wbbncEYifk1yGoK5hVShvap80C/rCG1hoykVJ
	I8VBSO8O/E96FLYkCvvDmJLYk6e9Tmx57WmfeAPManM2AGp1BdXlz1JJmpSXdfYhDqGO
	cc1g==
X-Gm-Message-State: AD7BkJLPjz5CuJjFXVhUY0psYwjQdyj/C9UZDehYopqD4RC2K1IgpSU5QdNxCr1Nq4RJiw==
X-Received: by 10.28.68.85 with SMTP id r82mr13302814wma.65.1458568809600;
	Mon, 21 Mar 2016 07:00:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i5sm25494578wjx.15.2016.03.21.07.00.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 07:00:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 15:04:25 +0100
Message-Id: <1458569065-14471-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-oe] gnome-panel: add PACKAGECONFIG for networkmanager
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
X-List-Received-Date: Mon, 21 Mar 2016 14:00:09 -0000

* fixes:
  WARN: gnome-panel: gnome-panel rdepends on dbus-lib, but it isn't a build dependency?
* there is general dbus dependency already, always used by libpanel-applet package:
  gnome-panel.full/temp/log.do_package:DEBUG: libpanel-applet: Dependency libdbus-1.so.3 requires package dbus-lib (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/gnome-panel/2.32.1-r7/packages-split/libpanel-applet/usr/lib/libpanel-applet-3.so.0.0.6)

* but when networkmanager is detected, then it's also linked from
  clock-applet in gnome-panel package:
  gnome-panel.full/temp/log.do_package:DEBUG: gnome-panel: Dependency libdbus-1.so.3 requires package dbus-lib (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/gnome-panel/2.32.1-r7/packages-split/gnome-panel/usr/libexec/clock-applet)

* OE qemux86@ ~/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/gnome-panel/2.32.1-r7/git $ git grep HAVE_NETWORK_MANAGER .
  applets/clock/clock-location.c:#ifdef HAVE_NETWORK_MANAGER
  applets/clock/clock-location.c:#ifdef HAVE_NETWORK_MANAGER
  applets/clock/clock-location.c:#ifdef HAVE_NETWORK_MANAGER

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 23e2de8..9be2ec1 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -25,6 +25,9 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--disable-scrollkeeper --disable-eds --enable-bonobo=no --with-in-process-applets=none"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[networkmanager] = "--enable-network-manager,--disable-network-manager,networkmanager"
+
 do_configure_prepend() {
     gnome-doc-prepare --automake
     sed -i -e s:help:: ${S}/Makefile.am
-- 
2.7.3


