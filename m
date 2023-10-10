Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC33CD80AE
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 11:31:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.86289.1696927216416284332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=RwYv1NIu;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40651a72807so52205365e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696927214; x=1697532014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5U+SpJFPqRzh716E+5k9uzXO3pVCFa0UdTdvhr1Hs0=;
        b=RwYv1NIuDnYyLd1CoQnZmbSBZe0sgOFwLOEvhZbEarH4Z8XV0b36oWru4DevfFtJ0T
         do2NOP3VNpfyUPU+kv6UHJVNDqMpGHVlYHEuTFR7oLpjMSOGwz2uvPmZmUGLLGSLr5bS
         yNnaxey9++/Rw5Yztps+804r7z4egAk5SxQ9btpldMKhKF2UL7R1L/7b4WbvKB6BmiZo
         m8qVIgDx/eCLzfK+56NMIOjHy4l/ZU4KL7Rn6GwEd072gVtgu1EgQsHgHKOZkaE9/XJn
         edFsgasGXmL3XGPOJkjPoPkJ4u1d169FxmCUrQlTP0wqy/iTYKFWZ+s3rJXO/KPJDuEI
         CN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696927214; x=1697532014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5U+SpJFPqRzh716E+5k9uzXO3pVCFa0UdTdvhr1Hs0=;
        b=hB5lpuvlfc5hy69t2PtdLgvEZKZLNNMxIZF6QezGpRjkYwtVxNWHHOQmj4Fa2fXfcW
         WsRhfjA4ik7iZByLofvGBm+6R1UaVYqJhfjXuPuVZF0HPxSB0oUmY8tBB68HPB3L8WdE
         O9AjUhsWMDe4wmpRFEC/YapMtcVx8ZexTYKZwRWjDdqqp2qwH4MtxOY2D0sg/Jn2Un8K
         Yfp+w8aO/JFl1VnWcHEUno7VBH+5zZFDGQfoD30oBsXtSaHW1QRJXvWQBudYXJbCQr/D
         s0UNLSlH2T9PlTXXEI0pvmh4ak8QUB/7Ef8+m/8c5BEiet9y03zic0dHWMjyVXHN1R0a
         8kVA==
X-Gm-Message-State: AOJu0YxefCe8tccPmaisGxSm1K+HKFCdsuxay8B4hwn7SpbDO2otx+i+
	i1TsqWyscodHjnCxZIi2DR5yWS5AM5LioJfAFac=
X-Google-Smtp-Source: AGHT+IHBQTpE4nAXJm89NOeLlIgBVPf/a8V4CAtEFnLzVFLp2u3JhMZwS3sdw0p1pNIlnVS3HKoH/g==
X-Received: by 2002:adf:fb0b:0:b0:317:dada:2417 with SMTP id c11-20020adffb0b000000b00317dada2417mr14258128wrr.31.1696927214068;
        Tue, 10 Oct 2023 01:40:14 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id t2-20020a5d6902000000b003250aec5e97sm12163207wru.4.2023.10.10.01.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 01:40:13 -0700 (PDT)
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH] meta-filesystems/layer.conf : Add meta-networking dependency
Date: Tue, 10 Oct 2023 10:40:02 +0200
Message-Id: <20231010084002.55651-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 11:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105405

Recipe smbnetfs depends on samba, which is in meta-networking.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-filesystems/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 318e99262..4f13bd911 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -13,6 +13,6 @@ BBFILE_PRIORITY_filesystems-layer = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_filesystems-layer = "1"
 
-LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
+LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_filesystems-layer = "nanbield"
-- 
2.34.1


