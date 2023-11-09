Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440ADC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 12:37:55 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.120434.1699533472603113858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Nov 2023 04:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=o+8EvJC+;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9be02fcf268so125279866b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699533471; x=1700138271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zD19iKR9DQS2lqBrSbfqqiHbCkEQt/P3HvmTvGo7nb4=;
        b=o+8EvJC+W8AtwW0sqJzCoU2yITE40ug8unD6HpHj+7MLq2yqQ3rMXvnvbG/SSpK4IO
         UWQhePePe2dk6dI+HOX10gr2SAWkLl4hD+1K+u1oxIK0JC5PJ60C6hAaN52RKDD3V50G
         oDjl4yYAWy22IQaBwMWeuCIFJOTQ5pjjtxYHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699533471; x=1700138271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zD19iKR9DQS2lqBrSbfqqiHbCkEQt/P3HvmTvGo7nb4=;
        b=NcmBdI9lnSMtrm8DpjtnY7bkXJMDzwWa5UCFb186tYhtf23ViiBfuxhtkKcG6GllB/
         cZwGncBCI4WLqgZum99c76FlbCz4eWsZZA+eZ/y/UzIpO6Jtj0GZElkge+krptSttEOs
         M3bqEoxnZPXPxGZvJSYq99lLitNrjhz0DMqpavUn2FdFRcQPF/ta1T6BVI5DctrJsOvc
         UXBA6ItFhG7UpoNy+lclAIEIp6G4NF1J3lQl8cg3mNPPfsVpV4WMwJpZenp6AQ0KKvl4
         SFnUFog3blsPCm2DUq79Pl7n6gJ4nc8y/xaW2W2cVD/Jl3nEipfZpTxnBAEOeumrQFLy
         uAhA==
X-Gm-Message-State: AOJu0YypSJlmowsE7uRgmzlRfjk+EFKk6R2XxjwfDqS/992D/v2hV9mP
	9r44BfefmeWQoHVAKNstckXVsYLnV9AXSk0HBsc=
X-Google-Smtp-Source: AGHT+IERFwltRmzF5fnpn1hdeX7faGGzW0uy74HlEzhO6pyPJJqOLq3tRKL6PcB5RHAK7aZUDpfIqA==
X-Received: by 2002:a17:906:f8d3:b0:9e5:cef:6ff with SMTP id lh19-20020a170906f8d300b009e50cef06ffmr916339ejb.33.1699533470589;
        Thu, 09 Nov 2023 04:37:50 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id w24-20020a170906185800b009cc1227f443sm2468207eje.104.2023.11.09.04.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 04:37:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] qpdf: Update 10.6.3 -> 11.6.3
Date: Thu,  9 Nov 2023 14:37:48 +0200
Message-Id: <20231109123748.3161295-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 12:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106517

Update to version 11.6.3:

- Fix a bug in which qpdf could potentially discard a character
  in a binary string if that character was preceded by an octal
  escaped string with fewer than three digits. This bug was
  introduced in the 11.0.0 release. The bug would not apply to
  content streams with default settings.
- The linearization specification precludes linearized files that
  require offets past the 4 GB mark. A bug in qpdf was preventing
  it from working when offsets had to pass the 2 GB mark. This has
  been corrected.

Switch to cmake. Use /dev/random to perform encryption securely.
Change the fully defined path on the target to fix buildpaths
QA issues with libqpdfTargets.cmake. Add openssl and gnutls as
dependencies. Tested with usermerge distro feature and clang.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb}         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb => qpdf_11.6.3.bb} (67%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
similarity index 67%
rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
index fa33daf52..b56f8a822 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "PDF transformation/inspection software"
 HOMEPAGE = "http://qpdf.sourceforge.net"
 LICENSE = "Artistic-2.0"
 SECTION = "libs"
-DEPENDS = "libpcre zlib libjpeg-turbo"
+DEPENDS = "libpcre zlib libjpeg-turbo openssl gnutls"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13c86d31fa33493811"
+SRC_URI[sha256sum] = "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40264b7fe67acd90bc"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
 
-inherit autotools-brokensep gettext
+inherit cmake gettext
 
 # disable random file detection for cross-compile
 EXTRA_OECONF = "--without-random \
@@ -17,11 +17,18 @@ EXTRA_OECONF = "--without-random \
                 --disable-check-autofiles \
                 "
 
+EXTRA_OECMAKE = '-DRANDOM_DEVICE="/dev/random"'
+
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
 
 S="${WORKDIR}/${BPN}-${PV}"
 
+do_install:append() {
+    # Change the fully defined path on the target
+    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BPN}/libqpdfTargets.cmake
+}
+
 # avoid Makefile returning error on 'make clean' before configure was run
 CLEANBROKEN = "1"
 
-- 
2.39.2


