Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE30ECDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:19:00 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.39590.1697206738673035512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 07:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=AY0dMB6H;
 spf=pass (domain: smile.fr, ip: 209.85.167.44, mailfrom: fabien.thomas@smile.fr)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50435a9f800so2814372e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697206737; x=1697811537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn71WhrS/Iw6k6IKKX+TZvE4ObB6kBnOWgIosuxTq6M=;
        b=AY0dMB6H33/8VC36KFEwihCWQQShHCWdZapyGA9Jf5mkcqEtd0wc300nt9yb72lDcg
         RVkocnHWwngtYKoLOE4CblKMR3KLQ0IptcMRmDwiJngWvRHnIVrG9dZvAYlIWSrvEyYf
         ATWUKJlxl/MXeyCtn6ixd0EjiXhNFVm49vIofOEWCVKQiayNX84U4h1vaUcfPEGXehyX
         J0EDu5ErctGy0ZPTx8DspzObPWvFh70CqCf2Ub3lIV8YcoND7Og0G7jzv202vTgNdtVR
         9hXsjJpyE7hzk22AraKBXKr7RUEMfKraR5YKuW2Cfrc5wrW2ziDhDGPuRfp0VapX2Q2r
         pbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206737; x=1697811537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn71WhrS/Iw6k6IKKX+TZvE4ObB6kBnOWgIosuxTq6M=;
        b=FLXrjxq6jsh9v+iahqlJJbMbntQKCJIDJkuXKFHI0OTKmYSG2SQaNt+74qX8wF8dhc
         OyhEXgwEeHkFjuXt7P1dkBFf4+It2ibSORByy40voubYzDRQmd+79rFIoqwYx8+6iaLW
         5AuX6MQn9tLQTQ6bMU4Fmp2AnftFEc3cETlPl2/1XEOmYlKKMxVLdgU56qLZu8OfCshH
         NEwP2l9bv35PrOQ73Q1gUnq8HqCjvEpldUy+OXXV5GM/Sd+nSNkRKXbNHjwPe1jS5Pzl
         U9DocNIErCKySjN1LYuBTiktJP7m7a9aLtfbDse8D4vk5Qog5iqidAFpYCYnfFLmkZTw
         fIFw==
X-Gm-Message-State: AOJu0YxXeh0ioFJHZ/ZXnJqIu2lgAOJyYWz0RzB8UtORETEQgunfSJ0b
	944phqlOPQT3bs10uZDYctSZBQl1gNA3RPyLUfo=
X-Google-Smtp-Source: AGHT+IEHq8hEO83fvp+d1Z8k/G2JcPy9Zrr6AqwF64pJ03dSw7YZnlWfrigyTnvU/S4iKzMvCJJiPg==
X-Received: by 2002:a05:6512:1586:b0:503:5cd:998b with SMTP id bp6-20020a056512158600b0050305cd998bmr26875481lfb.28.1697206736704;
        Fri, 13 Oct 2023 07:18:56 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e0021d4f13fbc3604e3.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:21d4:f13f:bc36:4e3])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c502600b003fefaf299b6sm253850wmr.38.2023.10.13.07.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:18:56 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] layer.conf : Add meta-python dependency
Date: Fri, 13 Oct 2023 16:18:54 +0200
Message-Id: <20231013141854.2949506-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 14:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105473

If feature ad-dc is enable, recipe samba depends on python3-dnspython
which is in meta-python.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-networking/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 2343179a6..2a541e98b 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -14,7 +14,7 @@ BBFILE_PRIORITY_networking-layer = "5"
 LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core"
-LAYERDEPENDS_networking-layer += "openembedded-layer"
+LAYERDEPENDS_networking-layer += "openembedded-layer meta-python"
 
 LAYERSERIES_COMPAT_networking-layer = "nanbield"
 
-- 
2.34.1


