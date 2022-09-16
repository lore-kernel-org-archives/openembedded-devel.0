Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8571DECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 16:57:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.8642.1663347426181605069
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9rW4Qig;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so243340pja.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UIDSoAAZRaMO9PghzLm+9UG5l3nSYCjTPE/uuoXHDB4=;
        b=H9rW4QigjE+mP8HrIvgbmnioqWmKFXGYxKs+Y8vw3WXA0pUUoUUmhV72q+WqSx5bcS
         uLnrBecM7I8cW/KMTtUiM9y1uiTl+GwjSoxvFXnRZKcuP5pbrpsbYcyGCMwyO+i90CGy
         gyxSsGV4XJ8HE/EAdKnmAxGgej/n9n/IJ6V5uYN358NAoK5C7FXR/BVq0bvKcsxVEvg5
         PSoZGEkHX0yptrqRnpjILWTi+b5X8nn6uVpd28hv6YHQhx/a4YpB2YSAP1436Ta41ljR
         TYpAHFogCGO0+dA2r+yu2OQKjr61f9plrcP2SnOIsRtQSxTFO+F1j8COrYlul6NRQM1t
         7N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UIDSoAAZRaMO9PghzLm+9UG5l3nSYCjTPE/uuoXHDB4=;
        b=WmTWbXmpgM3w0L19b4NLVjxyGt4AWNCiy10tvbzSTUH0bMsnDCIivwi78MWZniQx5T
         pB9Fo25nZkPI6+WySi26GHnh+2iOb1DVwla7NByDwVvHsoXSRDZXJM97cknIylC4icUZ
         fI6uXSC3EygZajyevVHwwak1e65XmFdYlEG/z+NUHuMXdHkj9OR8hD1IDTadcFdB+w6f
         xsin28I7Uh1UCQoWg9nWHr3UuMb0huf3WrqH+DUftrjdnAywMEWM9Sg9Trb4I9k5AZaL
         uSBBUdOz9VJ1vvg3sJ7AWxHc0+DLxLieqd18wzOepcTDvk3RAfK9ucqDs9AWWPrcwhYT
         DtrQ==
X-Gm-Message-State: ACrzQf0YM8g11mYX79eMDpvzUQmmVtaAcgAbrwcxqraIlTO/slFKo/ZY
	sX10QZ/BnLjjov/4Eok/ECGweya+t9Bpyw==
X-Google-Smtp-Source: 
 AMsMyM66cC4xI5VjxsPpwaorcblkeIBkEfSje5CjQC9TdF2ehdZiMhePOzI6XIAB64XckjnTG2cGWg==
X-Received: by 2002:a17:90a:c402:b0:1f2:ca71:93a5 with SMTP id
 i2-20020a17090ac40200b001f2ca7193a5mr6562847pjt.34.1663347425418;
        Fri, 16 Sep 2022 09:57:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b971])
        by smtp.gmail.com with ESMTPSA id
 s15-20020a63524f000000b00434acf7a05fsm13974783pgl.45.2022.09.16.09.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:57:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jack: Upgrade to 1.19.21
Date: Fri, 16 Sep 2022 09:57:02 -0700
Message-Id: <20220916165702.786175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 16:57:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98837

Release Notes: https://github.com/jackaudio/jack2/releases/tag/v1.9.21

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/{jack_1.19.20.bb => jack_1.19.21.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.20.bb => jack_1.19.21.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
index 90e5d5621b..c9496233f6 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
-SRCREV = "a2fe7ec2fdbd315f112c8035282d94a429451178"
+SRCREV = "6b3c96d8aeef8aeb4b20f3aa647e6d01b4000ff8"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


