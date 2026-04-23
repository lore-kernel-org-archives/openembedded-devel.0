Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328A4F34C45
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:59:34 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17699.1776945572907713345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 04:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hcnl4UZj;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb20bcff5aso615976585a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776945571; x=1777550371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nfojaVbFE6saxcl5VxeW/jCEK8BsodxHRyEvq7kAk/E=;
        b=hcnl4UZj+sRlEq4FrekMlUPhcoe6uhFPmc/B2lBFmZuWhMEEfF/DtaJB3dVlz66Rlg
         /58mBDAYC3BUMrcJM4Y821f0axtEuwi/ZSQ5gI2CgyeWvXnFq7WiXVsNtNlf8WlBo3yi
         ZGs5dDEiyO4srvmqmwKq7qDj4fwdUUp2pFNsigI89HBJF4IceIr5XuRppodILosew3b2
         7AlMBluXc5jKgw9OcuLC3VK+bgWtYk6937cvAEprvGyA7x1ndHin1DxS+ar4Chj2KtYN
         Ckn1GGgmZcT5drg+cAlz5B6eIKQUt7ww3Q6JjWs27jGBr9Ha3FUChfvZYFQYP517APHp
         Sdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945571; x=1777550371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfojaVbFE6saxcl5VxeW/jCEK8BsodxHRyEvq7kAk/E=;
        b=CnZQn4pfqIAEDNHUoCJqwOrrsblIZX3l4z8gOdwDK67R500MFZ7u6I6gN/QRKlnHHu
         SfaeRvIoyxgWSQl46F0WCvZ+tcqnj4HRZaFU1oOkXpKk0D/JGCHVb8MuegKu/QMS7++8
         dhsTToZgqvjWGPr4FYFBg0dHxP8CyGOoMPgydAo2tdwNnccbUMgCjk6jmQHtvixwW3M4
         hQMLumUtyJ8aadNdNzYGrnM46Q18NA92n2ZobihqVgoB8OmTYgAYL3OF34e0d0BoOKC+
         cdGwLOHlZjgSddmtJ20JFm55Rtsf9217EyWKytmMdZ91InFTpej7LN6/c2Qhv2q9/dQ9
         8kdQ==
X-Gm-Message-State: AOJu0YzhZPpr3Q8bVptNNvv1acFRaDsf+vduVcNuANttbmux3s62djPg
	MYSIgx2xqSYyN2ytISFLOctQs9PAjmo/5F8eoezm9JXNt7kLnHCp+2eIxh6+IQ==
X-Gm-Gg: AeBDies5hJJbU5L7wvgsGvbF9cEIcpVf5EgYafb/3SfP1v5VMHnMZsA8ajYw07JkF+j
	03gYV2c5PdVnVYY6YoxPkuI/MHeQ3gF0YsLo/eRqy36xQYXOqs9lWLOlbQjXDmsNcENR8xgQQtL
	6avraT8I/Gk7bOpqtIIl3quBJz+sRXLpLv1ao/duHhm2Zrfu1IpV8oAn7lnH9VheYr/qiuA+RZj
	i1gqAsyPDYTWmAWwW/vjqHB6JCeDuMrcnjy99PCyKc1SGiIiFvlSARzqtkVuUD6p6aAYxwHrpR1
	RAlMpkzLQQ6zP7hEwnUn6+8H5ilikc7+AzTb1rRWClMAmrB7JQ3/Ayq5qZ87EvJ9m8Vp7mwD3gR
	3GyTBEh6rvFxRf7mvMU454PnTrDb6FSMs9q5W06MPS6PNoAhbsZ39H4o7qnn1ywWuvSmwf6ea4z
	TRCqxFgyWogOJ4O6xe8eNh6KuMaEI3gzgk5RVRn7zLCq/idOdFQL58rUPH
X-Received: by 2002:a05:620a:7102:b0:8d3:d13e:8ed with SMTP id af79cd13be357-8e791c8e81fmr3696425685a.52.1776945571351;
        Thu, 23 Apr 2026 04:59:31 -0700 (PDT)
Received: from bushey.hsd1.va.comcast.net ([2601:5c0:c200:483f:8478:e47c:fbe6:4bdc])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe90a4sm1648177985a.9.2026.04.23.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:59:30 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-oe][PATCHv2] fftw_3.3.11.bb: Update version.
Date: Thu, 23 Apr 2026 07:59:25 -0400
Message-ID: <20260423115925.102851-1-philip@balister.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 11:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126576

Apr 21st, 2026
New API fftw_copy_plan()
Support for SVE SIMD instructions.
Support for LoongArch LSX and LASX SIMD instructions.
Support for Apple ARM, RISCV, and LoongArch cycle counters.

Enabling the cycle counters needs a
kernel module to permit access from user space. We need to add
SVE (and other architectures) support to the recipe.

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-support/fftw/{fftw_3.3.10.bb => fftw_3.3.11.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.10.bb => fftw_3.3.11.bb} (94%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
similarity index 94%
rename from meta-oe/recipes-support/fftw/fftw_3.3.10.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.11.bb
index 52122b9c0c..83010d3e7d 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     file://install-bench.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
+SRC_URI[sha256sum] = "5630c24cdeb33b131612f7eb4b1a9934234754f9f388ff8617458d0be6f239a1"
 
 UPSTREAM_CHECK_URI = "http://www.fftw.org/download.html"
 
@@ -57,7 +57,7 @@ do_configure() {
 do_compile() {
     for lib in fftw fftwl fftwf; do
         cd ${WORKDIR}/build-$lib
-        test -n "${TOOLCHAIN_OPTIONS}" && sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
+        sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' config.h
         autotools_do_compile
     done
 }
-- 
2.53.0


