Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EDAC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 22:06:37 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.5391.1706911591527260417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 14:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bb9b28acb4so1846735b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 14:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911590; x=1707516390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzqf+SNqpbNlGowd2N0QdI0/51W9FtK8KKXKt8sxSZ0=;
        b=YTrnmgJbdODYN9fCPnP7j/y1iWR8+kmr6UuU33Uh1hHdyonLMOUiFCZtEB1gSXbeOz
         Vc+Im84h58ltgC74Jok1C1cHWA/QNsa+G1YO0VaAFePNwQf+qBDsnuUNPl94meEsFIu7
         iffA7TAreQ9ae9um7s3pP9I1+E/rF5K13K3pY4AOMWQ4WO1AvMGySjGpERTuV2LKH6e0
         hmgWmDRhL7B/B5gWq+aNEyHMqrowAw8bxGLVynToUeaT0d8NY/rHyYy/604Ghi3NpPwS
         CrUyaizLH/qm7rMdfRzGhciOaxWgRvPDLcjMEzWTZeXJ+WhBNm8RGvpAEBv2v3bXOCO3
         xEGQ==
X-Gm-Message-State: AOJu0YxGoi4Exy3uviWAjCqRsQlZsWlbo8x7Yk8ByBb3Ca0e/dkjJEPm
	HkCGzGzGodEqvrYdBz0JVhMCxATzJ5lWygSPLaBqqyY+vLI5QZJxqP2u5tZ3SbPSYgQu
X-Google-Smtp-Source: AGHT+IFVTlQ1EV/VUes6YGbgVRBdeKijv+2L8p3yhXGSG4+7uW3FX+Y0HU23NOuUzgI2LVTMYflk2Q==
X-Received: by 2002:a05:6808:23c8:b0:3bf:bebd:191f with SMTP id bq8-20020a05680823c800b003bfbebd191fmr3667521oib.5.1706911589992;
        Fri, 02 Feb 2024 14:06:29 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id kq23-20020ac86197000000b0042a3358bf59sm1204521qtb.79.2024.02.02.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 14:06:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pymodbus: update to version 3.6.3
Date: Fri,  2 Feb 2024 22:06:18 +0000
Message-Id: <20240202220618.1620238-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 22:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108551

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...on3-pymodbus_3.5.2.bb => python3-pymodbus_3.6.3.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.5.2.bb => python3-pymodbus_3.6.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
index 4cd3801ee..337fd0e19 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.6.3.bb
@@ -1,13 +1,11 @@
 SUMMARY = "A fully featured modbus protocol stack in python"
 HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a146397c35e3d0953758ce8803de347"
-DEPENDS += "python3-six-native"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "26c1aa9919b24f2247794d5d9d80f65ec06fdfd9bd6b76b81d446b55335cabf3"
-S = "${WORKDIR}/pymodbus-${PV}"
+SRC_URI[sha256sum] = "862f64376ae201f979c91ca2398f0ed5df8f136b76491e0995edeebbd0fa8940"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[repl] = ",,,python3-aiohttp python3-click python3-prompt-toolkit python3-pygments python3-pyserial-asyncio"
@@ -31,5 +29,3 @@ RDEPENDS:${PN} += " \
     python3-pyserial \
     python3-six \
 "
-
-
-- 
2.34.1


