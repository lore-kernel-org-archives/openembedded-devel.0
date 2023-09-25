Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931E5E81806
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 23:50:14 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.7537.1695685809621095536
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Sep 2023 16:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iuKBcgOl;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bf298ef1f5so4852961a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 16:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695685809; x=1696290609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3jHyQ1vLFqX8Yln6zjEL50dIv68mmvKCoAFZ5PYvhA=;
        b=iuKBcgOlDeijHu4VREJ3IQqRLUBTl5cyv/6TnvaUBQ578fL240ADfuCHd9GyUzkNnO
         58ayLurz/gAVWJYChEsfzD1g96sxbMCt8VA21jZLLmmkd3rTFdlEs6ABw+qS5bEf5h2T
         CwoBDngDIs91eDjBJS+01W8q+bwAuwCOrsIKsmJrqWjCCbA1Qf2On9lf2DV2K1PFi3gY
         ZX+ndQMi+ZD901hjUqCfGS4BcA/rnakdOdtuZChqyfkEC+CI3P251nZHXcgJTgGdGxAm
         l0MOQbK9COmohGF+tFKeAgqoTkFk+sZivSoKLeFv/hetco2iU+/P3KpRXix3hG2xHoHD
         30Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695685809; x=1696290609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3jHyQ1vLFqX8Yln6zjEL50dIv68mmvKCoAFZ5PYvhA=;
        b=AyxaX1O179oE3r9ttq26lLnIWkbT3xqAmdcevkhSvIi6/dk23zIRCfhyeMOkGL5uRZ
         XzxTZix9tQHJQY9jO6N/rypx43bWUioBUISB1BD/Ns2eCpW7y5Rqs7OqnE1M2EcAsUjr
         1T49F0PAQiYJRPe2DTc+mCRKjUjPhzUuTqOJbXi9IWlC9nky8p6Ezk/tpL4x/TOM3QLH
         B5SlUyvYWKuhqutHDGgOBErOISDzPrtmFPSD6Q0i4Sbw+a2r018suaJI1cexShRlsv7L
         Z2O64gqWllSujwZT2ar6+cF5g0B4xOrgtKBQoxR3VodcSDtGwqyd2Gr2K4oDgDhaQntL
         BxnA==
X-Gm-Message-State: AOJu0Yye+ATa7XT2LHcoyx7KP0kRaZJPRHYDyxkc7CimYpQF6BoGLpTC
	E1aL0oqIS8JN5f+Z4vO6XyXhVcnLdphOdQ==
X-Google-Smtp-Source: AGHT+IGvASHNRDmB6LCdx2yOS7lG+Fg1B6Avxcc00FVUPV3aZKckzu8nl/7KA8HkdT/HPLQFZjSVPA==
X-Received: by 2002:a05:6830:115a:b0:6bc:b8d9:476e with SMTP id x26-20020a056830115a00b006bcb8d9476emr9700235otq.16.1695685808422;
        Mon, 25 Sep 2023 16:50:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id i13-20020aa78b4d000000b00688965c5227sm1776716pfd.120.2023.09.25.16.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:50:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: reduce size of -dbg package
Date: Mon, 25 Sep 2023 16:50:05 -0700
Message-ID: <20230925235005.2387359-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Sep 2023 23:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105135

From: Ross Burton <ross.burton@arm.com>

Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
the debug symbols

  Level 1 produces minimal information, enough for making backtraces in
  parts of the program that you don't plan to debug. This includes
  descriptions of functions and external variables, and line number
  tables, but no information about local variables.

This makes the sstate objects a lot more manageable, and packaging
faster.

Based on - https://patchwork.yoctoproject.org/project/oe-core/patch/20230925113508.1087898-1-ross.burton@arm.com/

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
index 5f94d32ee4..8962dbfe7d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb
@@ -86,6 +86,9 @@ EXTRA_OECMAKE = " \
 		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
 		"
+# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.42.0


