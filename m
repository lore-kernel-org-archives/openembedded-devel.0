Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382B7CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 23:14:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.505.1762298061389522774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 15:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOpUKdtM;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340564186e0so5142691a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 15:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762298061; x=1762902861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2J9UdpleMbzJ6lT4teK+HNh33BYvc2iR9PHHolqNEA=;
        b=KOpUKdtMUY2Ahcnft2RIznQSNcdmy5VaVzz4pMwyRVfa3s/VxaYELUSveev3hzxjh1
         k0Om0IRSfrvqsJheAQo/3ZjhaYwt1rP/wQ/oiReuD8BY7dWJQvbXFrII8D9NzDO4Jb3e
         gMvhrwkYsylxLLBlyX6KIM1FS33ZEuBuyU6u5sUTbWW8KO0UH8vVEkjFH9JzDFML95oe
         X0x7Fg9eh9VeFfStiiO45inOncxWcgyBBPjkbu03aZ8V2t9VHLlY6rZYpx+j8ZptbK3D
         EGKZ+jLmj34BBfhVeoS/LYEeK+60+gBlR0Cb/rTmVzl/Pzqf4W0b3q8p48PZ21IC15mJ
         Pvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762298061; x=1762902861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2J9UdpleMbzJ6lT4teK+HNh33BYvc2iR9PHHolqNEA=;
        b=UIl7/TI0Gt9kBeGYadHfX1S3EHChGUUCxiArH42D886f19Db1ofWj72k0eU9xr8OOY
         IxP1qTr2otOImkjDcQXyv+D5Sn25Yo9P0wTNXX9ERbVFyGDXiZYWKq7RWPGKYLmeChL3
         ojZ2BmDcpGMuvuWabiX1VqoV9jgSdJnwLkHe56mlM0JH+LBZeV2oa8vPI3QKfTyCg4VI
         /QO0i4Pog1GcLYaMwQcr7cXeKZ3u4iHp33uVJGMtNjmZDmBY+6g+IiliF2iXsX7nsFHd
         dlZEtP6nTqS5ImkYth9fXpqrQaf2sf+LqpOLwGBqisv2tZFqmTkDP+i92+VP7At7T3E+
         cC5A==
X-Gm-Message-State: AOJu0YyBuy7pf8W6n0TYQKb1EiZLKEbodvku6yydVfQgunAphqwluHfc
	OvVIVwuY+w752vuuK3VfxQZ4Wm9HIR+l24EW6D0vH78nYLObUdTvyRZsjcuHPCKL
X-Gm-Gg: ASbGncu5fhOCHazI3LvK5MIG9tWSZzJ2adRzPCmKYBi1oq0xU5Gk8NqsLuHUgQrNNjJ
	pZz0bi3Z1wW66rIJ7q0x8oqAbSvtF1EKSwlsYWBCGCZuy6lB7ayD8oAYAbtSb1jjj3Vg0+gp85U
	ejxPLdvgtslfuQ/rmw1oLvJYLmeRK9TgIOoTHSFdFxarHCFg57ZRA5il/GggaJjEwLKw6GJg8+s
	lvizjdnwlRTlSX4l8e4MDFwD4iIbd28Gcnl2I069o+5EgsDoE/7Zre4K7drgF/7kyOMbyR6wXkW
	ui6RYiBZycpP5JZlZWIDLLYyA1lp2cSEwMxIKs+QJGOwXjSr+gw8JElwsc02qbZxlSkG4YzklVi
	zuPoDMAR5h9HjnHKH1zrZjBWXGPCEnyCn9O+zR6XW1yX96mWo0dGjYxG72+OrtaZavMV4I0c8uh
	ZFZ45pxAyR6Rh1vw==
X-Google-Smtp-Source: AGHT+IFOAhOqzoQoQDxETbpWZfMhhZpfZWZSPVGSf9kyTk9RijLMMAJy2Z7fAHjqKM1oiNK8QN6ADg==
X-Received: by 2002:a17:90b:4987:b0:341:34eb:1be6 with SMTP id 98e67ed59e1d1-341a6de6bf1mr992088a91.27.1762298060584;
        Tue, 04 Nov 2025 15:14:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm3503470a12.15.2025.11.04.15.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:14:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] libcdio-paranoia: upgrade 10.2+2.0.1 -> 10.2+2.0.2
Date: Wed,  5 Nov 2025 12:14:09 +1300
Message-ID: <20251104231409.2056908-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104231409.2056908-1-ankur.tyagi85@gmail.com>
References: <20251104231409.2056908-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 23:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121314

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The project switched to storing their releases on Github.

Changelog:
https://github.com/libcdio/libcdio-paranoia/releases/tag/release-10.2%2B2.0.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...a_10.2+2.0.1.bb => libcdio-paranoia_10.2+2.0.2.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio-paranoia_10.2+2.0.1.bb => libcdio-paranoia_10.2+2.0.2.bb} (67%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
similarity index 67%
rename from meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
index 42507051f6..b880f3f090 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.2.bb
@@ -1,18 +1,19 @@
 SUMMARY = "library to read digital audio CDs with error correction"
 HOMEPAGE = "http://www.gnu.org/software/libcdio/"
-BUGTRUCKER = "https://github.com/rocky/libcdio-paranoia/issues/"
+BUGTRUCKER = "https://github.com/libcdio/libcdio-paranoia/issues"
 SECTION = "libs"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libcdio"
 
-SRC_URI = "${GNU_MIRROR}/libcdio/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a"
+SRC_URI = "${GITHUB_BASE_URI}/download/release-${PV}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "186892539dedd661276014d71318c8c8f97ecb1250a86625256abd4defbf0d0c"
+
+GITHUB_BASE_URI = "https://github.com/libcdio/${BPN}/releases/"
 
-UPSTREAM_CHECK_URI = "https://github.com/rocky/libcdio-paranoia/releases"
 UPSTREAM_CHECK_REGEX = "release-(?P<pver>\d+(\.\d+)+\+\d+(\.\d+)+)"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 PACKAGES += "${PN}-utils"
 

