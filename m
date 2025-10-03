Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90151CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 18:20:52 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.1225.1759515644356510149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 11:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSws4Mcx;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso2021373a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759515643; x=1760120443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvMC27GgnnFFWpWMCQCWeof9EbmCvZyXT3wR1WwqT3Q=;
        b=hSws4McxCwVgybSLU2BJS1+NAS/VxH1htOUijFKPl1MYx5XwjpJzL/xqVPsrpD5PZE
         GmrdPK3Jb9SyO4XBTKULPwj6ulHCxB7p5qlM0Z31DLi9QRHeqCL1+uSMHSAeB7PtmS2K
         A1Qb0Qn1x+f1bJrflOiQj2hNoI0W6mivldF8AkkC7YOd5+aJhoA5gWdfvf2Ss18L9K+o
         r46gZIgWeBZ2LbzkN4aJDzVmwj7oqUaphHq0byvhtUXwGB5TDDBh1lIj1j3FzZgp+UKL
         QJMJkuU32g8U9SzkD8WeKRgM30XIslJ5Eih9nK1g/BPE/yD26DJ6xBPLH15RLhSetxJ4
         4+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515643; x=1760120443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvMC27GgnnFFWpWMCQCWeof9EbmCvZyXT3wR1WwqT3Q=;
        b=ZzmLkgu6ZMIb1P4BTB9J7UHr2pXwx72dfhZIboCWcVDG5mgyv8RayL51gr1U+e1jwc
         mdpzOgFVxlpto7rrdkFHJ7Bouo5erkB/q3k3+FlTfczzLZH+jJkhE+10glNGEwyIBEZe
         eYksLMokIIGY2XUwWziUmPbW1bPWTfa8RWWc9pXgQ4A26rZqFPNkP19vSTyAtsFOvmxt
         RKe1xssjbV1/4eDTvynoEyDDnERWUKV5sZebt7UJqJ4ba6dxhwjH+2C4brdgbDAZySC5
         54GaOxWONhTUljl9Tbyh/npdYTLC9u/3mVWVv5SuUeXsSkLldxADlR8gI42gtZAZ7XpM
         8SNQ==
X-Gm-Message-State: AOJu0Yw8XSJ4ULHr7V/yzdu+TChIUcDDTGtypn604OeNj9AJVXmve7Y9
	lCkmocLpM+sePPTcc02SWezTGU0kKr+EHI0gnO5nfbC1vAeJdv/zt/11qrbcuEEm
X-Gm-Gg: ASbGncuL1R7jxSHSWxXIE4Xkq8sBXaJb1StADSvhz1l95bJlXX5byPPdk/84W9PTPI5
	qrygICHYTf6zUjchrGV7N0HBBtDug8SiV8yXVUORUxbmfNju80cCe179cxdtvaCaIVabDuhRdfZ
	tfI8e1v0ky2XG8JG7z6ZzCSMlHYe15La0hnO0B0iIfftVRbyTC/rzeJhdA41pigOMtw8WR4dV6Z
	CBgyOXcE08USh2bABSxSC1bYc9Zxb5y4e7MMhd86I/tFeOKZffkxagrfDEDYV9Cp12bpQY9XM4b
	SvsO12kOcnHvSpA0lJrDfAUsXRV2thgBy0MQ8tVi0HjpGypV8fzsUVM9COwp6o0OE2NdKSdu8+i
	eMMmqJcJP8eb/gCZt86sTd7E7qkQWP8yWPSOmHDRbFX0/lH66MZHTA2hBzSqMMq6KNfBiRcd1ZL
	GEfNup+GJMtzlfvYC07EDcvkilRc2kQ8QrEYa2exdnd0TJbK6yJVkoJT4g05KeuGA=
X-Google-Smtp-Source: AGHT+IHC3/TQaQGy9hHkg9kVLIftP2TAlI206sMgtNEcBWUK3isnhrZb0Xq6aNq3JFyh7//U2WW9zw==
X-Received: by 2002:a17:903:4b08:b0:27e:d7a4:cd32 with SMTP id d9443c01a7336-28e9a6654f9mr42001515ad.57.1759515643289;
        Fri, 03 Oct 2025 11:20:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d24fdsm56682385ad.93.2025.10.03.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:20:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] taisei: Add packageconfigs for lto and rtti
Date: Fri,  3 Oct 2025 11:20:40 -0700
Message-ID: <20251003182040.113937-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003182040.113937-1-raj.khem@gmail.com>
References: <20251003182040.113937-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120224

meson's rtti detection logic fails especially with
clang which disables rtti by default. The test is
triggerred in one of taisei's submodules especially
this commit [1], I think it should be something in
meson to fix in its rtti detection logic

Similarily LTO is only enabled when it is in distro
features, clang disables support for LTO in toolchain
when its not in distro features and linking fails since
it can not find linker plugin.

[1] https://github.com/taisei-project/basis_universal/commit/851bfc63fd0f9d00dd1a21fb542a9b8c0f7d06ec

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
index e0d77b375e..4af2712140 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
@@ -39,11 +39,13 @@ inherit features_check meson mime mime-xdg pkgconfig python3native
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 
 PACKAGECONFIG[a_null] = "-Da_null=true,-Da_null=false"
 PACKAGECONFIG[developer] = "-Ddeveloper=true,-Ddeveloper=false"
 PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,python3-docutils-native"
+PACKAGECONFIG[rtti] = "-Dcpp_rtti=true,-Dcpp_rtti=false,"
+PACKAGECONFIG[lto] = "-Db_lto=true,-Db_lto=false,"
 
 EXTRA_OEMESON += "-Dstrip=false"
 

