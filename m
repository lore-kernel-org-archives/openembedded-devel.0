Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8507C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.39638.1744003241618594312
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ds+7FKnv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so3001200a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003240; x=1744608040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy+itHCgfewKLO1M6IBmZoVlh5ssDQoiaqyAT7ge0cY=;
        b=ds+7FKnvOwc9xJWASEU6+KhwfWEiaKyUwvtzTuWEDsQkEr/kKmfIClrO21vN8NrDAg
         Z42Mdo6bkRJyunCtc0wkHS7G7nR5bmMaSUc01zJdDBrcfRJfx/OgiHyiGsCUeQ7F4FwY
         7PuL8f+zaWiSqTBGQnQVtpRMTksLMCkWMBTiD6/PHoBkJUCB2PDEMQjQ755/4jFwhmyJ
         XBITFE20tjzTSLbtSxd7pxT+MDNUj4NqV/NE1FGtB9f8/B3PSznVLoe1kSY7/D4LdH0u
         p9y2azUVb77DDT+oAqHvFTBu8X0legMqlQLcNE11JQd8v1HxGi/COVhXKmrPTWKboXJu
         QapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003240; x=1744608040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy+itHCgfewKLO1M6IBmZoVlh5ssDQoiaqyAT7ge0cY=;
        b=NyJYO9Fx2xK3RnQKkDB/j0X/kjKIpQ3comFWpiC5q/z5gFJN8/4vYHBrMN6eLE+PON
         XgSGJdY3/OokbcfvaFDMr62OOkYOW0UA/cMUNYYcKUaogtzKQHPJkYRuFRDXOHHkUCsE
         ldlOjMMS2zMd8P8qxCD4n11cxiSvq7Q4R07TaMDE+DPLJMrG/lHr58Wg3ZO1XYsnh+M8
         0UMSJ8Stn5wjsOVw5rzvQGWq8YuaKo/pcdUb+j1cdP8l9ecqIklNMx6W4fc0kDaaURrZ
         4KhJJ4M1gO/fcHYY1PKq59RWm2aFfI7drBm7PpP4wlYOSiE9Bj6lOTO6uvRwvY/b+mhG
         KpYQ==
X-Gm-Message-State: AOJu0YzcSkXD52tjfT606+jWah3jF+P4Mdl2udN6TY65o3CRdK8U4QRq
	jltrYC3UHbIpunB+Z8qrBV5D8RXpV1iqO0bUicj4G6J4NfBbR7o2dYpKxydT
X-Gm-Gg: ASbGnctuSQDOITDE4bQGOwbzAUpEHAQvgMo5cGYHP6OIpQdpmeheWVWF30wWGWWP5LY
	2ttULJBXWKgtt9314D5/5eA4MCTVLPsigii3S8VK3TYffs03I2p5eFopX4pXu4iwQHnNQGAdG43
	bofeV8Z2762Ik82RLPXR08eVmSNhYt+4YfuqXOk8L1jD49hEkou9Y2hFLOoGIWBsIVEcZin5Jvc
	0DoWK1X0pwKunO9infsgztW9iYN075MT/PkhogzesCoXdL/cGMUjyLKM1FPIA2ZMjMOgVClPTfO
	eyoXjm0oRXibHFJpa/m/J1+RyXS65amaCB0i
X-Google-Smtp-Source: AGHT+IHa4LqHvxrWpGjE6qCxbaSC0j7lB+yO/IHuoxHe3z8DccOyjfzFPcMcmgmlQEvoZVg8mXbquA==
X-Received: by 2002:a17:90b:6c7:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-306a48ff265mr13639763a91.23.1744003240515;
        Sun, 06 Apr 2025 22:20:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/7] python3-pydantic-core: Upgrade to 2.33.1
Date: Sun,  6 Apr 2025 22:20:31 -0700
Message-ID: <20250407052037.502341-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116617

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-pydantic-core_2.33.0.bb => python3-pydantic-core_2.33.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.33.0.bb => python3-pydantic-core_2.33.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
index 11bcbd259c..687158815a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
 require ${BPN}-crates.inc
 
-SRC_URI[sha256sum] = "40eb8af662ba409c3cbf4a8150ad32ae73514cd7cb1f1a2113af39763dd616b3"
+SRC_URI[sha256sum] = "bcc9c6fdb0ced789245b02b7d6603e17d1563064ddcfc36f046b61c0c05dd9df"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 

