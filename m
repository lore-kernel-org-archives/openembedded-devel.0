Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB896C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:35:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2404.1699731310632829325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UHy1jQ02;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4083f61312eso24898545e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699731308; x=1700336108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQPFbL5diCsWBrB0fi0G7Jh4uxMnmmlSoCpwillt8mw=;
        b=UHy1jQ02zJVRiazwwgZM/Y6nQDyK9jH+3voJA2Ty+x8aVYVG8yA4myjzMyL5bDdGyY
         Nlx532K1IFMiL9dpNkQ/gr+wgwCCabjaj08q++TgsS8eiab4RSfoiqEybH0yLdA6TcMu
         3ZdDd6zL4083GUP4vRA5ehx25LFrGsKqlZWtNc2G0FvGRnHMQQjk+FMqEx2WYqDGQRjg
         YlvGkcBohfdv4gSyxWeZspu0f3HW0M/kofHYMvNlPPK8h0sPQq30oqb988AMyLTi7NjJ
         yNrUcyUaZjAlNH9QLpC6hiNXqYcrakTyTHuAogGaSejeHiCftmQQ0PWWfOZ9/cnwQXSK
         pMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699731308; x=1700336108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQPFbL5diCsWBrB0fi0G7Jh4uxMnmmlSoCpwillt8mw=;
        b=f7rTUnyhm5KGBWBbWfyvfrwHkR/Ls6PU0uCxxmZuy/9Dwvy9a9h0G2aTK/vJJi4vjI
         vGmBKzsDcW0Nt4TQWD0jnRF7ZsaDeL65e8MKs7BOgvnXOooOFHU0U5liGNvwm2NR+hPd
         0G1brdmMWAENJ9bzOoUAEhJDCQ9wdvoEBQgKo1Bc5zY96dma0Ll5XCTpw2EyV8WPtmwH
         T13l53DakAvnLtmzV7SKrSz6KNu40B/ceCGWRVz5j6YKlH46WJFxlfX/KqVqmIqQ4Owg
         IUrLtlc8Qwn1Q+tUaCVUX74fPHcdw6GvyVMc8HtsMnzBB//0NYKDKqVp1oVGCJH/isoU
         pf/w==
X-Gm-Message-State: AOJu0YyO5WBbIy09SIaxV/vQ5o88UMHUNdHapZpQADl1B4FoprUhJl92
	VNXsKmCIICgKtvnty/Bs1+vg/pk7GSvDqQ==
X-Google-Smtp-Source: AGHT+IFnvgzzSSkHoiwFu1JGb9Oayn08wUW2UVGJgS1TlS166POCB4GWg0ujCF1H9CipSbOVJNL4mw==
X-Received: by 2002:a05:600c:4443:b0:405:82c0:d9f3 with SMTP id v3-20020a05600c444300b0040582c0d9f3mr2173040wmn.30.1699731308313;
        Sat, 11 Nov 2023 11:35:08 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c4f1300b0040772138bb7sm8769393wmq.2.2023.11.11.11.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 11:35:07 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] catch2: upgrade 2.13.7 -> 2.13.10
Date: Sat, 11 Nov 2023 22:34:58 +0300
Message-Id: <20231111193458.3422863-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106568

v2.13.10:
    Fixes:

        -Fixed issue with catch_discover_tests when there is multiple of 256 tests (#2401, #2503)
        -Catch2-provided main and wmain are explicitly marked as __cdecl when compiled with MSVC (#2486, #2487)
        -Improved break-into-debugger behaviour for ARM Macs. It should now be possible to step execution after the break (#2422)
        -Replaced deprecated std::aligned_storage (#2419, #2420)

v2.13.9:
    Fixes:

        -Fixed issue with -# (filename-as-tag) flag when __FILE__ expands into filename without directories (#2328, #2393)
        -Fixed CAPTURE macro not being variadic when disabled through CATCH_CONFIG_DISABLE (#2316, #2378)

v2.13.8:
    Fixes:

        -Made Approx::operator() const (#2288)
        -Improved pkg-config files (#2284)
        -Fixed warning suppression leaking out of Catch2 when compiled with clang.exe (#2280)
        -The macro-generated names for things like TEST_CASE no longer create reserved identifiers (#2336)

    Improvements:

        -Clang-tidy should no longer warn about missing virtual dispatch in FilterGenerator's constructor (#2314)

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-test/catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.7.bb => catch2_2.13.10.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb b/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_2.13.7.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.10.bb
index 1dd082fa8..8512a0f30 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.10.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x;protocol=https"
-SRCREV = "c4e3767e265808590986d5db6ca1b5532a7f3d13"
+SRCREV = "182c910b4b63ff587a3440e08f84f70497e49a81"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


