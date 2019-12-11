Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7EE7FA30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:03:35 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n9so7707367wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sMe2+PTbX19sUaidDtOZb4z9rrF3l3rBlWi62T4XiQ8=;
	b=WwJrVDjJGR6gD1MFmdrMPl1Q+XzGWQ1yfoiMrB1N63pJ3U/0e4LqCuHM7GAEchPlNa
	YCPRqEpmIzn8W0Et+p6YsjiBLkYCYFzCt4dLzZPwAdU2Tw/A8h/M+p9ILoTuYHfeivPT
	ONpgUEUlc/DRsbtznbiChZ5mTCMI0h9ugr5Q48wpokrdTAVtq1uIpPvdt4yslIJQjQgw
	YfjfXzzKZe4iGszCY9qtbjIcpFs61mEzW49zY4YLiZbQSFG0LGBBQhxGiegYrEIrklqN
	hg8GQrRwjN4POHDJxOPuFB8zccwvBRXrdo3ORqYHFybbwYNV72IZR8e0vKi5QoZKlWGM
	gH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sMe2+PTbX19sUaidDtOZb4z9rrF3l3rBlWi62T4XiQ8=;
	b=apmEPYYyUDGrKI2XylE/CMREoI9U5zi7zhMRVZi/iuQCFbX4Bz0rcbwiDP1LNPlzZD
	7u5NHPOM9LGdze6PIxs77VskQ1SoxIS7j1NYTGkTft2y2ZCkrbeT5xRCl6ZC5h/mF45K
	XKv/dOeKcqwvyXPTxYKbqK8SgbUV+F/aKLnhk+PUC7O/seBW7sAdArk138NY0HBXGxPp
	T6NHoJAH104Vbamqn8xVxPkKlpseD04koU7C9cgBZ22B7IHsYICDrMwBuFFpI+frftAd
	a3UTUr8hyuUbUAMPIJQRi8LxyaSBwmY8MzpmLa5x7DpL4OTbLQpwJXpQZ93mUWdLbkXs
	Yx3A==
X-Gm-Message-State: APjAAAU1otWV/mgHfFUOBQGAgUPkjAodUj4eVKcnm759q4bMFEdaDAaK
	lqUZsMvcADWGk5kWrcbEjjRUdA==
X-Google-Smtp-Source: APXvYqxXyLTr6QtzwnTZdS23NXCAkGqu0L5KHYYmrHpihRqmR94ZnD1yajZltaBmdHFDTQvCnCXXwg==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr573845wma.138.1576080215906; 
	Wed, 11 Dec 2019 08:03:35 -0800 (PST)
Received: from localhost.localdomain (lfbn-1-7161-157.w90-116.abo.wanadoo.fr.
	[90.116.92.157])
	by smtp.gmail.com with ESMTPSA id h8sm2855940wrx.63.2019.12.11.08.03.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 08:03:35 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Dec 2019 17:03:31 +0100
Message-Id: <20191211160332.1182-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 1/2] xdelta3: update to v3.1.0
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
X-List-Received-Date: Wed, 11 Dec 2019 16:03:35 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The repository now lives under a different address. Let's use git
directly to fetch sources as there are no proper release tarballs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../xdelta/{xdelta3_3.0.11.bb => xdelta3_3.1.0.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/xdelta/{xdelta3_3.0.11.bb => xdelta3_3.1.0.bb} (65%)

diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
similarity index 65%
rename from meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb
rename to meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
index 9669d9bbb..9bf136391 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.11.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.1.0.bb
@@ -6,10 +6,10 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-SRC_URI = "https://github.com/jmacd/xdelta-devel/releases/download/v${PV}/${BPN}-${PV}.tar.gz  \
-          "
-SRC_URI[md5sum] = "445d8be2ac512113d5ca601ae8359626"
-SRC_URI[sha256sum] = "0ccc9751ceaa4d90d6b06938a4deddb481816f5d9284bd07d2e728609cb300aa"
+
+SRC_URI = "git://github.com/jmacd/xdelta.git;branch=release3_1_apl"
+SRCREV = "4b4aed71a959fe11852e45242bb6524be85d3709"
+S = "${WORKDIR}/git/xdelta3"
 
 inherit autotools
 
-- 
2.23.0


