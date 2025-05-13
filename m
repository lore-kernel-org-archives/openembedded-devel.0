Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE60EC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 20:04:14 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.85720.1747166648834243482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 May 2025 13:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LuWMr1v0;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7b391ba6a1so583300276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747166648; x=1747771448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UqhJRoc92z9Yrjinc25WVy+UuasFQMiE9cmf3LmdJY=;
        b=LuWMr1v0rV70n2ArihPIbZRQRpwysg7q9t7NlD0vaI2r8nyul7w8s2f6tq7XXffkvE
         WJOGHdpqFV4nU9SrSWBtUfnKiB6bvdSytKoqYfe3gT3vzV73i3ajubENn65jsUhER1Gw
         263fCh+92sRwT6bqByuxzZ2H5b2VgMWiumhePRKHp4S7+JI7DRZcCUW24jNxk9ZdGLeF
         bp8eFn2He8qQ4xA1mFUE8N3i791WM9OmhGIliwI6KrrUeiezaZXE4g7w+F1dYG4t+qlD
         vPzMUX5ubswd/H0VP4lmbXSb1YZitD0wCO66nfBpHEXQ9Wbi15UNjBZmsw2qwdkYOe4L
         orBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747166648; x=1747771448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UqhJRoc92z9Yrjinc25WVy+UuasFQMiE9cmf3LmdJY=;
        b=ZpFNFoZNmnzhCh+N1tSlNdEFGWg70Mp+yrlVj502K7uC9cf41JdZ+1P+dEpl694Xfn
         cpyNaPSD5dShR7FFuXKrpEuetf/TEkzza/Oqodf8nsGdehA2oWI5vOLpmFjQNaCi3bRs
         hvhhMt5D3hw2OUlDZVuTQ3ssK0Pkzbwr2Yhx0Qv1PE0C7sP4k7JStf1zulGj7ig1YSVy
         MYRmZeyY+ULsZOSxWzb/IWpt1B9NcWpe3d3UDYns1M8zIOvbpSRa3tCeuGgCmKT/3NfN
         uaMP8emW5mmqGRvm7J4MVW/pe6F5FsQf8eAYERKTbTgWOUT5UBZuuHqGXrrinV1l0hED
         it2g==
X-Gm-Message-State: AOJu0Yxfjcpbs4afXPqzf5cT3nidcxfnt3kP1siTliji1jFMrUZlZX27
	bDSTXkVf9Ut/4tXD8uQC4ftgUrL0f4y56EHf+xHvwZeWDlHjtdG7sCM4fwbk
X-Gm-Gg: ASbGncu7EkjOW4GrRAO6OOv9+XfR4B3MVynP0XN1yXLPJ5zNgoE3eQ3q1/EXlvRQnGf
	T/nNRbI77zx9/V4eva51ShjhHOE0yllGNMGmlMh2QVkzbkJd+F0z9CU5fTjVOCFc4qF1vD2Qc5w
	aC+rCwvEv5dOhQQRKq23Tb8E2jIXrKZMpfKVdzkC/VfkcGx8xtZsJH15oNLKJA3RvILvXh8bJwH
	0gQY2K1rULU7IddWXM2POwM6YEv9XrEvLGL6yVQCdkKDR2cCyaWqctGOhwWHsmCKUQyo8eUUDRx
	00eKNL+1D8I82YdoMCqHy43nJPr72Zip87mg0qK3MfC0FnXCS/9eHAnU5kkUOLBnjQ==
X-Google-Smtp-Source: AGHT+IHer+M5/AQRGKwhGcKcbIc5brBHMGGZmmNgjHtcMOt0oncrTrBA+aEmqYDZDBj5y5Hfa0hFmw==
X-Received: by 2002:a05:6902:18c7:b0:e73:3147:e7c with SMTP id 3f1490d57ef6-e7b3d36dbe0mr987672276.0.1747166647868;
        Tue, 13 May 2025 13:04:07 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:6ade:98e4:ba03:461d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7ab5fb741asm1513944276.21.2025.05.13.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:04:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 2/5] c-ares: upgrade 1.34.2 -> 1.34.3
Date: Tue, 13 May 2025 14:04:03 -0600
Message-ID: <20250513200406.26830-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513200406.26830-1-akuster808@gmail.com>
References: <20250513200406.26830-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 20:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117402

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.3

Changes:

    Build the release package in an automated way so we can provide provenance as per SLSA3. PR #906

Bugfixes:

    Some upstream servers are non-compliant with EDNS options, resend queries without EDNS. Issue #911
    Android: <=7 needs sys/system_properties.h a70637c
    Android: CMake needs -D_GNU_SOURCE and others. PR #915
    TSAN warns on missing lock, but lock isn't actually necessary. PR #915
    ares_getaddrinfo() for AF_UNSPEC should retry IPv4 if only IPv6 is received. 765d558
    ares_send() shouldn't return ARES_EBADRESP, its ARES_EBADQUERY. 91519e7
    Fix typos in man pages. PR #905

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8eaa791dd9836a3bcba7590d208e8bdea9ef5b0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../c-ares/{c-ares_1.34.2.bb => c-ares_1.34.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.2.bb => c-ares_1.34.3.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
index 21a0e37e6c..c02bdbcc5c 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a"
+SRC_URI[sha256sum] = "26e1f7771da23e42a18fdf1e58912a396629e53a2ac71b130af93bbcfb90adbe"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


