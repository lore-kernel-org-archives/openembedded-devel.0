Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F3CD2B95F
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.19533.1730817414107293608
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXLvFfAz;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so4905030276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817413; x=1731422213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6rgthTvSmqtUv3rkodmnZDfMbEqFJzMU/lK6icQa+c=;
        b=YXLvFfAzzGRYM1Gv7TKt4q/HcQshdT2bfoASzxnKuP6zHBhxjtztENrl441maJRZJn
         9bY5V0YttqMe3G9vPik24Ny5JzUPw8kr+4c1vdhGwol6EppQGjPoaM2A8PDhAwftI7gl
         Uy/2dkCj0STQxqGjuUHaLOABm+liacqJBGrxs9g6pGq/DMHUDWFfRtk0GuZxOY2t4OQM
         FHOoSXlzAVKRqr975VqqHUJJz6Yi9gt3nQX9JZThx3JcYHUzlo8NyUebtI2pAN8h4Rn8
         TYZKnwEDvGCz3PfUbxWiZWx07F69XGyfXwcHab5BX+cHAC+INK98TsT8XNdb9Ymuj+Ne
         e3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817413; x=1731422213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6rgthTvSmqtUv3rkodmnZDfMbEqFJzMU/lK6icQa+c=;
        b=SpxCADI+LUGKWthcZ0lh8rL/wcTwggkHagDM76Y8fLyKKphI1ZKVHSst7GV4MRhX8/
         oOnp1uL8t3BQ/+JC8Z8gPG3Jlc1ttRw7qKyu99WwB/N25qflm63zbaTmB26ursXYzfq9
         vNeByBvox5FN/q+XPX8OfGgxpV6k+JaLpdAwj8QTzZOMtjXv8HGoKb2Dv1vut5ZO3OOM
         +n/mtNdWsofYcbDpVf4kk/DIsL5UQVz43vguo3OL+TnSdMpvOLncvzeEhY2jN4RteyCK
         LTCrLrF4vfYt1bq5P3ecq2MlIT0pIeElWW8PIIC7INrbOyQyQXEvjmFV9029vqqd68+c
         0JTg==
X-Gm-Message-State: AOJu0YzoySrJXgZdHt83o3ilUQ4I3MNVjxLs9liWZdqWr300ukOBymE4
	yodu1B50MiJa/X9v3ag6FEDnl2GItuZG2QG8eKr3+NDEFabcnkcaUANEKQ==
X-Google-Smtp-Source: AGHT+IFN+vNwXnTnjk2t27tLWoQzWbCW8MbXxHw+jfTR4AQ54WSeXNfCYimx2OGxQF0PvY3UIocb1g==
X-Received: by 2002:a05:690c:ec3:b0:6e5:bca9:cb8f with SMTP id 00721157ae682-6ea525509b9mr209091977b3.38.1730817413181;
        Tue, 05 Nov 2024 06:36:53 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 31/90] protobuf: add abseil-cpp to RDEPENDS
Date: Tue,  5 Nov 2024 09:34:56 -0500
Message-ID: <20241105143638.2301245-32-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113449

From: Yi Zhao <yi.zhao@windriver.com>

Since commit[1], the libraries of abseil-cpp have been splitted into
separate packages. When protobuf is installed into the image, only 48
abseil libraries are installed as runtime dependencies. But the output
of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
required. Add abseil-cpp to RDEPENDS to ensure that all required
abseil-cpp libraries are installed.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=dd6421e65eb75c35a904f4b487ba022075035ecc

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
index cc5204de4d..354b3213ad 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
@@ -106,6 +106,8 @@ FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 # CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
 SYSROOT_DIRS += "${bindir}"
 
+RDEPENDS:${PN} = "abseil-cpp"
+RDEPENDS:${PN}-lite = "abseil-cpp"
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.43.0


