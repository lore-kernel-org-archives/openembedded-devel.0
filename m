Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2DFC47BD8
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:43:17 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86610.1767692588276639392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o+j8PrS/;
 spf=pass (domain: konsulko.com, ip: 209.85.218.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b713c7096f9so126424666b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767692586; x=1768297386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bB8lZ8/uR5UeZeWPPlgHpoNfw4ZqKXM8V0sM0+l5PLU=;
        b=o+j8PrS//MVnz5aJ6pH+WGtYfVSWYy5AGQ+36QJ/v0cZGiAX7o5tqUuAXsr8IAwHNj
         rhy6KUsCTUToKE006a2tOtfDNDpnmITYFN3aNvI7G2yI/Sypp4jtf2gGBv7rw6z//MdP
         RtLT8vgox2nAGoIQglLnym78HCJzrUjQ0xDT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692586; x=1768297386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bB8lZ8/uR5UeZeWPPlgHpoNfw4ZqKXM8V0sM0+l5PLU=;
        b=Mj3z8c3yJNdhNoC1PQktAF6knxu4+4GHwl5KaOxDvQnpfepOWdVZ1ZSvjYKpd2L9f6
         q79cbOnlBvutvqgCoSASU2xLMvygNi/BEAiFxhN4UZxwMKXMTRKAlXbEBpuNs0JBurCB
         7oO3Qe3cJqCv4LPm8HRJlPFqgWnte6DlRhp4KRYRBfecK7zBdQxI6YDhPagOpgDlygmK
         H/udS7T4n20wFlx0eR+rZi41id203P7VcyZAg0uLbdKyUr7ss0f+0Abs3dibatm8XByU
         hCysI/b73grJlcKFjkmlCuEP2tPRcnhX+SWGieQHpGsK2S6N3PGcORvv5CAHbTneZe1J
         Sx6g==
X-Gm-Message-State: AOJu0Yy8UiilmyJzI9SjNe5sfH5AuY+oXeiiGPU6uR0K0C0hDCYo5ll+
	/jhw5kktL+xayODoFqkd/3vtlUX+5PLqLqnQub2oQ8UFJqHo2EhhR15Y6WVP1wKG5VwYi/MDq4Y
	QVSCa
X-Gm-Gg: AY/fxX6bmm7BjcAa69ZxhG/0hemru7dZcNeYXbPBYbqkQJpmow3sM9YHi+dDCki6bAV
	i7JguoNp8LSaAK5BPHQe2LDFDu8W6pCF5hzCGdLXqtJUxv6IbT3IqPHh8/YRiq5SLbnXaZQhRfg
	KuqFSklosdJk2M48z49on192n9xo8Sb8yI3mVrcl8jWsVCPutK0W0mIiBFCVH+GTsMY0vNP4kyz
	MOAFaw/Hs1gZ0TWd3dLRXMgUx2KeSMPC3Pc/QgHoySIJTa9CcTVl0/UwPjWWxBAQDyD9cufwbva
	9JWb7mq2QNI90RhIFiZ8YWcn3SM9o9QciMe9n92vj7j72un/8Y71vARFLek86GO1pO50c06dMlU
	sCOoL14G9loOQCMM5ZBKSmKSOX/XRZ44jgPX8ofo+EddGP6G1lbs/coZ/Za5HzwfzV1en2xukFR
	4AH1oR7t4c9630DViPW2439VuB
X-Google-Smtp-Source: AGHT+IFNfmXAU0yv51LDmZ3IEctMQQg9mjC+Dhxoc2RnCfrhv6raDfLYBA2q+iE9S16+rmurL4Rv/g==
X-Received: by 2002:a17:907:7f8f:b0:b70:af93:b32d with SMTP id a640c23a62f3a-b8426bf9227mr256384566b.53.1767692584000;
        Tue, 06 Jan 2026 01:43:04 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm176006966b.54.2026.01.06.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:43:03 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-brotli: Upgrade 1.1.0 -> 1.2.0
Date: Tue,  6 Jan 2026 11:42:57 +0200
Message-ID: <20260106094259.36870-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106094259.36870-1-leon.anavi@konsulko.com>
References: <20260106094259.36870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123175

Upgrade to release 1.2.0:

SECURITY

- python: added Decompressor::can_accept_more_data method and optional
  output_buffer_limit argument Decompressor::process;
  that allows mitigation of unexpectedly large output;
  reported by Charles Chan (https://github.com/charleswhchan)

Added

- decoder/encoder: added static initialization to reduce binary size
- python: allow limiting decoder output (see SECURITY section)
- CLI: brcat alias; allow decoding concatenated brotli streams
- kt: pure Kotlin decoder
- cgo: support "raw" dictionaries
- build: Bazel modules

Removed

- java: dropped finalize() for native entities

Fixed

- java: in compress pass correct length to native encoder

Improved

- build: install man pages
- build: updated / fixed / refined Bazel buildfiles
- encoder: faster encoding
- cgo: link via pkg-config
- python: modernize extension / allow multi-phase module
  initialization

Changed

- decoder / encoder: static tables use "small" model (allows 2GiB+
  binaries)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-brotli_1.1.0.bb => python3-brotli_1.2.0.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.1.0.bb => python3-brotli_1.2.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
index 5676d4ef97..f4cdab65b6 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.2.0.bb
@@ -4,14 +4,18 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-PYPI_PACKAGE = "Brotli"
+PYPI_PACKAGE = "brotli"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 CVE_PRODUCT = "brotli"
 
-SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
+SRC_URI[sha256sum] = "e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi pkgconfig python_setuptools_build_meta
+
+DEPENDS += " \
+	python3-pkgconfig-native \
+"
 
 RDEPENDS:${PN} += " \
 	python3-cffi \
-- 
2.47.3


