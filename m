Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981C4C3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.116213.1723697132992484289
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Czcf42pc;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db12a2f530so330470b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697132; x=1724301932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyTWjRO80TUfs0qfUUH04PxKpJB3MC9LA/b9+LkMbAM=;
        b=Czcf42pcuiGC45iX4L9EiEYLyW4ftbeI77dsvXCF91uN48Fy6cUUEi3BjWtKw2BE/2
         ScrYm65b6awd0t4NqYw6OFS3WP9NReuQcSjT+r8c1diVbZE9ER8BI1Ay5EtFe8Y0NZC5
         2l2+VR6HNeQLfmHSzpkDXOnstNtx38VH4h20Z1dba3XlHZU5DagDznkcvtGemfBkfJDu
         eLQgJRxunLFAtTRaELmdjPCiSllqRWTus5pvljkNdFX1xAkyBHf+cXg4OKstrBrLGg0X
         0s2CgtXn1gC0r+KdnLPDgyx2b4z7eRWVHfiEZxI2vRdsrc6daYzYXIbR9Apnu253ukDV
         p3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697132; x=1724301932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyTWjRO80TUfs0qfUUH04PxKpJB3MC9LA/b9+LkMbAM=;
        b=BQtgoyLd00kgH2J2HbcSKpJrGFAdjZxJPjwIQEkKINH/EPzgJXiE9CJKdlm8jvVGyJ
         da6q7Hwn+uBT+PoVH5EN4rkbsKTZcpkYd4dlf/p4Wr8O1AgXwiG7SnefhxZNl6BD/NC2
         OrreM1IRG79ABihxO2A/Jj/VMcLT1erm/tmz6smwFo0thCIFTbVqIxcK8glLTFp601of
         YrMGOA5NxZjCDHJVbNtRkaF7obUQ6BaC/XLy4W9Xw8Kuc9UbazSYwEjVBlcA8TAvmwuM
         VPT5SqzE/c5pfEgbUidVseoaqnEjJ4Uzjj0725FgJ0kkqKdlIA+EYKzhZ004ohxLg0oc
         T5ug==
X-Gm-Message-State: AOJu0YxbfQwgLW8nvxUKWFVgPeGwKP8Qy8tklsmScqP+ZugmO333N3ed
	jQ5z55XncK94bPGnRabzZKs9g2Vi+UCjim/YoxZr1kCwArrLiXaJofUBuQ==
X-Google-Smtp-Source: AGHT+IFnOHj5TPqQYhUh9Vy/W489E2FGovkjpSxojbw7RPAnvGHmZkJlJqCTZZ5Rz5xrsIumdIZx5A==
X-Received: by 2002:a05:6808:3196:b0:3db:1c8f:1262 with SMTP id 5614622812f47-3dd299a4d17mr4696011b6e.37.1723697131956;
        Wed, 14 Aug 2024 21:45:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/9] lprng: Specify target paths for needed utilities
Date: Wed, 14 Aug 2024 21:45:18 -0700
Message-ID: <20240815044523.1030831-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111812

pr,openssl,chown,chgrp are guessed during configure and they are
found on host, sometimes under native sysroot and some under HOSTTOOLS
which is not right, therefore point to target locations of these tools

Fixes all errors like below

File /usr/sbin/lprng_certs in package lprng contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index 5d5453ca18..c1a8aadff8 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -14,7 +14,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext
 
-EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost"
+EXTRA_OECONF = "--disable-ssl --disable-kerberos --enable-force_localhost \
+				CHOWN=${base_bindir}/chown CHGRP=${base_bindir}/chgrp \
+				OPENSSL=${bindir}/openssl PRUTIL=${bindir}/pr"
 FILES:${PN}-dbg += "${libdir}/lprng/filters/.debug"
 
 # configure: WARNING: Program 'clear' is not found. Set environment CLEAR=no if you do not want to use it

