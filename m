Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E68E8FDAC
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 19:10:09 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158345.1766776204208643435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 11:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XB8iHR5q;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47796a837c7so48493985e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 11:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766776202; x=1767381002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ2V13+EsI+CcuzRonIgaBLNwmPPXemePdg47GTrbAM=;
        b=XB8iHR5qr1bFXGldCexmLssaZZSuEBnncT0Nspvhd22icEU9QlqBu1/B9E+qFYsy0h
         yPiBvy+/+7IOsD7Tp9gOSgDEQN7U0dfj8+wlplF7nsLWKw8RH0Qj2gDKpjK4WuCW9vQH
         YkvoNE3PfgbgUQDVpLEGB5GJ5t5iORehzmk6vWaV1lBn7hckgjyXpp3ErVOdI0smZUo6
         W+8xT4aQxJWtcX2vmzkrUeO/VeN9aAUIrh3fgQtrq+3xSBpnHpC6kuCK7E+FTUqgpopi
         WG1XUCyPhKJAbKmq7Yk8i6XNfzduKU8OS80+64jwcGPvlDzWrpovrYuwX+TGvof4/s7s
         JnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776202; x=1767381002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ2V13+EsI+CcuzRonIgaBLNwmPPXemePdg47GTrbAM=;
        b=dLGUVCNYrin7cnF7ZOKjkIx6h81Rm5nHmXvJFp7g4f2zEctno3+H3/nSrbHoE8a13d
         wohMH8R4TdZ2Q+Z2jpzpYguddJihEBXYkjhx5V6ldPJ9Yj/dJ6vU5s8OmrFH5t8Vp5vy
         hgSIJMMPEtZWCuTivCKGpdNAyTr6ZW2kIPk0thYiwGPk1VQWEXc2hAc911Dcoyyfrn6Q
         dixHHNShiREKy8Yh4Q0qHRp8Zha1cp89MGxU08aGgA9NV6Nv0OqPPs0UM8QIK1EKWhCP
         P5Z2lVH6bgMLcuxBgPM7C2oD323Y5PifgQehmH1z7ZEoNeNui8LPwt3mIgXBYXQ3gK5M
         Su5A==
X-Gm-Message-State: AOJu0YwVEoI1y98iqHQAbyTZ6ZVovMicCkquARakSVaCgNfjO8C/Foam
	0Hfn3D5UPc79DebfIt95/dkbeYIsdwaiOq0RGvo8Nlt6BBY0I3PyGXcbx2xtFg==
X-Gm-Gg: AY/fxX6ful9HgZ+PDAfWVOY3bLKlvsYX9R80H783nm4VaOINqDdCzUTQQ38vHYEizod
	3iIHI1v3nnehtF69qYNWxHdu9g4NgCZnoBUnT5vAnbyVKuT/HCHRQNmGpiJZDcCJ2e10P8nd8ia
	DvFLl8aBS9WN77sh4a9OGmo89uZZMvhYW7EFPEfhbyaoT4RA/1YF+fAC4Srn20FihosoxtFJ7C7
	H1LvSd/cksV6pxCVJ7S8t1OvCMkF+h/YbgOq+t/2fw6Hq1nXZCVP2wyKRzQ6+eOZ5Oho+3YzglQ
	rAPl2gZTCjc8EFR2RRvOojcc8rYnQMcwV1lBRz1FcC+GAcSQGpwyLmFh7+zuYG24XedpM4Q2QOx
	Z4q/njSwTaX46By5BFuppzbEFJf+DrmPwidxo8JM/YbpNOSG0WqUYczpHnGORvqmPOuIuQN1iV7
	kFYAce7BYv
X-Google-Smtp-Source: AGHT+IE0OzOsnSOD+9XRS2n/wVb5FlfAGf95v8YdImgHJ13bCYnXj8tAfTfZZr6vm3gD+vnmtfZkYw==
X-Received: by 2002:a05:600c:4e8f:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-47d1959c74fmr259008485e9.36.1766776202366;
        Fri, 26 Dec 2025 11:10:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm47583330f8f.9.2025.12.26.11.10.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 11:10:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/5] redis: ignore CVE-2025-46686
Date: Fri, 26 Dec 2025 20:09:57 +0100
Message-ID: <20251226191001.2920748-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 19:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122939

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-46686

Upstream disputes that it is a security violation, and says that
implementing a mitigation for this would negatively affect the rest
of the application, so they elected to ignore it.

See Github advisory about the same vulnerability:
https://github.com/redis/redis/security/advisories/GHSA-2r7g-8hpc-rpq9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.21.bb | 1 +
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 0466e34000..474aea7dc3 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -28,6 +28,7 @@ CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains t
 # deps/ directory and are therefore not affected by this issue.
 CVE_STATUS[CVE-2022-0543] = "not-applicable-config: Debian-specific packaging issue caused by loading system-wide Lua libraries; upstream builds use embedded Lua and are not affected"
 CVE_STATUS[CVE-2022-3734] = "not-applicable-config: only affects Windows"
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
 
 inherit update-rc.d systemd useradd
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 0989ed5e8d..8abf758930 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -23,6 +23,7 @@ RPROVIDES:${PN} = "virtual-redis"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
 CVE_STATUS[CVE-2025-46817] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-46818] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-46819] = "cpe-incorrect: the used version already contains the fix"

