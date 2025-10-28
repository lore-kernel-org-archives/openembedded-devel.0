Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CFECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 22:28:21 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.22323.1761690496257720163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 15:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYG5+71e;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d71bcac45so68502447b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761690495; x=1762295295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LxTUg43mUTuSzRmXrW65fDp9GUOhqnSHatJCktRaN8=;
        b=YYG5+71en8QFHG3H64GDD8qvOoVREs0KtDlyIGqMHQH22d4w75PuzzoryzB6b7HJ08
         YfVxONIWXgVru2hoosolkHILveI6MFFobgsv5+cYRMZRxge5greNAWjUTJLEXLNxY0jy
         dgKQQnmyj8+LJPKIH+BMDhjxFAfVqkrC19OMK4vx2pQ6BzRM0txc5VcfuVlCi7EbFcwt
         urdAO8E3zZl4Px0IRRFPiCuhIPdArImjE04O3ICJ+9Z5LQYSCsDazzzpsqGA34MgDlxJ
         lfx/9swWoQeoKbr//3Qz8t7crxeIHE6zvDNMPnxHq/OFft6WtEJ4iv6p0hqUx9j/OL+e
         kPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690495; x=1762295295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LxTUg43mUTuSzRmXrW65fDp9GUOhqnSHatJCktRaN8=;
        b=OI3UqKlxTIkv7bTS28C+RMXSofVq+4Nb1rp1qV8Bd3SNNtdBUtp5m29XniQEDy/b0F
         eqXnxw1dR6YbXraKKAdpDDuyitRSuHbS0ENKSWt2qtJcryooZzdfts3cZ3WIFZjLOUIP
         rKhP22t8TlQaNhf+IzBV+9qN4xAEzqydM72K8CUumZeVvMpn/2u1iFYm9B6j5VM7lzqL
         6t+TNFgKJ4gSmDtBJM8NWE9OXrek+d1UbM5vt9RGuRCXlUyrhfmaYkWS6TPihH9ujKGH
         unzu/unIXCTdeZ8mqzetd+AUg9ALj9UgmcNysS0RH1A+N6QipL0OmgkyyHqngdXe4ZAF
         7OCg==
X-Gm-Message-State: AOJu0YwgLIqCEPcgHDy81wiXRzyb0HDBD48IX+zJAaJTFZmGZ1zC/Trt
	SOgamuEzY8DR4CYxJylxxM6qHzKX8BI1g7kVuHmm2W7MpEP0q2NoTWstRFSfD/2C
X-Gm-Gg: ASbGncvRFVmwQchfSJWNEXT9qlZWyFbjzLHAWU+UlzULA+eJMFbXQyprhyzQVz/R40l
	+kUPpF0Exn12u0s3pkCuCt9YI573IvrO4wrPvKxib9WXw+XLgxAVUjj+FOyqoqe1p6boUdyarPc
	5Dw9pbv3MQJjmJxCd0El+UXvp+sHVc9jtgmMbcqAJ26+JZdUGQS5YFrc8TP8aV3HV45bHWfoc1r
	F4KaGQD/zj3Q5Y1kz+tifsAeoU8ENXAnv2G4DrtaqFct5FhwhjnITYdjQ4YwZejMNZ6x7Yw7nnE
	2JOTKJ6XYBKRfZ1r7PRXSaFDCUZz5NbJ5X4SXRBm+nFQ5TE7+B5CWSSzvtbQBzyNUqCTJ86CtM8
	YRPOs96Gwtu4F5tswDdG0eBZjLarMMDGytip/edQSLMPnlRpFK4C68eBnGfeAeP2je8wD6ZZrsL
	7Qo2bnLofzKXtIEjVZx/4V0Fjn2CoNX5g=
X-Google-Smtp-Source: AGHT+IF5f0X+psJ9leqjp0TIo8s/D9/Bhc0lyAjsYGEcQJuMY7YIhYG5RYcCWC0HkHsNJJth6GKwKQ==
X-Received: by 2002:a05:690e:4193:b0:63c:f5a7:406 with SMTP id 956f58d0204a3-63f76e05ca8mr931763d50.58.1761690494904;
        Tue, 28 Oct 2025 15:28:14 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785ed1beff9sm30930157b3.41.2025.10.28.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:28:14 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.21.0 -> 22.21.1
Date: Tue, 28 Oct 2025 18:27:38 -0400
Message-ID: <20251028222738.134423-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 22:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121102

Changelog: https://github.com/nodejs/node/releases/tag/v22.21.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../nodejs/{nodejs_22.21.0.bb => nodejs_22.21.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.0.bb => nodejs_22.21.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
index 6d1a364be0..0cba529673 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.1.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "791b18e969ea22cc952108ee8eaafbb12cddfd973bbbb0b7fc116395c0d9a81c"
+SRC_URI[sha256sum] = "487d73fd4db00dc2420d659a8221b181a7937fbc5bc73f31c30b1680ad6ded6a"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


