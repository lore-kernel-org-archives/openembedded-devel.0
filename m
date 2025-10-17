Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCB6CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 14:51:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.17641.1760712704829780137
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g6CwIzxN;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4711b95226dso7380375e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760712703; x=1761317503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/A5uGykrsehTD5PAKImR75qcc87l2X/8Eq86FqtwNU=;
        b=g6CwIzxNP5Aj5a8RI2ZpCFqWEaJsnmmLKk7bngpMXO2wJBTKmcsiAEJ9AJTnhAyXV1
         8k2+4egiDMHaZB4VR6rFR117qRo3rd/ZdTqhGpvZUcBnmfSwooiTA2qDDJZ0I1ojNk96
         AmSSUTyKeL988CNCOPzYW6sK9XzRG0QbUPWyKVwvcG9fexBg+/f9cJe/+jpK8j98+d3W
         fhoD5wjv4XNbhbjiwoafo7aIQWCMfShOm8wtfRV0Dd3oj2VBHa/rS/Udg76LForf2Bdl
         BZI8HYLXRRylEtY9SlYlYRLQ5hOxjecv+w7WSZAfxZTs0VOaFniDC6XqVjMTHk+LBheL
         N4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712703; x=1761317503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/A5uGykrsehTD5PAKImR75qcc87l2X/8Eq86FqtwNU=;
        b=KMvGeUUj3zdUBHTuJhz5qWPpfczh4Xon17w06jfPL3qR3H9mEHUPFPxZG6L/JlMsgj
         P3UBeARE7ftU084feze0WbCDMAUDXj3SKjmyyYWBjs0KZhD3L7DWOfM6UoABj9/C98kr
         v9Ve/tgaNMIbFJymdMuHEGP9zZc0XOPjzzHr6uSaLdjZ7q+rRLKDU2XIJVxRMur3F9i8
         3OwC9g79333eJ9JBNNk7zpJ0mEBEmZmc5wluYImYVY+fPABn/S8sL0swn+GkBDWqmuG3
         y5io2i4OkavsvivHhibscV7RHqZ/WNH0I5Ras6hQnMpP1jvYw/UCbw5SB3grjEqj5BLO
         NcCQ==
X-Gm-Message-State: AOJu0YwXPC9pj9GqI0tLg563aC9ofQCpecfpBtQ0mKGF+meRPf95hzM4
	UN7lqKgdTM8ZUuKkR6y1jh4onen3XVsePjlUOqlcrR6xoM7GKKAzp4r62LcHuA==
X-Gm-Gg: ASbGncs4FpeH5fgtDaceTAdZZLfnCiXIi/CaIvkFTt0T+PbUN6bCcvp80CG0W7YVk3G
	lT8ID72yGqN1NzgZmgmvIXtgqiUGkFWzem6bTt57zU8Rkl1qV0lrPQ8u3EWlSaSgOAVlEmlFDGT
	s/yoOzJjvkQRAA6w/5AJE/urYdCrRd1u5M++++cJWbrxp/kkH3H3E891CuRTRZjd6sIp3ycDcSA
	qttbo/44cscoVpn1VKPSiy48MJ8Au/2o6Tnrrdfr6JyBI5zGoTq9G7nLqSZZsvM2Qi9or2/ZPbT
	BpWN1kHZ/OLl8e4AQnA8suOTZrab5JE321b7PDT0ZbZVUKJBcmIgemgVkLh3Lbh/B7aDFJDc1rw
	UynGqXr6mccS8kDs5SMQaTxZ7bJDXsOVbWdVP51Hs40WvZrF/PT67TtmIczWDor7/sVmj0keNzt
	IhNgfUnKmp
X-Google-Smtp-Source: AGHT+IH6qBhEqaB4tnVP38zwqJQdXrORisccrmTy0e4+Tw8qs30oWZ+V8AMpRT0bg2D6fcVk+vYG9g==
X-Received: by 2002:a05:6000:26d1:b0:427:45f:ee2a with SMTP id ffacd0b85a97d-42704d49857mr2688508f8f.9.1760712702840;
        Fri, 17 Oct 2025 07:51:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e8141sm40560321f8f.48.2025.10.17.07.51.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:51:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] keyutils: add missing ptest dependencies
Date: Fri, 17 Oct 2025 16:51:41 +0200
Message-ID: <20251017145141.2612628-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 14:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120765

ptests failed due to missing "make", "file" and full "head" command.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
index 0464117311..62ebcf7f38 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
@@ -50,7 +50,7 @@ do_install_ptest () {
 }
 
 
-RDEPENDS:${PN}-ptest += "lsb-release"
+RDEPENDS:${PN}-ptest += "lsb-release make file coreutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
 

