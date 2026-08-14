Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7E4C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24385.1786747605760375446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AZ3QQOGU;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d02b4c3601so18660665ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747605; x=1787352405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sG50AMx+FTMvooKIoVmfJ+VVG1jI+jLIDIP/0FJ2qY=;
        b=AZ3QQOGUjdzxLIAtdN4bxw91Cqx/3aDMfR3YcdZxZomjo6BNIy32bfKX6L2Tl/hAUK
         st0VfWn5KgilET4tKbNb283nGjVKXJGEGTG9meMoDmJECdyd8Mk6JCwIxr83XRCkhEeV
         nL57cWtfAJPdTfQATJ/GKdGSt7OC1lRRbarVgwLFKg2RHA8qXK3cMliCRVMO+rplrs+R
         YunPdW3asIGfyqKt/uWxLuXUcgUxktO1+zn7N4Nmp34ZA1wIk2IgUYAS6q9Ym7AJfxxV
         V0Ul670BTRSZJ7hSQFxZtmio1ke985+6pcKbnPfkmWWCcqgQc0hKptC4DltwS1eHdGqw
         ko5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747605; x=1787352405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sG50AMx+FTMvooKIoVmfJ+VVG1jI+jLIDIP/0FJ2qY=;
        b=Q0DSS6Rm4iv8uiRNKc9ighbWGT4QyFTyERCXJ37etnpz8w8eKbzBxlNQ/gZ8AYtQNt
         TcQLSBD/7eYzHCh9SVYr8tru/x50KOAPgph0j4Az2TTc5ay3hQU4yOtLJv6M3+0Sp3WM
         2rbn0SpzfJ5qKvBcLVneFDG7XmYC9wS8T2tEzvZpm0kCk3C/m4Z2gH15CowQtVM+uQEZ
         nSjJCn25PsjUa1gaCMlFXqcqiRP/4QgijpHC0lFNpVZA+31vUgTN92fPvNpeYp00arVE
         tZ/DI9JoV/mLkcDtp4e48zU9I2vgdluyLXTHpJ+TQmrymjH/I2uA4inkHjYQoK5yFHbP
         oS1Q==
X-Gm-Message-State: AOJu0YwrPTaZD1IP2jnNkGBFLKCKAyVHLVb1HHbgo3WpaTqs/zdumhN8
	7ckpSA9AQ4VCLRaOJ94a9yklAtbNyE4uLCyFF5EDyGLr4Q9s7NHVYusDimpVDA==
X-Gm-Gg: AR+sD11bHp37hWiMGOMtJ9xuxPxym6hG1T1Pw7tl+LHZEZSMXnJa2PEUsfsfbBnQrBA
	67hU89PcLoopvXEI4XGPbC/r6HUSZTAkFtuqSytVeQ5Q6LV9tv6e8sRbADdCj/+N6BLetfCPQxI
	X6OqrRhcECN8RT/rVE/lL9OSYq/PbpAV7LAJ79mKwpEakdQk9lcf75ePxgHCM9CE/bFQBbE6Y7A
	gr6dy7ApvHpAicPK2bZFEbAjrsZMOIDH4+bQa4nVjJLc5WSg7mTGlLtSSgSbwnokYIqBBSNZ6GY
	bVjxha489XqWlpQKepw9ZL2+dgopVmyts7u3M5DocyjZdlnuW1DqH+Es8DJb+08g2LmvuIWwvCL
	vUN0u2x0+lPfAhj06samAH+iWNBrysPZ2snR3Zn9CkourHpJzltVhTAxHcCHsfWd8/O2m8BR9t0
	bEseuwrx9PxOiSmuSJFmY/YunU/aUe4JKr0wZtVWcQdVQBThw/yCaIWv/EtXRckDtuYWcR+Y+b5
	6002FgeHphaIWY/gMJs/rZmpaHraAyqtm1x4pm/++rFaEgbKO8GgR9wKpOwD0X+Znqck647g2s4
	QO/fiHTcx40UxmfH+wg1gbv27Ovcr7qQ3gMH1EfGySjITXECGYc6fh+6uPfgm9fIz1FYJ0GTDiQ
	90WGHzTsU0jgi4M2RNYCi3QVukLmsSA25Mmec05GZyiL03Q==
X-Received: by 2002:a05:6a20:7343:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3cc71cc65camr10150781637.22.1786747605082;
        Fri, 14 Aug 2026 15:46:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 056/109] python3-psycopg: upgrade 3.3.3 -> 3.3.4
Date: Fri, 14 Aug 2026 15:44:42 -0700
Message-ID: <20260814224539.1523174-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129120

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-psycopg_3.3.3.bb => python3-psycopg_3.3.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.3.bb => python3-psycopg_3.3.4.bb} (86%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
similarity index 86%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
index 7b8bdba690..063219b260 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "5e9a47458b3c1583326513b2556a2a9473a1001a56c9efe9e587245b43148dd9"
+SRC_URI[sha256sum] = "e21207764952cff81b6b8bdacad9a3939f2793367fdac2987b3aac36a651b5bc"
 
 inherit pypi python_setuptools_build_meta
 

