Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF043C55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:11:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5252.1785589908877679282
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J1sKkKgP;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2258709b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589908; x=1786194708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfitPfix6IkAs5XkHngZrf/OmN9egvQrJCzWXySsVkg=;
        b=J1sKkKgP2CR+ZDT5M0VcENTjS3Q8SD543/fAjJOLdQpa9/Wj5vTVOwrKV4OvySwkZ0
         5CeSlnfcxbPG4pVc+TLeffyiri+DkPoECNdAbc4BEO7dfEb/d4P5kfEk4IJAckvY8OHn
         evWpNk3iyPsmnAoQLT97VLjIw7rIKzNibzzaWIeeDoF9VW8MUPR6JCstp9lgydio3YII
         3tLbGbh3HJ7Kw7aLgs5hPhl0N789paQMbX/rgptNQk/V2n3btGvEV7JAM6NctDh2tAgi
         oIWEePK8lcI9SLlt5CdOqZQtW9ZhfBje3qfnPctMk7ptwgjyZmFCsPLX36v2rP52+4Wz
         de/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589908; x=1786194708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfitPfix6IkAs5XkHngZrf/OmN9egvQrJCzWXySsVkg=;
        b=syhhCqynS49FKAeuKn8UKNSca9EEdgZBSHxPoGuqnFarCDZ9Ai1ebaprtwfppenY/3
         SHyoLecCUNauJ6Dz1vxDE2B+UaojQtM3VLqlTXbI92S7dcgmQN3e84xdPb1DPiNYax3Y
         OVJzzFXaboox+Nt5D/aodEYY7EtfStRpFD8NmSoQ6JwdFYs8xPRvlvT3+wy3SIJAfIg9
         NpZOAelJ9DyQ51RGZMqg+qRYJvv+6H8aOq0fzhk7GYnW/+/UmVBJRPaJCV9R2v9P2hP/
         He2huspTVdIddyb4S3toCCustQefIX5XsYf84Z24VDdPanReBg3flVn259XkeinXfnaz
         AdJQ==
X-Gm-Message-State: AOJu0Yzp2qDI4C8mz+iy0DbxQVuE9SkZW6czrtDax9f0Hk6NSvBWbXjY
	8BOzHabXq+5I6yhD8eZfcS0WtqZJxUyYdG2kXxuhzS9yVJlxonF5L534z65LK29G
X-Gm-Gg: AR+sD1136vBNi9TUsYw9GSa2AzBOV95/nFNzoeK3L6cEDrdRIaxcp4o7w8k9Jz3pa2r
	xw2yssCHn4CpX0tBvmoqHXT4EBIS7+VJJXGa/g2qf/0b5VCgOrH+jtJlTMwmPnNDrTFlo/ptiZ1
	Qw47F1AQTMxteyGj/U0Dcam+7mYO9oK32WOAuaIHwr2nGxVXMgujFSMY7D6xkoxhXuSxkjBNvdV
	vS8F+z7oy3UGLTLL8cuWKrPQ9xkEm0EpZrZ0TLoDrElLjIMGr3HO+bWpF9/qt3cXFmTit0NG6PU
	ZOz02vs8FBmXYWqcWgFff+oHNOWGC+ObWG8+lILIZTLNFkFO0Do9YzbwM4YiR0Q2GZPWs4ftSZB
	363C7snQrpMl5Tm1ZI8Uv6vFCS8UYvzITOCjwsGL3ImO3dyy/3NYX3133OV6idDli6WFVLZS4ag
	vqtNuXpxFr2Ucpr33FfJzMsnEVSbTKzj7ICeHkSQWtPuZgtyyGb/PCsxujhMHdW1fsL7pC/eI5c
	Q==
X-Received: by 2002:aa7:8885:0:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84ee488240dmr3088582b3a.26.1785589908167;
        Sat, 01 Aug 2026 06:11:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:11:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/20] imagemagick: upgrade 7.1.28 -> 7.1.29
Date: Sun,  2 Aug 2026 01:11:19 +1200
Message-ID: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128595

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-28.bb => imagemagick_7.1.2-29.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-28.bb => imagemagick_7.1.2-29.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
index 7fd34dc54c..0890edb8c5 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-28.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-29.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "c2068fb3394af17fb9e3a78c712af2ca67141836"
+SRCREV = "360eda553586e389c9c725fc49df94f209a8a3c7"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

