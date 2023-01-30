Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8383C636CB
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.34382.1675055352872917442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=faIm3SPj;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id v23so10416075plo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqun3I6B8sfYtgEowiFgZOaEuhhIlvJgVI0Klnt1USk=;
        b=faIm3SPjZv0YeMVQWIqu/IulAaZNIAD0u5JWwEZHiSoErWsUEp95orfoYDTnoDQCk7
         LdoHER+ciEzjwD4IdMhvqbUiWcNzlI9si7ZS4hRZHRBf1LPk0ee3Z3M3lmQuM6bLFbtX
         +Vo5Ecl/EBBdwfjuDMkjuMTNy6brSbrrMgBrnYQNASlPWbYhoKuVRkOHtZprmcDAcKRq
         8PsbjBzOHhluebFy54Z6ez762MIsCLD2WqieF+6UL+sEENwD1ZPwcfXGm9MfgWOJW5I1
         sFF0GERtEZ4FVgmL4Q1bhJZ65TEjpPQA2BkRTRSaLA+rVCQgvHGSB2JX0XlO7BqWnbaV
         E7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqun3I6B8sfYtgEowiFgZOaEuhhIlvJgVI0Klnt1USk=;
        b=aigvvpGT2cJXLHqUTBhnElt8OOrp9YniwODbA4qqH/OOIJQ5A+r089mExA2Qq17Kgm
         z7CI55xR2T2ThBMNArAYG6dlWIsMTZra6/c9+/aXwq3qMuRKL+4bHNmiwCCUuq6+umRs
         Egl1HkiBbdrSmn88BqymymQtqqMTBk0Xlcha+6rTrRnm62WC8B8hHHZ1MbfG4jPd6C/D
         qFRQ4saRPS110tu6PhzwEaQ3cOtbqxC6ccel3TOunLJpPnUFo3MJk1X3jdNfC1sV34nF
         qovOw/+DMueofcUYZLZ89/rs7h9z0OSRxGgdVWXmASHSneYQBrhTqMWWI3BoJmtB5ppE
         6R7Q==
X-Gm-Message-State: AO0yUKWU+1xC+zA83tyHKyU4XK7rSv2MnNLYUFolUjU02j/4HXnc5KP5
	wkC5830B2nlbIziopd6zjTWANA6cA3lG4w==
X-Google-Smtp-Source: AK7set9mZcJ4o4TMEnhs2VX+lN42ZVnUw+RzBYgqUvDh/FXX0Wd4s1AfStBkwjkPnYYdihnIgJGClA==
X-Received: by 2002:a17:902:e385:b0:196:6671:d68b with SMTP id g5-20020a170902e38500b001966671d68bmr5561971ple.45.1675055352007;
        Sun, 29 Jan 2023 21:09:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 01/12] wireshark: Add nghttp2 packageconfig
Date: Sun, 29 Jan 2023 21:08:58 -0800
Message-Id: <20230130050909.133727-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100845

Ensures that clang does not enable it when nghttp2-native is staged in
native sysroot.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 1a4aedc139..37faa68bea 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -46,6 +46,7 @@ PACKAGECONFIG[sbc] = "-DENABLE_SBC=ON,-DENABLE_SBC=OFF, sbc"
 PACKAGECONFIG[libssh] = ",,libssh2"
 PACKAGECONFIG[lz4] = "-DENABLE_LZ4=ON,-DENABLE_LZ4=OFF, lz4"
 PACKAGECONFIG[zstd] = "-DENABLE_STTD=ON,-DENABLE_ZSTD=OFF, zstd"
+PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "-DENABLE_CARES=ON,-DENABLE_CARES=OFF, c-ares"
-- 
2.39.1


