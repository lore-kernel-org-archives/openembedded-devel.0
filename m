Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0F6C5B569
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 06:36:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48550.1786430214628596958
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 23:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=amPYyQx7;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485ef63b68so3394898b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430214; x=1787035014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4qgwY6eYj4jXjmoar9sSOB3Zo8cHtXjSamWT3c+43s=;
        b=amPYyQx7ILmk0kqCbMqi8KTzS/4AaHCy1DKmPtdeGVH2nyBCx5lGF6vGJps7WDd2IG
         RqX44D8mK0y4JdSF/red488uVKxec/W/ij+Rsvesz8DmZmjTN5fxLAirr7oybWJKrpOy
         mQCpct1ujlBqsk23OZ5u9KflLep8Vzo8rJpNGHHl41bal7J9U6m/Hzr4bmzefhQC5cNN
         zna0IWTLQ3NaLMsCVGD3w+chH5kbX0iK7VkJ+VpAe7/s9zjhLlxtZRlxg8Sm7zBapSic
         MwK7DP0l6QQ1Fp+zWEdLp0CkAlO/Hf1eB0gHx8RdJ5HAN2+kVAlCUaRZVREphyZXxBmS
         RHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430214; x=1787035014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4qgwY6eYj4jXjmoar9sSOB3Zo8cHtXjSamWT3c+43s=;
        b=qcRK30RUCghTEZKfz7njpX37jE67HjtEO1BGEFmgXAegfm6SRlzsGw2HdMMtGFGQgh
         TEaHNSvADpiYoRrVBi4EU/QH3mCQjdW/Q1VO04QQK2Acus+5wg/sw6bOxOZKKZLhNddt
         5y9ViT2lblAbyve3WU1zDRGrIhdTo0YRHjSi0BlxpUVAG6umhNQEVbq7Su/7LFIG7zFg
         Icm8IEzr/Hza4akAEBgKFjtLxeo55+mXwv/ayK8Rb8rNYIUx0vMDz/J6EoUXYsbEmu7m
         SekvH7lSkuQUvwTMX79D0+9A8s3QlCUEY4em3zP/AVoLYyhH9+7swcZ1LGO8cuVG9HrB
         b09g==
X-Gm-Message-State: AOJu0YzPcQEjMrj9MkrxYJtJkphJVsrOihwW7xoyC53olL2FffgNFYhS
	cviWzhqQ7pDTZWhif8IV4nXqUqhKgFiGwAf8zA3USRXViHce4N8KC5o2Yz0knx9d
X-Gm-Gg: AR+sD10Yj3nEzOY9e12v9RLVaGKMHZ8ogDn9sKu7uypZ01wPbGAF0xZ6bbXTySjqJ7s
	8NtZfPBlfAPsndxkaBoVMkG35FaoaYTba0Ru7Jxbfta5undvVPQspq9sjPvp+6F5cfeHkrY9Ibp
	nbiDYfThnR4FQVwwX4eje7Gk2FczQfSPZScKSqukgEA9EHDq9Vq4m/b3vZMxXyg/GxM8OrsTozQ
	hkL8fimB6yUUkszzCdbKzRbkoUohux7Vw7EQsKDR8VIgCsiCFKUVlLZ9fS75Sk7ibpQa4vgHKHG
	o/r6qIyONtl1hHJxC0RWQ4PlBU3+CoEvfaxgPBxn9GJ1Dcsql/2mFxlerID36DJsl+glqmJTAg+
	gMbk7RuQZ9E1vHhHOtDzz4/9xva3L+IZA22BDue50Lt7rTW0DcrI56ONCz9aq9lQLfqMffZmp8F
	5TFDYNsAS2QeMNhZTWKbTSCnvACcKBWzBI0x2I3xmRSxYvLMrTTKZUcc6AUuhyr9/OgiPmyPKlt
	A==
X-Received: by 2002:a05:6a00:420c:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84fa87321e4mr1070805b3a.20.1786430213977;
        Mon, 10 Aug 2026 23:36:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa952841dsm154852b3a.30.2026.08.10.23.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:36:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/6] python3-google-auth: upgrade 2.56.2 -> 2.56.3
Date: Tue, 11 Aug 2026 18:36:39 +1200
Message-ID: <20260811063643.152169-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
References: <20260811063643.152169-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 06:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128917

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also updated homepage.

Changelog:
https://github.com/googleapis/google-cloud-python/blob/main/packages/google-auth/CHANGELOG.md#2563-2026-08-06

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...n3-google-auth_2.56.2.bb => python3-google-auth_2.56.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.56.2.bb => python3-google-auth_2.56.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
index a4dfcff56d..c096c6ab36 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.56.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.56.3.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Google Authentication Library"
-HOMEPAGE = "https://github.com/googleapis/google-auth-library-python"
+HOMEPAGE = "https://github.com/googleapis/google-cloud-python/tree/main/packages/google-auth"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "e28f103ca8091fb7012b99c44243d7366c29863713b8e34a220c3322b7a07051"
+SRC_URI[sha256sum] = "40e229fc901f0a305b553050e5fce562d509bee0435be053abfa91582b51b90c"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

