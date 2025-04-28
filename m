Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C845C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:06:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.54457.1745861981568874684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d4BTj/IS;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227c7e57da2so43743195ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861980; x=1746466780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bkjBIzuyxSZrG3I6BfSAX90UNNgDn8ERkI1p7Nqoz4=;
        b=d4BTj/IS0e9jLmT24QHjflm8yj0wKtrQZmNs/mkd7r6rvhRqkGGYiIP0V+gdOD3Ayt
         RZAU2/id5TdglmY2fxajqBZ8OIbJ4yzyPOT3Hc0hZoUJRCTmuUPGH1UqD9j6L4Oq9huH
         vAv5OZ3rJowHsoNIGbbnM/NMuOvusyz1bGcjy3ibB/uHVzqByP5a8vpd3vpA9o6u9Nrs
         x4qeVr8SB8VInDn04X+p1y0bPF8upsKh+J6UmYqFcSZVxWEThpvw9o6UlJxR66D/8HEK
         yfZAhCrTI1h3s5C8ahyYFQdc1SW5x9TlImWoPhqA8ioomMJ5mnVQCC0EOebgzHlSBz3g
         lQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861980; x=1746466780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bkjBIzuyxSZrG3I6BfSAX90UNNgDn8ERkI1p7Nqoz4=;
        b=B53stjMag7mmJMgtBb9K0g4z97zYBexoVs07V3zkgkoaOtIoDGkiCCWYP5926jly8f
         uoUlNIXP1VYevhrThXFNeCxM7HW/+4UhuhVbd8pcA/JA8VaezHQmDzoGWZes0wtV3Apk
         UqXb/R5BcFdbgVdpcDEJ29h9BVHVyaeUlpAhkGq45k6rryZOikDQIAbCV1yh4b4JpNRP
         lFODWmIE1VHsUdH4BZnqyNLMtczNvbAqxnZBbwpnlvJpZkPV8WTjICKddhpsObphSqjp
         IdlgaaZdWpou4bf/X5/Dld7T75c1JUFXsHXhDDJ5M6A53AFJc9ZcraRcDGrwhF5IW2tR
         Ht+Q==
X-Gm-Message-State: AOJu0YwyK1cOaOjpAQiELa2rAwVmPSdaVEvR62guKyvaXJ0f1zw69ssZ
	pnL1ugABABcMw2/wfyC/pebr0+K26Zv8l7JO7c9kR66PUtNvKn2oIQjAsQ==
X-Gm-Gg: ASbGncuIUe2HyA3mu4yHZ3wIfwjUv9eGIqQURcD9UfEEyE8gA7dTI1TVnS+ZCDiNFBJ
	v+4rEVIezNmEklXTNO76y47xGGy0F/K516KrgoBqjKgpDJhapjHU/npQaozty0KTEtcGeQyc30A
	giPcNH5LLpA9emkVgyDpTPFooHBP5zchbNgWdH8/CWRypqRk0uIL+R1RFOOLXdQN9YKvnC9BewE
	2LJ9HoVdpEwKM2SXn/J/Sg9r20CCZPqzRZwehyaNGIfvJXd7iiShGjDQ5iv/81KWZUWGoZO0mI5
	Yq7FywN5FEWA8E0ZaL6gVpg7lCrmNCqmPHVkGqACLnQ/DsFYx3Wrprso8eLFPFAAxCBhlA==
X-Google-Smtp-Source: AGHT+IEiHHupUQcD8QHP7dVNr4p5ausrbjPqfu1LMnc/EEIGAbBLdHc2Qt+sk8uWTN9mrjIBeS1n+w==
X-Received: by 2002:a17:90b:274d:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-30a012fd061mr13487675a91.2.1745861980408;
        Mon, 28 Apr 2025 10:39:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90fa:f3a0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309d5d61f7asm14493383a91.0.2025.04.28.10.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:39:39 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Clean up code
Date: Tue, 29 Apr 2025 00:39:22 +0700
Message-ID: <20250428173922.43331-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 18:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117200

1. Add "simplelog-topic.md" designation.

2. Fix warning in building.

3. "-Werror=format".

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
index 764425dbc..8acf50fe8 100644
--- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
 
-PV = "1.0.5+git"
-SRCREV = "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
+PV = "1.0.6+git"
+SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


