Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7DF7E424
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id d18so4884981wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BKKz//XRKH0MeNaWWyGO/9S+mZfkVM+0N3e66EreJnw=;
	b=eh+gSc2oxf0Ae7eoxcTKQGBSXUUbr2exUBlO02QjYjsEaHq08DwuFAoUwA2pfA+72F
	eDeFbHDbWI3cBzNRkdM3Q9ysFEmAUROofKrdeXvvHO56bZ82xMSwvCMgPBREwtzS7Q+I
	aUJ9RKDEgsNmjdEm8RNCRhifPi1+wBauXYMnMBWCUPcG5BcCZtdP4y9TnEVAQunOAb/9
	IeF324KbGRyr8ub+8ik6NZL6dLpUtWQXJGsUZoVrPdy48PTiev2QKjdui198xIzKMtOA
	7Uj7jHnuQgY1CB1M2hJ3ooWdbxCcj450YGY/MpP1Myoo2hrI01fT9DXXv+5+du1ak4Yq
	K7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BKKz//XRKH0MeNaWWyGO/9S+mZfkVM+0N3e66EreJnw=;
	b=qNGHQk+jtcVQtG1hV7ll9CKDbIysSg3cyqJ6jOVp8hScCo/BLwsDGC95wqFLWxpK7H
	ktdGSG8FQzaR18CmMRkO3oPSucbyrG/8lmHUWCqn8ewe+2c6GJ+xK7TwET4GclkWuTCz
	oReeTuBrIanA1mx+mWyh4fCkpJ+1DaU9LO8RFkAxSVecr5EW8qySQvtGkhl23LrrIR5l
	fkqAJYowc8+d8fp+PCtca3j3rn9eBMDlTTSe/wUY88FKl+byRwTMu7ReYCwWP81Pc+tx
	QTcsr6tC/BaOYxK/zrUwAGvaPobGEXT0SGxyVh4mpLCZk5vawdJpJW+Mzb+we5pWoI3d
	Y8+A==
X-Gm-Message-State: APjAAAXNuQfpCjWQmMsLIGkQM38nCcIS+FPWaaufP1NnKT3vrCN8Y7Hm
	Ej0Dqmc610qYAUmhRTAT+2JFaqcHkP8=
X-Google-Smtp-Source: APXvYqztQUzLKUxtgMWQIvTa+7+XacgixwfOMzp+f7sbypwv1xXpkgYU4PZUbbUeRjS6hpTKJJrwNA==
X-Received: by 2002:adf:de82:: with SMTP id w2mr6536695wrl.53.1558594162053;
	Wed, 22 May 2019 23:49:22 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:34 +0200
Message-Id: <20190523064859.24336-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/41] network-manager-applet: port to meson build
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
X-List-Received-Date: Thu, 23 May 2019 06:49:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to meson being more precise / better readable we can get rid of old crap
e.g useless dependency on libgnome-keyring.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../network-manager-applet_1.8.20.bb          | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
index 7181f5ecf..45f552a88 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
@@ -3,32 +3,25 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
-           gconf libgnome-keyring iso-codes nss \
+           gconf iso-codes nss \
            intltool-native \
 "
 
-GNOMEBASEBUILDCLASS = "autotools-brokensep"
-inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection
+GNOMEBASEBUILDCLASS = "meson"
+inherit distro_features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "06aafa851762146034351aa72ebb23d4"
 SRC_URI[archive.sha256sum] = "050dbb155566c715239dc0378844d8beed10954e64e71014ecef8ca912df34ec"
 
-PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
-PACKAGECONFIG[mobile-provider-info] = "--enable-mobile-broadband-provider-info,--disable-mobile-broadband-provider-info,mobile-broadband-provider-info,mobile-broadband-provider-info"
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[gcr] = "-Dgcr=true, -Dgcr=false, gcr"
+PACKAGECONFIG[modemmanager] = "-Dwwan=true, -Dwwan=false, modemmanager"
+PACKAGECONFIG[mobile-provider-info] = "-Dmobile_broadband_provider_info=true, -Dmobile_broadband_provider_info=false, mobile-broadband-provider-info,mobile-broadband-provider-info"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux"
 
-EXTRA_OECONF = " \
-    --without-selinux \
-"
-
-do_configure_append() {
-    # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${B} -name "Makefile") ; do
-        sed -i -e s%-Werror[^[:space:]]*%%g $i
-    done
-}
+GTKDOC_MESON_OPTION = "gtk_doc"
 
 # gobject-introspection related
 GI_DATA_ENABLED_libc-musl = "False"
-- 
2.20.1


