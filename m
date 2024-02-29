Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2FCC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 20:46:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.6230.1709239596319324748
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 12:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJMXsNWn;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29a8911d11cso959398a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 12:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709239595; x=1709844395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1cTunx463NrxpZM2IVD4L+30lUHGCxvKcL1KqSuRd4=;
        b=hJMXsNWnMtYsy6T8fPYFouGDC6DVtOuXgdGDuucIUILBGMoY22+/gV+BPSyxelEGrI
         8L2Ea/kiHgpRDp1lP5Jl1vpsXUNbri8Bhzv0egBg8N04Q0/Tab7DSnFqdVSDpHpK65cX
         6lHSWyNS6UA0RHheqDoe3DpJoiPRztyOdb/HVx7VDOFV/shaAGIKTWYB7GB8FpmiGkCA
         /iuH/XGPN/zXe7LftaQo6fQ9SRdXpBUn+I1sv+r+IsYJvd2otPIQxRqVPWWa5zMDk1rL
         zxzxAUvAN30ycfIj9MgQ3BXKddyv1gjsAX56UdEAqpzn3wxt3B0W9ioJSg7QNtPSEmbi
         LbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709239595; x=1709844395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1cTunx463NrxpZM2IVD4L+30lUHGCxvKcL1KqSuRd4=;
        b=GvPD59WDDFc8s1sFN5PcK/KMttWTS23gvlZ7zE9+WP/RGHjfTiStXU2whPsJwRNI0Z
         eAqttKjMIwgTWpPlr8yNvUKlKv3hY5TuigIg3clXHArt1BrfUc/MfLhB68wIdNthONk7
         aY8d9rYJpkyl/Z56MkRqO/rI/faAeO5GyUKP+ZPmsdJvjHuIEa7Yo1UPTc846PWQNOni
         /DUHM2tFJ4Ee254cXHogMo47FfMQ0jj0Umj94SoVMUIcYR2iDzW1AG1umUY8TjYtYABO
         v9ZNtm63ZNYMwn18sidmLILWFt7nPBDHqdPtb7kDKfPyiDZub/LdB+m5byYv4gPnMSlG
         501A==
X-Gm-Message-State: AOJu0YxPBGqmV+btRuMRj8plXswH6p4Wiq+jh6PfwAM5qZFRD0L2SmLY
	IB4jjlqjOQ6c2IhntbacOEidvyLyD2LRzFg+W0pq3Bsb3ylbgEaf+m9XxpD8
X-Google-Smtp-Source: AGHT+IF+6wiWQ/h54foXCuEazPqSTYgvEHcUHNeVP64/U/r8A4Ma/o0Xy5ltS2UpnwdtLIVsPY848g==
X-Received: by 2002:a17:90a:f60a:b0:299:5ebb:1ee0 with SMTP id bw10-20020a17090af60a00b002995ebb1ee0mr165372pjb.28.1709239595337;
        Thu, 29 Feb 2024 12:46:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7ade])
        by smtp.gmail.com with ESMTPSA id nd16-20020a17090b4cd000b0029b035682d7sm2451480pjb.9.2024.02.29.12.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:46:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-gpiod: Tests rely on configfs support in kernel
Date: Thu, 29 Feb 2024 12:46:31 -0800
Message-ID: <20240229204633.1320488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 20:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109060

Add a recommendation on configfs kernel module.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
index 0dbb38d200..d8c8628daa 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
@@ -24,6 +24,7 @@ RDEPENDS:${PN}-ptest += " \
     libgpiod-ptest \
     python3-setuptools \
 "
+RRECOMMENDS:${PN}-ptest += "kernel-module-configfs"
 
 export LINK_SYSTEM_LIBGPIOD = "1"
 
-- 
2.44.0


