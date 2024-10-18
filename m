Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D484D3000A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 13:26:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.21789.1729257962844286570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 06:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=UPP0gYKZ;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso318993466b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1729257961; x=1729862761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnFq3I4UOuLF8DG3CHBGs0wI5u6gKOXRVV3Fs/znWck=;
        b=UPP0gYKZZE77gkhdfPieP96xKmuKToxGlRL7d5U4T4JR8dLIJNDUoBJ9oUWgYPqZ55
         S3JG8MGa7QqXJ9B/YRg/KZvDQnj7YP48J5YXhqLkVrb0SCz6g8t/xBOuft90u860x4OV
         nwlhhu4NvmV/WnxWiVDUDOUbe//uEUNj23SWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729257961; x=1729862761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnFq3I4UOuLF8DG3CHBGs0wI5u6gKOXRVV3Fs/znWck=;
        b=kEQ8elY1O9WaRwpU4besy7cmHqNYVFSy4ihksyT75tIGtcisU553KW1rn2SMeXiM4C
         e3gqJcoat0s5cZEmtPQRqyCXD3Wk1QB+PNkILahw2ZUhdbImfJayIeaE6rjOrTRFlAVa
         Z0tsVUnSxS2fmR18BB+SXH8g2hDEzUoVZMlxRavKcckjdcKjqdlaNZZ1HGW9m5m/vdT8
         txlnkBtJgjc+0v979VK9pRCZT48r7HJSIreeRTZrL3nqLsRVVDXDepKd7Os35VWsyWxL
         xhc3d4w9Eb1tI1k9iFcffK1rsX4RPSKrvtCeUFjN7Hlptt/rl8IJL3IvfOYgD9OiW2zO
         cPOg==
X-Gm-Message-State: AOJu0YwsKdGjjMSJbMimMJa4HhvQ+8j2Qvo+cHbtXONMa5o2AVmmHHor
	u3ssRGkFnuhZXv0KKbm6FXyHUBdbDes7jd/ggXuOlSTFZiZhrtNKA+d9geVmdkY0XRaKgXiuqoI
	u
X-Google-Smtp-Source: AGHT+IGf+iDOz+3hNGhQLZqGgqfa8LdYuTir5O6Iu8LNfcxBbuCS3szcxbKvc5sV2le/5F/JhP2O0w==
X-Received: by 2002:a17:907:3f1c:b0:a9a:161:7863 with SMTP id a640c23a62f3a-a9a69de760fmr212857866b.58.1729257960701;
        Fri, 18 Oct 2024 06:26:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf621csm95681266b.165.2024.10.18.06.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:26:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] sip: Upgrade 6.8.3 -> 6.8.6
Date: Fri, 18 Oct 2024 16:25:57 +0300
Message-Id: <20241018132557.3595995-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 13:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112980

Upgrade to version 6.8.6:

- Handle single number macOS deployment targets
- Support for architectures where `char` is unsigned
- Support for building from git archives
- Run the tests using the current Python version

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: sip-6.8.6-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

The work was sponsored by GOVCERT.LU.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.3.bb => sip_6.8.6.bb} (64%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
similarity index 64%
rename from meta-oe/recipes-devtools/sip/sip_6.8.3.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.6.bb
index d12130af4..157e40451 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.3.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.6.bb
@@ -6,12 +6,14 @@ SUMMARY = "A Python bindings generator for C/C++ libraries"
 HOMEPAGE = "https://www.riverbankcomputing.com/software/sip/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1d69a33480ebf4ff8a7a760826d84e"
 
-inherit pypi setuptools3 python3native
+inherit pypi python_setuptools_build_meta python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "888547b018bb24c36aded519e93d3e513d4c6aa0ba55b7cc1affbd45cf10762c"
+SRC_URI[sha256sum] = "7fc959e48e6ec5d5af8bd026f69f5e24d08b3cb8abb342176f5ab8030cc07d7a"
+
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.39.5


