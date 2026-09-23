Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F15C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:36 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4169.1790160094886418627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=disb3Am4;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so378586b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160094; x=1790764894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Leet9VqSkoS/0wdHq4QzIAVMYrHTW2gM2qLhsfTjB4U=;
        b=disb3Am4/08UjUrolFDHkjFzR3SbxvzmBdZLcQwhsgVj6E0AKcWSr+UVivvlBM6509
         4ZNu2DXl8gvj10e1lMalnP1z/a/vAPfffp0mBMYClPYBpG3gWZQLjTnxQGHQrPuGQ3iy
         lQoi/sC0D7Pp3ar5cMAh8OPSaQJgVoJHRVqo3v++w3E+zLpS2vxCq1VxOZ/mjjV7kmaQ
         QG4EhHhvkI7neW/idR/SXEZgvbmgggZ3sUByQWY6bVv8HiNfBkma1+Rz7vRKQInnO7UQ
         lbD+U8ngDifkw40/UgxG/iWD/Wfa3NCeSc/kkyLKFW38b79hxhhztHUORx7fYe2daCK/
         83Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160094; x=1790764894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Leet9VqSkoS/0wdHq4QzIAVMYrHTW2gM2qLhsfTjB4U=;
        b=FoQ9Xmm/AxxxD1Dx1aU1z2CmmIA7FpjRfgHNbmXW8S3pTKZgvhEceJIFDy4oim7YwR
         RDBbNCOfHru6dg/XE86kMQ6GFrxLfEWKb+dRxzlUYOChbD3tmV30y/uvgqHsAcHqaRsR
         GFSp57PEJeQGiawu8NIfUcFpFqgxQcpLFRp6FYiKV1f1Q6ZgA/lQSMHHYWwRkN5NreDo
         gY1v+B6tkyYNXZ7ZF21FB7e8+Wyy5xI21E8Koq8KskDehXOL79krHMizX2Djg/j/H/Q2
         hO0OQd7BxNtkTIGD58mhbQgbyYOnUqMia1GzZHqTX8/jQWSFtdXHmvXhwWT4kg4X4KO1
         aPiA==
X-Gm-Message-State: AFuF++kNFZc+LkkOV7+au74JCvghSkCz5Hz05Qivak1EjKhaUQDP7LQk
	7DMy/1S06Qp+ogxtK24ynu+eIlPX3mvv7h94IPkQRbNvljL+fiNjcalXG5N6gg==
X-Gm-Gg: AYBFou2uaQEA+J125hzXJsAcgP4xzc07zQJMKNmr6tIJ5Sdx3G9yC34m44+v62fWX7e
	AYt542raMmz8aDFa+7M1GHZ6PJs2TiFBafw6cKnyxtQd+8wwmZjeMDjtv4aQuKfxN9hFFzRB+Nn
	HI/zAXKs+gBKD4AVVPhJNp/w3tmw4+vpXUQsHn6Dvc8INNEEU9F9SwnyRFfyJ+0XrP8+1LFFKHL
	xoj8ezLesh8UQ42T4DhXYB3PUS7X8WjGGKEzo9cmUJf1xKjNudDhgofRn2xVBetM28UexxiUNpv
	l5RNu9r4+N3EMjBXap3tYC/Xxu9bXP05pqFk9+6keEUH7dBbrv5NpJEihSftmcWoR45sLWOo/X7
	w21BjwMEpxa1Ee3xJnFGQu5TQjHVm30/yblcmW20Lr7mh6xBOnQsOhWeOgisSXyEclSmXjOAbIu
	t9WxkD8SSBf7iVUBlnyb6BdSePtBpRo4ae4KXy47RIQbDRGoqCUkEhDhDjj8NghqwoEzTNfKfZ/
	93OjAR7V9PxMhjJPt/LjNdaunJezBiDMg==
X-Received: by 2002:a05:6a00:399f:b0:878:3538:8f7a with SMTP id d2e1a72fcca58-87d1baae9demr2051376b3a.40.1790160094255;
        Wed, 23 Sep 2026 03:41:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 17/42] faad2: upgrade 2.11.2 -> 2.11.3
Date: Wed, 23 Sep 2026 22:40:31 +1200
Message-ID: <20260923104056.457360-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130204

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c8d2af3641e1d694ee4eb6215a2f813b4390f1de)

Changelog:
https://github.com/knik0/faad2/blob/2.11.3/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../faad2/{faad2_2.11.2.bb => faad2_2.11.3.bb}              | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.2.bb => faad2_2.11.3.bb} (81%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
similarity index 81%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
index 83fcaa248d..8dd09439f7 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 
 LICENSE_FLAGS = "commercial"
 
-PV .= "+git"
-
-SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
-SRCREV = "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
+SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "6918ebb51b8f7e86278da15884bd7114e4b9661e"
 
 
 inherit cmake

