Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E526C4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:37 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.11755.1639668216766355849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5JeisM/;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so3555729pjw.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VuHs06E+YS/kl54O7w4Nkso4129ZQgKZQvFoLabGXfQ=;
        b=h5JeisM/cte5EI+xYapqGxpAngiqJtD64XZ3iK6/jZ8AvxG2PZMC8/1o5x60UNVA3U
         y7yPsFYBhgI7EZZle2H+sX7Bl3V9Q8mwQyvClzBqn/Ik2B4alW8CBG4Tmf6KIAyZQZjN
         wUKWo2TzMCUqxGKG70hoLgyE7yg8mM7C1FK8be6F0KWn+NKdr+iMRnTtH61LaY+UC/Po
         egwI0SwK2O6hBdeHs14NpVHQpsQ6k6Q0OBde3YVuU4CjVlwhrw/b3PvA+pRSljqDtCKp
         7913YDhAIM3o2e7p9eqm1WI0Fsl7V4ZeA3Lpa20kz9jkxePrMjthZyW8mXGJc6XCMDbo
         OTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VuHs06E+YS/kl54O7w4Nkso4129ZQgKZQvFoLabGXfQ=;
        b=eRMGj0n8zP+JXogzXENC6S7VzLcsMv36rmsBTUG4MI/VWtlzp6QSKIWV80JDPRFzM4
         GZaemv/TJx7vB7FHjELjU1P1HpPMkEdX0FqtfqqoyWpRmBZX8NO7Xl9QQOjBTpiM3meL
         9XDvxMM2XAgIsk7wCDYMADJcU5fVDu5XZF4JoUccmm28baWAmD1gQINjxUEgI48zxR9j
         eIHsXagNeUcCKuF2cqaJVRfYXjkm/r8dMeyRiZw7/EkEMgpWhud5zku/F0aNme2/QcKx
         gZGrkhfz8Ch0NaKs8Shr7+hFwbKRV5f+p+WRuLJ1eDAG+Z0Mphhw2C3ybaVdX030oXKI
         okcQ==
X-Gm-Message-State: AOAM532bltmCJJJOJooDKghVePq6fRGnUn1c7epa7GUwndIFpsJw8cU8
	ZDN7osrQm6BSKXIO7jH3ct2/1PPxsH4=
X-Google-Smtp-Source: 
 ABdhPJwFjvmADhKMi3wow+57+Z2M/cFO1iHisxZRrKtRTQfMNQlUAqwDJa6GwCbUANZu2yDHNH+WMw==
X-Received: by 2002:a17:903:230c:b0:148:a7a1:e697 with SMTP id
 d12-20020a170903230c00b00148a7a1e697mr8842529plh.154.1639668216149;
        Thu, 16 Dec 2021 07:23:36 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 11/18] python3-crypto-vectors: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:16 -0800
Message-Id: 
 <a9a50f06e1e03d7696254696caab420e154d0888.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94396

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit cf172e66fe8f0ba6f676beb1eae6efb7c00d8b1a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-cryptography-vectors_3.4.8.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
index 2fb48f3cf7..25ff63b5eb 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_3.4.8.bb
@@ -1,8 +1,10 @@
 SUMMARY = "Test vectors for the cryptography package."
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
+                    file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
+                    file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b"
 
 SRC_URI[sha256sum] = "4c84410257993d3de058b44b777a49e1da2ae35ebea2970a360c7e3aa0f580f2"
 
-- 
2.25.1


