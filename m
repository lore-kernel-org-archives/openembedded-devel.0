Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDB6C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 00:39:33 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.10403.1702514369267447068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 16:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35d57e88c1dso32605055ab.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 16:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702514368; x=1703119168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZbN8JyZxkZtFBZ1OAxR/vep8UlSVD/krSSJ2ZGU5sg=;
        b=ujVvs6eqb/5Y9iN8Gk9rm6aKH4Rv0oFDMZAcp9hU9x41cqaDx8qNOILKUd2TP3D4qI
         wKnwkZiNjlNiHirrlQya77QOyb4+frdSzHrfJu0Os/a7sJQ0JGX433yaWumyNxZkVDg6
         y3vU8OpdeAP0NyhuxOIS2TSV1/wSqTgYmkeL09HSNIOWSNac3hyPZ5REq5OFEpxh77pA
         4YHl5VAToJ0Jdo9LOq38p6ul8mTP74AyXJk5pnTrAubeOWGaGia4CzybyKATnBdhNdbM
         TSpdqL/0ZfcbbMa0bEt1NfD7bnmKrpD9DAFXL+pPXqfWmTaWxQskQTBxEDnNKYneYWzY
         QKog==
X-Gm-Message-State: AOJu0YxpQdMeyGCJA7Qkd8X2V4Xmh6pxPWCz/oz/ExVszuA3i6hytEN2
	u9ue4SQLbSjEGeTKeghtsFrZGWJbicikxw==
X-Google-Smtp-Source: AGHT+IGu2uwFB06jJf1Y6RxX0Vj36X79dfpw3mHtWwKMAyLbYW+h1hZkRuAkqpvGWz2f5FxZc4QRZw==
X-Received: by 2002:a05:6e02:1e04:b0:35f:7f8a:ad2c with SMTP id g4-20020a056e021e0400b0035f7f8aad2cmr83288ila.5.1702514367739;
        Wed, 13 Dec 2023 16:39:27 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id z8-20020a92d6c8000000b0035f4e16162dsm281202ilp.82.2023.12.13.16.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 16:39:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyzmq: update to 25.1.2
Date: Thu, 14 Dec 2023 00:39:19 +0000
Message-Id: <20231214003919.1179147-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 00:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107405

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-pyzmq_25.1.1.bb => python3-pyzmq_25.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_25.1.1.bb => python3-pyzmq_25.1.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 504ef7abc..658dbe6e2 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -13,7 +13,7 @@ SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "259c22485b71abacdfa8bf79720cd7bcf4b9d128b30ea554f01ae71fdbfdaa23"
+SRC_URI[sha256sum] = "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.34.1


