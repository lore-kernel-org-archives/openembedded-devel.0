Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9854DC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 19:19:37 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.27359.1753471168849611261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 12:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sxPnlCtz;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1664656f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753471167; x=1754075967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEHxKrcmNzwSMUm82HjmVoy8rDaKn2+nFqCAr2oMwxc=;
        b=sxPnlCtzQMJW+qjPyMwPtPY+et3dLZpB9dcmuHInWa3qVScRoENfZUe3Js/MLf8mKG
         isNn7/BelVjBBRWseHFkh+jg24agrwhZosQ6fhinbBzVVjSw0pJT4JCzR02dBtcWOoPu
         rqz1Kcy+uG7gbUKWLEEGyDpDAlgv+hUGFny3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753471167; x=1754075967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEHxKrcmNzwSMUm82HjmVoy8rDaKn2+nFqCAr2oMwxc=;
        b=aei71C6SkW5NpXTHEvJ8ei0uYY7NsvtKJ1fmLvxqJrbODyOVpPC140SGB5k1DtMQ2r
         IM8vEYFoebbosQtabmCnRttPpXZXOWMMCfU7cY1pF5n6o3MKM1myp88QJmrfOFlh8AYp
         ROPS340dTSrfJq23Y4cFByJ5Yum3euc7ZewD8SVZRygYuvjrM6cy8cyPXPirol5aQfzR
         4MeWu7v7upkWzGVUpnur1ObMan1AeVXSGekWWAlkXh/Rcxq3USqa4xh4xSiJK3DYnVYO
         8n9GGalgyrt5BK1y54Lj9+DVxCwgxcj4sQn/9+SLqU32oLKvaSCkS0MafpdaYILnibLP
         z96A==
X-Gm-Message-State: AOJu0YwLIQusTBs/9G8HzrQr40+g2YGbyxtp9uk5igAWimpAa5XXAuHI
	x1MIjog6g5rYhByCdC6NvArIOdcVl3vEDJjaPjrtW0SFJlDhyQC0Vl6I/S3xQ4KWgyElIEpleiP
	Z1p4sq2iZdHC/
X-Gm-Gg: ASbGncuMOtPmvu953uCwOQeBs0+lHFqqViurPi+UUBIDEa/EbsE+S8rHEYckVo3i62C
	7/X93eUTGfqlHHgurw1rHLtSNB1rkXyZHQguSUI8Rc0dTAm/94PDWDx5cod0hLv64qAXCz5VXKC
	9VE+hW/1ACk7VPuMK5awmcgLgG66EuKu+Naqws4uAcjnB3oLq6W6pPqNmmu4f+NxNkAmu1EtZVD
	K+Hk5MCPgkjPSWkBxdx3qvhFr9iVlzc24CtddpQaXlaig41fR+kUyN/H+VzMhu74r1iiQR1ftBP
	aep5+M/ASUws7IBoXttcKSRWHtvlvlIsd13QWxgjR4ZsUSszS7K2TggLFWEtyVroso4/Tf2gCJ3
	wr0ppfJCnRLY+P5mFXwpdhkagqME4WQ4CuwjaJkTzLBS3YkYGCB6U
X-Google-Smtp-Source: AGHT+IGpmdJrfxyLeGTDQauF+DZwpgdJy+owrHlW8WzErai9YBdJ49uxPEnubD7j/6oBfyNMlkTZQQ==
X-Received: by 2002:a05:6000:188e:b0:3b7:6d95:56d2 with SMTP id ffacd0b85a97d-3b776726a56mr2663556f8f.7.1753471166909;
        Fri, 25 Jul 2025 12:19:26 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.207.175.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f23ba9sm622820f8f.77.2025.07.25.12.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 12:19:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] python3-pillow-heif: remove native&nativesdk
Date: Fri, 25 Jul 2025 21:19:20 +0200
Message-Id: <20250725191920.1696032-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 19:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118733

From: Yoann Congal <yoann.congal@smile.fr>

Through the dependecy of libheif, enabling native&nativesdk for
python3-pillow-heif means enabling it for the whole codec ecosystem
(e.g. x265, ffmpeg, ...) which might be hard to do. So, disable the
native&nativesdk variants that never built in the first place.

Fixes these warnings from AB[0]:
WARNING: Nothing PROVIDES 'nativesdk-libheif' (but virtual:nativesdk:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'libheif-native' (but virtual:native:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow-heif-dev' (but virtual:nativesdk:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow' (but virtual:nativesdk:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow-heif' (but virtual:nativesdk:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'python3-pillow-heif-native' (but virtual:native:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'python3-pillow-heif-dev-native' (but virtual:native:[...]/meta-openembedded/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Cc: Leon Anavi <leon.anavi@konsulko.com>
Cc: Alper Ak <alperyasinak1@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-pillow-heif_0.22.0.bb       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
index 7f5dfac702..4b5d5f30dd 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
@@ -16,5 +16,3 @@ SRC_URI[sha256sum] = "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc
 DEPENDS += "libheif"
 
 RDEPENDS:${PN} += "python3-pillow"
-
-BBCLASSEXTEND = "native nativesdk"

