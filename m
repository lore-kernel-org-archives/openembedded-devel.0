Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1757FEE0AC9
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2674.1770460444973249853
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIJL6jkg;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48068127f00so27354585e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460443; x=1771065243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cawXVzTaWxPhuZthNqx5H6eSXyYqlw8mRvhr0Tpd40o=;
        b=lIJL6jkgVjjaU/SEc/sOLVsWAt2SHStjHMMcoLSIIKoNe1QDMaCn83qlx9lesK6364
         Iu6dqVUt5bI3BstWFOmzPEAsKtpSQHDOAdRWILFsdpTV5/KVFUtwlUMQS+twRkwxYJAX
         yoZqcfaf+YuesFvrnHR5VfvBUQNHkR9YmcxTG94WVNuOdAASyqG/+B/HbvyVisi0+eob
         Dot1LF6UmW/sO1jvc+FDb9Y6QYx+MISeQ6LI836TiNSYyqdIswSL2kvEFilII3KOGBqL
         RLOiZDstXQwkkjofspQBjjtumSWxPlPA3U5kvn2jg6ulyESxMwB32J6MOu6fjd68A7aB
         uwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460443; x=1771065243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cawXVzTaWxPhuZthNqx5H6eSXyYqlw8mRvhr0Tpd40o=;
        b=uwnJwAepM/rwV7w380nkBH1nWKTR5X1Bwis9y2SN2Wa8F4HlFlYbThexDBlcqWxOqf
         cpPxTinS8DOcPNyBq5cS+N1T52OkHelZy9cCN9I3T8wiOJEwYlohovMvIi3sgcXZRGr0
         zGUxIYllQsVh9ytuNVUjeu2JSznG4tHVElyeJ46mmlk/DsSD6q/78xB72QWcR/NXnbzD
         Tw8kZW/W2KOSVmy82RVO0CjWBoRUnKKZJ68RGYtJXRQaR0qqD1VSjdE498LFgm18sAUC
         rm1t8zdNuo9jUsFfG0rZL47upF8adVUYJKfRZfOwnouuv5uTdou0hA39wpZ2Ky9y/A9q
         P7gg==
X-Gm-Message-State: AOJu0YzgIndCr0oqVZXRWFP53ewjICoI96lK+f6kH0xRWNskqdYSewIc
	4Znq6XJ2h/PUDQUXtt1tZAn/3VLdUDC0l3Ag4vfxiZe60GnMu6Lh9OVHsZ0zFg==
X-Gm-Gg: AZuq6aL/fIXXVY+qp/R9D0ZHrO24TwHRJOcHywns6Du2iBzy54j9hasNK/xaCBj/VC9
	bvD/qNatzmbAVwVO4XtP5O7yzWvv5b6GWZdW7OUjZHQ8UlAoSMZs/3zCKbYoujkZ1/GLCDFS4x/
	SewUD4vd7iVBe8x+7sNgnFEtBqkdCCmNE6MVXl7JDQd4SYYbZucIYK11VOKVTb+ANBF8PGYeYsd
	lcIQl/4QpfJw93bm0oSVTfesJi0+uf/XSj8OfcW3x8cP1jtGjO5OM7bA74iGrgXB6fpmZ6JimpQ
	oZtDD7x9eM2odrjKxvXu3Wq5zZxla0PyWr9C5ykcm/8Y3tBw1g+twZlbyMGZT2OnuHJzgVyLdS8
	IXJqJTCNCZ6ylBRiXiTt8rL3nMC7pGJuWvJ/5WXQOAuQitoJz8iRtAJGh+QzoTxNjWW/XsWVznZ
	PHp6eo9Y51
X-Received: by 2002:a05:600c:4ecb:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-4832020df78mr73119525e9.14.1770460443219;
        Sat, 07 Feb 2026 02:34:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 04/15] mongodb: ignore CVE-2025-14911
Date: Sat,  7 Feb 2026 11:33:46 +0100
Message-ID: <20260207103359.4177243-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124245

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14911

The CVE is currently tracked without valid CPE. The vulnerability
affects mongo-c-driver component, not mongodb. They are also stored
in different repositories.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 48bae85179..baa159adf8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -52,6 +52,7 @@ S = "${WORKDIR}/git"
 
 CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
+CVE_STATUS[CVE-2025-14911] = "cpe-incorrect: The vulnerability is about mongo-c-driver application, not mongodb"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
 

