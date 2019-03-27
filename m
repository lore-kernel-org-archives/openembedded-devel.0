Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id B39C67D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:43 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f3so468992wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IOmX+qsQrRfSvvF3cM12sWAPLNohNhqew5rSq8ExTFw=;
	b=YfA4eWFVbBJnvdzUhc/zRT3fJh3SU/FSRnSgcijL6dNkRkQeyZe76NRrkRuMYhrAz+
	SEkNqK7rVdJKXhLYsPAlDcpL0mggGJLjj+4iKGjGegumPDIE0lOehGc4WJtZoI1rjRCX
	/62o5xWiXWVluPrYDg38xvQGD+8bgPRUERZsFciP9SImtSKFfvOUbPvh1PaEtgV1nf3E
	OLEZdlWMvsJ3Jf9qYumq77lxPMES1A1I8gk9wAf7HUNO+tFQCRYm9K9191a3YdgsYJPc
	CRFPR7DBEb/hGmjaWt/wuIKoGUWbl0K4KLz4xILv29kqdy8thF4da5KP1nyCUMqqHLgl
	fGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IOmX+qsQrRfSvvF3cM12sWAPLNohNhqew5rSq8ExTFw=;
	b=o5up0NdUCRoAdG+xlntY5ZF6IM2F1ec+qWTyF/+4u5wevfZu0v7e1lJ1/2lWqCRuoA
	iRT2vV2IHYR/LJ6dnl7Fgc+pwY5kb1D/gAQfHrNtCfwOr0amFuKnE3jFz1Fu917ZxJ9q
	rIrPuai8a2LjjsgkfFGwRUxu8UKMdv05CCpnN/pqMPgdLCxAMPvX2H0uAZlpFzIa2s5u
	eba/teaNRD0/A1qAcBPKDr06LEc03/+yqAOywwmdW5JkyGCAHexvRFkR4Wm2rXakDz2y
	kJznMiAyz33zBd62a7IFfRqTy1mKS2e2n8PCLigq0k8q958EI2LAxzvMY9UgaDt3PLMM
	J+HQ==
X-Gm-Message-State: APjAAAV+lmItnS1U5IHfloRSaQWaBMhQilyotRMDnIDSs62N1uRk7W+f
	o736E3iEOB7Y6VeEdG0V/QiGFuEs
X-Google-Smtp-Source: APXvYqxfS+IMvDmFHe3fFAR/BDcRLGAIMK12sjgm8ZNxfJYd3jJ2te4lr4zYLahJnbL49xHKI1fsHw==
X-Received: by 2002:a1c:a70f:: with SMTP id q15mr2253039wme.28.1553700944052; 
	Wed, 27 Mar 2019 08:35:44 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:07 +0100
Message-Id: <20190327153509.23928-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] gnome-system-monitor: upgrade 3.26.0 -> 3.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Be aware that it needs 'polkit' in DISTRO_FEATURES

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-build-help-we-do-not-have-yelp-yet.patch} | 32 ++++++++++---------
 ...26.0.bb => gnome-system-monitor_3.32.0.bb} | 24 +++++++-------
 2 files changed, 28 insertions(+), 28 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{files/0001-help-remove-YELP-macro.patch => gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch} (38%)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_3.26.0.bb => gnome-system-monitor_3.32.0.bb} (43%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
similarity index 38%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
index 57b60a0d5..f2e720e9e 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor/0001-Do-not-build-help-we-do-not-have-yelp-yet.patch
@@ -1,7 +1,7 @@
-From 4a3ee8b46d25b3d310448bfa4446e15a686fc685 Mon Sep 17 00:00:00 2001
+From c6649fdcfb2f44807089741557f8e527ab9751e4 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Fri, 23 Mar 2018 13:50:18 +0100
-Subject: [PATCH] help: remove YELP macro
+Date: Sun, 24 Mar 2019 02:46:07 +0100
+Subject: [PATCH] Do not build help - we do not have yelp yet
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -10,19 +10,21 @@ Upstream-Status: Inappropriate [embedded-specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- help/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
 
-diff --git a/help/Makefile.am b/help/Makefile.am
-index c5cd0d3..4b83adf 100644
---- a/help/Makefile.am
-+++ b/help/Makefile.am
-@@ -1,5 +1,3 @@
--@YELP_HELP_RULES@
--
- HELP_ID = gnome-system-monitor
+diff --git a/meson.build b/meson.build
+index d60ced7..6a0ab4b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -183,7 +183,6 @@ subdir('data')
+ subdir('po')
+ subdir('scripts')
+ subdir('src')
+-subdir('help')
  
- HELP_FILES = \
+ 
+ message('\n'.join(['',
 -- 
-2.14.3
+2.20.1
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
similarity index 43%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
index 9b6ce17ca..d0297d438 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
@@ -3,32 +3,30 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = " \
-    intltool-native \
+    itstool-native \
     gnome-common-native \
+    libxml2-native \
     glib-2.0-native \
     gtkmm3 \
     libgtop \
     librsvg \
     libwnck3 \
+    polkit \
 "
 
-inherit gnomebase distro_features_check
+GNOMEBASEBUILDCLASS = "meson"
 
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit gnomebase gtk-icon-cache distro_features_check gettext
 
-SRC_URI[archive.md5sum] = "fcd59867c07f8c4853b1e28d60cbc037"
-SRC_URI[archive.sha256sum] = "f848a8c2ca5e164cf09d3a205dd49e4e4bf4b60d43b0969c10443eb519d0e6b3"
-SRC_URI += "file://0001-help-remove-YELP-macro.patch"
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
+
+SRC_URI[archive.md5sum] = "6c2c5c5bf8f15d3e6985faacbd3055dd"
+SRC_URI[archive.sha256sum] = "af00c4a42dd1db17d9abe88edb11c7751b20982db1a8a2a467bab206fd8a77e3"
+SRC_URI += "file://0001-Do-not-build-help-we-do-not-have-yelp-yet.patch"
 
 RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
 FILES_${PN} += " \
-    ${datadir}/icons \
     ${datadir}/dbus-1 \
-    ${datadir}/gnome/autostart \
-"
-
-FILES_${PN}-doc += " \
-    ${datadir}/omf \
-    ${datadir}/gnome/help \
+    ${datadir}/metainfo \
 "
-- 
2.20.1


