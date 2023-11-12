Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0C9C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 07:10:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.11702.1699772990797231297
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 23:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ST6741Ty;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso5272942a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 23:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699772989; x=1700377789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhmXca17xps7WNgPECAe/NwHw/RuHjaho9YQp01E9a8=;
        b=ST6741Tya5ep0F9jxGcW14qzoTd9L4q9Qu1knZkQiVvQQ32wFW9hPZ9PMufz2Y/RH4
         WNAgWysbN34ckiP+e308oepSrBbgEaw2l4znVFzPlLeV9JhaWDzOB4OpSITgOXL3fmWr
         Mysaad9NajDH1VO365noIZsxlwsxhDJsdI6N3uNyLTymyW6H2rAThWZjuXUlu11c/GJB
         jE/ae7K62IuaAD/j94wG88m2UTWdqyKl1gSJd4XRJ0w+5mtD8xaOqMsjmOcYQ/heiv+v
         nNsLFDTc3T41lsGpGnm5TYCQHhCX0qCZTbT1Jb56Bcs+qLXFeL62AYl84HQfjh+FXQsS
         llAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699772989; x=1700377789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhmXca17xps7WNgPECAe/NwHw/RuHjaho9YQp01E9a8=;
        b=DFpdLxbd+8x8QdBQ28YTcSZu7FzIaCQDQaIOI/1ebBsIICX8LeaZ+oCx9BMBzN5hvO
         oPdRatFVjylFZhgQu2/e1fMkQXhf5c4z2OrG/g+l9Do+LhJ2YLwiOY1Dl0lDhpQc8gOk
         yaep6qDxiSyWfgFSfTOGP9c1Fp6v0usYyz6PKHZNlWcNTuhPJ1iuPXr8RSr/xgURWxzf
         5ykRZxK4tyuYfdykV3uwHAqEDs+SnpvuvhfwhmeXHbuYhmnpMVQrTIjlsg4cS6GZfJrY
         R7mge8L8W/1ahSou0SrNMzns7kwkh8xzlc0HOT7uCz4JtfNEzgZTmmEloFXY/+PD5Wus
         3ErA==
X-Gm-Message-State: AOJu0Yzo0DHbqnp/jfz7ytKH4F862vy4BxyvU2vWfpbsvtY+W24wgHuJ
	rSs3PGh9zVzKalk8mkn9rEbdJ1ByGhv+LQ==
X-Google-Smtp-Source: AGHT+IFO1KVLnIjBAuHltxFc140uVhZn0Pm82ViUf1BDBvyWrR5MF+F9TKMkTn7jBXp3tc750fsQmA==
X-Received: by 2002:aa7:d847:0:b0:543:5281:2ad8 with SMTP id f7-20020aa7d847000000b0054352812ad8mr2470838eds.18.1699772988545;
        Sat, 11 Nov 2023 23:09:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id f20-20020a50d554000000b005434095b179sm1936226edj.92.2023.11.11.23.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 23:09:48 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCHv2] libsrtp: upgrade 2.4.2 -> 2.5.0
Date: Sun, 12 Nov 2023 10:09:40 +0300
Message-Id: <20231112070940.15457-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 07:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106578

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
 I fixed my typo in subject. updrade -> upgrade

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


