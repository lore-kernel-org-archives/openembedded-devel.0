Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEB6C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 07:03:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11670.1699772611891178096
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 23:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IraxEyH4;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d10972e63eso513554466b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 23:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699772609; x=1700377409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fxzrPrCjuFVh1mYyXE1KKMvpM4LnXrD4q8vYtiyL2Q=;
        b=IraxEyH4NJxUOjezQUv6rdO+idkFRgbj97F1wMUJIUyXBE7nGrv1DVbjHhlMo88QiE
         odHuvpWpD6th0i+ApF0MDiOKvZYszpE8/i85M/8S5wkpANmygY61t2Rr5XiuL1pN8xDL
         kMXmmoDpjl2doHAo5IR0lgjfy6fD4/5QT7UhTXDhm32GtnKVlmAeF3RLFPWIMFOWMiOh
         d64Kb0BeJDPLKTQgeahwtlBMkPybRkBo0ibx61N4Wd/tAxP2KcoSzE7p1WbGaB6u/sa8
         Sl29yZUOKaL8/Hw4vZZSE5wM/gRW3YjHl+FXH8u4UnqQceNc5+KZsuBhYgzIOlQ77m4n
         99WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699772609; x=1700377409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fxzrPrCjuFVh1mYyXE1KKMvpM4LnXrD4q8vYtiyL2Q=;
        b=jAtY/BGYvCkKc65NJV61PEqk7fg1OsOcQUGH87k6qANYCFzEUdkg1T48F0XNoozrwm
         kt1f2NGT+GwSusi6pxpEFciYmUJloobp/wGu4JaKRYzXUCntX/op971UnkCPAoogpL7V
         vn89nnQlqH5Y9ygjEb7YApOltpOgfQdZAT/ZY+2J/G47CWUYi5vuVvTcBknDlm1yPrvF
         JcjWilk/nL6un4FOgLQrHiQxSBXL7YmOCpC68shjkOrXjGjyuscWv+B5Lx2V5sn7rg/3
         SEhBcL2sCP0qD1uC47qokNIGenT5tRqG1+vAeP9jD1HTsMxku7MA1sx0FuTPRFSJznzp
         52kA==
X-Gm-Message-State: AOJu0Yw8NWg2aFJtBMt1gqdihEn70qBT7aiO0FoK9u17o+yFUa6R120x
	IM4a52eEy32yN5PK6d7BrgkkXCEyyjRO7Q==
X-Google-Smtp-Source: AGHT+IG1zEuAfO1x4tNL7ejtCoqP0LSQSnbrRUrar1IQWAgjQA7BcP446MRpYj6gJZ8PteSSY6y4xg==
X-Received: by 2002:a17:906:5fc7:b0:9b2:aa2f:ab69 with SMTP id k7-20020a1709065fc700b009b2aa2fab69mr2066298ejv.30.1699772609312;
        Sat, 11 Nov 2023 23:03:29 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id g25-20020a17090613d900b009e4197eae9csm2149878ejc.171.2023.11.11.23.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 23:03:28 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libsrtp: updrade 2.4.2 -> 2.5.0
Date: Sun, 12 Nov 2023 10:03:20 +0300
Message-Id: <20231112070320.14346-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 07:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106577

Changelog

-Make mbedtls hmac less restrictive in line with RFC and library capabilities
-Allow overriding stream list implementation
-update min openssl version to 1.1.0
-Openssl 3 support for EVP MAC
-Add android build to CI
-add CIFuzz Github action to workflows
-Add policy_set_aes_cm_192_xxx symbols to def file
-Use current directions in stream update test
-Call `set_aad` and `get_tag` in AEAD performance tests
-Create alias for srtp2 as libSRTP::srtp2
-Remove compatibility code for legacy OpenSSL to fix LibreSSL build
-Export CMake Targets
-Avoid initializing local char table when converting nibble to hex
-EVP_CIPHER_CTX_cleanup() is deprecated in OpenSSL 1.1.0
-Correct null cipher key sizes and be more defensive
-Include directory should point to 'include' not to 'include/srtp2'
-Count blocks instead of bytes in AES-ICM limit computation
-Rtp decoder support ssrc and roc
-Use a full-length key even with null ciphers
-Fix set ROC functionality with gcm

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libsrtp/{libsrtp_2.4.2.bb => libsrtp_2.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.4.2.bb => libsrtp_2.5.0.bb} (85%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
similarity index 85%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
index b17e4767b..d1cbe0f59 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.4.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.5.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=2_4_x_throttle;protocol=https"
-SRCREV = "90d05bf8980d16e4ac3f16c19b77e296c4bc207b"
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
+SRCREV = "a566a9cfcd619e8327784aa7cff4a1276dc1e895"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


