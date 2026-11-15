Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3900.1794729090411884646
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OzWJNrM0;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37600b0db49so3070966eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729090; x=1795333890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHl7ONdu9O7UTph31dLCKDAu6nWd67cHBd8FP97a1AY=;
        b=OzWJNrM0pX1oGxjJX4If22xNJVQwcHyL0XxkDLEFzT1JU1KisOZXeU7v0UBtIFnlx+
         NXyYx8/cOTSlHnKRTju9GXC1T8Q7EqicszDbNcwXFm6tdgLLLrZQt5ZtV6GFw8YgXq4X
         ndnjnyhF5MT+ZtPJUbLtKrEE0Vp6TAu+kfZTrc4o/+bWkJxu6h8TGArThLgqUMh7Ofzs
         ZCXVw0JmQg8cQb9s5oiP8dQ/7vLRyNLQmmMChtBnffaL35qyF1IOtNx0CtAtQfdPoKtg
         zMbEZ29K0sJsNGQ3B76sxytjET8jivABvZIH/LoKjUv0spNU/hPEuSRxQYC2s3h2N+/m
         Z4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729090; x=1795333890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHl7ONdu9O7UTph31dLCKDAu6nWd67cHBd8FP97a1AY=;
        b=MjXGQUbxVQO4KH3Wc4irYGvjI9N4LeStofUhcnAL4FmmRteFtGBsRiGz7yWg0JnaR5
         RAHDGNcespCT3uKrgUeazdFFeFaXTW5C0a+MRkAkz6/YZkCoXUBM/EFt9VSEtItaxQHT
         LvU1LuEm4ua3kBcAjKtpyDHydGWk4wAz2Tb3nJwepBgjAww3U+ToMnb8Cp0TVWYY218i
         0ltFsmO+6QyEt4ppV/ANUp4IqiqvYe01/17kDRHyRNoDtkL21567KJ1vkxpqaadZiZ3R
         0vuJm9jZFUIzjkVAwXEOAOAq/3Uf0dA9bSQ0NSZDUtuD+SdnQitixEoJMU4PpiKdw3Vf
         tHFQ==
X-Gm-Message-State: APuU4Z9r0kSnYa5KbAXh28s4WHfwhOBfOGeA8k+DZUeRh5sIAVgxzGyC
	iLOOJygFSELwTvzivKcXjb5eRy9/BdLQ+V45m72istb158R1qDRfZ4pmCcu8WRO0
X-Gm-Gg: AYBFou1xQwZd+igfiaRe6M4l6yxealVuOeIJzaUpeT3VUjxNE7+L4lzJnkf1A9KS7aH
	gLWLQaiQi9f7rN0uGk2ZH9O4c3ASOJTVqIUMXXZB7uL1P8cm/8bOs1jVc9O0ORzMX0DogT6YyLs
	S7WN9iQdPfd/sndhW5HeEnijU1MIL6D/80s4NlZHBKjwS8Wi5CTkDse06YLYzDwDlkCSbg9wlDE
	6aGSxcGSDQkoOBRXyoiJUoroBPGT0Ly+7DNVQPtaepD8sgpXntGZxLsjc8a2cenjO3TyXEuqTm4
	qCW06UDEAW9fK+I5Gk/6oxFuIEiLBkVvfSc8QdeudGghHQLN/rSZs14VR4lksc+ssggphTQCZOX
	ZXMsl/YiFBwH72D3sBO3FN7KS/zH21DDGTYXdMebXkwq4OrUps9M0IEE6a+2/XZ33QEvuaMsDEF
	8dmWN+JKaEx9f9g2o+M63v1QFaDDD/tQlufNqvag/6GxoKU+iItitmkTEnvFIB4gFDRcC8mQQ0c
	lSgEqD7AHmQLU84pTWUGlieAr1WfJPVPynfnUe2iYhPLiIGFCNz/Uar0aef4U/A30MvBQI5EWkh
	Z69l18i7s0/iUmrxrazDVjqNdGmHri2jZ8KjhmkWMJmiv7jcXfLjokD3uZXFwWb/RrMHRJ/W5Sw
	NMRi+MvwKGxI99qKovwIcbFC60hKuD/j8TkdnDAnarI4QNJhxxVP6XBfHXYkev/LF37PPuh27MH
	hn/J8AB1azeKwe+tmSt1k/MjRQkDwkEjnJDrHiEE1zRUb3ThgG1HcIfSfqvlwdAqvZoPU6lw3Y9
	KtxbNB1iUnJYfawMhkDuFKZh2OkypZ7XJQf0W8GbP/y4IfZR6Tw6n0S3f5oYpQs+v7eYQr/sU0x
	wpoR
X-Received: by 2002:a05:693c:639a:20b0:36c:fdba:ee36 with SMTP id 5a478bee46e88-37966e3a566mr6792894eec.12.1794729089674;
        Sat, 14 Nov 2026 23:51:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 79/96] iniparser: upgrade 4.2.6 -> 4.3.2
Date: Sat, 14 Nov 2026 23:48:57 -0800
Message-ID: <20261115074918.2932593-79-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132349
Content-Type: text/plain; charset="utf-8"

fetch without the Git LFS content The repository keeps its PNG images
in Git LFS. They belong to the documentation, which the recipe does
not build, so the fetch no longer needs git-lfs on the host. Tested
by building iniparser for corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../iniparser/{iniparser_4.2.6.bb => iniparser_4.3.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/iniparser/{iniparser_4.2.6.bb => iniparser_4.3.2.bb} (87%)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
similarity index 87%
rename from meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
rename to meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
index 5958ecb9c6..72c46a66ce 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.3.2.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://gitlab.com/iniparser/iniparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
-SRCREV = "4bef811283e0ec1658c60e09950bd5a1ddc92e4b"
+SRCREV = "4fff3f22b63819d30ad5c2e4d7c7df9ec272cffc"
 
-SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH};lfs=0"
 
 inherit cmake
 
