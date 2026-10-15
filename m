Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793BFCC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 01:28:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29961.1792027693875695300
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 18:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l1ki1am9;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8d2574fd9so31282705ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 18:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792027693; x=1792632493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ixUFCsoFjhbqNbMkkUcxqPQKqG+5rUQpnoYBOamqNc=;
        b=l1ki1am9bw4ORi/XcRFaW5ESEd7hSzNuRQMgnBYUoFrMV7n+FSGsCWmA2HfIUvC7aE
         RJt8xAG1DjQOxjdz5bj3Tfn8NWcC4SWlutLC2S2S5bUDiNTFwPj3BqJv0jB7Bh/7GgKd
         pwGSv0FntyOQC/8xFPK4rV4m2aW6zFjntTbG0rdP55jE4f0q9Ixkr5SLJ6Y70L2GDtuG
         d0rpkUJ1R7883Z67oIg3g7u4BLyqOg10Kfb/zCZ0hAaJShZn1K1oX+1ei1cAnTkv07OT
         OiI9pArL4JhZvv3XQHqij/HR7NpKerU1KOx5+u9+yhKvDSL5g2O4iYMv0MGW5FsLqIlt
         /Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027693; x=1792632493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ixUFCsoFjhbqNbMkkUcxqPQKqG+5rUQpnoYBOamqNc=;
        b=mfNzFKAID6OZptSXVlIYXmxcDifA95V4RzGA2yiPjoZtKv1cuVidPPK2JB43n5N9ws
         fo16Sc2NkXc6PRYrVaqJddTHnZGeYtPywXGVnmjPqIEUUgnZZbPwZFJ3nG6ATQ8bYeWH
         W2Qde+Cm7PwfnInZV6qdJa9xBoQWP6kPKWvTlZdqOirsnkDjeH3RDeczS5s6gDKAS/7Y
         8gKAjFXvwYOOBR0K6E2CZ8q7XPCe2amyQnXYQHjBwDKGXAK2bu3JUYqbxabSQWifNj3Y
         j05JQFvUH0qdGvISpy78m+NhPBgU72bnhJKiDdAt0rshW121v4zX+GOClXTZCySNabRO
         DKNA==
X-Gm-Message-State: AFq9FYLiH6Nsd+SFlYKBagyo+QGP3q2k6ym46m9cUdAdsphzi5a00Jr0
	gZjB0TbuiVG63zBH9rGhKHVasXpcVpZZKjMNsgom0nIP7Z+wMX/GtLbQk0wsiw==
X-Gm-Gg: AYBFou1fJDE9C9+8u1NiDPnbwQ7HBg1oNdw5uRZdjy94xwtplDOnoqOXAf/6akOmzIt
	ULwfZs+TBgtO1Ra+NSQy35EzAYO+pZ7Z8b/jXIcS8v0REixeY5Y4B7t92dUd8xWWCfM9vURCTxY
	ssRS7PBSoSbYRfB59s+iNkbM0WmCoSDhlzS5wGyjsldIGkUUZcBvXXe/seKz0ZtlTuHRNyHKn++
	OHxMtRsW9wTpLaau867qQQ4bAoSYB0LmEMJW2Se+HKBGrjFxIGunMRPSs87VwrNDOY4k6aUCZV+
	/scxofA5uH+ttS4zbHD8wvAtdA5rCILc4TIw2C+wneXMI5cuKd7HERlD80/3DC3+OkpBWAkVxak
	biHCIu6uhN5d/mA/SphOkkjTh/6WgFYzIzvjUYIKyc2gLazsLCI6wr1dkCn7Zl7jnUx4+yjLHIK
	UCT5G5ueeWYtbvW8Ux3UKtbCwn/c1EUV2HEwAorTfwRj1qTTPt3SyHXu8zSRj8tiCPKVGPyeWA3
	YsuPbg8qh1MjWt0mMLIohynpB0W3gW/m3uqAbENqg==
X-Received: by 2002:a17:902:f312:b0:2e9:5ed2:c39d with SMTP id d9443c01a7336-2e95ed2d8d8mr2287275ad.36.1792027693250;
        Wed, 14 Oct 2026 18:28:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm74429495ad.0.2026.10.14.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:28:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 6/6] python3-pillow-heif: upgrade 1.8.0 -> 1.8.1
Date: Thu, 15 Oct 2026 14:27:52 +1300
Message-ID: <20261015012752.1650544-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
References: <20261015012752.1650544-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 01:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130906

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/bigcat88/pillow_heif/releases/tag/v1.8.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-pillow-heif_1.8.0.bb => python3-pillow-heif_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_1.8.0.bb => python3-pillow-heif_1.8.1.bb} (84%)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb
similarity index 84%
rename from meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb
index 8dba299cb6..e111a3968c 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.0.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.8.1.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
-SRC_URI[sha256sum] = "e47c27432c6fd3d66c22f0de9f27fd379383b646c947520bc485854ce72060d0"
+SRC_URI[sha256sum] = "521ebffb8a181d56c3904e5a61f20903edee0d9d3275967b8fb345f866215c06"
 
 DEPENDS += "libheif python3-wheel-native"
 

