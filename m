Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7563C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 06:23:55 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.7658.1752215030260741168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 23:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vn1c/g3H;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-555024588a8so1551518e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752215028; x=1752819828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vWVop0zAOgs7ZeiMK6+0vc8OgNSmrhKmPCSulrNYbjA=;
        b=Vn1c/g3Hvim/FGANQfvS61GDm7MrwB3F5/kAkGCVjTBsZIABAyO99dVSKl7EQiPsv0
         k1DOkBdniYzGSg9oEKtZWPDw/hBObCPWyTW07wZ9SNiaWZGRyfj03oi88Dh2OBUNRCKJ
         i9A76mIWsRmTOliA7N48phRuTss1rARW0i2tH9ZS+EuxG9V+h4f4cLYTnf41JZsM+7GN
         FlfiX4HB1Mo3SbgAt3ZAzUDutYkE/dlbClqBW3g92DXsTGxqWO41Z66v7FIc3W6i9oGD
         0JvU5/y+/FDdcG0/sk+9MQFa8EiCr8qsNFqUBYps1Lvh9B2rN0zGHFplScppxP0aCrAb
         zPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752215028; x=1752819828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWVop0zAOgs7ZeiMK6+0vc8OgNSmrhKmPCSulrNYbjA=;
        b=B1f9D/X5sJiO7e2liI818KaCGCmEhiiaDLrGreIQHRqbUpi3+XHJL97u0TtoY1esl/
         /Vd3swLotsOOmPzFyNPU9eAKNp2w8jvsY8OjHgQ/oL/BZORtlJEnTDIdO4vkwavcu0mv
         R43aDfOddNG4IwKSpH0T5N8tHXz8PHJZpktHfmD6CFJtTyLQlBswIXvo85lh3+MwbpW9
         ef7sDzD9ySaq8PWfII/UuFmnP6F0RjIdfkQ7C72Z0vabAMQFuPAK93bnmxKRsGyC0fYV
         IK6x4JlF1sqLCG90M3lUIwy3eCFEYzIvWoZ2PKXn9MnwOl02Hit7N/g0sYXSeRg0W/bB
         p3RA==
X-Gm-Message-State: AOJu0YyIPHlonNBTTWrc7Chx0LpetJu3rXf9uvNGC0snAB90uUGQmlbq
	Iw/Nc4wCNCVY2qr3ab27e5ffhPtj9KaOPDaZXMprAzntdo7ervki5H+Q4l0BtQ==
X-Gm-Gg: ASbGnctlWOmCv2eVl9whSRPKAwk+HoB1Gw1fTnidPmHteMcvlpCFOspa51ebwdFDKmA
	pfCKYofxILNXUbCTT4Ze4B+9D7kmqqSM4y6wNMamQHvXK8helL5d8EP5YIsfL2gcp/gZMfsH5uV
	wqozLoIxT3pnvt/nkOaB3OGGp8ibwnBmCa4xROAre3mkCbjQErQqudvlP6OdEg1tD+qSvdFKcUs
	rxOY3ukV6GSSVovuOnFOHBH5MQEzqyf2tSsAJk+uPHqCemWXSru1PTD6L1157VQZNgJgmQx+lEi
	71Bs4gM7F5FzcYRrqpOl9kY8DZdOasH5hZVDNlwl/AEteCMYT7gMKQylOyL9CrczO/PFrNHzrUp
	vdhZkoeZQJqsZVnvc6POtfM+Bxh0t+Gp9ZM1exw==
X-Google-Smtp-Source: AGHT+IHLdCrBwh/05yp2Sg6AdrfqAPYgqMbnLYS497/U53zvqrl1spSxE92+2Z6FElrWITfMJxOmqw==
X-Received: by 2002:a05:6512:3e0b:b0:553:2ff8:5e0b with SMTP id 2adb3069b0e04-55a0462bf5cmr561657e87.42.1752215027606;
        Thu, 10 Jul 2025 23:23:47 -0700 (PDT)
Received: from localhost.localdomain ([176.33.69.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbf82sm739324e87.4.2025.07.10.23.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 23:23:45 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility
Date: Fri, 11 Jul 2025 09:23:38 +0300
Message-ID: <20250711062338.8393-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 06:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118430

Fix:

| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../recipes-test/linux-serial-test/linux-serial-test_git.bb    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index c617cf09a3..888b13e2f6 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -4,9 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
 SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
-
 PV = "0+git"
-SRCREV = "2ee61484167eab846f7b7c565284d7c350d738d3"
+SRCREV = "1a81f3c7be086ee01a9be8589a606426276c86d5"
 
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.43.0


