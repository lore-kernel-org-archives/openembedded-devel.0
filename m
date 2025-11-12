Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DFBCD37B2
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6293.1762976146879492703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QoqYr+n4;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so23940f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976145; x=1763580945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FvD2HXK2JbzKAijoJr+hsztDb+w+b/T0oF4BnQI/sI=;
        b=QoqYr+n48FLBR23VzifWkSTFXeuCXoC2IyuLjhtgMV4po6L2zIB33UaROVXgv0RUFE
         lOSHE3eVCubbA5TmAPR/aGDzUp0QV52ppn5oSW0h6Rv+puCl7a+NEo1u8wTyAQiIvqGQ
         9BWhYlv0yPMgaVQch/yiHhVvNywCy1zWpSDsxOmTypIdWUwrRR5Ofssd2L+zSmAb3q/E
         O5EZ1oOTpMueS+ezBMfRF5BfZTCzEs9KUehmTBsLWNMOjkJlpWlPi15M4yam3f5KbWxC
         l1kRpSXG0IVAla9f1PQC9lEaaRQSGjh5T54VNdtGYo3/dGSP7TgHSeYSHyYaLRq5skJu
         Cjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976145; x=1763580945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FvD2HXK2JbzKAijoJr+hsztDb+w+b/T0oF4BnQI/sI=;
        b=XguxHUroIAz62mQvAYmyAxmt8zGji2N0tIUt/o92zCT/cP/EJBnp6izYz01ftgqf4s
         3Y70vJ6sWw9zHDkMmFSGN8/3Yk4A/mZDV5iI0RAjxRNcqx2HGaAjELH5gJOPc3iwjuA8
         QgXphP4uk74NGaqnbc/IEYRmNUgAzRI1tDZ0S3HT8apTLAGQpbcmNYBw7iMNUylspwez
         ixmosMuyP3520BVyHjpEd9amFAUc9bECws3z+8tUZUGZyaM9IoMcqrcJLgxEF4ROsD4v
         FRnpgshlhVl798FzktBt6tBCii2Qeby5O7dwKB20+SnBfD91+q6ATCG1z/ftdL/IFx8P
         utEQ==
X-Gm-Message-State: AOJu0YzwK5YTC2ZM5mt2SQlTFQU6GifZ/DXZ0bAy3uYGYto82+pF/7og
	fC3Br5xExUlxgI8YUEsDYN6CcKkEuPi5V9SnmCOj9Duvf3NewQ/SJgtEuETWFf+d
X-Gm-Gg: ASbGncsdT/4RfaJ0oVrnXfRaI3qQsNm1gymoaScQhB25cqpVygS7UZPlNkATIFHtOKG
	V1m8rHliGmyrGKhR15C6BS1fdQkUEW3vfZcBCUnhwBDjYyhUHl135OXQpWMQQrS7xUawsVkit9E
	pK+/aZHpq/aSzypyN/AljQxrMPfFoTDzuPF7brJx8BYLss2nH7AkMf6g5C6u8bQvfXvc6JtjQUn
	Trj8AI27h5IGnn0lrEH2HlxIF5tw8Z7amvfFMWWTutl6q80sLBEyVwpR1VDkrbnMBJBxP2itQsA
	YEpyTSM0NF1l8FvK43ca5kfs1O29ZiltTTcsR0ezpIB+VV5vgaqemQWjWsvDy+r7uo9oHwRVihk
	drmApKHAcTzNqk7FF3RKr8LP3nHx1hKXv0VYBqmHneFIA7U/gMLx8DEFTlt8ogYL12H/qmbCl2W
	osdb5mmn1L
X-Google-Smtp-Source: AGHT+IE/DtFI9sZhc0X3RwYmxcUxwluzeFuqyp+ctW2M3FPVBTkIc4VpRnjEFD+iqCY9O302s118AQ==
X-Received: by 2002:a05:6000:230b:b0:429:d253:8619 with SMTP id ffacd0b85a97d-42b52795624mr508866f8f.5.1762976145192;
        Wed, 12 Nov 2025 11:35:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/21] xf86-video-armsoc: fix SRC_URI
Date: Wed, 12 Nov 2025 20:35:24 +0100
Message-ID: <20251112193542.1589821-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121564

The previously used repo was moved to freedesktop's gitlab instance.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 955c5ab47ae7c44484474b18a0e9ffba467b47f3)
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
index 8b4526fc5e..271adb1268 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xorgproto"
 
 SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-armsoc.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 

