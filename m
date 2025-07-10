Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF587C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 12:50:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8032.1752151819214266438
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 05:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGrwsyuk;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso7838395e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752151817; x=1752756617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwUzEN8zQeEMDPfHEwTv1m3CW9+VU86/VkyUmjuuvrs=;
        b=PGrwsyuktAayB6nKdkTi8sQmnrU7bLRPxK02y97+ggJ8x/BkAb4hVI/LYWFbpDCQiJ
         W5n9XiM156s1iljIF4mH5SjHYy6uF+q8UCavuIdJs3oKumeHDu4JDHGgsU6OiuuCoOv+
         XQxZ8iaOKGZ20p+4961Lxbbx5UBKIG14P+diT6KbW4+65umcaDnxwIc3RBcyIN0j8I4u
         IOcGyRuGumylyeWaIcIiTrUCbaneWe1y79AbLubeR/0wRnkaoF+LGcGAt7XYd5DJJP64
         66YiqybJwivZY8JxVZb/5pk4lOCNWuGqUu3VG67d91GryzGezlQj5HdIECWBiRd3pxQh
         5x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151817; x=1752756617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwUzEN8zQeEMDPfHEwTv1m3CW9+VU86/VkyUmjuuvrs=;
        b=oQnnFwMbI1ut3IycFiD5mY3Sf+3up+8kKL2hejb4iB3M7fwbcYQ8xODQ3wUnzEFVcs
         i0Ru8uc0ZDBvtj9Ktdh7pMzzhweR+fApV2omjtvSt9ZNKVo8XeF6eIzGbcdM+ZtArK/v
         I8MiOCRNgpWVGmtlh/8QHuqdNwDcJt89iRWhibPSaRV19SgEDJdtrDcxMV80DHOwfQvB
         mB202qIis8202WXv878FgxerBnRhvhBGCBk0ksEX5sy+kmtXGk+01As7s4q2GmnSwLOP
         W9VwyueaR6sPlJfGD+wB9JjAjdL2kXo44Pzhg4vfJscEqWLW263gKfV6gUS9+3vl70z0
         9xow==
X-Gm-Message-State: AOJu0Yx1aopZSRGIvl2cu5OabZzkQeuD8Ood7a7anmIJ4934jK/lNwjy
	0f09AQxa7e0HND1X9tostQUQi9kDLGgEQhDFctGZXjX5iDP+xXJ29sYmasIsvw==
X-Gm-Gg: ASbGncvml2ElgCWR8h85JRaJahlNrmJwe/cPdXXtBGynn+dA0EeaIlpHk7ixmGPEGz5
	RVaAnjAABIePrZ2R0o2K9BlXRr9hJCQtGItCP6aOKE3p7swvd9NWl28cMbduiy10khgGqYQrpPj
	HJpJNI5mNaW170PByHM80thxIU/EMb1rGjEWh8smcArAO+MGmDF4HAd2r9N/MpuG+MALDmYKP37
	DfDvr/oBCu6D/ZuRHiuZthbvUNfpBklMB8C52wY0l94ABFNHiVdH2vNifSmYRdLOhp2Z6/1Ijl4
	+q3cXRkgyj+qBJ896gRFd1SS6y9+Ng0pLdIsOZiZdGzeeVL6iQXkQgAbmTXW3h65tHX+CA==
X-Google-Smtp-Source: AGHT+IF/gFwMQXeKPi82E3equkDxEac2QOtjOBoy2BY+eF/U66rXZO5+UbXpmBlR546BIlt/ic7yAA==
X-Received: by 2002:a05:600c:4f47:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-454dd2efdaamr18949945e9.28.1752151817057;
        Thu, 10 Jul 2025 05:50:17 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1f4edsm1773262f8f.83.2025.07.10.05.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 05:50:16 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [meta-oe][PATCH] python3-genson: added recipe
Date: Thu, 10 Jul 2025 15:50:03 +0300
Message-Id: <20250710125003.2080700-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 12:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118413

Adde genson python package

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../recipes-devtools/python/python3-genson_1.3.0.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-genson_1.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-genson_1.3.0.bb b/meta-python/recipes-devtools/python/python3-genson_1.3.0.bb
new file mode 100644
index 0000000000..e23af06a2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-genson_1.3.0.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "GenSON is a powerful, user-friendly JSON Schema generator built in Python."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6c30d55dbfb3a28d420d918534adf6b"
+
+SRC_URI[sha256sum] = "e02db9ac2e3fd29e65b5286f7135762e2cd8a986537c075b06fc5f1517308e37"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"

