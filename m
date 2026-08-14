Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF04C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24362.1786747570667443978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qfKDmo1B;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84867f07d63so1483246b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747570; x=1787352370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NRUk+hwFCNejH2je9hkLs6bNi6fouFS74czuwvh+SA=;
        b=qfKDmo1BZjk4bVlaTXXvYtTQ1dkf8X8xmw0lYtWdlgCENp6R7V3I1AFDx5ZVqdWgK5
         1hmRP1ZY/nYpXYWJnMA5/X28p8JqYyVL1wOK08f4JSHhQy8KUm5BPThHVBEGcOs6EFN9
         11ES7vrHcTpy18ccW/e3mkeMFWNQYmB9q7Ig81RNQoVbSFoZjNSAyPNYEU/5qFe5kzsp
         26Mg1wuhTrxgbar2LJIJHfUnKVyS+tlUtTiMGKJa5SnUTKh+m7lT+7Y2y7ASSc/H8C3/
         aCk66x5/iBn/35pSzw7ouoIjtWBSdUoV96CF8HVzqPYLeRQCCwtUmKvcPoZdl37bolcM
         r8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747570; x=1787352370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NRUk+hwFCNejH2je9hkLs6bNi6fouFS74czuwvh+SA=;
        b=ss1dXFtwRF78j4hDxUOl7oatcmBFnV9NynZP0G1LhjLgUMPlrCEDraIGAPY3vqIhqu
         r3URyEuAcQKXS+4OtPBQdf4Shfrd4RjyeWh+WciK/KrWcdmBuhlR+ZokdomQ41QdN9JR
         0up4O/Mb2i13anciOT2bK1YAocnEpygn3S99uQ8X9ycwbVfPVk4dOYcEEMAcbzZl8QFk
         F1pIQZRuumBin9alIH32ksiyyTgsrnJW9jI/rq7YmS3QuGOVBAHqnInXAx4TKQ8nX1bY
         RUBgPMKvrMtiznZ/YVBqPixInbI42RieS3XkzqLWfl2cZtU7M3lS6c4EMttURoGMAKk1
         m/Jg==
X-Gm-Message-State: AOJu0YxsyF84dgKlD3YGTbDtUKmHQp27k2gEnoz/FVW5sMPpRty2SIh1
	4GUjWt8cCpSg4fSL41EPQu9ySh/o+88LAzfMEUqGVko7er8UBAD2T1UeVzLaJQMo
X-Gm-Gg: AR+sD12y6kw3njXxCtmCxXMMZWG/CpX4k/5vgiq3RiNq+kkRDG5z1q2TzNw7su52MI3
	9pwsT+AO7vtdK5kXCDWujobaueRyWkKwdCuCgI/DcXHzTLPVa0HIJVdaC/swTETFTSeOXiXeoOf
	Qz6lBAyHqONaqPVyx8e05wgXt7vL3blL8F1uYNb2fuwvhvaSL7UIGyTy8NUDqgJ9ThzduqDgAiU
	CoSjC9If+s5P9tpb5IS01pTwq3NU619qUV06HMbbAOci5RGq+LRB5WL0cnTB0AbUH0hcUzMB4kf
	fhEqVInjCcNbD02ANpCbTkjbjmzY1AKnfIeNfBCcU9dGJ2q4qn4RAZnL+efjBtS3YT0ARIAclMx
	GreBxndn8zMZoSk5rWrgI+ZzlrZdUH3zN/JLZlm+OX4Xkx9Ct+pdqhZ7EhxqsuHn6n4FyXEwQ6Q
	bQft2NDzyV9W3Nhc36Z98ZxTLOqv3ydBmharF8e+GW8hoYkxVa55ca7R52qlqsvCCha1dua6UTC
	nF9Vckzy45xf91FgJqNCkYeQx7s+gDKC8MYMj/htRLAR9ILSY/ZgyJ1ehAMzbA9NwvoPKaGBT+e
	sI6n8YOVs8c/XVvKlMBaOB0M5lQe+uAoawVPGB7PvyOJV/546XXhoBnUixZhqA7uxAjcPbWfbdV
	Hyl9otFaV3QSEBe4bl292Ls15jIZLVX5Wy/3dYgXX1DD5iQ==
X-Received: by 2002:a05:6a20:2587:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cc71c1b66fmr10391451637.1.1786747569913;
        Fri, 14 Aug 2026 15:46:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 025/109] grpc: upgrade 1.80.0 -> 1.83.0
Date: Fri, 14 Aug 2026 15:44:11 -0700
Message-ID: <20260814224539.1523174-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129089

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/grpc/{grpc_1.80.0.bb => grpc_1.83.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.80.0.bb => grpc_1.83.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
index 882cda24fb..3e03bf510e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.83.0.bb
@@ -23,8 +23,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Both dependencies are mutually exclusive
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
-SRCREV = "f5e2d6e856176c2f6b7691032adfefe21e5f64c1"
-BRANCH = "v1.80.x"
+SRCREV = "c876f4da50f7da2f331888b88b2a7243514139fe"
+BRANCH = "v1.83.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH};tag=v${PV} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "

