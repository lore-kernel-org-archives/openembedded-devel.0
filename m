Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDE0D2C11D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.19545.1730817422448982710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbrWsxG7;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2e340218daso5555539276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817421; x=1731422221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHT/9zatg/jRGi4za15SjNtuSV/Avq0OMcso3sW9xlo=;
        b=TbrWsxG7KDBX+YJwkRL4dU4wRepOibgncZSHTRlunxYz765hj14+9POCSvG/uFdJVO
         ohK7HYKNyxtKNtgngqDPFyHEEl4X+TrPqSdKTzX8dlsUnAniO5ezTeFwX0ty6ItjnZnI
         qEy8cY9NZQDtq5jdo+/UO3W/Gu8R0zQA6PSAKbWzTgcoGbqubPgsM547uJFYon55Sqil
         2GMV3OMVMRL7xSf+XI8UaVC0MoqLWnPluZ1IMjTuFmRN8Cn8Wrjl2vgmA0cn+YN4nqQ7
         0uiklEp0NbStVWyfuORWJokW4khZpwYt6ILsnPvYSVCSLkL4iDy53Gkteq9dlQE6K6jO
         2gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817421; x=1731422221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHT/9zatg/jRGi4za15SjNtuSV/Avq0OMcso3sW9xlo=;
        b=WXq+aqAI8miMhi56vScOFzOV7YwUTlwS2VNxom6DuWk2yzutaIUuu7qY96atmikvY6
         tkhd0AVrT3tt0qAXX/WtmZakO8v0Yol+gHm3zTxzM6/O5JZaQIIbS+9ZG1rbKDpA2emh
         HsNWLWMzzuVPYJ7o3ghRRFKQvQHtXzC/c04fDCsfSUIJ07Ueg3/Bs/ARs/CHibn8jM4J
         BO5jlT/Jtk2h+yuSg5IYh3FvlYVnvsBZ2Y0HoXZIhnsFWYbMs2VweW8Lsz+O4Bws8UDy
         wVnM+y4ygZDNalvTKRSVMp4virs6NU0XJuVA8jomKnocTJzTVJ0iBPlZAAVuUWdABT8G
         bgPw==
X-Gm-Message-State: AOJu0YwVRnzKQRD8AFekO8AGtAoV1tQY1ZmNfpzSy1Hxz2T/3yCLFUsa
	2Gb43tLikTiXGoZ5yHuffmuxlsA9K6Nt0Sv4dxU0JyzL2YE1AZTITnlmlA==
X-Google-Smtp-Source: AGHT+IG6lKMwaJ9TIHn6bQArCVJgM+79vWpUYS9OTj+sC5QQQu0/KAD/UBmt9rjA1Aqg8LlK3CK0Fg==
X-Received: by 2002:a05:690c:4982:b0:6e2:5d2:3421 with SMTP id 00721157ae682-6ea52356fbamr96709967b3.10.1730817421406;
        Tue, 05 Nov 2024 06:37:01 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: s-tokumoto <s-tokumoto@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 49/90] capnproto: Add "capnp" to CVE_PRODUCT
Date: Tue,  5 Nov 2024 09:35:14 -0500
Message-ID: <20241105143638.2301245-50-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113467

From: s-tokumoto <s-tokumoto@fujitsu.com>

Vulnerabilities against capnproto are sometimes reported as "capnp",
so add "capnp" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2022-46149

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index cb4aef5224..daeeb975f2 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -12,6 +12,8 @@ S = "${WORKDIR}/git/c++"
 
 inherit cmake
 
+CVE_PRODUCT = "capnproto capnp"
+
 CXXFLAGS:append:mips = " -latomic"
 CXXFLAGS:append:powerpc = " -latomic"
 CXXFLAGS:append:riscv32 = " -latomic"
-- 
2.43.0


