Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6DDC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 12:43:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.10504.1705581801555039792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 04:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7XdB2LP;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so499917f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 04:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705581799; x=1706186599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLVd7SQj1+W6pkSnUmn52Yka3GpfhLXVcwdj7kNfFPA=;
        b=d7XdB2LPP/5PzRW0k2Bj2yTnA0O+UOuJWuOIhlrcjl8+VCs9U9Py4xXL971PoiIOcG
         e7BX9GAwR8ORKs6Zlb+Yq95GqWH7xyJJennD/2hD6MQwKDuuN/4glZqiKVHjzpGdPXNe
         MrIsKEIwYBEKz4N7dDPrTziauNFt7ADuyiQPWlkgUT/R/IsWo84XOCzgSbT7u7gsYcUD
         nDl2saGP8zP5zqKX2dMKNfFyWHgwep0oaulyIaRlDtoaH6oW4slBXbbUq2vzErvdl/ae
         dnvTIw4zqWLisAbdXjWmkvPfg3WAmOrrLi7U+wmVYGS//vVgA/r6gDJ9ivH7pXh0S0Ot
         havA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705581799; x=1706186599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLVd7SQj1+W6pkSnUmn52Yka3GpfhLXVcwdj7kNfFPA=;
        b=WhoTyTukbeIrBUkFqk4Q5fK6YErUzL0UPl54cghr6RhcoKh7uwUl2/Ifw4gwwZNRu2
         9bSoCmaM7K2pxwk24FC8Jk8+kIxrjKF9dZ3miEvehuttW7HWNC+HEDm1YzN+2vCFwDkW
         dsoIscMfRKxARWhQcKeZXRG+fTxsOPIAVp+cIVI53m6Rcn4ADk+mmxlzUZshKGG7OrOb
         CYbTEZXsdQakIffTFtFBmsQHmC2T3IJRFL5Xub1n8XnEl2b692HGx/vYrKTsEDSGlzfT
         QSEWqDrfMYs3zsSrL3Kqjg/3HXSyT3V8TKpx2XIBjOkp59FJyM/i/NnX7hNc5beKr2FA
         dPYQ==
X-Gm-Message-State: AOJu0YyUHlqrf5r5w28pEiJDcCwpqmtKzFGdEekw6IqHB3X7QFj7TYnw
	B2sDVujyZGnmtYgtFqVp0kPC2zPL9V25okFiPXyxP2/otyLHEEmwTUeTgEiv
X-Google-Smtp-Source: AGHT+IFybLDwzDPP4f9ItRPYL+cxS4NCwtPhtt2TdScrf3FAuc8JrB8lqOII5GKsAZCk+fC/D0JqMQ==
X-Received: by 2002:adf:edca:0:b0:336:c5e2:fc9f with SMTP id v10-20020adfedca000000b00336c5e2fc9fmr375215wro.29.1705581798883;
        Thu, 18 Jan 2024 04:43:18 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id d12-20020adfe88c000000b00337be3b02aasm3982966wrm.100.2024.01.18.04.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 04:43:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] protobuf: upgrade 4.23.4 -> 4.25.2
Date: Thu, 18 Jan 2024 13:43:17 +0100
Message-ID: <20240118124317.63364-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108343

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../protobuf/{protobuf_4.23.4.bb => protobuf_4.25.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.23.4.bb => protobuf_4.25.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
index 7d37ee3d2..6cd44a4e7 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.2.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "2c5fa078d8e86e5f4bd34e6f4c9ea9e8d7d4d44a"
+SRCREV = "a9b006bddd52e289029f16aa77b77e8e0033d9ee"
 
-SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=23.x;protocol=https \
+SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            "
-- 
2.43.0


