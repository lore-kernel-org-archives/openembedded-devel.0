Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FBCC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 20:17:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.55656.1710793061099790819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 13:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BzIIX4sM;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: geoffhp@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so445462b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710793060; x=1711397860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xr5ZhSP4g7HBLhTeno/4zf+9kc4hlihJxM5zQ/cO9NQ=;
        b=BzIIX4sM7CZGvU8+UE7m9tWUM9fINWDzPKQEaNLiLMePYx9y/4nktA8t77nDv4k8mM
         /o3jFZjnV4n2YGojLzsIMsF9wzePxkoVzKrpcQNqgEZvN45QnGErvFIMy6ymc55ML+/U
         6ZM3Ce9x5JRvqGP+slmX11meWcblMeZa36tA+jBKd4wq1OeO08h1pUHscbvlyV2XesEM
         3CIkgo0tlyuF/2h654n0rMpAowz1OBfbhbEJmsX645bdC0tq79iLh9pOxDyNCCUc/cqK
         pOLpOQR5UlPMjhChoq29XYj/fQG6MBslgqTNwKp4xzriCNx0iCQk0MuUC1ph6RIqOH8p
         +//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710793060; x=1711397860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xr5ZhSP4g7HBLhTeno/4zf+9kc4hlihJxM5zQ/cO9NQ=;
        b=tA74VU19JJPlZW1quZg6EBItyKAUmPZEc+HIVh0FL55zh9L+pxKGsvRsDVdPekTcQP
         tJ4kp8omYvgaJDTfAKs7mdF1RONXczoA4f6DQAyOC0sfKYroYZJm+HfKjhAyZcYgQn8f
         i6QUKxZIbn1bThofW0GVS5cf17qdVHbDBKk5qyWzVekduDsh7jY60guyUYcW/UEwlSLx
         NZf2FXDgtN8hCqNpbjMkDroL4/S9uofCfWYXToXM6b+piq7FkzSP2UmvtdsLb/OE4LmR
         3ZlU3LSuvqvNp7/mprBWELFcVkC6TdFInn5Z6/Iw1G79ntx6ae161Yj2wdMWNuAIcnry
         mdQA==
X-Gm-Message-State: AOJu0YzFAfUf73CdQOWQT/5zKXkJYNXT0iUzMPNiaILFXsRDVb/MgA8H
	KVoR1MUKT6K4Bl0aFI1vkLCBLFs5ylEVSap1MQSbhSMrqJLQGd4SCjP32DWujHU=
X-Google-Smtp-Source: AGHT+IFSAvxfl4Os1q7Is06CrRXlzeWyMKymUbuSDSyMyDBiEyq2ePuCWSTvKpH6wDgjWxydcYmKag==
X-Received: by 2002:a05:6a20:9146:b0:1a3:6737:3d25 with SMTP id x6-20020a056a20914600b001a367373d25mr4819535pzc.36.1710793060143;
        Mon, 18 Mar 2024 13:17:40 -0700 (PDT)
Received: from localhost.localdomain (107-185-056-205.res.spectrum.com. [107.185.56.205])
        by smtp.gmail.com with ESMTPSA id z189-20020a6333c6000000b005dc87643cc3sm7576937pgz.27.2024.03.18.13.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 13:17:39 -0700 (PDT)
From: geoffhp@gmail.com
X-Google-Original-From: geoffrey.parker@arthrex.com
To: openembedded-devel@lists.openembedded.org
Cc: heinold@inf.fu-berlin.de,
	mario@ossystems.com.br,
	maxin.john@intel.com,
	otavio@ossystems.com.br,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with scarthgap
Date: Mon, 18 Mar 2024 13:09:25 -0700
Message-Id: <20240318200925.1197695-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 20:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109413

From: Geoff Parker <geoffrey.parker@arthrex.com>

LAYERSERIES_COMPAT: replace nanbield with scarthgap for Yocto 5.0

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b6bf909..71d6a10 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "nanbield"
+LAYERSERIES_COMPAT_meta-java = "scarthgap"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.30.2


