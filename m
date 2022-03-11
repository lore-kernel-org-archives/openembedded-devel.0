Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65D2C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:56:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.7706.1647017776319687997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KF4LPXw6;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cx5so8678170pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gBy1hoEkrSiRZ9tS3z2veZeQgJoDL5kwRPIM1DVjsA=;
        b=KF4LPXw6sjt8kiOaT5EMljQLpogmHxMbMFwKY+ZmUdqdlVvALy9S/XY5f/qLuLuX6R
         leD/mpleSlP9M6Nnaxpekl3TOomuTwdRiqCpxYqO9nzgyxr1fZoW5Ehrk/PSSmSqJhfZ
         96zeOlMpUHCKGT1s5hi8BJ/D7sLOmpwV8qpml8kDGY9TcSV7LZr2LvI9Zdji08mJIrkc
         dDcg8XJnYEyGTneM33L1pJkthU0CeL+J8xkdoQBBpiBx2+E3r/JI5eEUM+a7af6zbHIV
         97DRyykmY8ih7/ZPCRX7JEbIOB0onypJSJEHDX8CzrVzOdkkaqjtHJwJoCFfBgv+FnK/
         s7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gBy1hoEkrSiRZ9tS3z2veZeQgJoDL5kwRPIM1DVjsA=;
        b=dX1OZzqDng2CtYaT3247LmApXnPxsMmyIeqnYynlumd34pTveTkIbcxecZ9gktC7hX
         4gqMckdfOVU6Fn0hhNRmLHtRY67odd0tS7efKU4VOAAEV6wM1iLJ4345b+yQpYiVD99o
         6oSUgVArM37DqoZhrKDEq0ab5/PxG8NLJwI7nD6tND8cXv7/sOpHmyELT/bgHuL4M0ed
         o/4QOi3bIWGEq+m1c8mtF9LXBZZboP7z/+Dw3nGnW8PIRK8nFFZeO2PPdT91+/a+usNY
         9HhAzWs5HwhZJO3r5i81i0DYFJpcDFM51N55JlRbCYIeTROUJ/Rt/YwiGsuutse50x7Y
         J+yg==
X-Gm-Message-State: AOAM531XJcpSnv2QixonHI2PGzx3znmxNfD9VQ967SbkKJJCGkQzKk/f
	5JjkYyjlYq6Cp0HYZP7pTYDnMCH1eFW6DQ==
X-Google-Smtp-Source: 
 ABdhPJyQaYCcHkfN1cHn+0qOwb5WSQtgYaTmQr8y3vENUk3rtPd0czvl8g4E9tEgPqs6sx59PfgAOA==
X-Received: by 2002:a17:902:c745:b0:151:e8fa:629b with SMTP id
 q5-20020a170902c74500b00151e8fa629bmr11685283plq.90.1647017775363;
        Fri, 11 Mar 2022 08:56:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm10639597pfj.128.2022.03.11.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 08:56:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Link libatomics on mips for ptests
Date: Fri, 11 Mar 2022 08:56:12 -0800
Message-Id: <20220311165612.2909327-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 16:56:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95954

clang/mips emits calls to atomic builtins which it expects from C
runtime perhaps but compiler-rt does not provide them so link in
libatomics

Fixes
atomic.cpp:(.text._ZN6cereal12Inpu
tArchiveINS_16JSONInputArchiveELj0EE7processIRNSt3__16atomicIdEEEEvOT_[_ZN6cereal12InputArchiveINS_16JSONInputArchiveELj0EE7processIRNSt3__16atomicIdEEEEvOT_]+0x10c): undefined reference to `__atomic_store_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 250ea97f40..fb37de3c30 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -26,9 +26,10 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig ptest
 
-PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
-PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON,,"
+LIBATOMIC:mips:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
+PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON ${LIBATOMIC},,"
 EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '-DJUST_INSTALL_CEREAL=ON', d)} \
                  ${@['','-DSKIP_PORTABILITY_TEST=ON'][d.getVar('SITEINFO_BITS') != '32']}"
 
-- 
2.35.1


