Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C8BCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 07:57:04 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.7177.1758700616587554737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 00:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZn571VD;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-425635acc4dso41707275ab.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 00:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758700615; x=1759305415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tY7VD/2JQlrmgOiLl/D+sK3zVPwk3nfYeMyZlHpvE8=;
        b=kZn571VDReWedglEBMfNd5QzihaniYahbCzj7vi8L6GqkVFirP7pMu6Hcig05AnoNN
         KT0Br8hxErQEMoET+8O04VmjSeU/DTwd5NNjTWwI200/0J1ujPpD4yssnW+qVYJM/hrl
         a7mo68j/t3ylLHJc9RwB3v+8kqX5OZNGmwGYa3AL9AEH4QEXEzwgASvWjAz1KflNyCTR
         mE/Xvl3T9/VxNkUj8mXv75y0vqlHZrqvKWqfaMblRbItFyPzLM5L25Hh8aHV3rl7ITWq
         WV6Sg6osuIUf85ou8Isb5EE1lBiCotkbDVKMccvMnpuJuGcEyuykvp10pWt+opE0S3yv
         RKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758700615; x=1759305415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tY7VD/2JQlrmgOiLl/D+sK3zVPwk3nfYeMyZlHpvE8=;
        b=pWg/5zidyDP9TMbl+oDPl7qGLYBZN4Hq5ZNIJe6E9x87A929+l82a9R9Levo7FVSIU
         /3blHxntbvE5sZI/QdyVqSJthR7AQ+MegWuBEgrQRPS1qr/+xoq7qJ/AAz+SluKcnTft
         OLm6sD6HvCL2vKy9O7P9Nb0qpqjoBcSRuFW0E2qgPxX2nSPtdjO5YxHQxJPG+Ka1vdK/
         dlnCW2IJFGhv4m3miv7e4xDW+MtaeKZuGEJkDEnMjoi4zJ2RqsozJOBNyZb7nrDO4Avx
         x2pVFeBUoCd79ElNwJh+aMMxqRfE3EwbHjSOEG5uMXKk6B0i1Yys32v7/eBSycjz/tfH
         uryw==
X-Gm-Message-State: AOJu0YwNysN5GMt+wGetWH7HXMw7E2EU71JVPTQK6P+CNsnIQP9m286Q
	4zOqTuaW5CgMtAkkBW9fLhhU3aRwzH75F/dD3Jro5ZBtizXQLc0rP0YcQJIUWQ==
X-Gm-Gg: ASbGncs9SAFI2sa7N1r6uLCKKbaiqmUj0EArl/Imxz8FcGty/zb6ggT5aupVXIpU0eu
	V0VZqNQjUBjvhgMcF0yYDfIZstl/nQ71JwHza6sYNVb7PKe6ByG2ifdZTNM51PRcg9VkGA1AH5t
	W3d/OLUtfga6a+iLCH4YvCV6+w/Yys7OJVpiWNL2IwldrKXAvKvJZTesEwZlrPecGIf81qMGYC1
	okKP8YBM6vfs/N8XVGoAgXa2Qnt4YxL4UB+AZ6c7dxJmUOXI0CGVF0eVoCvWoS3wHzzzJO3pOSB
	zE8S7FjiWhyYfaNb0xZNp+5QiR3WRByvpDyU4kSsxklpK92kWitATdgQwB+e90tY2m4U7HSY7ki
	JGMV7aQlsQ2XSmqbyu3N1MAsn4yZoLDFHexfH+OoW1m5QBQJWHrro5V/h0tCmZmI=
X-Google-Smtp-Source: AGHT+IGZJ7sNBGue14VfD+BP8dKluIYPleSilK6HdTkZKcLWvKydgPZuuMMFGXCmIIbS5IGu1ZQu1Q==
X-Received: by 2002:a05:6e02:b2c:b0:425:7e42:c005 with SMTP id e9e14a558f8ab-42581e8eca7mr75681565ab.24.1758700615519;
        Wed, 24 Sep 2025 00:56:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.216.253])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-55dba4465f4sm3203576173.37.2025.09.24.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:56:55 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/6] bolt: upgrade 0.9.6 -> 0.9.10
Date: Wed, 24 Sep 2025 19:56:38 +1200
Message-ID: <20250924075643.2047506-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 07:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119756

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix bolt exits when opening an empty version file
- Fix failure on integration test due to the change of the latest pygobject
- Several CI improvements and fixes.
- Fixed memory leak in boltctl
- The unused codes were removed from daemon
- Fixed a NULL syspath variable causes SIGSEGV
- A new NHI for REMBRANDT.
- CI fixes.
- Don't install an empty DB directory.
- Fixed: Determine the string length before writing file.
- Fixed: Free on error to prevent resource leak.
- Add a 'nopcie' security level since some devices report 'nopcie' when Thunderbolt
  is disabled through BIOS setting.
- Markdown lint styling is used for documents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 98969e3b441183ae8bb0c30258cbe5377c18d979)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
similarity index 92%
rename from meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
rename to meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
index c278a0982a..2e7237bd8b 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
@@ -8,7 +8,7 @@ DEPENDS = "udev polkit dbus"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
-SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
+SRCREV = "c0d4cb2f4399e86417907a37c0d8ef3bb9fb406f"
 
 S = "${WORKDIR}/git"
 

