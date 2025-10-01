Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0611CCD184
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.18609.1759326770991205415
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPK2+PJ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-634cdb5ed4bso2013688a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326769; x=1759931569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVscwQPame66xWfvo1txVNajsFJcofbqGmTmBmpe8oM=;
        b=VPK2+PJ4oBotD8n8X0FC2rgpiYL9p4gsliIuL1BmM/4f+I/euoIyrR7nMYGH0M5xz6
         n/GKayhkt+btiBJbBtpxSqVBODu7KaF8WcAzQdFT+3LU8MCtLxyJDR4ZEjzSaoW+5Xlw
         CaJAG0tDKwJ9ntf2UVDdq3h4FtUgI82+KPRPP/CFyi93CoB6AjR9PKWBZYDjvrnrw+zr
         xnYFZRvv4ukIVzdNF7u9/8Rvti3toynKljgWiJhyN/EdsJEfB8CwCyhKqjylLLtViMt8
         XI6P6upDeX9USvy8JJZOqiRcbLwEqu0xsZPjhYNG4LtsePPBc52jboE/EE7KdtHAIEaF
         cTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326769; x=1759931569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVscwQPame66xWfvo1txVNajsFJcofbqGmTmBmpe8oM=;
        b=qgw1+9wEGT5gBblWBOOznhkK5NqMrhmhpQnaF1ycNt5Snx0MOHGrkIHE3ao/sTQfXU
         luEIn7YrFuz5brNDV/oPDNr++bQVccIDBWK/O9h4qptEigavovb1lrOud0etU1nWZDhe
         oS68+cEKVJMcm8/Fv7oMPDqdXrc1vwKMqza5aRUDXEjr0JurbYimPrZJZFRC0oDYyYvj
         Tpi1WvlhuusAShegjwhA3C+6bD5I+o1niXl9F4UWtsKZGdFpwRMoCwuyypRElCjhehRW
         ssxoTNl4NuXsOWAzFcuFfjtMVWTi6B7+psBZJrRezhCop6B4u9Xm0SxUEFnkHItskJjI
         Vjgw==
X-Gm-Message-State: AOJu0YwDs8oxkcogTMBWBbBW9/F2E83isJgOYxKNkzKPZK54hUwqeFcp
	SI7SADVrPNtFCKyU4fP7I0MCxGO/do106sD32bIJlIKmHY1hEvsl1xvu9nF9Yg==
X-Gm-Gg: ASbGncuCPY0dAyU1y1pSZv6S+bs59pYlB7Za6y70+fpjCYpMz7/J7HAxrgYdX2Ws+iD
	HzhYtr2jPOmiKzp0TyedjvCz9HzGsnrBAh8VL5yM/4nCTYk7ROv6jkicZsh5artoaR7JwqexTlp
	lsuDqLt512BEXeTISCIWrif1kKaG0clLmOwCNuns16LrWR1pfGRUmx1pZdBSUJ3y/0oP2PQDW+l
	KyrV/jcj3BCejZyzcJdbTVcHs20jIZVNOma6x5TQlDIkIXniHmyknydPqpYKP0rDTjnu3j3m/UQ
	f2bfvUN1Ydu4JoPUbqDf+30HBPweqpUIfY8loLaSJCFSa0v4lCbOkmSg9b1n9ztyASPCTsuc8Z7
	fhXhCl4YH9s7Nap6TLUezdu61HyjD7Zc2MNrkMfdTDH1I2nX7z1A/eu4=
X-Google-Smtp-Source: AGHT+IF4r+F2iT1x9G+oyBKMo6kPCDBo/QtnOHHIzD8LworJp+IE46xxASAvh7iSbsP5g9I17Q/w9A==
X-Received: by 2002:a05:6402:5212:b0:634:cd66:9cdd with SMTP id 4fb4d7f45d1cf-63678bb89c2mr4408705a12.10.1759326769207;
        Wed, 01 Oct 2025 06:52:49 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/25] p8platform: unbreak do_populate_sdk
Date: Wed,  1 Oct 2025 15:52:24 +0200
Message-ID: <20251001135243.1490753-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120120

From: Markus Volk <f_l_k@t-online.de>

Error:
 Problem: package libcec-dev-6.0.2-r0.corei7_64 requires p8platform-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides p8platform = 2.1.0.1-r0 needed by p8platform-dev-2.1.0.1-r0.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 03a1a24618e7366235af76ea58514442669f0a76)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index 8a06990574..1307f6dc4a 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -17,3 +17,5 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
 
 FILES:${PN}-dev += "${libdir}/p8-platform"
+
+RDEPENDS:${PN}-dev = ""

