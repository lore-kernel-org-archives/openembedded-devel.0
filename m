Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB9D67D0F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 23:15:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id v14so830182wmf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 16:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnldcm0djuK9Su2H+N0+XPRLTuRPeAQAq0XN/jXqHBw=;
	b=GCXMGwrgWRpNaShOQSPEwgdmXrvjnKSF/wwiXaRzYiZ+XMca4bBTgE89057aSyio2q
	lPtYNQVZBzoB4YE/JjZNGHeYHRfCRNxtaHA8XiYak/z617AEYYb9DlewKTNZ05R2cftA
	mA5qCns4qEXxeBMNlI+Z/MUKpOutbnsfFMvBo8680NYsBVqHoPwRo7yKTEOrbEwq+Xir
	jaPUvSlHWDc8sR4NsTVwawNb6L/Et5Z843PiFg0R8y6hpqtAs+QZLin8agyUGtSGNRgg
	OJbUq8NAtv5SWfUShxcNnPvw7V2ulVQbck4h4f+QIBDgpCpfaUQwqw4JwesKJGx8+fxg
	WXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnldcm0djuK9Su2H+N0+XPRLTuRPeAQAq0XN/jXqHBw=;
	b=a/YJ39xgEiQhVRgKUBWHeiRMkNQLeCDxIgcRSO3+ZsHUF7q7U40kGNSbJ8DNkc9yxL
	1H0jH/abx4+2nBuqVre3JXuB/Vg4P5uTT44gWDnl5dWdmsaZo18T4R+qm8KlYxsXGf9n
	e5TjcsvsHZ3EcGV70VC55ZZv6rUGqUONSYwS/hY5a/qNrj1mGkjLmvRSbk4tvUMpHxDm
	ARhb6G851mnoeG36y+eqbZ+O2AXVR987MNyXB8qZvBxY1lHg+keEk0XXdS6N5FLSJuVF
	HAYv/LBRHS6wE2tHf2gJ0AaoMAkhuvUUIr2fmxOZF1AVkV+PZ9hX39DSe74/RbOVqCI5
	kV2w==
X-Gm-Message-State: APjAAAUh88k7PB5BpbTrFlct9IGni6p4YLYchhugtWF0TQADiRtrlFg+
	dJZc4yIE/PeWyLs9p14trGWHnUXw
X-Google-Smtp-Source: APXvYqxsho/AV94gbuQw+4FZDLPOXt6pkFv3XdcGsO7QZ1Y2nZLF0bSC6zTEPw1n256QlmdVPi76Tw==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr1699073wmc.124.1554333344241; 
	Wed, 03 Apr 2019 16:15:44 -0700 (PDT)
Received: from superandy.speedport.ip (p579734E4.dip0.t-ipconnect.de.
	[87.151.52.228]) by smtp.gmail.com with ESMTPSA id
	m6sm25410482wrr.53.2019.04.03.16.15.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 16:15:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Apr 2019 01:15:32 +0200
Message-Id: <20190403231533.24354-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libpeas: rework gobject-introspection handling
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
X-List-Received-Date: Wed, 03 Apr 2019 23:15:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gobject-introspection is mandatory for libpeas - there is no configure option
to enable or disable it.

To handle properly, this patch does:

* Make 'gobject-introspection-data' a required distro feature
* To avoid trouble once pending patch removing
  'UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"'
  are in oe-core [1] - set in recipe to avoid
  | libpeas-1.22.0-r0 do_configure: QA Issue: libpeas: configure was passed unrecognised options: --enable-introspection [unknown-configure-option]

This does not handle MACHINE_FEATURES / qemu-usermode case but there other
issues of higher priority.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280711.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
index c1ead0670..dd1b53e39 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.22.0.bb
@@ -5,7 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
 DEPENDS = "gnome-common gtk+3 intltool-native"
 
-inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
+inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache distro_features_check
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
 SRC_URI[archive.md5sum] = "a20dc55c3f88ad06da9491cfd7de7558"
 SRC_URI[archive.sha256sum] = "5b2fc0f53962b25bca131a5ec0139e6fef8e254481b6e777975f7a1d2702a962"
-- 
2.20.1


