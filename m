Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B44CAC5AD
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:53:48 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.43598.1758513820812467471
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 21:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P/w0sbml;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b522e2866bcso707525a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 21:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758513820; x=1759118620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HAIo/2xZlooycG5BqLwwwx4AtEGxNn22IOfCGPviD2c=;
        b=P/w0sbmlqVc57ha4kw2bfSFx7nts+1aooymmEMpr09GqcVy8PGrDYEBHPwZmm6e+1D
         AEKjM07sBBsqxxi8Ugjesppo17HSuSX/FVU4W06DMWwL/b+eaotiOu8vQZ8/U6JTJ+hd
         T+9b5hG2cFIeHaxmISslfKILeZqRUg5sLXy777I3kWuX8tCySBCU7x+XbtecyFxU2CI8
         CGNiuRY6AIwqScrZtFVr0u+KFuAszZV/S/ZQBM2NFpXlbLjRagIj30W1DLcnCZ7RHCcp
         MbPHLb4Av+I5Ezorie1WSA6ERfUxagnb9bjL+Ut7JMq8Xeoobyrah3K1+xYGK1BIdVg3
         jdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758513820; x=1759118620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAIo/2xZlooycG5BqLwwwx4AtEGxNn22IOfCGPviD2c=;
        b=I6SDPRrXuxBiyQlo7rQEmzwrMZkCTN7cPRv8FDNmIJCy7npPXysR3GYaHpO5C8UmUM
         QlzlWEs9bIGC+eIDq2JASe522BRRSfV3NmRyZj0g8rGqE8UNtKMCiKr9IcB3M5KEQIjo
         Ff3lVDTSDundyCKCK9ZVZz1ubMlwEaSVTMgj6TmiPKSgTrgptqua+MsyGPagj/GrXlW6
         Qo62vRrx2yBZjNb6sraxzLKFKCfqu0mbnrvePRRWDrNSxo607wSahO+mVX6EM4kzhMHb
         +yQgSdEOswo/CMuWhY5zTJxsOce7SOcNrMgIkzykYE2a025Idiat7zcWosLKHp49OOR8
         neIA==
X-Gm-Message-State: AOJu0Yymxta+7op0M9YcLcsQAm4uXJOv42FZ1uWnjFHuy/c2Xm9PNmzI
	/u5TK3sSqjf5O4u9/JKmcQ9H6VtBDyHaD1McWAQu+7yyGpkCxOteaVPBimdBgQ==
X-Gm-Gg: ASbGncu1eWSj3tP7zP373sFhYozWouoxEyScvFj+dQ4wpI3/vFAc1E1/EjVlac8xDOa
	eM9+6/6UWbutVDG4jRAxjyjs3RIInFG2Akd/8RgUvwmflihyBr8dmkc2ZADJ8VtzH0qVBo6LDq5
	RGcOJsagTLtC1tRheOgCkrVnPPk3FkIVfpwzjimA5OT1lhf1HuBE2ga9C2dRm5omeOb3zzIQx2a
	YbjRUQ5ZLjmPH6A5zvY2ZYUoCl9Usm5TZOd6UFEOJMI6EUI5QnXdZCaVqc4tZLYVWY+G5c2fStd
	sR7nbK0jKvBQ4V5hTpFNOg4sYdyowwB53ZxFr3+M4otzv4FoXHVoTaMQT7ZSkznlOVyN2D//U8q
	bTEJO8/6RHF7CRPYjSohUGXV5wq6zt4IMDGfQa1C6Sol7pkID
X-Google-Smtp-Source: AGHT+IELSlzJqK33Dj+xYF7BJpm9X/SM+dpZI+iSAEMDfNvxCAqG4jG55pR3d3kjYvIZAAgfLoYIqg==
X-Received: by 2002:a05:6a21:32a5:b0:266:1f27:a035 with SMTP id adf61e73a8af0-292762e34e1mr8003231637.6.1758513819806;
        Sun, 21 Sep 2025 21:03:39 -0700 (PDT)
Received: from LL-3324L.kpit.com ([223.233.85.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306085e6dcsm11817915a91.29.2025.09.21.21.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 21:03:39 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com
Subject: [meta-oe][master][PATCH] iperf3: Fix CVE-2025-54350
Date: Mon, 22 Sep 2025 09:35:32 +0530
Message-Id: <20250922040532.2152232-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Sep 2025 08:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119644

remove assert to prevent crash due to assertion failure
on malformed authentication attempt

Reference: https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..12ca38b830
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,24 @@
+Subject: [PATCH] iperf3: Fix CVE-2025-54350
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Comment: Patch is refreshed as per codebase of 3.18
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+---
+--- a/src/iperf_auth.c	2025-09-12 10:21:48.186090000 +0530
++++ b/src/iperf_auth.c	2025-09-15 11:13:21.123222080 +0530
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index 265611e533..91d266a2d5 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://0001-fix-build-with-gcc-15.patch \
            file://CVE-2025-54349.patch \
+           file://CVE-2025-54350.patch \
           "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
-- 
2.34.1


