Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6386C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:50 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20737.1782663768010960006
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p33gGXgy;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-139eea1aeb0so3739095c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663767; x=1783268567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlk67xMmzyrYs6tObl7NBG690kfd6vNFhOZU+qFP1mQ=;
        b=p33gGXgy/scOYhtAjSWZYnDKc8Lb8lOp7HDjjKOXpxYN8bKVPhlJFzdVCUn7roIcUj
         vdB6BkZ85iiC2QmHSYDAhsYQgWqF55SX9ZWyeck+v9PABHeLUTFaa+/YLb2ZUCrQeQJD
         e4wqMvINa1Imx22qPn/6ZOALeAHSPCbahtrlAYr25JR3cI5LONNYnnjZAnjROsnYb4I4
         bIR/ovS6VUT6is6cACUg2vXjU8J1i5NFMp2dmCSRtnHA11PSxcnUKxMq6J6g9Ip8pa7p
         TbWXKVxKGB0bgeEJw/2hjaF4ZNHNfAbn4axr/WQS2bCPRLLd/PNxC8zc3FLWnHJ2v1nn
         f1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663767; x=1783268567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlk67xMmzyrYs6tObl7NBG690kfd6vNFhOZU+qFP1mQ=;
        b=akUxaJS3+rxx3N3l3ChdGg/YJNLqTa5qmzJ2gmOYb7/loEalVzsTbEQxB/2c3XGgi0
         jycQRbWXMygzVMHbT6ePPztrc8dANhdBKZ0iajqwMEWKsrqfn7IitgUqgeB2Ra+rQebh
         CkYygTglvOnoaPXHHWwQs5KhGnhOIo/VEZ1JYF4Du6jrpZYe47SpSHe9Zqyj+m7ovXvs
         ZwCCxUrV2mBD4hPCfMAsBI+QxqnyTGFdjn3IZFQlikli7LQ/nZkNY3S33eAESX35gqXd
         O4Ca41BxYL+vAEkmKtV37qFbSXu/eWLAYbfsxFh/VEuFX4EYOPXnahVUhW6MHJGDsE+Q
         tTNQ==
X-Gm-Message-State: AOJu0Yz7bx8FUCWpp/dgL8Kl8/lPMxHMOmf6TuW/8vjUnzsF2wowQzcY
	xEIvvbiPzy8Pg62R5j1GtS3PTKOKV2xChBRtx5V2U/OFMptvxE1tzgcfIvw65tutUcl9cQ==
X-Gm-Gg: AfdE7cnlpr3CyqPRMhW0bHgcoXSCIPe5Q9osbGctGA7kAcBOyqGqeAhWBXEmVidRbe1
	NPJUqnUbdOUCzJbaCwd/rmYj2nh/QxHEJlx/5RDaeeDFovNMZodvmsKkX+Ll5KKKZ/lnpDXNLoJ
	TNHgXDiJy3bxTcRDjJCYDwLyKu/eJlOQM9ni0hjndQYdZVpqOKmm6HXTjoer3tkHPBGRAE56smu
	21vK7ZpswQjhN6isvRGPOpw+AGUfq91NFu0G4i7JNepqZFiYXLhmq0N9qHbkiwQWVg+EfwxLyx/
	8alAVC0KkVl9nDdhy3Piyc1dPSp0E75OKCQB0a6NFH1TLa4Fh/ueLg6iBa6yijJEWMgxDRX8hV8
	YekHVjLR2TZCLYWR+1a1TnakWDukm0twdkLLMud1ZWVwZww28PgWhHEuWCZCpb16h6qvoeHrX/L
	pN5GYZyjQTtrxbhJi3tKezlrBCsyiEbQyhSKbacvvZIKmHt5hKb8Ur6HtA/XrwqGNDnPf+FBPlK
	+8xY6u6sqlhrIuhEFgAoG1mr4pKkl/sOLuhmaLwOTS7noQEjn5BuYZMHKZRcUpcZBGKEBnjgrHX
	D7M1GTBKBZDQswzTiKtLfmE67ZzUcg==
X-Received: by 2002:a05:7300:7c17:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-30c84b94259mr14223036eec.3.1782663767318;
        Sun, 28 Jun 2026 09:22:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 122/128] redis-plus-plus: relax -Werror=maybe-uninitialized for GCC 16
Date: Sun, 28 Jun 2026 09:22:16 -0700
Message-ID: <20260628162222.4081517-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127932

GCC 16 emits a spurious -Wmaybe-uninitialized for the exception helper
constructors in reply.h, and the project builds with -Werror:

  src/sw/redis++/reply.h:54:60: error: '<unknown>' may be used uninitialized
  [-Werror=maybe-uninitialized]
  cc1plus: all warnings being treated as errors

Add -Wno-error=maybe-uninitialized for the gcc toolchain.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../redis-plus-plus/redis-plus-plus_1.3.15.bb                 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
index 1f4b05cbac..b4ab0697a6 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.15.bb
@@ -13,6 +13,10 @@ SRCREV = "a63ac43bf192772910b52e27cd2b42a6098a0071"
 
 inherit cmake
 
+# GCC 16 reports a spurious -Wmaybe-uninitialized in the exception helper
+# constructors (reply.h); the project builds with -Werror.
+CXXFLAGS:append:toolchain-gcc = " -Wno-error=maybe-uninitialized"
+
 # if ssl is enabled for redis-plus-plus it must also be enabled for hiredis
 PACKAGECONFIG ??= "ssl"
 PACKAGECONFIG[ssl] = "-DREDIS_PLUS_PLUS_USE_TLS=ON, -DREDIS_PLUS_PLUS_USE_TLS=OFF, openssl"

