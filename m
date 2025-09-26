Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5213CCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 20:59:10 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.1820.1758920347279849322
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 13:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VNiXlzyH;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b35f6f43351so457021366b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758920345; x=1759525145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFe4Np4TdivfGAKJVVxxypsA/AaprMWBNQmmrnB0A3E=;
        b=VNiXlzyHdeSv/UOzFhDzRMj6C705zG29oCt+m+F0Y/BzQFKT8zzMCwHrHSckhZ3qPZ
         qW+Gb3RgWOVwD/DRFYog/k510bU9czbdhNMPodDNwiK15FTFv7ta7ZNi2VL3JMEW9K/4
         kucvkIxmbgaY2lXLxh/DAthfJnWTJ8/Sr2L1ntjg/MTkipZOEfm9KHLoV2vH6JkpBl4K
         Uuu9ZfXUo7OpMFu+fm+mtP1AZ0vAxU4TIBXE/IlYgciZSDadiunrrOFiJop6P6nNFJrQ
         l1+cP1sKPW2z4ZQpcIyuVy79YpUVk69GlfsTwcVlCu/403uCyK0Qz2rvq48mo9zAGfr/
         yYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920345; x=1759525145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFe4Np4TdivfGAKJVVxxypsA/AaprMWBNQmmrnB0A3E=;
        b=e0mUtV5cwndssOOAfmTnxfBrkqPeykidrXKOrmaLfUqAlmPgegkSfJ2csX68s0x7Qz
         EL69mhxDATt0HeJRJPFVEm9WW/AZilIALNCWLrk/B5axFDbT4cYlwvQFautJ7KAV+odb
         f6z0BWLPD4coA/mE0v7MqUeMKue7vfxHGNpgqwsc6SIrT5UfpMQaZJjmiXyDZsaE5r0w
         qewFycDisA85tFsP2vdoLk5J3e4RH7c4oX+BhKdBb9LireX1K6ShvfLB7lbMEK4eU+kv
         FX7fNrHYz1ve02sceWAqx39gvkbccIoJNONP9J+ZOteAacy/886zA0vzq3KiFmTw+9sp
         3l5w==
X-Gm-Message-State: AOJu0YyBB65ya+eM3XGdVN9XeAXfnkUL0nfCsHvBDtZtyq9Vx0iEte3/
	2OPEhQM8JQuqP/TpcA4t0rpUfi3BEJv3/uGW/inDZklGYWn68o4CqkKR9pxvqA==
X-Gm-Gg: ASbGncuPubPkcPeGFnqM3abLZcVWGJMIUmRyp5wlM10OguiTapi/yH+/ASfNQTw1Zdq
	j9CxYDPTLgX70qzVyLLPSeyqrvRk32svqc4vCI/3igBlb3p9JAJc034ctw8SHF3duFPVKtahQ9t
	2B6WM2d2boMtScidRDe7IncsuBbFn20jF3vBVFR56miPnbCdK476mBfJJgsuzJ1gnax26cPJZp4
	4RlDV/KkgUaujhBM8HwLk6iWZNC5k6Ie1e4UEP8O87tCFR9qNi6cr+fQmh2Gq2QK1mBf5Kr6XwM
	L3Am7bBRm6Vbj1hrwQglEei3enQAVZ/GZk7z4WgwuLA7yqZ96CKQVC6wfKkLzIvsMEq3L9bDDTs
	3bYOBqwaw2viwu4G9fG6I
X-Google-Smtp-Source: AGHT+IFrtOrvghsbHan1X3ERmL6CPtoXzaLTUyv+r1J11sn7PFlNzZgpMkYV9eOmgT6QWcZNqkBmYw==
X-Received: by 2002:a17:907:94c6:b0:b0c:ecb0:d15 with SMTP id a640c23a62f3a-b34b78ceecfmr964344266b.23.1758920345456;
        Fri, 26 Sep 2025 13:59:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d11a0sm430934166b.17.2025.09.26.13.59.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 13:59:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] mosh: set working SRC_URI
Date: Fri, 26 Sep 2025 22:59:04 +0200
Message-ID: <20250926205904.164639-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119940

The project switched to storing their releases on Github, and
the original links stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index bea22b18e2..6588085ebb 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,13 +14,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter abseil-cpp"
 
-SRC_URI = "https://mosh.org/${BP}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/mobile-shell/${BPN}/releases/"
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.gz \
            file://0001-configure.ac-add-support-of-protobuf-4.22.x.patch \
            "
 
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES:${PN}-server = "${bindir}/mosh-server"

