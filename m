Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FB0CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3581.1760484812130264461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8pxYgv1;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so5761430a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484811; x=1761089611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/eGPGq9fO94N0Uhy1pzyCjVfxuml0/hGuhadABayw0=;
        b=l8pxYgv1W39yQnzzZdks9MOBkx0KHaua7nBm3mO8xKipP7z3fL0Jzv44GnIijKudkC
         Gcbtheg6qsto5FNl+KGszEjrYbXoNrGfXMoeLFsteqRZ7iid1E5z9gwMselyFl8Z+WCF
         vpoTiztogSoLC9MAVuf8mmc/M0jJATKw/flGAHLkMa5Dd1obasaLl+Eo/29500EDFn15
         6H1REKZEtcfyb7tuKTmXPgzPrHgfwoRHDBkrQh57t8R577o4GyZzz1oDrgfCrWOMcryE
         5kd/Bdi0BRuVxb/UNRl+mT0BQq3ayeVp4as8lrK4S7zRt9v/7oC2sPYDoH21lv5adjj+
         AWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484811; x=1761089611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/eGPGq9fO94N0Uhy1pzyCjVfxuml0/hGuhadABayw0=;
        b=uBoggUuSFBvoK8xFhgsQfu85HIRHBMCAUJqR+8d2hhgdnDqpkhCFYv/SGFVTGEGDIz
         8TINQGx5qnGqNuOYkPWFd7AImbevvWAOtUpkkWs9fPvlDsFtRuYzZtX9JuB91xUrWjKl
         raCUxGHKAAecc+8dQHGz8K3L3jnU7ZMemlG62JuZE7ocBrFZ+b8Kk1lRj7wfQbaNSzLA
         AMvzmdrGN1L0u/1EBfEuV1froW12zLZJnzN8UdeM2C3xPIgqCXMJWe3QO19atFqH3IGC
         T7eq7UnCwhszRJCPsHH6wxo09B81mOtu71UeC1IsqvUADyliLCFmZGvQZ/J1L/m1WpCs
         ZoNw==
X-Gm-Message-State: AOJu0YxMOxefrexPgK43I1xBqV2e5i/usVsStQyksUB04YSQizRoClmk
	DnwMz0fw1mZG6yoEfd+ZBlKh+vAbzw3qS/A87mr6U9VQoAHz7S6FCf6GypXcIw==
X-Gm-Gg: ASbGncuTR5m0qsobJJBPLr2OeaPSVwv/tsyro6w3CZT29N/7ECNuC4qPDv0ARj7q0Gh
	6IX7klfDux0O5QYVKWNN3R+1Ct18rzW3pWC1XYLxwKbl4bKJJoYbRejVKryQRf+OOTDlJ6Pcf7C
	OR49kM+BAq49RMgu19s6eh3nO1FPpDx2dnDs3qxZQHAPFfyA57CzXkMq/S1MWMmit9dj8yDfP39
	mRo9h49FLf06w7Zi6V+dZNevzp2CijVRa0mDcP3HkhgNdYR3IpFL+LtvF6xml0NA08f0IOdDdps
	G3rGlIwo9df76S00knbdpVjrn+jLk/AhGocVh29DP4lqGr7tCHzt7yigIWIl45PZOWpq/idg+Vi
	uF2LejKAXhdaP6LN8rjXayY7EsgIKy8FOjjo2gv1NCsxlP2pVYk03kmc=
X-Google-Smtp-Source: AGHT+IHmH2dTZkmV0wcXNlNxUJNIPEx9C978nxy3k0z4XQh0+XKoDRpf9OnXgpqol5Y5hoISG8ZQSg==
X-Received: by 2002:a17:90b:1b11:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-33b5138e3f6mr33563938a91.22.1760484811374;
        Tue, 14 Oct 2025 16:33:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:31 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 18/18] jasper: upgrade to 4.1.2 release
Date: Wed, 15 Oct 2025 12:32:29 +1300
Message-ID: <20251014233233.304125-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120677

Bugfixes including CVE-2023-51257
https://github.com/jasper-software/jasper/compare/version-4.1.1...version-4.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb}                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb} (89%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
similarity index 89%
rename from meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
index 5281980ecb..d4dae1f22a 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
@@ -4,9 +4,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
-SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
+SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
+CVE_STATUS[CVE-2023-51257] = "fixed-version: patch is already included in sources"
 
 S = "${WORKDIR}/git"
 

