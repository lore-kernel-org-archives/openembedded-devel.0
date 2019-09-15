Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id 607CF7EC66
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:18 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id u28so5217621lfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=QNM33w+1Tr4D/d5MGxwu96PYLKEJjtrSDAdR5G06Ieg=;
	b=EIPpXbWzWodR+3s9WFGm40y4n2PqV35kteoAZosSGPVFZiZfI6zbbeNVYmRZ1KORUW
	f4yPBQ51peJZliUniA6vUJlRg8VfcsBH7SbaB6U2vPial/bOVyUHHXJI3WgwBbedrRxq
	scMDscakqc01tFsSKYYZ1NVgSJBm8CtYwmTt42vMXWoY8xXvR6orzXA3aqcD9t8w+4DQ
	raqzdXQzd33HkEzGDF8+Q4yK1z2EijeD59qG5gDB9Jyc585rNnYVmgGmEr4WewdVyaIm
	2ZarAI4qfydl14gxoFRHSWkUzaU+ePnQ37nxpoQ8jH/IM+axz+aljOONqQzP//5lk2rS
	JXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QNM33w+1Tr4D/d5MGxwu96PYLKEJjtrSDAdR5G06Ieg=;
	b=EmuJJ1uUlnO0UPJy08Udc/ghLgI+/1U8FIDYQpIfDuYeOtfSEJ27Fx/Gi9MKOGVRUb
	k5SsyfH1aJFa/15I1zWd3UyiUFiY+nnNNS0Y8/7msQ5Vo7rmF/WmvkFLUr5QNG2/l2jR
	7DCxZzbBgxqh3Eopyv9p1yvAcnjV2vy8QzMcXhgkTY54ctDA07slCtPPkjtipUUMCfiN
	pFv3aRoeKaHae/YHSG4TuU7scIHS3wM7Cvhy5uZsQ3xIht3yxq8hFyMuXkXFj2UIYVOx
	GzvJtLDeLn9M1SOdFvTfY00eX34ubUUwenxXnzJl26hz+sQKZw05cghReDQ8pRGPi2Gk
	tdNw==
X-Gm-Message-State: APjAAAWyCk6fgNHxznL1c2w3EmskevpIQ8bzQkbuL0MItj82PNLkZ8z5
	cRcRRIIlxq8MiAQYK6JwltHO2aUUokQ=
X-Google-Smtp-Source: APXvYqwoEZ/FmNqHTjM5Lb7js4qTot3qUNoJXV3sG7cxbN4snfXgCezpO1UYFOAFEpUChCqSuHSM9A==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr7145615lfh.5.1568590938747;
	Sun, 15 Sep 2019 16:42:18 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id f5sm8640480lfh.52.2019.09.15.16.42.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:15 +0200
Message-Id: <20190915234215.13184-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] lcms: update to 2.9
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:18 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.7.bb => lcms_2.9.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.7.bb => lcms_2.9.bb} (70%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.7.bb b/meta-oe/recipes-support/lcms/lcms_2.9.bb
similarity index 70%
rename from meta-oe/recipes-support/lcms/lcms_2.7.bb
rename to meta-oe/recipes-support/lcms/lcms_2.9.bb
index 12ccb2050..be72d765e 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.7.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.9.bb
@@ -2,9 +2,10 @@ SUMMARY = "Little cms is a small-footprint, speed optimized color management eng
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[md5sum] = "06c1626f625424a811fb4b5eb070839d"
-SRC_URI[sha256sum] = "4524234ae7de185e6b6da5d31d6875085b2198bc63b1211f7dde6e2d197d6a53"
+SRC_URI[md5sum] = "8de1b7724f578d2995c8fdfa35c3ad0e"
+SRC_URI[sha256sum] = "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
 
 DEPENDS = "tiff"
 
-- 
2.17.1


