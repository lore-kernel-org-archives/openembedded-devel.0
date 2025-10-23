Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D254CCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:21:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.16005.1761211284433272655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwik8EKV;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33255011eafso649073a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761211283; x=1761816083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MKrSq1Chec5qWdmTJefV8z2Aq9LRKCqc3QZp/8hock=;
        b=lwik8EKVl+TTdkQA0+vOjbjD7E5Ez7Zi6eBt/LELivvgE+7ePTZfRF2I7PtRYgMdlf
         IGqD56PTHLNkC3udn4zMyoIydbyOY2pnp//ObrsPd5V0iIsGLASUZF22JX5Kl8n69KcN
         jc/GJ3JtkCG1q0gUZ+PKExe3bYANbYGp9bdT89hVtUivIj39aIGqa0n2PYZXEXAc6QAr
         v9JBn1EWlDncC4382kZ0wkbUPUP/PwL6pxNeAG/Th8QZ1nL8SAwHLxLxfWa8hr3EJ60d
         G4nxNd+WJbVeFuqz5JNiYdHYIANZAIzhIYoRqgkSEJ62jEr3WkqnZWhhPyzE+Nqvrrnp
         cDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211283; x=1761816083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MKrSq1Chec5qWdmTJefV8z2Aq9LRKCqc3QZp/8hock=;
        b=SKPO+hVqf2pCb/S6hnJ3/c19F3aEWuFQUApMQJmzuOyDnqosyPiRSOAtxrqM0t/fxG
         N0+BzeD2YjZf3HkgqDV0KE5xfyHJ2Ox6cA8EkJSuAZ7byhnsyeSwRb0ouUDcOeU5SHzL
         k9ZQbmfzh4VzmUpOu4FUbxg2mU26YUh2djd085oY9SEhes8uYm8gWnf5hGl6FeWgw88t
         xiE036T4k8sC4rgxpQ8beiNy97vMarhW3YyDn6kxaqfHgODfuW7+r+8r8engDODSBjfY
         xCXNMmte4y1HupeCkYpQY03NgSkSrC7f7gAV3FvyR14I4QVhuZg4rvMy2zSIXoxI1wle
         L9tw==
X-Gm-Message-State: AOJu0YyVJqJg8QAXiBLp7QoyZPl1bJ1kgLoZyN8gpNOQ1vHzzcgoBSb6
	WQOtyHeyrhd5c4ZHlokhaIBNSEocXdY89qEYyMy7B5W2hpf5ahEb0PaPa/m28w==
X-Gm-Gg: ASbGncs9qspNmZTCigOrWQGCf/q0/FjqiJAF0kT0tOPqSRyzLrALN5nim1oxqeo5JWL
	Vtf6bEuqwxAW8AmNB/gjzVZdTWtxWHJg+I2va9a6PlHI2NaeZIRN+nVY7Fys7AXJIE1W5FPrXEX
	IiSFs1vTVlHyjdg2WFmF+mZyDr6yiONKv71YQuoGAqmxyNSh//2+xytYtAImTNiETFqueu6Cncy
	wrgF+wTPIdn8vm39y/XU9Q6wgsOafPHJbTurQc3+dXHUnSZaMGrSTlDRWqbt+GWAL2/hEB3l+H6
	Uw8zH4ZHtdxEoeZCz7bvvna7R6M/lX9+SbpTwlrrFLL26rl8CToP+YKq5OOSWPEav+OhMsPthOM
	f6uPgGEirHzU4QkPOcwSSpgHFSM6Nnu3x9Djs3dQHvIAdr5MV0CZmesnYHIsCeYQ/O9NsEByGfM
	5I7uBtK9Ze3xtMmiZYGUH+cuv8
X-Google-Smtp-Source: AGHT+IGQt1wDICxR9QAzSaY74Vc6FZj+XqGjM88kV2zAlc+ZwzA2kNoVcQiQMknZqN9b9dyt6Bs5aQ==
X-Received: by 2002:a17:90b:2d83:b0:32d:e75a:5009 with SMTP id 98e67ed59e1d1-33bcf85ffbamr26737160a91.1.1761211283268;
        Thu, 23 Oct 2025 02:21:23 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2405:201:a438:60:7f43:36dd:a0e2:5aed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3704f6sm3912387a91.2.2025.10.23.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:21:22 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Cc: Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [meta-oe][scarthgap][PATCHv2] cryptsetup: Update the license field
Date: Thu, 23 Oct 2025 14:51:14 +0530
Message-Id: <20251023092114.319586-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120918

Cryptsetup code uses Apache-2.0 license also. And the below
reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.

Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a44380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
index 504c718b96..934aa856d2 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
@@ -6,8 +6,9 @@ and can hence offer more features than plain dm-crypt. On the other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION = "console"
-LICENSE = "GPL-2.0-with-OpenSSL-exception"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
+LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
+    file://COPYING.LGPL;md5=1960515788100ce5f9c98ea78a65dc52"
 
 DEPENDS = " \
     json-c \
-- 
2.34.1


