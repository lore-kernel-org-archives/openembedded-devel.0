Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6A40C7FD32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 02:37:23 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q12so3348068pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 19:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b7DnzKwyFv85bwACdjhkWZsnq0p2kSGhtC24GWC0ons=;
	b=I2GUIA6OQbR90d/vg+Js+SkAgdTyGaWNOWh6jsbqPK09jmRz2qW0h/vrv+qYrDtBo3
	Z+T3nuUHXb75pF4gdNv4kKC6bHuNaSyBSFplwqzX7iFlC9+w9NkG+Yd4hD8GDkm4uPzY
	mUBS45Nxz1LUp54T3Aki6neUjiORSDST5i7JZpydo1gbajJFMCDjXWK7ymftx16Lnk3H
	NzXxrb3h7VeVRRUrgznOVkeNgqssTLr9ofNi9ERUlPkLeHJI4xOY+aMYXUkLngkDmGRc
	M1DBDY7VEei4HVPR8i12lVEhkOEuREfmsx3T3SJ5TXqW71CohV8R+sxFranglF3HfffT
	nyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b7DnzKwyFv85bwACdjhkWZsnq0p2kSGhtC24GWC0ons=;
	b=ataXzHzNiv/2HuTAT79HE5vagtzu1Nh0iDZ1DWuM73HF1VIfpJnKAWvXe/2pH3JGuV
	DcOehRdFPAFN29CdUTiPK0eHZKWwTp+JLeMuHc1zn/AHnePJXN9lUbhxUG5oYiOU+Yaf
	mTnEw/erNbHaU5SOee3NykoF3Bu5XaBLEzGi0sD+lfGIqiufym4aeLY/lw4yA1D7lrJK
	mh+1D18CcL623y5RIc17pj7E+1Hft+3WpreTvJnAqtFZqotdQy6IdzL/P3gjNzXYZ5be
	Kb3IoMH8TJiJUImoO4ZEuk/9ALyKd+By+N+Grfl9neeaqCrxTgN4BFAyNHmW65UR9xSI
	gTNA==
X-Gm-Message-State: APjAAAU8xp11pMBiVTIrUomOTFL+rzJeTowURX0FweO/SBFwKtWHxbiF
	dapQJAW0/8yv0/KBQz2qv8T3s8b12VY=
X-Google-Smtp-Source: APXvYqwBLU6dLo26w42SRUVZxQyWz7d7eocwBL4qcOFyPyKGy96rdKVlXQee81jqNwdJTPbLajXXtw==
X-Received: by 2002:a62:1b97:: with SMTP id b145mr1684365pfb.163.1568774243889;
	Tue, 17 Sep 2019 19:37:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a29sm6437807pfr.152.2019.09.17.19.37.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 19:37:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 19:37:14 -0700
Message-Id: <20190918023714.2551087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dfu-utils: Switch src_uri to sourceforge.net
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
X-List-Received-Date: Wed, 18 Sep 2019 02:37:23 -0000
Content-Transfer-Encoding: 8bit

dfu-util.gnumonks.org has gone AWOL
Re-stylize the recipe while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
index 76e1552c0c..8a2ac69347 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.9.bb
@@ -1,15 +1,13 @@
 DESCRIPTION = "USB Device Firmware Upgrade utility"
+AUTHOR = "Harald Welte <laforge@openmoko.org>"
 HOMEPAGE = "http://dfu-util.sourceforge.net"
 SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI = "http://dfu-util.gnumonks.org/releases/${BP}.tar.gz"
-
-inherit autotools pkgconfig
-
 DEPENDS = "libusb1"
 
+SRC_URI = "http://dfu-util.sourceforge.net/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "233bb1e08ef4b405062445d84e28fde6"
 SRC_URI[sha256sum] = "36428c6a6cb3088cad5a3592933385253da5f29f2effa61518ee5991ea38f833"
+
+inherit autotools pkgconfig
-- 
2.23.0


