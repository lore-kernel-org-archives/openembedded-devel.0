Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EB5C87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 00:23:29 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.101724.1754094208176888908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 17:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dg3ITmYw;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso2751715a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 17:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754094207; x=1754699007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niddoWjMqvd75vTAUVpPifjLdXbZF5aw6xPt+1KbCqI=;
        b=Dg3ITmYwhogNMStQ1FG+d3wYPx/+pMgHwNwhvmsvBNQZKqLdNc98y0lSlVn2tamlhk
         ZYTbAo3wRVIesYIdSb/rNpCLjt154oqH4JIYcazYdaQ3KjkvqZvpPm8QLSer9DWV6Hdl
         iL1Hay1eRmtI4pnMSyAoL2yZ/zCag8R//K3xiabL0amk3hT6r8mLx2W4NLArWVg9BXU7
         1xn2hHNXfyV0z6Ecaji95dLUdq3VB/xZ+iRD6WOB3HZCMIe2Y7Gt9vHlGbmmWtUdiqfp
         7qSoF32AyYhvYFvFMrgW26AOBcQfW0HQwKtPGIn1WogZEACAo99PHtjufi3ID90n8Z+z
         VEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754094207; x=1754699007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niddoWjMqvd75vTAUVpPifjLdXbZF5aw6xPt+1KbCqI=;
        b=Z+44Tkcw7eq34dH8BTFNlmci1+HNTyXZfbSSflwjPZh96fyBcRsqqcBv4bf4+VAIc/
         KpkbwwvUJd/KEx3WI2dj4MghV7866WyCr3zVFONv/9e7FYFep3aG7xwiHiP1NGGp9z3A
         gAC2dG3H086x2FjuTlywB0UNx1EDCZpA4YEOEyA2qb5TKD/Zdihww+xMRcF1uWxL490l
         IjfbnSP1ZZPf++I0sGc1g0fzMhDApiGdVoXYPOs3AbIRP7JuMKZ8Ui9wjBOdDN6KqY0a
         ZKp5qMIeAkGg/f3gADkI1ayKOy2gal7+rJVYoHDzjuq8lFSKwvjoPYlYR1nPXrQ1zBfx
         Etow==
X-Gm-Message-State: AOJu0YySzz5o4PcgfzrLfbzSWS5ry5BAxtTHHI29dT8hifEWP6ejeHjI
	sPfxsIJ5vFvZLOOjP1pxEZoIfQIj0/C72bq40NMDXhMSUcq1IdhuOY0fZ32s+Rg0jDI=
X-Gm-Gg: ASbGncska1SoF3ICZVcsItWZUbUEwOjilf259S7YxYSvlZzMgj23X1dKNrEv8ANgOMG
	dIOGKmfjsdq9Pl4fNUWndbIsUeqhRd+WNwFsl0IBNvhuz7JyDhDG5/f+EhRSMFkjBUG6fn4jlDc
	mBrBtZyq8zaT/1v9O9wVH1OHqI48PtFIntSFP6HNg3XMv2acew6AJDs+qQBiH8oVY0+f5+ZGJre
	NojF+I0TWPHJtnTncQny/JPdDobNyK9/mlnL06hoxndLE/dpP1Bly7wpF4vm7Tei/AVGGrL7c9D
	hAXoVe/D6qUKrk+NoyjyTkUiKq7tV8ZjPv4q3v4mmktJX9BOvtBuxU1+v9YqC497EXRopY8jcfo
	aRSlbts9v7g7+zQ==
X-Google-Smtp-Source: AGHT+IHSGLskeYUMo5d7WoIQd+d9s+ZSA7kTNhNu2X6rdTmkUVUQ4aLY0rdUAGRZIBy9KbiyYCgtbQ==
X-Received: by 2002:a17:90b:4c84:b0:313:f6fa:5bb3 with SMTP id 98e67ed59e1d1-321162e9e6amr2200927a91.26.1754094207268;
        Fri, 01 Aug 2025 17:23:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102b9022fsm1296005a91.4.2025.08.01.17.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 17:23:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] spdm-utils: Move back to meta-oe
Date: Fri,  1 Aug 2025 17:23:23 -0700
Message-ID: <20250802002323.621998-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802002323.621998-1-raj.khem@gmail.com>
References: <20250802002323.621998-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 00:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118829

Clang dependency can be met by oe-core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/spdm-utils/spdm-utils-crates.inc             | 0
 .../recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb               | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-devtools/spdm-utils/spdm-utils-crates.inc (100%)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb (100%)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils-crates.inc b/meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils-crates.inc
rename to meta-oe/recipes-devtools/spdm-utils/spdm-utils-crates.inc
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb b/meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb
rename to meta-oe/recipes-devtools/spdm-utils/spdm-utils_0.7.2.bb

