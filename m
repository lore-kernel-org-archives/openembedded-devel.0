Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C8DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:12:39 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.22579.1747915950307330685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Rhmg61Zh;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6023cf146d3so3653724a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 05:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1747915948; x=1748520748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06YSxDkjV/NycMz+8MPLCmxOtEzs0bPkf1PznkXJ62k=;
        b=Rhmg61Zhz+J2/6AMdu1OtxBJsAPz3XdMpRH1ORp5bNs96vgUGUJ9t6U2KAPAOW5vti
         zmAaGJK5WD8oE8uKoQ4Da9xIgPg0z02QNvObGy3a5Ajll/6F0m9Rqx9NQAq3J49Eo7OZ
         kfUqkkqzh8Eg19v+t/UD/P6x56CSEUt+wU1qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915948; x=1748520748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06YSxDkjV/NycMz+8MPLCmxOtEzs0bPkf1PznkXJ62k=;
        b=IRqZ+K3k/eJlzc/4mcGhH2YFQ86G89MsGpMjZuMOSSLohj9WHHbeLT5eJveTiAoMB6
         qPPZ+VtHjgIOnYvn7LphtoPN8l/Pz0BCoGlTLyGZb4EdHIRFedTXmFuWDfDvxRvWhdew
         tvIhmBkZ4Hy47YNk1S91s0C6Q6rj1cWIJ9PdBKLkmGMCWDYHVGvbwnrfWCiysoPkcCcu
         eQHuhnYXSFi1apU24TXh6oqdpwccPY+dmNVO+mW4GOEUnQC6wEr7mn40iDuZUwHh3ZPv
         9K5pVgOEJyyIisXR1bb+lGkoJTxsERDbTdUO6khOFkZv6ElkEu4uKx+jUe86R3M02xwE
         mszg==
X-Gm-Message-State: AOJu0YyAf22SSVG2RLtgcjN9gxzMNcNKhV4/idNk/PquXTPjvwZhb+yZ
	27Q4AnB8uKYqg/7GealZyQXavrqqmJU8zLiVqBYM24BdP12m0YtA8r9gBx3indzdpQONEQO9lV1
	JmPr6
X-Gm-Gg: ASbGncs1QTbPFX9Gud9YfK/dnb5ilfXuneY79azfbuiPg4CtzP3rZrC2W5xpZ1rrFlW
	Z4GLW3XkqWxaIi0lcHWvJ1nGaYOR1Idan5KfgFP1MAA6XQ8PaSvG1UtHpUAT/hejlhbe+jgEWb1
	HQxs6K5l3msnL0cReNmO4370efBSnPVA6YW+nrqCF+Xm4/Uj5y2H5vnwiuX5Kmt5AoR59cdL9x4
	GSxW/6yOdUwYL0WDWTNVWxIzTagwoLeQecp8WwZJEdWF8QXICiwhMWjIPFu0IV94JQhGqJ2CKn0
	WhPiVlDd/nb4bDjZsoTNwwAkfyoJmFVEqEP5JXuN7De/d1adsPC1Zow+ENzpSBW/3w==
X-Google-Smtp-Source: AGHT+IHSZ+r261aUSAfGXv42CipFIiAieOtvQpvOsdYa157Xe94mP0Ge7doSXY5UiJJ4aF2NTMOTNA==
X-Received: by 2002:a17:907:a07:b0:ad4:8ec1:8fcf with SMTP id a640c23a62f3a-ad52d5b9db2mr2499907566b.46.1747915948404;
        Thu, 22 May 2025 05:12:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383a6sm1065476166b.120.2025.05.22.05.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:12:28 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH] python3-pillow-heif: Move to meta-multimedia
Date: Thu, 22 May 2025 15:12:25 +0300
Message-Id: <20250522121225.2349008-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117585

Move from meta-python to meta-multimedia which depends on layer
meta-python. This way the recipe will reside in the layer where
its main dependency libheif is.

This work was sponsored by GOVCERT.LU.

Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-setup.py-support-cross-compiling.patch                   | 0
 .../recipes-devtools/python/python3-pillow-heif_0.22.0.bb         | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-python => meta-multimedia}/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch (100%)
 rename {meta-python => meta-multimedia}/recipes-devtools/python/python3-pillow-heif_0.22.0.bb (100%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch b/meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif/0001-setup.py-support-cross-compiling.patch
diff --git a/meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
-- 
2.39.5


