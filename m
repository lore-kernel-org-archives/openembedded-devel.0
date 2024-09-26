Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BADCCFA13
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:40:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.38614.1727343606814600762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jyhix4PY;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso6303865e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727343605; x=1727948405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2NZcEZEM51waj+/nVV2vaPOi4PVBuhI63/l/mJcTkTA=;
        b=jyhix4PYfdGS2ggTx2fLux+FKBIJWFCcI6s2win5qc+444hQbIQw5zIXwmPf+GroM6
         DbAkm140ec3CawLRn/+2GYtG/HpRCg6PbPW5QiyV48Nzh+35b9seZCEjf38X1lzFKU+f
         qys1EfdFu0usy0MpNKlB1Hry2KKCSHrZ4jmVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727343605; x=1727948405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NZcEZEM51waj+/nVV2vaPOi4PVBuhI63/l/mJcTkTA=;
        b=nb4hbVGMJvUBLJ1rGsjZZJSLttCj5ylFQ/JYf5VsaqMAkfIWASLX2wMAbUWAcC+hYU
         6pw+V+X9QM5tSuFqnldncMGRYhoHenqSYpBHYnejesO4Gu4SJFf8TR8ud3D2UDY5SUob
         /5tZHFfJpyLn6yMCMYihlySb2XmWCD3iCD59/yhFA3eYzUQ17CQ5kgECuWTgBFgp+O0+
         0ucMfZ+yQeUBv/4iqWgZGl88Y2iUyEMiWTGVneolO9m1Bl4nbByq/RajCt32unSwrXk2
         wAOoTHRTG2Afpr3y9Vma7Mr5gKlbBwft6juDW3PGYKH+sllTEe/TT+JYdtV77bEbEDJu
         XDAg==
X-Gm-Message-State: AOJu0YzprUi/vsWskqIx92mYJg9MSQaUkATCYvpno52MKih9DlY37klX
	1ypdOZXZKsMX6KO2vyNytpZXqEDQQZlafUs6N1M1KKvj1QMRcRxXcZ+vfqXniqg8/+T9wu3JcEL
	M
X-Google-Smtp-Source: AGHT+IE5UMxyLYaL0iOfAkilS/GGCaqgG0u+e30alg2ChxYphmNSJOvLFg0uOkZFMBfRA/IzAeRIIg==
X-Received: by 2002:a05:600c:3d05:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-42e9610381bmr38383915e9.2.1727343604901;
        Thu, 26 Sep 2024 02:40:04 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ccd4a0e34sm2000412f8f.91.2024.09.26.02.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:40:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v2] polkit: Update Upstream-Status of a merged patch
Date: Thu, 26 Sep 2024 11:39:55 +0200
Message-Id: <20240926093955.3740217-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 09:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112514

From: Yoann Congal <yoann.congal@smile.fr>

https://github.com/polkit-org/polkit/pull/497 was merged as
https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: removed duplicated Upstream-Status
---
 .../meson-build-Support-openembedded-OS-for-PAM-config.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
index cc396dfa3b..445f2fbdb0 100644
--- a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
@@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not mentioned in the
 code.
 
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/polkit-org/polkit/pull/497]
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2]
 ---
  meson.build       | 2 +-
  meson_options.txt | 2 +-

