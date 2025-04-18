Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D719AC369CF
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:06 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.10256.1744977119340642673
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/DKqmYs;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so693328a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977118; x=1745581918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMwKFAovUjUL3koOqANQzkI728kOvHwejvooyQsbVB0=;
        b=L/DKqmYsd3ltz+MPB2aqibf/s9a6m0neKA/wk13dON/tfO2JnV5nT/HuPZS3514Dg+
         WRFkYWbzcMLu3j9mOs0TofXtEg8Ubtjee4NEKvpEC44C30jiuQjtsGQvxYZs61Y+S+83
         0LGOAD3kIx9JRTDlS5zrpAaCUIwp7F1ueFvnhixnTNa2mNfMkqBCGRkz/dly1Emg/JPr
         wg1PeJBODDh0Lk3K1WAtt6Oyx1yH9kIcbBpXOi7k3g2XY68E4kpZD4VXX/SaA508kL8c
         /uisY0TK6pKXHWoPbC7sbyI5f9frnKRpSUCCSO5RANlSrBe1BFGeaqKMie6/B9RSgx6k
         oSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977118; x=1745581918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMwKFAovUjUL3koOqANQzkI728kOvHwejvooyQsbVB0=;
        b=pOAM81AZPvDkrTXci075wlUrCeitp+f56oaGbkr+FX4HvkU2W+RB6n1jlpO1f5+8O+
         0OR6aROHQh8c3EP4M1QoktvPDrNRdQ0tQK5B8zMqNr5w4gOEVuHGof4TKWPPak7r1yze
         E8RB9b9Hv2Z0eAGx+xlxSWvtGg0a6h09J9WePg5ixeOgWTiNFMuEb6PikqEigexFJVpl
         2yNDVmFD6AXeji4rPx1pnO/4wLoX/2NIPR3Mmw3oNtS8Nvv1ewOY14J0599IDR3jWS7U
         ASBq3jIW7ilh2fLkKdWeKZQiOxVTQQIHSySdDIX1Uxcp3AjEDVBNuSoNE/BVJ3b26qZI
         q88Q==
X-Gm-Message-State: AOJu0YxQbjTqjpgdux8CAxqmhI6zn0Zd0GR67mdHyVDXbllaeFAAsoOV
	wcLulxt7at35L1fJxidWIY2npu+AX2uSvtAqDbYIBi8FNAqL2w+rz66imA==
X-Gm-Gg: ASbGnct1YEPWtwE20j60C13vPgjZBLlmR/yv+DeWcWvPo94I4WVOr30d5CrizvxSSNj
	0KtKkJKniVWdXJVZHVT2z7ocWTRZE2vEj0WjJ958ZAI0IKS2HJXmcl7cM6HQOMhIwUm980TtkBL
	sQlUVgI5U8otIfavvEQnf3BHgSnmaHz7L5Cd67PUyW/6KHmK/G9PE+AsGDN/U+4+sxI7qi6VokY
	BasRFXCh99xtM3zud03ktA50TwU1e2KSBQRUSpkAHcBjWZqELUbDekt1SOZk9WXNvwDzWjcgHQI
	n7iXjxmrb3KxZ3GEm3F1NggtClGZFWgzqYtRHELnMH1mmU7oWtZ2ary39qP4NzxDJ8fTVp14nsl
	HpcRgcqCbrANs90BIpyngN3tVbokXEvce5UI0bF2pozZw2xJWjtmO
X-Google-Smtp-Source: AGHT+IEq50TB2NhZMJ1LZHY4CDLp0BD2+FRHsQRluEGlMQy37UNYKTsquqAVU3jTiZrIBT+ypn6xEA==
X-Received: by 2002:a17:906:9f90:b0:aca:a161:f113 with SMTP id a640c23a62f3a-acb74baaea3mr212601766b.33.1744977117564;
        Fri, 18 Apr 2025 04:51:57 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:57 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][scarthgap][PATCH v2 3/5] can-utils: Fix build regression on musl
Date: Fri, 18 Apr 2025 13:51:39 +0200
Message-Id: <20250418115141.150272-4-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
References: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116960

From: Khem Raj <raj.khem@gmail.com>

This got introduced with 2025.01 upgrade on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Cc: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 932aa1de20..d4ee34167d 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=https;branch=master \
+           file://0001-Include-time.h-for-timespec-struct-definition.patch"
 
 SRCREV = "01083a64ebf28cc716efe2d2fd51c141042ae34b"
 
-- 
2.34.1


