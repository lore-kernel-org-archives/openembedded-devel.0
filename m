Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF6457E5F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:49:49 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id d17so2781776lfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qe8FSUv7Oa/jqdR556rbv1nvBdba/6grIIgSgpdYLUk=;
	b=gT/6v07yVq4Lu6C78GU+TtmYXB3q0eMQj0R0uzFOhkwjLp0DjvnfHhvm9ziUxbiCZp
	mnBSzBKyBvdrE8tofYUlMJ7OsTntPw5QyaG2h8SGqXB5mnsCtLAOtPEEBvCHBVQ0u4Vt
	amgSl5e4UlhGo03a/vVwrtYMDoFMSUar15quwwOfpCw4Rs4B7gYDIvnm5U0+3DouAs1L
	0XPgEBLwOiAY6gGX6foqTdTzJIAduF3MO9lqgNCxRNcBGVP/NmkLdVIBAWg4WqSi+So2
	T4FUH2PazBeOMWPjBl3SsFpTxFZfODWRMjFHjOoMqgILV2rOiDAIe1mxZApK87fZ8Iv/
	hXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qe8FSUv7Oa/jqdR556rbv1nvBdba/6grIIgSgpdYLUk=;
	b=nUfWxZ4BpBOxqX1ew9C1krJCMgTZie4fW0pyDS7kTstfa7EAfo2k54OS9d4n9SDpCC
	/wlbJJlzg//mA8x528qMxIYHLltglE6CmSRDVF0rbE+7cPwzNwy3KdOVzIdf+iFrkuW5
	cfxFOJYQDBnGb0BL8VtglFw/r2SU5DeI5tbiczj/ovtdifMTaQat3AIWQ8MEXRM+PnTK
	3GVRfmydGFoeGXPiScpS6xpjQCHOymueL/kYpgVzX0anO8ozs4rcOPKkGkgxPP0ItqJ8
	Ccp0sMrUzFV9nFgJi/iZwYFI2NLLPyWFITqDpI7wGAW53Htg5ZPz75KsptoS7Gkj691R
	M8Xg==
X-Gm-Message-State: APjAAAVeHv+OODbduXrvaiAS1qGYOFbuXRmKwqf1R7rzIXvet6uVOtHN
	8A+bZWfehfWfSksi1SotmAPjyaUxgvo=
X-Google-Smtp-Source: APXvYqy7EZ7P5E2uVbGv0/Jp6rnTn/1xySw0y5zJtdsn1XXHsIeKOX2XgTyzXnv650uAWaor2QQPOQ==
X-Received: by 2002:a19:2d54:: with SMTP id t20mr27580287lft.84.1568328590192; 
	Thu, 12 Sep 2019 15:49:50 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	n12sm3184377lfh.86.2019.09.12.15.49.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:49:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:49:48 +0200
Message-Id: <20190912224948.15057-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xfontsel: update to 1.0.6
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
X-List-Received-Date: Thu, 12 Sep 2019 22:49:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-app/{xfontsel_1.0.5.bb => xfontsel_1.0.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xfontsel_1.0.5.bb => xfontsel_1.0.6.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb
index c74b29194..e9260240d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.6.bb
@@ -9,5 +9,5 @@ DEPENDS += " libxaw"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4669d2703c60d585cc29ba7e9a69bcb3"
 
-SRC_URI[md5sum] = "a40302b88c599b63e3d3d412e02871e6"
-SRC_URI[sha256sum] = "170d8550b96fb47b04db6181b947e6f6b8b97f4df5d691c351a278480cc931bf"
+SRC_URI[md5sum] = "13150ff98846bf6d9a14bee00697fa47"
+SRC_URI[sha256sum] = "25aa0b7c4262f5e99c07c2b96e00e4eb25b7e53f94fa803942af9d0e8da3001c"
-- 
2.17.1


