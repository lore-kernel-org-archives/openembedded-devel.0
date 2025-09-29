Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17742CAC5BE
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:56 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.52860.1759151085910257762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAfWjBwy;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b40f11a1027so72514466b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151084; x=1759755884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7eBhd7XJczS8AtrDUlyB4YMfXXij1Rw3tDPTUWTmdk=;
        b=DAfWjBwytRq1qfsXSaZJa4m8r/lYB/Htab5M48tJlsh7PN4mgZYfQYpdVkEL/n6R59
         t5Ktxze2vln9hUMS3erIs7tc4NWaMSl37OxTTAfUAoZdL8YKiubQM8b7TQVVJKl3Y2Nk
         QPjOp605JGGO2o+kvkcAoAJWaWm1Ox3/E4Gf1vJDJ5OCk1XLOMk0ttalm/ArJOfVi76R
         6qDtXysbF9WGOooCkp9OrpENmwsNK3cFu3vZ9sfy3fJLpE4FZBVreK+fJFjJVcBzvQs7
         tQwCNwr4Eiv87EmsbW4SmGfXN+3vC6M1ZCOizbpP/7iyWxkEIiG9NWLmT5iXJiupNECf
         xIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151084; x=1759755884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7eBhd7XJczS8AtrDUlyB4YMfXXij1Rw3tDPTUWTmdk=;
        b=DD5ECL+qERLr1s0Z1EdeWH5ue1chmTMdj+e3G9+5MLNcVGRIRkO56XdH5+uu2sGJji
         WlZJwN2qiDXf6k3qlG08XWbW8TyjuE7uGZBkVPRAFgtIlhk7p34pwccHg3z9e5kbIFWF
         TmdmWcPvXX4inerHxS8R8U2AokjumayppYAWnKkV+gs9JnI9itkhc7iEafoY/fF14jCd
         Awvc1Q5mP6thu8jMqNHqoskcuN5cIK7YogSrlusan80n8uL4U637W+PqLFg1AxnCdkyu
         gI0eglGJoWKmemuTo3YoWztmSrMieYCVR3u5RVK+401GDpE2htJkZk2wtQZ5Xo3hf5JO
         X2hg==
X-Gm-Message-State: AOJu0YxFOFvcUCQ+49SZUon8hGx1beE8hFkMHMsxCGxOghMhsdC3kA+1
	cjQI7baWsJWUDJhzvhN2xqcwhGHZWRllqAgWCw5Oa+Zwm9AiuRjKIcF1HkWY8w==
X-Gm-Gg: ASbGncuxZJ62r9rfVUPd9gRpuRBV2E9TYkMCbF055t6w4dzdQ/Qd+8lLOkuzxZUGMkO
	us7JnhMahoKoleUknhS+lGnxGQnyp+I1YWvhx7U3HGcecTZPxQnJlvvO89h1RLMn1pR85ERe2N8
	daRGSF448tfEVDrfH72dgc94I/VFeJsHzkcAIOUiVHIkmdYdhdWbZTh0HNnPvHyCD499ymX2Erm
	cBy8nCCeyKbDHkBXDlp05d8CneLRIsLDPeNeWW50c7G8ZKfSnB9UUtLX5ftMmh4o428pleNjnSb
	1TKY/ngNwpBJ8siUkiODR5RmtaBq4DDkYAimalgG9wThn7FVf6QU9PaicT5zTYi8ujoQmA99+lr
	qa828Fke3hQHtK47mbqvEnbFxh3kAddw=
X-Google-Smtp-Source: AGHT+IHt15Rp2UvPVOkfvah9Re5m/jVcuWExjJglfN1gfcAtZ99nUkaQQcQJ6n2VJcVPmbjGCe5i4g==
X-Received: by 2002:a17:907:6093:b0:ae1:a6a0:f2fe with SMTP id a640c23a62f3a-b34bad28537mr1859842366b.36.1759151084043;
        Mon, 29 Sep 2025 06:04:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 19/22] paho-mqtt-c: upgrade 1.3.11 -> 1.3.12
Date: Mon, 29 Sep 2025 15:04:22 +0200
Message-ID: <20250929130425.2912077-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120032

From: Matthias Klein <matthias@extraklein.de>

Service release.
Issues resolved: https://github.com/eclipse/paho.mqtt.c/milestone/19?closed=1

Signed-off-by: Matthias Klein <matthias@extraklein.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 29c4df0cbea8e84dc27a2d651360fd8e516d51be)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{paho-mqtt-c_1.3.11.bb => paho-mqtt-c_1.3.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.11.bb => paho-mqtt-c_1.3.12.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
index 218672e266..d006ae7636 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.11.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.12.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http;branch=master;protocol=https"
 
-SRCREV = "0995176412616ae8f1cba51c8d609fe4b69687ea"
+SRCREV = "4157a27d39f1dd5b95750ecb6acd1481432785d8"
 
 DEPENDS = "openssl"
 

