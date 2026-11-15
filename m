Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3846.1794728974522603535
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UQ4AYLy9;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so4584013eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728974; x=1795333774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JUAxO8ILZQ9frEgCa2O+qRmIYDSFy++SiKj4sqXyiA=;
        b=UQ4AYLy9NQIyINPxC2HsQUoyDUheDzZA5LaVJuUGiWkbvj5suKcpzT0G9Tn8l+tqQB
         y5tp8MSB2WvaX3VQ93VBp7o7nCPmPdSo79IZu2kcL6PvX+pZqXSziBa6XvHWql/IRWza
         nXINynICLbcZn/2p/9Em9tkKtcwRl2vzNiamNg9VgtqG7qdsKIPvjMLjKrZoULUIkS9/
         9SXgLCfu0uO5IPC6qZcnFFDQEqZR8t7lmMp2TJ8t8XXBI0Ob3bHYkoIR9+o8oRcw2aN8
         87UaGQC0OTnXXdJjkuoLERW39AjfOZYkQ1Qqr+eWXchFsePESuz8F5gea48TZ2k9fnop
         1ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728974; x=1795333774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JUAxO8ILZQ9frEgCa2O+qRmIYDSFy++SiKj4sqXyiA=;
        b=Yg0+H5DTqw8p9alcCoy4wqrcSqoJLLCJoyw6cnE6BV09wikPfNioJZY74q4vdaYtSL
         MwUMP4TgPRMTvnCwC7lCUiQ2nSxHbbc4JRseNTSyHnjncKt9m6yhBQlkxS2QDGbSao66
         EO8P0Kreq48CLnBBc46K/6im04wn+G6IQlWoSPejdQjusjUql+w0L5L934AHAts88Obn
         xmDdT4SnEdf/VCr/RlOUbtcwF9bc/H9lS1lK2SRW4WAiqm+NEe4CXb1ugs5aGxKFZbRQ
         t+rjzSkJx0GLPCGLlwR0ZB9przywItkQ7i2L4+suckgu3cjoo8ZzztJUOO4lxCil0qnz
         lKZw==
X-Gm-Message-State: APuU4Z9H9J7WAtNtxNmB1EN7IcZfR4BsbOjLs43cUi/+38KfpU8DQ0pu
	Kc6Miy24L3k8pF0RPFoGmRvOWiLLvY14fe7txF2qYGKpbkGF2yvlS2f5QG66/zLD
X-Gm-Gg: AYBFou0x/QtKQ5PfqRGgWX/Q1mVTfq93hb7DeSKSQFldYkEXHhdjW3U2NUpWmx42QtQ
	8fwAFDuoiRUroj5NkCJbYpiwScf8RagMSqACnW5UYYP9zGW3OXBogb83h4Me0K9oqEctwQnIQa4
	FEktmDT1JmoshEoRvywMdgpUWOdCslwogw5qgHYh5VnHwQAEuMz1O57aKoWvc9t1xCUNXzYDwSq
	3pJZPNM+8WlkkqsBqqz50CmA2yAW6+/YTesaOBB2LpT5xclbSCINTUgn7lqekrqgdFKH5xyHtTv
	JpzfT01oT1i1k2nW2sLVDxTxRjvBRk7UAMOi/NzOuUME2d5JqDXrBVh2H6pM1MPJz+0ystBNAim
	235TbKcrZlW/mwq431VSkIMrG04xRJvRDeKJ49a4v59eMfBnJBQO6CzDO2JMYwb3AZs36kNhBYp
	1OSD+9+uvUB0cpRU/gaVQxtOvEao2/UzyuPUW733Owin5BXfusEaRmY3G3oR9CDzVCauJjbY1wT
	pFNnmLgxSTQBjpHWnDP4zFBNVe1xuqKCt9chRrAsseEKAgFw54Q4gy7mG+F8ESW7Zxyaa+1+ygo
	sen1fT0Et9PkdwsBmcDdSJYl9WoNM0iFuv0hxGiHF6niRyk0oztav6oojuaGO5oy3AdYIRyDFmW
	5nenaS2P+IH4UAcQOAY6IEVaF+nI2SC3J8Z42RQfLAAmMqSzsR7s6cSQRAiMf7+NEMFtjkvT56z
	31ot4J2QSP+cKu7D12gJqlAQXdOWt4oP1etgIDed00tUQD4lAgGD3qfMoKVgi93/KTfkR6egKaJ
	SbBYeJUnlWRRb3cCXlZ0HcvrpN6LfALUS3hxdrYJ0YIv8xhg5vaeuU0KkL/W/CnPu3Fjpb4fRWn
	iYNb
X-Received: by 2002:a05:7300:d58a:b0:376:feb:2df3 with SMTP id 5a478bee46e88-37966766dc0mr7368701eec.20.1794728973678;
        Sat, 14 Nov 2026 23:49:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/96] graphviz: upgrade 16.1.0 -> 16.1.1
Date: Sat, 14 Nov 2026 23:47:46 -0800
Message-ID: <20261115074918.2932593-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132278
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../graphviz/{graphviz_16.1.0.bb => graphviz_16.1.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_16.1.0.bb => graphviz_16.1.1.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb
index 99ee0b088a..abfcb96316 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_16.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "0f661718f3e5268dc3bad0fb53ab646605d26db70f4080799aff1dc2f61783c3"
+SRC_URI[sha256sum] = "52e7fb9a57b52b5c67f41dba6504ba3231e118258779421cb8f4f99104de71f6"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
