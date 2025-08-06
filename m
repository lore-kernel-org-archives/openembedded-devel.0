Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8DEC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:22:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.20218.1754468522286912673
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qv8Ku1Zh;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b792b0b829so5202097f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754468520; x=1755073320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhiaWhSSRqDjApw21a73Xt1SjPx6YFpfS3SjVv+vXUU=;
        b=Qv8Ku1ZhG5zHvF+PJJcPBBGJ/mq1cRWWSzuQR76SUuDweAj2HIZ0alX9rhNcimVzyy
         FJ/bggTQ7iCLQsIFwkWzLfjuPpOHNSCvh4xtPa9DOSDbefTmMqahKm/QjDQwxuguDxce
         R3xs77gGq9gFTmAtOVG8PmBR2uvvlbvmT6DFF+57suvYZ5b9e2GAwhAMeIvoEQkBbaq4
         bKm5G0sccTTxtVYz8LfrEf/nKfaUAmXSgE3Pnf6i07DPnDTQay4SxxzQGvuBR77Wotos
         bc8QGo7kuxJ54EkDLJYfPYo7G2Z14vK0MW+e+7s45rzB6DtQtHjFMZy+DHC8olXhwlX5
         hTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468520; x=1755073320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhiaWhSSRqDjApw21a73Xt1SjPx6YFpfS3SjVv+vXUU=;
        b=vddaCoqf624HQuxqJqDPu691eONAxu7w8cVx3nPRSxlhqusMo37c71lCP3tzacPfc6
         f9aNqER7aZGhJfAHWd0wprfSEITpXJi3YJHfiA9xQMYGPHzKx87KGjE/RV2+j+s31FGu
         8q9+i76IYJ0/1G1OVCsu0+KWP1IgUtuxMMNAFlx3qZ8vYGYRXnEChthqeA7wL3hIFUqJ
         5KzEfMqvmanJLoKOrnN1wyYyKV1lbOITHgtyOVjYtxe3kPhh1O1VTVqlTaYdpTtYDg93
         vvD17M964u8V2eqcVcTpYVdFB0LMoR6X2GMfridzbwdbqohUU/b2Gw3v6UfufVtlzJj+
         Qbww==
X-Gm-Message-State: AOJu0YxmdAn1D5lU5leMGo6UIc7eVntmEU6JNxUVuBo60mV2srIf/8Sc
	Qy3e1QWJGOSD3L/4AlB96H5brwA21FxCF3VNCNG/bxrIJct9G5ddp5zott19zQ==
X-Gm-Gg: ASbGnct112tiZYyIvKJAWRza85FdDzI+nnyuqAUBEIzKcKO9Xjf135HUUzr9TDOH5VS
	ApVVxlWCX2DsbNOehpeMqWmMAWExMyuDvP/sz6dC8moHNxI3yRf/7QTNvHGZUcUkJaiif7ZKL6D
	2H+KJhMUHQ5U+3ISuXWY8ReigByTb0+cPj4WwVQOt8RaqbLch79Fx9Aoixk9U8MrUANrGlDsjo5
	Qk+qWoAfo2Py0gk1s0rta/gUOf2J+M+P/IMeT6Jq5BnS53Zu3s9xbKWWSIgcIIrmro1FHxrLNzd
	OnPtQtZZz/EMKH9jgp1d7kVusuDgfEEpYag6CMfbhXTaFS15jdpn5xJo3UQwyoNVO2L7q5MnUI+
	+m6oIrLMkivoJ9+Oqi4sjoSyy/xeeAiUDzwUqZP4egRgSAHT+pRnEOOMmxli9ijwumTH0t4erxy
	qkZI1svUnokGxPoWrdkJJ38qSAVGRc
X-Google-Smtp-Source: AGHT+IHF0mBUrAh2gVbcI2QR0rHsmfAVbmY7Y7iudwfokjNXP8YnPymvi6eDrrs6Hb6F8xJPh7aPRA==
X-Received: by 2002:a05:6000:2909:b0:3b8:d2d1:5bfc with SMTP id ffacd0b85a97d-3b8f49152demr1236375f8f.37.1754468520247;
        Wed, 06 Aug 2025 01:22:00 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5843021sm42189935e9.3.2025.08.06.01.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:21:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] cli11: removed old SRC_URI[sha256sum]
Date: Wed,  6 Aug 2025 10:21:54 +0200
Message-Id: <20250806082154.29108-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 08:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118889

Both SRCREV and SRC_URI[sha256sum] where defined.
The value of SRCREV is the correct one.

https://github.com/CLIUtils/CLI11/commit/4160d259d961cd393fd8d67590a8c7d210207348

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-oe/recipes-support/cli11/cli11_2.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
index 82203b3019..f6c9ac8f69 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.5.0.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8bdde6bda8508bef68a39f3e0d7e939"
 
 DEPENDS = "catch2"
 
-SRCREV = "4160d259d961cd393fd8d67590a8c7d210207348"
 SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https"
-SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
+SRCREV = "4160d259d961cd393fd8d67590a8c7d210207348"
 
 inherit cmake
 
-- 
2.39.5


