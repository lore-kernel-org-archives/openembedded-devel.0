Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A89C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 18:18:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.66957.1723141079818161986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 11:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpyP2qQc;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3686b554cfcso625333f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 11:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723141077; x=1723745877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7cq6uFGy7M+vVg5ewEI/xgnXEKM5szPdQ1chVWcpsU=;
        b=BpyP2qQckSmOrPuY3sF1WDpY43tEYLTWd90ZGZKBcioIov8ak9xdycqeQn3I13bgX5
         ydG5Uagznke2WFPrSdP+mF17IxVAvgATHqaffjW7ZuY3KscghcRpIrcntkifgJLa/Re0
         /13fEA4O2Ctc/YB3KB3Z6u8VP/hH9bTRie7ZXKK9gZIghJ1ggaZJkDctEIJ5iM6+Y95Q
         mQGtFJ6BlwCKCtW7ntZAUu26rPvmeIKePeqP4Ym/6ogsF7WqS1NrQZPFKtrQBLDEELPv
         p7IZb7Enf4kJSgVcY8aUEYWOKrz5PIgbJfWHjurbLB2Vir86dgCKtbl7lHcdIxyZQcIv
         Xuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723141077; x=1723745877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7cq6uFGy7M+vVg5ewEI/xgnXEKM5szPdQ1chVWcpsU=;
        b=DJG31nrsnH7c3n8BKEkSIIX/NIl3eq5yQRvORK+ckvtYbipbfQ92wl4hHR2+leNqAn
         oTSK1dt5rX/MF4RdPotByFTR3K1DdX0gZJQN++L4UU2h2WLJkikG2UukiYJDSgq9cXEs
         n/0YLPL/h233cC5veWsBsQf0+UJxycqoaOQz45W1vTxQLrDdj16jI0SBBKhU0Uv7Ps7S
         IkXdlfK7jw39YsCzRzPMEvJF5ra+aoZSl2djoEbBYalfzBQM2Jpf5hLcU1hfRZRFyoBO
         tltC7CfLiDJPpRhhPORy28zZJRgc7POKPQ+6+YAVkEdgni+M//OYrFmU1u5u9vREAgSx
         933w==
X-Gm-Message-State: AOJu0YxNQzI3cCiYtfZJp56XwwtP7FK9n7484atOLsRbCeclWXmoxMtd
	q42KKwdCnATggNnyDTxVACPSwyqqtBKI6YqOT6/V24L17yCZzJFhXNzuy3N8
X-Google-Smtp-Source: AGHT+IE3o2RGECj3kL3otEQiPXOOww4+DOCofcyziNu2b4j8n6IPoZmh2PV4rmxMmf3gNVMM64tSyQ==
X-Received: by 2002:a5d:4604:0:b0:368:4da7:5c35 with SMTP id ffacd0b85a97d-36d274ee46bmr1733910f8f.30.1723141077265;
        Thu, 08 Aug 2024 11:17:57 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2718030bsm2707865f8f.50.2024.08.08.11.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:17:56 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-reedsolo: upgrade 2.0.13 -> 2.1.0b1
Date: Thu,  8 Aug 2024 21:17:53 +0300
Message-Id: <20240808181753.10036-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 18:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111680

Full changelog since last stable release:

https://github.com/tomerfiliba-org/reedsolomon/compare/v1.7.0...v2.1.0b1

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...{python3-reedsolo_2.0.13.bb => python3-reedsolo_2.1.0b1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-reedsolo/{python3-reedsolo_2.0.13.bb => python3-reedsolo_2.1.0b1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
rename to meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
index bb5b973d8..bd2b59d36 100644
--- a/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.0.13.bb
+++ b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_2.1.0b1.bb
@@ -3,8 +3,9 @@ HOMEPAGE = "https://github.com/tomerfiliba/reedsolomon"
 LICENSE = "MIT-0 | Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ffde61aeb8917e70e0257e0a4b6d103c"
 
-SRC_URI[sha256sum] = "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
+SRC_URI[sha256sum] = "e11528d63e75461d45b86c23f9db8260303d6ab6cae075fa9eddb44527ad8ece"
 
 inherit pypi setuptools3
 
+DEPENDS += "python3-cython-native"
 RDEPENDS:${PN} += "python3-core"
-- 
2.25.1


