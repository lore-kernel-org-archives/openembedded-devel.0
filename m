Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F43CC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 22:16:34 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.34101.1703110593132017838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 14:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ba7c845e1aso5445139f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703110591; x=1703715391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2g6w5ET+HBrXJw5s7rbX9FP6L+NHKxxkPckm/Pmgow=;
        b=ni1GkqVoiW50OyxnETAUK83Moe/2AAiy6LKpEnZcMxfe2f9yHQ/o/IhZeXgYMDZjF5
         6ZYyU1RhDirPtv5nGriM9ZANApvLQsqwgj0e0p2huDVp1onq17Fo8TxP9i2Ndy+7xWql
         s2Vq7tofOkDQaS2ZU1L1Sf5pV5hyEL8rUUWP+MUJ5egp0RTq4Tdg9UvmeLzHIHKob6RI
         RQrRx1Qh/D5ejTg2viSUcsha/klzfz1OgJqrxfo4TCIeS6RoLPKhkCOjrNBbz5gyDhiY
         m5erF9nP70zWM8QCeb0Ei4HxDyMGVh4mV2OXjmdviBf5HGvMjySEC+zSclNrrTHpZ9IN
         v2jg==
X-Gm-Message-State: AOJu0YxxWTzcMQ88Y5tfvwPLRVcbkNgGeTADJv0nPtOukW3RpgEqrcC7
	pNmbervzS3JgRdv70GyWr+iymJKt/ecyaw==
X-Google-Smtp-Source: AGHT+IEAL8KXpQIkfi+Hs1+6qqat0/ostb4nB+vdGqqdH/yi+lM44jHBi3zdiKs1z8WqhywpmrKjDg==
X-Received: by 2002:a5d:8558:0:b0:7b7:55fc:7d4 with SMTP id b24-20020a5d8558000000b007b755fc07d4mr20306767ios.18.1703110591560;
        Wed, 20 Dec 2023 14:16:31 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id i4-20020a0566022c8400b007b45c1015b6sm119541iow.31.2023.12.20.14.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 14:16:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-coverage: update to version 7.3.4
Date: Wed, 20 Dec 2023 22:16:23 +0000
Message-Id: <20231220221623.3788352-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 22:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107680

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-coverage_7.3.3.bb => python3-coverage_7.3.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.3.3.bb => python3-coverage_7.3.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb
index 16a67e9e6..42bc9fc8e 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "df04c64e58df96b4427db8d0559e95e2df3138c9916c96f9f6a4dd220db2fdb7"
+SRC_URI[sha256sum] = "020d56d2da5bc22a0e00a5b0d54597ee91ad72446fa4cf1b97c35022f6b6dbf0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


