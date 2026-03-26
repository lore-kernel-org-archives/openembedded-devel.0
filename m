Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA5310A1E76
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45498.1774523026024284608
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MoxnhTm/;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8296dabef74so830564b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523025; x=1775127825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpZweoZFypDAryZ9dgNaOFCvEcPaXPELsiczs5icxnM=;
        b=MoxnhTm/fW6fSh1fcPoCKq+Uk+3OVmKB5+BBXAxQSJ2ZQzaIAb9xEwv1FUsJ0wAp1m
         OeNJcnThvXWqhq2qj27tmugamIZLwoWEIpbFqXAKi9PMzbA1LyDAXGMVFMmSEKhRVRFP
         3FrLQrAq0B4prle5H1eOkaWSmqcV92PVHWqDrphhEvvEwy9o29deheu2qSYWVwV8UdU+
         T9FHgsMurqrUvOEGxCYfgn+Ku10m9CoIS+GVSSaaI6exTYXrMeyqYULjhGRlUmeCRRgb
         k3DM6nyu4/5Ce8Q/QJ7/vcrRyewWRBvSUknauP79IinbXEvdKFiiBAT6MgmiDWJUVCw5
         1mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523025; x=1775127825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpZweoZFypDAryZ9dgNaOFCvEcPaXPELsiczs5icxnM=;
        b=QT2GkxURC/qvJfQbE/eq3JSJeU6jyoOY8exi/qWGjV8dc0OeWZAUUkoncq2ddPOxkt
         jhX8/4SuBgmUV355hyiQZz59FzZMSRpGxmS9G7n7QfKYJUI/EsKtz07U4Nhw7WyDnC38
         z9vZp2sNCIarbbVqrEvY5AI+Lg8IW31kkZ2Wr6giL3do09x8/LSryMAU6EtuPKWKGWAZ
         f4OqpDunZTxN0QjZdog0P1jh+jO7XkqErzG2llYkv0Xe3dHqBkCVSuOQQ10KP4bMvDCe
         +EmqiTk0F3kO8Rj8/yV5K9hlDfVVEUpi2iFCEVkCrrPpVhRG2NAUA+Ri9qjdc/nPUv8K
         ICYA==
X-Gm-Message-State: AOJu0YzKCXQz1olhK1AKYyRs8h2lzaix2Q473qPlUXTZUnHM3qYyRNuH
	CMmNm0Retqxlb26e2wFe37zAXDUrIiPUNuNXYyMwasJnE0WEXLeKD5NFT0OdhxVu
X-Gm-Gg: ATEYQzwpx74lbArCiwXcRbaQu9sY8MayhQYIu/+wSVOQ/QFYZsjsWMSw6dyfKSp9uml
	j/+wgY6I+f8XqEzHHwSvzz91nUT+X7T6ff4Ic5odhiH9G/Qus5AUg28tWyN8dg0eVBO04vtEXI2
	Ttk38XS8heSSPzwRTq/wh+H50D2H7dHNH150XbtfH6JDkg6Xy8vJ/ZFVZ8wvGRiCC438ugAfa25
	AmFm5cAS5QDXIj3hlLnaSZz0IOtFJP7cTuax7Z6bsYGyWfAAkF0JDkmsX7mX1qK5LYOlYNNYuGn
	Ji314AFjPcKqBq26LGVYDKJU1ygx+8LayQrwyEEMAKp0jsklm9yLOwV1nIl5Pp2EHz1cBVXrkJ0
	o9qHf5KFrABaYyMMGWcfqM3VimwB2GJZm594M54UbDob4FINCHs9luGK9QwtayhFyepohUmcjaM
	vjV2m4XjadTywkjFLG8AYUmTXKMspuD7aOIDc=
X-Received: by 2002:a05:6a00:1c81:b0:82a:6569:1f88 with SMTP id d2e1a72fcca58-82c6dd8cb25mr6843938b3a.0.1774523025204;
        Thu, 26 Mar 2026 04:03:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 9/13] webp-pixbuf-loader: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:06 +1300
Message-ID: <20260326110310.1809866-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125650

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
index 726139a6b3..00cea42ca9 100644
--- a/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
+++ b/meta-gnome/recipes-support/webp-pixbuf-loader/webp-pixbuf-loader_0.2.7.bb
@@ -12,7 +12,7 @@ inherit meson pkgconfig
 
 EXTRA_OEMESON = "-Dupdate_cache=true"
 
-SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;branch=mainline"
+SRC_URI = "git://github.com/aruiz/webp-pixbuf-loader.git;protocol=https;branch=mainline;tag=${PV}"
 
 SRCREV = "52232e4ba282b2fed68e8fcb4b5d45ed0eaa4ed3"
 

