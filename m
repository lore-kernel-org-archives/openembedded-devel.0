Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849C7C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 22:32:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.488.1713393160018792255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Apr 2024 15:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lVJ6Lwlg;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: beniaminsandu@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41882c16824so2235315e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713393158; x=1713997958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9Jm9/xHcTFYojXqO9pzTKv7Rgo9/o3cl/SEdeJMM2o=;
        b=lVJ6LwlgkQ/wi0jXwCoIZ2AIuH1/IZQA5kcoL1pHrgyoIRoazuw6yFEOTC/E1/QlkU
         4qBi/E59ZgRZ1cinrEE0JP/OMO9RF2/S0M36QOskyRr1z06EA3aFffBQ7ny+1bUDhZvX
         dQO/7FNJcDvaghbLcqPU6yK/1wLyKN5zEvFH9nsZyM/bH1tNflYQfrGaB/KDgoDpycvF
         qT6RiqpQoF2EEAp2K48LJoGjglhxDEcdb07vDqfbq2RHn634bC3Vu8VkvsFAeJStRkoR
         nyYN5CP7wY80U/QBUsil80szQd1nA48ahWS6pNoDLoYbCoSLh7+qSvT9shg6GqNVqgJy
         l4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713393158; x=1713997958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9Jm9/xHcTFYojXqO9pzTKv7Rgo9/o3cl/SEdeJMM2o=;
        b=jDqVn3oiGMjQYE47JIqgR/cjwBA+3RiVw7lIFTz8A0L/8evrdcS/rr6fp6tiVtjXgY
         nxTSl0kmdavWhnKNxXX92b5klLCYWTKp7xfUHn9TaLHUpkMFgHlCV/2cDj9VuOAIFLgW
         t0J5DevOrYOY5uF8uawnaRkfwpXnnha3EaBQuiFfj7TrfmfYuOhDmCtKqtiBvYKp6bty
         1Zm9tB8ifzmejSdloyK3vXtj1A/fEDJbImagww/hoJwI3yGadb1Won/XB4wksIQc2Qls
         TfN4EnoRDj2CYFS+J4ugQF9B79Oon2N05Ez+36E3HKJsg0e9Wjy0LpOIaQjdgEf1AL+2
         zq8A==
X-Gm-Message-State: AOJu0YzNGzijVO6ZdPd4sCd3JvOmC1OoVOXM/8rGDBftmvLn24ELDq0J
	F7OsPx8oV25qzqPZbeILH3C/9ewuMxJOoH+85/vijNTsyCLcKDDsVaMy1g==
X-Google-Smtp-Source: AGHT+IE3qzzJJRPK6dU1Og4DXDTgFvzdIcYRCYMo21wCxodfimXvlh/EvX+toKepgyP46yZ6S4zD9g==
X-Received: by 2002:a05:600c:1914:b0:416:605b:584d with SMTP id j20-20020a05600c191400b00416605b584dmr670473wmq.3.1713393158400;
        Wed, 17 Apr 2024 15:32:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:8855:a800:57a8:4f82:7788:d99])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b00418d391b09esm495428wmq.0.2024.04.17.15.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:32:37 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-oe][PATCH] libtorrent-rasterbar: fix CVE mapping
Date: Wed, 17 Apr 2024 23:32:19 +0100
Message-Id: <20240417223219.893512-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 22:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110047

Set CVE_PRODUCT for this recipe to fix the mapping,
as it was checking against the wrong recipe before.

Log from cve_check after change:
NOTE: libtorrent-rasterbar-2.0.10 is not vulnerable to CVE-2008-0646
NOTE: libtorrent-rasterbar-2.0.10 is not vulnerable to CVE-2009-1760
NOTE: libtorrent-rasterbar-2.0.10 is not vulnerable to CVE-2016-5301
NOTE: libtorrent-rasterbar-2.0.10 is not vulnerable to CVE-2016-7164
NOTE: libtorrent-rasterbar-2.0.10 is not vulnerable to CVE-2017-9847

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 .../libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
index 084e3c408..f2de1f468 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.10.bb
@@ -17,6 +17,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig python3targetconfig
 
+CVE_PRODUCT = "libtorrent"
+
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
 PACKAGECONFIG ??= "python3"
-- 
2.34.1


