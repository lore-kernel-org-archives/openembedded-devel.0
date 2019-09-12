Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4996E7E08E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:03:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id w6so20609245lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0E9i3rgqYNZ+PM2Ioimds3cSgqDOoJEgfiN0TKbWLv4=;
	b=n3bUtZVAgOAJOnLGILDPqjlKvLzNaofxnitce1KaLnUYXFk2xFupMLpuOxwBH5x+Ew
	Ovybmmj0FBkGt1/j1fXGfGbvvOELr1+cjGweSAbe7VwOLTcrcbk8Jenc1Pe0gfMGnhzZ
	pfpEJUyDz1Mc6jfXM5CEAo3Gbtb+f0tATHPP4Bg9Wo/iE8uDG9IO2/xuq8enLOOftMUD
	Pd2qqtVcompdLhdyiTvNgABB9xKE7QSPXi9CBP3Q/4/pUBoJpa09PiO3poyKNFPSHIIo
	gtusruPKhz+9oq9x7hSL1VlFEzU4fQBCOE2vFwIh9ferKijAB7qEUEVxHqOlVK1TqsSv
	J+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0E9i3rgqYNZ+PM2Ioimds3cSgqDOoJEgfiN0TKbWLv4=;
	b=FZcqLO6f9SlHZItwrAUb4OiLaNA1jAguwNmXBe0Hh4eSYqWF0A6M1bEQFUciZtcG83
	A9L6W6YYJMyHWf9e3ZqGvgpbNaECk38VSkdpTNIFCdCY5cwtH7LXYYy6NW3vUMiaQI/u
	j1DzmA10evjYWHnxYglY4uUCnsbn7a3g4SlrDkRBUoHwXKaQTR7WJk3IcYLf88aQQkd6
	7Jn4cDLVaLLuC9QGi+NEEA/xEfJzZGqKqinb5RsGsO9CqNjy8EFT/1wc/rJM1p/w5HOW
	u5TMOwcEZFtnPomqlgPHID0Hn+BgjHf/bHw55ZfNdYzEur8oOqfMI+ZCeCnzs9hZ5Wa4
	9e7g==
X-Gm-Message-State: APjAAAXAbUZ6VuhP8FTdmqSt/SzO1QcPC57hADrDR6BfQzKm4Lmzz9dk
	IdgQdhvPmxalrePSccbTdaC2VZYMpRI=
X-Google-Smtp-Source: APXvYqymfhIsVehfu9i6KZY2eSEacnZ/ShstDbKcM8rNtO9a0kFk/5UJhwZvSoyS57kHdvPrRlWU5g==
X-Received: by 2002:a19:c14a:: with SMTP id r71mr28693546lff.55.1568325837585; 
	Thu, 12 Sep 2019 15:03:57 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id r8sm6538938lfm.71.2019.09.12.15.03.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:03:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:03:55 +0200
Message-Id: <20190912220355.19448-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libopus: update to 1.3.1
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
X-List-Received-Date: Thu, 12 Sep 2019 22:03:57 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libopus/{libopus_1.1.3.bb => libopus_1.3.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.1.3.bb => libopus_1.3.1.bb} (94%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb
similarity index 94%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb
index 1512a1d7d..19ec12c88 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.3.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.3.1.bb
@@ -9,8 +9,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[md5sum] = "32bbb6b557fe1b6066adc0ae1f08b629"
-SRC_URI[sha256sum] = "58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633"
+SRC_URI[md5sum] = "d7c07db796d21c9cf1861e0c2b0c0617"
+SRC_URI[sha256sum] = "65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
2.17.1


