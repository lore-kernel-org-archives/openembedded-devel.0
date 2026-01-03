Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2A0FC6182
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 19:02:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29895.1767466410785870088
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 10:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kd6wMqJ/;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo14372307b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 10:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767466410; x=1768071210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgECHiFmo53DNnATb+5RyOEDL8zHS2YAVnlE2Gyzy4M=;
        b=Kd6wMqJ/6KqZUers8y3M4glW1M3iSWuWzNo0aU+FT8mVQAEGqPRXNfXM1w9aRf9j0Z
         PSsEl3ssgKiB41SAf7styttzvN7rPCUNKsyj9gzOq1xkg0gqlHs7leUzR7PIRzvqzuvG
         nuv+AQFq5wSu9RgxdubPy42Uisn27Hk0OdwSi8TSQM3ebHpVlP1K9Po7dvA17GHsPyU1
         maHpe4dFNW3Plg7iKp7/LywGnwQRXHZ+5RdeDoIdYCpvmpgJrT7H+vSJr+++04gpaycD
         OGeywVBRT2vMsLombtKF8w4AxY9/R3QQ+GaUOiGFziwwBE4XNJFdqdp9HuYE5q0UGvyS
         qH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767466410; x=1768071210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zgECHiFmo53DNnATb+5RyOEDL8zHS2YAVnlE2Gyzy4M=;
        b=eukCgW74EZaL5ICde4haZooqxmXgmeby0VAZ194KVR4Ya3CeAdgdojV9oYvIQXT749
         yjuoWbIklfMfMW96extCdHMKZjBMfm7MfL48yOUKD6FJsIWtpfMP+VrjlV5jR8qUTVOI
         1/qY5iR3c74qRGM6919NaxSskp85efRoIjca/aBN5Xc1s5/gtC3vs3hNUfg35qz33nqh
         UnC3JIwsMoH/rsM3vC9T6KyVa/RxvEYTvF8IqLhis0HB/9s6NG3qokB4R4CVXbFnAnbE
         nlrHaacA7Rfv0fw8gMTzQhAcIa82726gY7W1Z1e3BzG1+et37G5D6t2o8xOEhPqYszn+
         Jdfg==
X-Gm-Message-State: AOJu0YyHpoJ+zUoufZW+ypgoiU+wU8hRXL/wEtP+jkNS3GpP8NIUL0qt
	axjEP2NhJXCNvW0WcjJv2SzIokrHqgoDcoFCAAtNe+H62fYssjDKEziHQdNE6w==
X-Gm-Gg: AY/fxX4UQ6oRInc4sVUe0d8XBHJ1KNV1pp1TvBPUk00VCXhP8EGUeh6Fx+Gb+aCiLLh
	WJySnEb5eoLSiQhwxMYdhId79re5f/M06kEE65lZzhgtkur7rKd92ofYJwFtuZaDeiAcgLbo8DX
	sQVJnjTO5xfFYH4MhoRVBnPCw7EBwjNCXdFG4Aq5Yh4QTTwQas8PQQiib+2Z9w42+2SlmfypvEz
	lsqztmZ4zZOwfCQUn8up2k2ZEuLJFJmaVv0FTB7yXr8oYHz+hrdLtyC4y/hCk7Ny0Xr3pCbdO67
	O8EgET02WrXyTCojdYG0ZdHRPDA3X/BBVwXEaQPZGX4kOLPjm7650MDjrjBsyCd/Oc3alrDcJiq
	EdLy+vaaWIEIzv3Sp1rw+kdNeymDyxzIpyJQiR4MSy8M1R0B2YGlKgAjvXMR45tTB1cxaiayYd0
	sssD6AwFyQmtqZKL7zDDvmUbSF53f6znYTu7t7
X-Google-Smtp-Source: AGHT+IE+SGX6g+kCemgABIzyFt4Wh18hqxtzzTZqszrbIPOJQsrPIU0fRkgW+/egPRt+0V0IgK5rNw==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:8c6d with SMTP id adf61e73a8af0-376ab2e904cmr39356633637.67.1767466410185;
        Sat, 03 Jan 2026 10:53:30 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4505a6eesm1486854a91.2.2026.01.03.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 10:53:29 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: sanjayembeddedse@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Sun,  4 Jan 2026 00:23:25 +0530
Message-Id: <053a302c2c820686b6454ec77e3931f0b339b2ab.1767466259.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <053a302c2c820686b6454ec77e3931f0b339b2ab.1767354166.git.sanjayembeddedse@gmail.com>
References: <053a302c2c820686b6454ec77e3931f0b339b2ab.1767354166.git.sanjayembeddedse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 19:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123105

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
index db071a1995..a1a4a3d57d 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "15aa3f832f4ec1874db761b9950617f99e1e38144c22da39a71311093bfe67dc"
 
 SECTION = "base"
-- 
2.34.1


