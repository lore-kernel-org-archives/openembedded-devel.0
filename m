Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE635CFA74A
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:25:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7378.1763713545743289880
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RMTuvRAV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b566859ecso1561310f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763713544; x=1764318344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U+TE39jdf/aPMonIwipIIAR6MrOJqEFP+nUX1xp+Ak=;
        b=RMTuvRAVsKk0TB2mwAUCWJ9bvJ81RiKQA2Rcp8XUWsEJHPqhmUAhR5WfsMQWeSuigO
         +80C+rRXu9bzIBSYaLwi0eCa/U2KkgakQ9IDWRH73XHfmlLiN9zKXYonHNKeSHtr2YEv
         wMJHrvfrGTWoYwi460A5VaQCxXEfT7D6SxhxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713544; x=1764318344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8U+TE39jdf/aPMonIwipIIAR6MrOJqEFP+nUX1xp+Ak=;
        b=lBnMrIMiL1I5ZrCRKstUjgbWVlZ3PUgxv67NAFg8gu1QhDLV17WADb37C+KpYx7LcI
         fSJ+q5tmGV4u0GFTJyjzEQM4Ap3FY84TmK1K7xsi5cMghydxBkn2ArmKspg3KDuCtZlr
         U7dyOLHyFv+PpwSliARqRIlOEOt9cNXXJbYaO0H7hNtYaBvP9PWJkk4ZZqXo0OC6qJyG
         RsuyDnaBWcXXsSk/SstIYcRWVWqnpLNWQYXEyrFgd3PmN6oVGVrdwZgFAKZVOvKDtFZu
         sc025pplc/grXP0q/yyzpHilwbe5B2sMlG3zaLXQRt0h6MaXjr4MA7seCVujQab30sFP
         vrzQ==
X-Gm-Message-State: AOJu0YwNFx4LlFC0kNMQWiV9ITgt1DRaCuR+ZJnp7Qx4XukzDx36r4S/
	/Lj99e4z/oDpLqEUysn6W8MDkwGh+CPk4GG5SHv0kk1FFjWgRJhJ/rdwAqlvrwj0YhIzJvhWfm+
	f2qxm
X-Gm-Gg: ASbGnctkSm8w/Jy5p19V5Pt7W6A73uAgtjThr31Zc1un0ve8ye+ii0LpRM/EHlUiw9s
	7+K5BrXnAo9blYN9e6QcOce/SYvd3/TEFuLPrqJHayGdG/Xw3eGCBaf2nBVK3eJgfOyz/1jhoCu
	dS7lEVC+ZvetFeVrArBrY16nCeDrbZSGNz7r7iwqJw6LIEZub7HM+DI/vH5DfMs0hyTwFojlfV4
	u6X9fkWlHk8KEKOlasO9+E/242zjfnM3aE01BM6rXezqLMw3iJJ5Wc+L/aCGsp+8KpqOvHlho6x
	zV8CYS6gdaXXdgbUb3MqK0rIC/+owj9MPzaHFmND5KszKoZpYsjW3oCBBHdtv/JhrDzMD1khUBV
	RPTK6wQRUH3I72t3VZ3VTLXyMMhaL5nIntmCO2jnNtngHrEoTeCxAD/8TRCTL0b+B8W/qnKkDjP
	HG+TMKgshDq+1yG/KZ6SAZ16qu
X-Google-Smtp-Source: AGHT+IGZlrhTg7CAQww2lCOsZTWYIG7UIduDnSA5as3aDPRuOq7d8055Wge3vuvJwD5H6CGcM58TFg==
X-Received: by 2002:a05:6000:22c7:b0:42b:3ad7:fdd3 with SMTP id ffacd0b85a97d-42cc1cbc075mr1319922f8f.18.1763713543749;
        Fri, 21 Nov 2025 00:25:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363b0sm9817641f8f.13.2025.11.21.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:25:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH 2/2] libheif: Upgrade 1.19.8 -> 1.20.2
Date: Fri, 21 Nov 2025 10:25:39 +0200
Message-ID: <20251121082539.2929084-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251121082539.2929084-1-leon.anavi@konsulko.com>
References: <20251121082539.2929084-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 08:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121959

Upgrade to release 1.20.2:

- When opening tiled images, do not check against maximum image size
  immediately to allow for tile-based decoding of very large images.
- Several smaller fixes in writing image sequences
- CMake option to disable building of heif-view, which pulls in
  dependency on SDL
- Fixes reading/writing of GIMI content IDs
- Some build fixes

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libheif/{libheif_1.19.8.bb => libheif_1.20.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.19.8.bb => libheif_1.20.2.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
index a3f5f21406..b268b37d8e 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.20.2.bb
@@ -6,9 +6,9 @@ LICENSE_FLAGS = "commercial"
 
 COMPATIBLE_MACHINE:powerpc64le = "null"
 
-SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=v1.20.x-releases"
 
-SRCREV = "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
+SRCREV = "35dad50a9145332a7bfdf1ff6aef6801fb613d68"
 
 inherit cmake pkgconfig
 
-- 
2.47.3


