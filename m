Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD15C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:28:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.31210.1723030116277666936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hmHMRpam;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3683f56b9bdso1132719f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723030114; x=1723634914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FEtRO2t4iYJuXuiUquc3exfeqtxRym9Qrj9Uofj+YeY=;
        b=hmHMRpam9EqRqxoSwRINBsTcClf9+nEa8PU1PriPnufDZVfxfVbhlPv7DeISpIH6UB
         TS38NAbUnDSx3y10cOzM7R5p17fvRgNFNDmh0S+Y/VhCyl9KW+lolwpRQoTAmhoVJceX
         YbByl/bOlGcTEnmpjm1pvvJGY79rFti3KbFnPiXRa5krjwbqVH5t5yAHENmLuj1j6vja
         N91tpUdeTvRvT9d8lS2HaiKwRDkIa2tQH27/U13vvMU1dvNr+miRFDi8P+6VsPt/5jvi
         ibwV25aneck59/Y8TOO1YcXk5YUzrwBEw+osI/XCdkmCVvv0Zel6iCR4wTj7nT5FyvL0
         cY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030114; x=1723634914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEtRO2t4iYJuXuiUquc3exfeqtxRym9Qrj9Uofj+YeY=;
        b=njiQRNUNohlj4BGfn/xXa48MvLRGd2GjjuXYrzKxxwHdHJ2GxjrrnJWPl8Sn1vHe52
         3cM6a5FPElssZD8c5R46P4Mw62NM5gFC47GUPXDoXr25FWgdsbsBSIvbO66YglklnKp7
         zA1P/RbJj93viAiOkWnHTfPE9S2aI+KpgNjHz5t2GzyUeKPfcV2tAUvtJh6KJ/lUfnYF
         tBwAmL+OnpHENdC7Hdk6YmXPrILs40WumP8plAtUOJbazgLCM+ESOkk4wcU3Mg2AagrA
         VXQ+6apig8wDXwbh5zLEoiDkpqnnvCK8iLfPB9K+oEuaJzUXjwRkRlF/H8cyitCWi3up
         Sz1w==
X-Gm-Message-State: AOJu0YwQEU1LwYYPtqD9vwaI8GWTv7J6SBsq8YB5NfejVclidY7Co3Pw
	guqt6dHUAwkfaBQ9c8Nz4FxWS64dw2LryBYN+ptMG7g9AHg/DgiB4KdOr9kh
X-Google-Smtp-Source: AGHT+IEag/7El13nZfGoFSRWeu5F5ZNIDid6jpOxorkEdrUCjyFADZd9I5mA+x3GaOEC8hTOSFTLNw==
X-Received: by 2002:adf:e886:0:b0:368:5a8c:580b with SMTP id ffacd0b85a97d-36bbc0f56dcmr12526807f8f.19.1723030113958;
        Wed, 07 Aug 2024 04:28:33 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd028842sm15555133f8f.61.2024.08.07.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:28:33 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pyaudio: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:28:31 +0300
Message-Id: <20240807112831.72299-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111615

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyaudio-0.2.14-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 1599ea834..6a325dbe8 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "PyAudio"
 
 SRC_URI[sha256sum] = "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a491f790a0895bd2f87"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-Remove-absolute-paths-into-build-machine-system-dirs.patch"
 
-- 
2.25.1


