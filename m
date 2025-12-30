Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAA2E95A8B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63175.1767097503630952328
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VZVESh58;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso89768095e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097502; x=1767702302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=USRKtRUeJP7hg0nR6VqzEPx53s8Lb6J3qddJWL7ida4=;
        b=VZVESh58SUTfRiRJnIilUtshE2Tr1BJ5D1GDP5vXGTCFWpkZw3IR7M2eh8Bg6IyHbi
         G5Jzyru8AgjIkMNke7Hd7MnKBLhd1pzzon8iKcX4YozShn04Ku/4x+pER4g+gA6nCrTL
         tkO+CBqAQQxI7m9faUm3nBYKk242SefULxFhEtSsGNPZIxK5gKvKYLzWviz3CM9G17Jl
         cPW7jE6vzB61GEzseZGcRsXoImC2/DL7KgLahkRaU9t1i7isT+B+eAbQkwO2TUYDGaqb
         Jg5QTgxVnTbxb/Wpi9qS/XKLGhkfs3PlnvFmxWQE7X8BUaNuhKyIWVNSsAAb5PHAgqov
         SOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097502; x=1767702302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=USRKtRUeJP7hg0nR6VqzEPx53s8Lb6J3qddJWL7ida4=;
        b=mjMz4Uc9Ku5Atbr+jDrnFae3jyF1woXJBw6Hxay+7D7LxB5G/73NKU2cbDW+V0ADLw
         hjinT5dZZjEyCVltRj2Q0K+WmmFD9pop/ukIA1GjYTS9cWDZkhuE0Xy4IlKGthK2P6lo
         iWvEW9LDiSm2AmlljpeRig1QYoT+HH/nKEMrtb8VvR+WR5nk0xBiaKXsI8g3JdZsxNh0
         GR/7vwN448vIbAIP40iOW53dO6cSl2OdgcM7FLvmev/sNt/FDAhQfsTIKohuA4MOJliy
         CS6j/jpwfxmLIjxhda5Rj/zA0ABAYOmoXezZr2hvfE1YvNxFuLgEMX+q+dghMGvR7az+
         j+6w==
X-Gm-Message-State: AOJu0YxnpXHnsbrPqUDcGDM1gXhxhf6fgbxN8cxHLUyOj+GPqIALN2iH
	ckHUJqE2UVNFHYPe8Z/ZOkt5aASs0/JY583IbuuODfgE65THs7GyZmZ8wwj3hg==
X-Gm-Gg: AY/fxX5BBR+829zeZEUIX32dF/qNa2S5sSJCjIeuLUG52VYb6q00/ZCh+mo6HNYuAA3
	B4XxufyBtndtKlFCRbiBZYOE0quuBm6LuR6L8ijzUFEX+2pBEBeGkuDfIPboPu3gGk2bX0OqAHE
	uw/Yk7bCISPypjMCrHkYG0CvWRiAqGeWmE1A14HVyk8cHuDl3l3Zj84jq9b/Eie4HjMp/SEO9zq
	YfGZS1AflncegQUAaS8aTEAwf3zBkLjo57Qf20I5bX2N1M9VUWFHFPpwhhv6jkBawTcE+P0tMKP
	wmoZGtcWP+zH/TFV/CQB699AzopDihl7e+KCVHWtwfqiOv9zKfv6TdXO5zqfNIQgpqcVVfK5YRq
	s0U8+sHnAIrsO25OC2DpaxYw8Do4CseiuMNSsm/KYCHFhdOvOEDFatJIRfb4VyVBFFdkyPaYKU5
	BdTkGrPxUk
X-Google-Smtp-Source: AGHT+IFUOh+Fu6wBeJhuz7WsF7aEO4CT/JMar/H4NxLVR//honDe+2ZYR4aLZibysWipWI2asDgVDg==
X-Received: by 2002:a05:600c:3b0e:b0:47b:deb9:fbc with SMTP id 5b1f17b1804b1-47d1955b7f4mr309197245e9.2.1767097501785;
        Tue, 30 Dec 2025 04:25:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.25.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:25:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/10] python3-pywbem: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:54 +0100
Message-ID: <20251230122454.721515-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123016

Relevant CVEs are tracked with pywbem_project:pywbem CPE instead of
the (previously) expected python:pywbem.

See CVE db query:
sqlite> select * from products where PRODUCT = 'pywbem';
CVE-2013-6418|pywbem_project|pywbem|||0.7|<=
CVE-2013-6444|pywbem_project|pywbem|||0.7|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
index 59c9914bc2..6857563079 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
@@ -49,3 +49,5 @@ ALTERNATIVE:${PN} = "mof_compiler"
 ALTERNATIVE_TARGET[mof_compiler] = "${bindir}/mof_compiler"
 
 ALTERNATIVE_PRIORITY = "60"
+
+CVE_PRODUCT = "pywbem"

