Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5C3C5B543
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 10:56:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.2655.1748683408276867597
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 02:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cysMK7XX;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747d59045a0so94986b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748683407; x=1749288207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blZWfe7149Mje4BX1dkGXTUhl79Dbr6nFHF9NlsgbI8=;
        b=cysMK7XXV9+Bs/Gpv+y6OFMGd33Ih9ke/nDM0YztCX6UD0LVLtKeaRw8L1L5qI6ipB
         epXIYK+A+YVQ6JiKvXD5+Rdh1mmnoG+9CwNdleQK4UYbobcdI6IOSaOL9do+NjiAiL1D
         WYHfHumrM7e+aYZchhUvBY4rDRMC26lSIczAW7UjgetTb21CbIVWmIPazgWxlILptW1R
         MVin5m3dj3KpcVyFU35xOCs6iPL+ienKvyW3cj7eiscNVTSye1gf9txxk9I2P/NheRsu
         ki1YSzBe8VsCDKERwWvV+PUvHz09DgNPsnWkoS14KpabtkDw9yZsJi/9M8r9JeRKZqpI
         OmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748683407; x=1749288207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blZWfe7149Mje4BX1dkGXTUhl79Dbr6nFHF9NlsgbI8=;
        b=iqGMYlAa3RG7nwi+5LmxQbNPU1MHogQ+yS6nH5PcuWuh/B/VcoJLNMQsoTIWKIyaIl
         NYkFFQKMn1ExMysDW8lBgNMiHeyoqVSmRhRQPgBkPseW46p+K06Bx/I/fpqUhKdGVyVy
         V5JjuqQAP6CSJ9qxtH8muHcaRM/OeeeSK8vpXSMBtgNqEmzslMuX7lhSzDjVrZ9Is+b3
         Lhv5e0gvni25Jjz8gSc0JT4iVeaheD3wYtMkkojtPEVLqdDdpW7MfZQZQViyTwC/KRI9
         meaWbSgrfhRSarhMYxYfeJNc7wsQoI/mStbv/B6PqXJFyjlBAybRMOrTQqO2EtM6eiAe
         cv7A==
X-Gm-Message-State: AOJu0Yx1KrtCyzy811BefiCp9FgLTdLhKxr/2hoF4gtWif7Q1S/ei1gZ
	CSgpyV4ESqiHFNKGTnBKkGWSvOCOs854RW9/WSLiNX23m/KMcUI5CnHoPrhI4A==
X-Gm-Gg: ASbGncuzh9yF3L/lDN2xNEBOUH3nQC5oU1NUWTXHRRJZy79x+HymbJfC15dOYRq0HvH
	7VvD01Gj2///up72cuasqRWNJvkG4Cq1DRFwJOcq3TYn7wXsLb1c07YJVuBLG8eHRU8HgEXu0lJ
	gXAYMm01jnFb+esI9DNJGZmPSZEOMyuityvnG3jpCDGyXIeKgTUsseGVMB3AxLVkHyq4o5FekN6
	/8A7huHJ51tE23xURkTz7rn9GT3etXGpF63eThzn9cnCR9FLoZjyA0OSSJjLKU/sQVplklxl2Lj
	bqrVAUJcEIoPKUkaIH+66JQlis3LQWI9hGdbzOxr7tWB3b04HlUtPnZm6Bobu2LJeDdETSmpLkC
	+rm5r
X-Google-Smtp-Source: AGHT+IG8hrUrx8Q2kNylyFLxy/sOQQErfRAcq7KmMuS+2kI7yuzWA6JWBUtvo8H1heHdGHpFO7iHnw==
X-Received: by 2002:a05:6a21:7a47:b0:201:2834:6c62 with SMTP id adf61e73a8af0-21ae0082bf8mr7961023637.25.1748683407172;
        Sat, 31 May 2025 02:23:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:91b8:fb80:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff71fbsm4248199b3a.165.2025.05.31.02.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 02:23:26 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libserialmodule: v1.0.7 -> v1.0.8
Date: Sat, 31 May 2025 16:23:16 +0700
Message-ID: <20250531092316.13901-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 10:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117677

- Backward compatibility with older versions.
- Supports both full-duplex and half-duplex modes (e.g., RS-485, Modbus).

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../{libserialmodule_1.0.7.bb => libserialmodule_1.0.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libserialmodule/{libserialmodule_1.0.7.bb => libserialmodule_1.0.8.bb} (89%)

diff --git a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
similarity index 89%
rename from meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
rename to meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
index ac5a3eaf09..7994907e13 100644
--- a/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.7.bb
+++ b/meta-oe/recipes-support/libserialmodule/libserialmodule_1.0.8.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 DEPENDS = "libsimplelog"
 SRC_URI = "git://git@github.com/thuanalg/libserialmodule.git;branch=main;protocol=https;tag=v${PV}"
-SRCREV = "b5a5a436900d0bd69f990ca062de916c65f7e2e0"
+SRCREV = "f89f98ff0c9d0aaee2624d40addb0687a74c5d81"
 S = "${WORKDIR}/git"
 inherit cmake
 EXTRA_OECMAKE = "-DUNIX_LINUX=1 -DMETA_OPENEMBEDDED=1"
-- 
2.47.1


