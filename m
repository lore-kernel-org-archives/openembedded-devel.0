Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B038FC72B8
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:14:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28167.1774174484686983008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IgkDFCEH;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aecefc7503so23384755ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774174484; x=1774779284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlEB7G7AoUoV0ppBPEFsyJ5EB0vOLSdXQxpy1I1Tlxs=;
        b=IgkDFCEH2PBV6W9Orb4NbqKgl+BY3y3sSmo55shhIV5BNRBfVVB5zqNcZS+ar9Uyxl
         oU3Tc5L0XANrZnf2WSWd4uSTptijOmxJnZ0FRmGRz/7tznOVn2PBpYOL7siWlC2J7wa3
         PYPcQKQntREYHIi5vRMZj6nWp06mbRBGzcagvCPUIngrW+ZdncFmFfWkn9Mm5ouEDfGR
         vi5UeZQErFswnWHv8Ki38TTMoKhuIxiSCnRd/UL1J09Qo17xrgfUcNdSPRKrwtJ/07/C
         g9JNsbdLXY6PxpIcfIpjjd0moqMw5r4ptX5eKquJl8Xz93tM1vf34MknsdJ5+lmDHdGP
         rBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774174484; x=1774779284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlEB7G7AoUoV0ppBPEFsyJ5EB0vOLSdXQxpy1I1Tlxs=;
        b=e5O+e1oLoztr01ZevAvhEXzhLEAl9lgyHk3i8Tq06XSIQtDE+wyhk8Y/9JBnrJYstk
         swvaHMHm2OCO0u10fNCJP4qE30GIWGV3s3Fjs51dds+bvE4YUQAFT5kcYd6n25flqXpV
         9ErceSPVxAm+vXj1KXrye7lG89Y2Wpa7kX6SKU0pGs3MwsmqmODMIPX4SaYTIa5Oejhq
         CauRoyOhg/FXCkAsg9DqZ1gKIdMwtk6pUwNMRVioFWze1vcrQUbhnl76HJB3TRPdhLmU
         FTJ3JgBWgJUtakRuyizxQf154atBhPf2MlbVRR61bWCkj3umh9Dh65xsH9oD5rROhaXf
         TrVQ==
X-Gm-Message-State: AOJu0YwWNrF+optEYD94gxh4FC79i7LaL4bYFeDFwbh467SNCI2XJmHv
	B2xHh/dami/2505uIAMjdOurjFpPxATGnuscEyzhFyDqG1WuxJ4EV2UKIO06SDd9
X-Gm-Gg: ATEYQzwGQq6Kq1Xf1AP6i6//Rpyg2KLqyjDO+V1at4Q0dz5FlOhaPT0wV7vBAdHtCNI
	6zMSxBhJ4jQuAiYiLaPncWKsM6l8/Zmp+/74Oc4B1MXpmD/rOPlRudu7ui/mBP8mqt16F8S2BgY
	MiszxgpVWzYbLva8y6qdEPoud//a6YrbEFijOfCbmi6H9KvLm1N3Q4+aj4OZ1ej+qqnkpnaV24j
	1UW9jIujH9NxRRyHgi8T9dhd95ZTlvLSxgjZ4UeTgK/AKIjvB2T0IbUcIb31can+6m8zC+mZNjZ
	qiiZIT2bx8eoZjEFuSwfgrvfv5TyslgrI73/1//ah9ic7yPRdu2K3csGsYARf0czrpXnU/Q17A9
	jOFWguKuIQBCMgD68TBPz9dMRUM0lnHAlVZ2JnzMYKOxuwWElavoJnuSp0dvObrXCffPkBTuQxG
	iXFJ55Z+O+TxgG5RWFc4tK3qOhRE8AzVvj9Bk=
X-Received: by 2002:a17:903:1250:b0:2ae:48a0:33e3 with SMTP id d9443c01a7336-2b0827cd04fmr83166615ad.45.1774174483870;
        Sun, 22 Mar 2026 03:14:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm73775575ad.75.2026.03.22.03.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:14:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/4] python3-gpiod: update to v2.4.1
Date: Sun, 22 Mar 2026 23:13:50 +1300
Message-ID: <20260322101350.439083-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
References: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125476

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bug-fix release addressing a memory leak and a couple minor issues.

We now ship the license file with the dist tarball so update the recipe
to take this into account. While at it: trim the LICENSE value to only
include LGPL-v2.1-or-later as the other two licenses cover tests and
text files.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f75f4164fd7184ed47e119c782cea583b96fbb45)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb}    | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
index 405951fe0c..61a3fb929e 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Python bindings for libgpiod."
 
-LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
-# The actual license files live in the upstream libgpiod from which the pypi
-# package is spun out.
-LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
+SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 

