Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35758D3C55E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:13 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15658.1765373232577293014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZ58oAGt;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29d7b8bd6b0so5870425ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373232; x=1765978032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/TPoBMzzV8VXjhgmSjn1pHNyakW1IMUNZHanMprX+0=;
        b=JZ58oAGtaWWnV1TjHFjLM4EwKIBKKEpfonr+KCe5ENuK3NDEwRPLl1UZJ0dMtSbh/e
         skEdEagHqJkFMKgEiOVFYY153KuGDoZSef9K9F5RvBPZkVRAtbJxOX7T0AJb6iq+OlOk
         ysfd+y4BQO3FLDLKeNpjh8EVcjXEf7hKepkLgcVCaPhmdn215z0rlSdSflUYhn45ZhCG
         RycAiezq6/cDWHgLTBPpCTNCH/UBzT/JuaQ5tFlONi5PW6G3CnngILNDjzF5hZVmM1fx
         C1pcX5CiWPTHxxey/dr3+mj2IXj6jmwXbT/kPDGkNV3pxsOh4Xrg1284ZELILaPAB+F3
         kvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373232; x=1765978032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c/TPoBMzzV8VXjhgmSjn1pHNyakW1IMUNZHanMprX+0=;
        b=n4KRM9iwWAGnSp7zMZddqIfkjyUZWGXFtU4uTc7RiUzWMLayaJhgk/XxOvV0ywjkaC
         eX8H6UE10/usBY/945kRjBWkHhcAsVWlRVgbzx5BDaguSFGlDbs/DQdSRL30HlrrwnEg
         eiD881dikXAlNKMoyZl79C7hYJ9870ixsZbYW5SbLiDMKiKhGq/Kc2y/nZCwRC9Ux11E
         B3MEW0QY/wRY05m/dEVKWpa0QsiqGhS7rx00jzBd9h0ANQI62+AJD0IFZfnwly8ro29v
         OM10yglAmOh55p6j+ZQi/VKK79+dVzkawS+ufW+1N/0avz62I82OqyPofyu0UUkt9X/2
         xdkA==
X-Gm-Message-State: AOJu0YwtRDbSaNmwbmJIDUM+sYodNcXzT9TC/QrZ/6i1fcIrWBe2WefV
	sJqZT+Hna2cO7EBMdOEQcohvSdzQ2NO57rWgT8rFPC8DE2WNMZVPu3rwjvV99g==
X-Gm-Gg: AY/fxX7WZK/I3lGtJwh3vUDNzjZwVkgj1C+j39ZjBZwkCz/sonLzOYcWwtUrD5EEyHa
	COd26tE9UV0QNSY55SbquvPBoQec970oHshD2rC7qBekADiDeiCdk24m7yAYB3uZcTZ16PJ+DdI
	1N3AlmwCp7A3b7PaCxstY3rcSzLCOABi3mBwtKuRMQai2Ef24mUz7ZPFrhakCguQ3xHjDbquAwN
	k5ky8j3CfRhp4tUtHszeGtjeDrW/kyI2+t4ULeFpuBdaopg1BuazoCLcSafSV91dOgjXBhDQjQL
	SRrRgz5a0NqAZ/O/6qwvDtauBoUSnBLxqR8rflsbMXaOkg0yga0E4Pez1/Dz1aviMRAXgFTVSOf
	2/uayv0bCooCdhI4ZbyqfHLSWVoYCPiqpGycjeIn1hpA52mUXCviZWfek2WW69mhJTA4ZJvJQIV
	sNCY882zJu7kCNTWo/pzUikOU=
X-Google-Smtp-Source: AGHT+IE4QXbFRC59QhE52gymEJ9xFtNbjllo1q3xdy06/ecKP97px/hhO6ZHri+GOpnceNRKODuYJg==
X-Received: by 2002:a17:903:283:b0:298:88:c006 with SMTP id d9443c01a7336-29ea02ad627mr49320135ad.4.1765373231786;
        Wed, 10 Dec 2025 05:27:11 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:27:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 35/43] microcom: upgrade 2023.09.0 -> 2025.11.0
Date: Wed, 10 Dec 2025 18:56:41 +0530
Message-ID: <20251210132641.323679-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add -e switch to select an escape sequence other than Ctrl+\
- More portable TTY settings
- Better error and signal handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5665110de0ece93471c74ef855c2e207da71bdd0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../microcom/{microcom_2023.09.0.bb => microcom_2025.11.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/microcom/{microcom_2023.09.0.bb => microcom_2025.11.0.bb} (89%)

diff --git a/meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb b/meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
similarity index 89%
rename from meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb
rename to meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
index 73d434cba5..7f0154794d 100644
--- a/meta-oe/recipes-devtools/microcom/microcom_2023.09.0.bb
+++ b/meta-oe/recipes-devtools/microcom/microcom_2025.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9f7c009791eaa4b9ca90dc4c9538d24"
 
 SRC_URI = "https://github.com/pengutronix/microcom/releases/download/v${PV}/microcom-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef42184bb35c9762b3e9c70748696f7478efacad8412a88aaf2d9a6a500231a1"
+SRC_URI[sha256sum] = "b1d734a249d8613db7ca1f1bb2ec4e28a35234a60212d91e0c00cc22e9c67a39"
 
 UPSTREAM_CHECK_URI = "${HOMEPAGE}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

