Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B321AD2C114
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.19553.1730817428440963013
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O0SQ04xx;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea7c9227bfso9154377b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817427; x=1731422227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krfVk9tN4vE/dYrWiV5LzDACUvl/nJf+vupq883A7vQ=;
        b=O0SQ04xxXTCbbUEKVqkII8ikm7+JHgdV4l9H+JS2nobS/X50hglaQ57IBsP/AI/Sve
         mYgToi0HWE6CHJh/IGcIZGFTKJfwErxSTWcKi1caMDHtSu2SAYAKUViCOdMkgRs4mfRB
         +XZRbT7xj9xDx0zhS+Aod2LrtGap5e2rQIjQ7znQlZdaOZUZSzZHuRrsWtQUEvC+G4TG
         ouodLHKzNHHm+L9/UxliJPkgr7/kkKu/FY06Fb3ZMzuJilkaBZEd2Lov6g0KTVhMyHFj
         bET8nNGCggafldHZNeW4o9MToho9viWi18K8YlBvSsv/Nv6n/IyAxUVDQuCjxvAtmC0Q
         x4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817427; x=1731422227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krfVk9tN4vE/dYrWiV5LzDACUvl/nJf+vupq883A7vQ=;
        b=Ik9P1RfGlq8w7V7KDEfI/gmF4UQe3M/2FENLQIoMtMpAqkjPb/eSN/nmsIe4zU1V+G
         BIIkXZK7wH9o/IhGS+MXldFcvFgdc0tI1p1jgaG7ZOPMvUk1aL8/T5f5EmhuR94TnWzH
         KLPR5e4225Oct/tJL+8gLbATa6eEeQ1TIFaTTNALJ45Y75GIh3J9JWqZZGG4NpMJ24Po
         2v9vDLuFM+u0b/AjMIPYo/AkS1SBUe4pTn79IusrRk90NCorkoaW5yGP74R2hyCKIh4n
         Ie+213SjFGZCZ7w8pT0dAoBxZXQ1BscsqkkT3wMFoomB7/hggbxsAdtSNBu7tV5Silyb
         Xl+Q==
X-Gm-Message-State: AOJu0Yx+vJT16AonwzOHVq6diQyIArRdt8KHxxHUKGtpH6p8+ppUMpez
	BXWj6ArwrPlVCsIeyoN0RcRd62hJm/nFRgdotJGXPvkWeT1nNmLSb1asyw==
X-Google-Smtp-Source: AGHT+IG+LMCi+mRy1zREvEPo96puZvDVyAWzUAqMg92xbspMmneXZEFpSm33beZLLXLILdSB8MThGw==
X-Received: by 2002:a05:690c:9690:b0:6b1:8834:1588 with SMTP id 00721157ae682-6e9d8b00311mr346531527b3.35.1730817427477;
        Tue, 05 Nov 2024 06:37:07 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 61/90] python3-inflate64: switch to PEP-517 build backend
Date: Tue,  5 Nov 2024 09:35:26 -0500
Message-ID: <20241105143638.2301245-62-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113479

From: alperak <alperyasinak1@gmail.com>

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as inflate64, it is by default.

- Added missing dependency python3-setuptools-scm-native.

Fix:

 WARNING: python3-inflate64-1.0.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 289470f0eb2bbef8c2f3310420e39c266c8a6c86)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-inflate64_1.0.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
index 9fbd5157af..7804152d94 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.0.bb
@@ -4,12 +4,12 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit setuptools3 pypi
+inherit python_setuptools_build_meta pypi
 
 SRC_URI += "file://0001-Do-not-override-const-qualifier.patch"
 SRC_URI[sha256sum] = "3278827b803cf006a1df251f3e13374c7d26db779e5a33329cc11789b804bc2d"
 
-PYPI_PACKAGE = "inflate64"
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     python3-core \
-- 
2.43.0


