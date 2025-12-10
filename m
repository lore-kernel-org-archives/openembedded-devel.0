Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D769BD3C912
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:16:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16391.1765376213061097657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2t7dG04;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so7437553b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376212; x=1765981012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wA+tbXV/FmLLF5virKLwJeuH8l8FV4fbbRCCwsQ/VE=;
        b=M2t7dG04SxSNRNcoS7v7/J6gUY1U55IybpBrNjpilIkfgVyXD9ZpGQUI3rTTv+WD2H
         V6VNspfzBGT29zVUmVzDUI0/4BLQ0xeOipVOW7kV0rFee8lR02qPNArHF5ppLpG1rGmM
         JppIrd8MDdeIQ08/tAhkWzTMkrmIb35CM8mh+RNnQPJ2O6e6PBhC6m1jImX97ur7nEg7
         gemz5CIyftnyfgjlrTDA3WlyfMAhwsfeBgTUSOtEUoltArOwgfcVoheD1wqUjKqVeUUw
         HNlfRguf5+xZ5rM13hndp/8d8gMN0XxfFbevkS96td4bf4DTLGRF4WFnGaWq82sG8Avg
         hubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376212; x=1765981012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wA+tbXV/FmLLF5virKLwJeuH8l8FV4fbbRCCwsQ/VE=;
        b=j8tcTQxUlJaNQmAg8++9LD7LBBC41r/cFIKxTOL0g3Qc+vSjxUPS+GqhjeJmb02S27
         fFkctIDUcg7gYovLIeDrGSF6/JPmQkUcDpZxU/AbFNL8Y3k7ZsK1+9RxJZzBa/mhkZbh
         1Z3O4XdlYO8E2EU2uTYoUt4Cb5V3KPR52WVXWl3fbVFlsQptiP70bOe309SheHNSgPUG
         Rfk8WP4pAcHSy8ef0gGjk3+wApsWQTf44+6SdZorRovrXo/uRaajVdIUyxwkbuaBMMZ7
         C2Khv8Pn7oK6jmlxauCfmnT2BacdNPHr9k9UGoEtfbnX2gfI2RblDQgFWc1NbhifQX93
         ZZcg==
X-Gm-Message-State: AOJu0Yz2Ct/DqPBND24p6Lqqxp8gSKoJ7dW3XrmDM6WOCn1d7wy9TWsh
	IDo+mwyfCjkPILnvREEn9PHlg2Rug+qBROPAGiq+9+h1rZ49nABZ8TyFz6LhNQ==
X-Gm-Gg: ASbGncsKXKULFnaqAPz1l6u2cyZV+hxXH5Cgh0imq3uy7nlT+Na6pbYfwRv3uqQK7mv
	Eg+MV78eVCY2MRzVhH/+n3H7p7GdiOwmM1obF5oGjq1hc5TPx9rY+YisPZ8UIH/RRpk7sJQuRWN
	EAZWayO4g1e/4r3xMGtVyClNQpCD94p16jgzBZ08mrIUtqvfpQVxoKTDLxa6+Wdk1TfI98kwABj
	y9QXAsuyboVN3KWllhPVKCM9IhhxeNPGgPAkOw944lA1t4pKJ+Aca8qMNQ31yhNz4MuCNiuIB7I
	/02JUUUUtFqYRypux4s8qEsXGtsjzrFEmVDSNVaDkZOb66EUzmIjzAH+c+92iAA7NZoOpgy94lF
	+VuZm0vKdo9o4nT9d3aeImf0oP+se2Uh4oTzDy2XjxywPX2yLVXfzcYM53jz42rHPnXG5lV0g5+
	EPcc2WalZL/GuWIEjuqxP57DCMtyKcoCQ2ZA==
X-Google-Smtp-Source: AGHT+IEvo3tcYOWfkBHDm0OEfgv+up+rGuXlU9wr1Xzt8OhikXqt9Rea5vcMd/chMrU8B0urr7JHXA==
X-Received: by 2002:a05:6a20:7344:b0:35f:aa1b:bbff with SMTP id adf61e73a8af0-366e07dcecbmr2423373637.11.1765376212179;
        Wed, 10 Dec 2025 06:16:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 3/7] swagger-ui: upgrade 5.30.2 -> 5.30.3
Date: Wed, 10 Dec 2025 19:46:35 +0530
Message-ID: <20251210141639.1397030-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122551

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- deps: update vulnerable @release-it/conventional-changelog to 10.0.2
- deps: update vulnerable dependencies (js-yaml & glob)
- utils: handle sanitizing multi-level relative paths

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fad70abdb36e42eda376fd5ed0275c1dfbdea403)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.30.2.bb => swagger-ui_5.30.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.2.bb => swagger-ui_5.30.3.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
index 3f5c8b3f32..3d152e15ad 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.2.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.30.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "30d8f985caeca5bb9400cf21403686ec5a82c1cc"
+SRCREV = "199761a94d03753ec62c23bb4ba162bb73c3cfc7"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

