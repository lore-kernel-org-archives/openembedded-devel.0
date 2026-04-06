Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27E1EF4ED8
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53488.1775477005934921154
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DPG5N6Dp;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso3615279f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477004; x=1776081804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zX6Mh8rP142dxfSLAli2/Cvn+RqCIeLcBy1IMsocQc8=;
        b=DPG5N6DpPqwscz68A89Id3hULGWXOAMqfECZcKr4ve+v6GEgdICUfcOk9H9uE4LV4n
         nhZ1QukMYIfByHft1ubVoYxa51CjyOdFRJnIDQ4IUXj5q8SZtIPfdvOT/Q8gNHTdKkTN
         vMNj3rT6/chjJqZRPBdXhyoZallkYHNVD2/oncmn0E7p97fzIYFs54DHbKi7Lxi8dHUe
         flcFWbdrbo/lSBhrSE6K+84e9IbPmMcuDAFmdda3T4sit+I7NHwJDqiFh7aPccOBd3Mr
         c9TnjELw/L6qJZUmJ8nBq85r8v1wK19p0m6tINo8ZoalBFqGcdoEG4oihw8QF/Yagwin
         xKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477004; x=1776081804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zX6Mh8rP142dxfSLAli2/Cvn+RqCIeLcBy1IMsocQc8=;
        b=tDmYQhOBrMBNKgDYFCXW9Ol5qBFGT1MiCLC4yPvAQKtVrOiBcUHiqqUN5obhMA9g5A
         XhpfbtGEl6l8Oqq5a/8rnR6KSXsyPHUNWj/dhuUj8gqeolShxft8evND0XzPB/fy2AQk
         2DVw0gTC7feyIn/ayWXmr9UIGMJ/E/kkRU9OzRf34L343y6h7y766HxKr7gUh/5tDjRg
         gKSnI5FNASzfF+NqNpnOLr6rytiRT4sOcFZyLh+nwZDG5Zz45SBjwAe6g5WmYDn03xVc
         esThFgRuNOLlypdUzyWRTqPRX51aj5QocITw6IpgSyP4zrLrBgro/qRHl5OJJbCfCjfc
         DiRQ==
X-Gm-Message-State: AOJu0YzdM37p0K5b7GNcKtfsp0BYuG7Ve/2g80eRQDtnLTwx/IhMp64g
	Q3Gn/AnidqJcj7WYzTQHHcRJAPCd/o7Hp2BXr1U0b7M+04NrCc0gmaZ24Z9VRQ==
X-Gm-Gg: AeBDiesAu1G3LG41I9n/i3KJbU3jyEyy9cC2RzbuOsmpZsPG2O4z7RiShQLbji0E2Nw
	rZuxmCqG5gUg8G6DVPW/jMK9cm5DOQNewVghTLo5gPEeCxeYC/rTIpvyk71GXVQQdKDm63PtzqU
	itG9Gpi87vULoTf2FUGHS+tRU+jtXfZb0L9re2pL4MojJq5/7mSDZWh6Xq3XJ8wmsHeKgtcu7xr
	5w7TEnKbYTvupynerEJjXB1nfqzpL6/O4nB0bnmyQNTJRU22bM5cF37zR98G95cdwkzWbZx5VnB
	zzXfHLiIia6o0mSimayuEN6yPxBX7vYILzG0APUGSJg74hSOb9YNW2KGMzfRIZA+q9W7aAPI010
	Tg9fuF38172mA56Smx+kktjLs9AtQ4+H37kK0klQGXjfkBpN6LPt1ljreDxJA07ocnZqmPDZVxH
	WPyQ68sodLuSbwZrD4/1c6
X-Received: by 2002:a05:6000:250e:b0:43b:998c:9bbe with SMTP id ffacd0b85a97d-43d2927bc12mr18707061f8f.13.1775477004085;
        Mon, 06 Apr 2026 05:03:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/7] botan: mark CVE-2026-32877 and CVE-2026-32883 patched
Date: Mon,  6 Apr 2026 14:03:09 +0200
Message-ID: <20260406120314.3514982-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126039

Both CVEs were fixed in version 3.11.0, however NVD tracks them
without version/CPE info.

Relevant commits:
CVE-2026-32877: https://github.com/randombit/botan/commit/798a332e11949afa8b004564bb9031e66c1a4d13
CVE-2026-32883: https://github.com/randombit/botan/commit/6ecc62a4e36937d036df8c8eda6a85708abb8c37

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-crypto/botan/botan_3.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.11.1.bb b/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
index d3d0498ec6..2d6b64ad64 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.11.1.bb
@@ -65,3 +65,6 @@ FILES:${PN}-test = "${bindir}/botan-test  ${datadir}/${PN}/tests/data"
 COMPATIBLE_HOST:riscv32 = "null"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-32877] = "fixed-version: fixed since 3.11.0"
+CVE_STATUS[CVE-2026-32883] = "fixed-version: fixed since 3.11.0"

