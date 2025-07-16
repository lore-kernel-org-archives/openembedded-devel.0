Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34C2C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 11:50:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.20266.1752666640958764707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 04:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltRh9L1E;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455fddfa2c3so42905255e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752666639; x=1753271439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMmqUnlCY3aR9zrNXvQgkcL4l+s4wVm1vuarzR651FE=;
        b=ltRh9L1EYuDhflZyUYclfzmMmcAsFANY3z0cCuDF3yffxpdax/N1W3Id2BxhdwU+vW
         orIaEFeGR30FQGenhc3wLf9zKUbJ2t6xDoPmiOWO4PZcfyyrDfBOaj6i+uKi2VDWZ8EA
         PrZ2GxuGkfr580hQYgsqVRmD1yRUUasUC1b8X/1jyHCRHZw1td+AEJ+ecVYIAjY8lAAT
         mTXob3Vk4/MUjT4S+rdkF3aOHMfR7O9E95Nt/PdMM05vVin7JtZGNW0oKGiaM9ZfHjY7
         ggDmJzDpRmNmQxNdDf7PjARVF0128YZRh5HXHkuPTYs6c+g/pzLoQwIp1xgFXsgDUY1t
         mQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752666639; x=1753271439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMmqUnlCY3aR9zrNXvQgkcL4l+s4wVm1vuarzR651FE=;
        b=D4ZeZRtfHU60QOJfaBdgO0Ug4Q/MHHZ5KC2hkdkRkhkg4cCkX3cRm8RWmgJvQY6Vzu
         bC+Gej3rsyjXTPjjz6yDxHdPq9/QqYlybQsPArAmLTMzrVvA4PiVt2LipUVDCTgnaYY1
         Ifneyf+oSlLK1pva/Q9Gryx2iyV18w7vdasbca7DcB7y46QFSR9VfnSWJmUa/tpFG9sx
         j84XZs17niBfd8bTXi+zoF9ohlyOE6b2NAPKNtzob6BNzr2HT5RdBGbI9Ie3rE9jiFj2
         0+P5BfqNQjidl1JUTr7lQ/1hY9HU0zFqqdoAOuiWQhHFVw/P3fI+P+az87TvINmKblIk
         cr5A==
X-Gm-Message-State: AOJu0YwROhIMzCbD83vhU9svMWVj4H6j0bNbt27s4lO7MB05zvfg8BGw
	mU0bfZsGvOtelln5BzAzEchtspPxelHTx1uFegRC5ifKKxjMo/W11c74sR/+CA==
X-Gm-Gg: ASbGncsiPUsFGo16npLicKg8HycFHiSv3xx3DtFKjT8n9kw4CQXuI4mJjtBNMItQHEw
	O8ZJ+RSPmXXvNtFX1fZxh0M6ZHulWV6wiKdrYD4wkc4iX2UzzTzqnmzJXSyv0/9IaLelUGQFGHH
	AZ/2vz6y6E8pf3Bt3itZ8xWd2mg4tQ199yUjCtDTyvqfNYqoegyJUMH8Rjd/LyyxhZUOX5hAF4w
	n6vOuNw2G2tnF8Umzjt5CAQ8KlTWY0p0/vw0Z4EsQLtRA0hnP9xdI5YnvCLAa8uss7nAAVJJa75
	91Fos1xKUFMvA/d4oQd6PvSTdnaH9IR6h42RyNErtCbulIAWa5/8nxkoDmc3d2L+Z05IDcc+KmE
	6L6Qx+VHd0qYDxCXZICe1AiX56DsgOr3z+95LJckXSFSqzAE=
X-Google-Smtp-Source: AGHT+IF812IbNVgVYXsP8g6YojK4LHib4clmEeYtlHP+Xn/PzZCusa3Dn4ASYyJrOHjEvsj+urzijw==
X-Received: by 2002:a05:600c:a55:b0:456:1442:854 with SMTP id 5b1f17b1804b1-4562e28616amr22977135e9.24.1752666638781;
        Wed, 16 Jul 2025 04:50:38 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e819c01sm18928745e9.19.2025.07.16.04.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:50:38 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-networking][PATCH v2] mbedtls: upgrade 3.6.3.1 -> 3.6.4
Date: Wed, 16 Jul 2025 11:50:31 +0000
Message-ID: <20250716115031.367122-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 11:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118597

Fixes several security vulnerabilities:
CVE-2025-49601, CVE-2025-49600, CVE-2025-52496,
CVE-2025-47917, CVE-2025-48965, CVE-2025-52497,
and CVE-2025-49087

The framework directory has been changed into a git submodule.[1][2]
The recipe now uses Git Submodule Fetcher (gitsm)

Changelog:
https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4

[1] https://github.com/Mbed-TLS/mbedtls/commit/8cf5666a174237998a7965e284d7ba8c1655d16d
[2] https://github.com/Mbed-TLS/mbedtls/commit/c90c6d8ff787ab8787d9373b0e662a95ed1f4dae

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.1.bb => mbedtls_3.6.4.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 0b64d661c4..07ac602d12 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -22,11 +22,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 
 SECTION = "libs"
 
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
            file://run-ptest \
            "
 
-SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
+SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


