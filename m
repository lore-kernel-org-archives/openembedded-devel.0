Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B29A4789CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:31 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z8so10249238wrh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=e0anN98yhq2Z+rgc8Juk+HN/PyOLN3FeIuqntTVojhA=;
	b=O+xa25qM19Zbk2Lac1UpMEbaEZZoS94o5PGAf47a8LrFuL8PGWm5GAfkwGoFj/iP9u
	wEHQ/Hm1TMWFvAhzl17885Mognbe5SbsFmE9XK4ec040CgorZfSzsu2n26MX8Pg/3/i/
	WLxT7AAs0snf1IRTy/WyUoZ7+f3w3X2fecfjlDx470RgclqzX1Hhn6O4baChO458Y2bt
	Vb96Ep7fSZCQIcgBNDBapqtx1aoluIHPtuUoDNUHKHw+b6tJxHEYAXpP5+OOdHBlsrm/
	0jT0lwcD9zcQv1/t3BPe5t7D5vLRvWDKoi9f6pD3iq69pUK+Lw7m20I9iVCEw57Dr0Bg
	/eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e0anN98yhq2Z+rgc8Juk+HN/PyOLN3FeIuqntTVojhA=;
	b=bC39LlF3dSDbxq11Cwnm8U+DKQcTN7pKWCNpz1u/IGA2XeH6e/72p6LR1XvrF1VUNI
	kHn6xuPUSj1z2edCTi/U4f+OirCO+jHaCMpwtaDmR86FJueMU58pQc8oo3ih5asZ9qKB
	Z2OS/vMku0MZ4J8zVTlhWqjr+HgDJXxQWWj2TRVFBv689LTkea5xJ9vA0GccGhE/U1ew
	EX1a7+Zp5PRzaTUt06baScjlHL0VPtMFF3cDKxNV2KYTyUtpmJw7dtgH71eV2XEifi9U
	1Yn5ywFAs24q1mvT3Iv1RcRsj7MXf7Krfa+0Wo+BMbn7zdY7G0ajkEaHRReX32GYe+ZS
	/ReQ==
X-Gm-Message-State: AElRT7ESm16y/itZuwwFKlliJtYs7HdlEsWLlwUDhE5PU9LsjEvUaBoi
	ShWSzKmxxdeDVnxJbEeIy9ArQA==
X-Google-Smtp-Source: AG47ELtf8TUCkSRSpLWmXO36hjaVI28zqCYw0xkti1rGS+/t3iEFil/bU4ssugQ1RgrcMsk2RD3ptw==
X-Received: by 10.223.134.125 with SMTP id 58mr10301928wrw.102.1521491372293; 
	Mon, 19 Mar 2018 13:29:32 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:02 +0100
Message-Id: <20180319202911.30760-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/17] florence: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it depends on libglade which is gone
* project is dead - last release was in 2014
* 0.6.3 tested last time was buggy: keyboard tended to reduce it's size to
  few pixels and there was no simple way to undo that

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/florence/florence_0.6.3.bb      | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/florence/florence_0.6.3.bb

diff --git a/meta-gnome/recipes-support/florence/florence_0.6.3.bb b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
deleted file mode 100644
index bb55721f9..000000000
--- a/meta-gnome/recipes-support/florence/florence_0.6.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Florence is a virtual keyboard for touch screens"
-HOMEPAGE = "http://florence.sourceforge.net/english.html"
-
-#NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "gtk+3 libxml2 libglade librsvg libxtst gconf gconf-native cairo intltool-native gnome-doc-utils libnotify gstreamer1.0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "8775051d7352f75dec5a86dc9964e8e0"
-SRC_URI[sha256sum] = "422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e"
-
-inherit distro_features_check gettext autotools gconf pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
-
-FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
2.14.3


