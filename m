Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A36D071C5F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:08:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so33421833wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R03wJNmG3pw4Dc4WPab+6gWy+wEYet8uw9Ie8C+cONw=;
	b=oB+EN6+UscTU9mYgxTsCXpojaNkCEn3AlnnH6n6jWSAb8CBrLlJ/J4hhbr9sfm1ZhR
	jobb4h29ZLgFs472cx9mpZfStZYjwN4weA0E6Yf4319C3KTqqx73JN2auw3nuRvbYR25
	u9WVazATfMd+rB0foCCQgzujj/41zLqTGaPAC1tkvlGNNdBBbwvdEo6vsSlDuBhakoTA
	jAGwEKzRsuqEVmE8bZ9kteFtFqM3KroNoWG8ybqumvNS5lPvUkBWIul5q6hVMQgYB4IJ
	C2UL0+d1x+sskun1WUVpJR/NISsTxLsE+Teh+EGMMHwqzkHN7MVzZqMcQeyWL/euAak7
	VgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R03wJNmG3pw4Dc4WPab+6gWy+wEYet8uw9Ie8C+cONw=;
	b=IBxI2EDYhl71bMgt09uW05Boo7X50uJYL0PE7TPeibteNRYLy2NcufXucwpoRpIcqP
	o7RGcMkd3R2mrGBMFB/G3hz92JwEGYY59SsowUjgw75xaMc2+bPYOIMLkr1bSU0U1B0K
	dU6TqkcpDI8OYX42NJEB5gYx97jTJPQgEEYp9PBhPDCWKS6rlEx1L1MgtH6RcqsrCTrP
	XnpXcY+YL238IuQc1njcdq1rK61b2t4R0/1VHapekCBMiCTxbddJdVYe+cDkGr4KSDB9
	d2iyQfCgG070qiNtwx2AVMo1pJ0oZcKZNPrINuxjEU+qjFqQGx+qyHKQHUz3dCObnjFg
	osDg==
X-Gm-Message-State: AMke39mjvnSCHyf1+09DllK2ladUqO30zkDQKqcFH3UyMycLbbA8zRVWXNfPJIMttFt17A==
X-Received: by 10.28.214.144 with SMTP id n138mr16776709wmg.136.1486562908542; 
	Wed, 08 Feb 2017 06:08:28 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	a72sm13143357wrc.48.2017.02.08.06.08.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 06:08:27 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:55 +0100
Message-Id: <20170208140755.12812-4-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208140755.12812-1-andreas.kling@gmail.com>
References: <20170208140755.12812-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-gnome][PATCH 3/3] dconf: make gtk+3 dependency optional
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
X-List-Received-Date: Wed, 08 Feb 2017 14:08:28 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  dconf requires gtk+3 only for dconf-editor and is useful
  even on systems without gui.

  add PACKAGECONFIG for editor, enable it by default if x11
  is present in DISTRO_FEATURES

  add gtk+3 to DEPENDS only if editor is present in PACKAGECONFIG

  add x11 to REQUIRED_DISTRO_FEATURES only if editor is enabled

  Note: editor will be dropped from dconf in version 0.23.1
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index f7666cc0f..0b5970ec1 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,15 +9,20 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native"
+DEPENDS = "dbus glib-2.0 gtk+3 libxml2 intltool-native ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk+3", "", d)}"
 
 inherit vala gtk-doc distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+PACKAGECONFIG ??= " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "editor", "", d)}"
+
+#note: editor will be removed in version 0.23.1
+PACKAGECONFIG[editor] = "--enable-editor,--disable-editor,gtk+3"
+
+REQUIRED_DISTRO_FEATURES = ${@bb.utils.contains("PACKAGECONFIG", "editor", "x11", "", d)}"
 
 EXTRA_OECONF += "--disable-man"
 
-PACKAGES =+ "dconf-editor"
+PACKAGES =+ "${@bb.utils.contains("DISTRO_FEATURES", "x11", "dconf-editor", "", d)}"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.11.0


