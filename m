Return-Path: <net147@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7671971
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 04:17:41 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id h70so1696083ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sSKWCAl1LrNuwMm+LdPnkQK8h2ApF+Hh/sFNAvO/KTs=;
	b=OlNRp9ojFMPs7DYYGvL168UWD0rknWTQXreE+bZjxZr1f0KST3LJ9gO9xT80e5fiGE
	rUD83T7Z+JYD9uTII0s2zwtGWHJcDYe5SmIAdLPmt9mmE1EhpW/NEA0vRwHe9Cd84uVv
	yoxlgZh9YJI0NJrjyCgHyPhl9a+SqAWH8fXbBrboTYyRlptZedMVhtelGU0kIRkGKenJ
	dc+fCQTyXrYsbtNkcBhDt3aNeSHvzyy98NEXQl3x2hEOS7Y2xXm50jodYzHS2bHn2xup
	VLYTUCpsIISAxgtrMCmLFytVwHQkION2/4PidNOg2bT0pbQo0A6AcL7q/lLVFAcEpMbf
	9Few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sSKWCAl1LrNuwMm+LdPnkQK8h2ApF+Hh/sFNAvO/KTs=;
	b=TvcisjHzgpUY4vPzG1QGTWEPf12b4MBTmrx5PHxCWwUUqMJAUdpRsrggO5KiXx09Yx
	L4ALo4VY0EVnPgE+bBQ9jfAvoq8iIPuDfh61TbwEK4iX/ZAz13eXY2Z3fNOMkYKlSGg5
	sRlXsX3teM+hTkmmGhZcbEMFEZqZxjj6IZU4709lt3Q9mewzg0kEdVaKsWPuNLCbrzI2
	5lwMm5vHc5fTR+39p2X4C8BbMPSg594K6nYk1ATDTYhZcWnXkfkbzG8YTvXaBnfZjVUd
	SjciPFe4d7wg85G+YV+kHUSMJXGhiG+e+RKn/Pb2+a5ax7VUnAaSIISv7nhOL5ZCZQkQ
	rGBQ==
X-Gm-Message-State: AHYfb5iwj5m8vq0i+W4R51xbwvtlSQzRUAbJRBF5dwj6mYxlePDZSdfM
	7x1VQXkYzu/c2w==
X-Received: by 10.84.254.9 with SMTP id b9mr1119629plm.422.1502165863249;
	Mon, 07 Aug 2017 21:17:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id r82sm599032pfe.0.2017.08.07.21.17.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 07 Aug 2017 21:17:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:19:01 +1000
Message-Id: <20170808041901.22996-1-net147@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH] libftdi: update to 1.4
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
X-List-Received-Date: Tue, 08 Aug 2017 04:17:42 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/libftdi/{libftdi_1.3.bb => libftdi_1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libftdi/{libftdi_1.3.bb => libftdi_1.4.bb} (85%)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.3.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
similarity index 85%
rename from meta-oe/recipes-support/libftdi/libftdi_1.3.bb
rename to meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 199e5a8f6..6bea16582 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -14,8 +14,8 @@ DEPENDS = "libusb1"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "156cdf40cece9f8a3ce1582db59a502a"
-SRC_URI[sha256sum] = "9a8c95c94bfbcf36584a0a58a6e2003d9b133213d9202b76aec76302ffaa81f4"
+SRC_URI[md5sum] = "0c09fb2bb19a57c839fa6845c6c780a2"
+SRC_URI[sha256sum] = "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74"
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
-- 
2.13.2


