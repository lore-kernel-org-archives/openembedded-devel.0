Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23420C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:12 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24816.1785872465181602383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=isYiTgtI;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so212462a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872464; x=1786477264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0s93EH7FWgdgKeGyihiQjp/1hFocosWfjpm4M3EJ1A=;
        b=isYiTgtIYJaiNsu3/alm8j3eYRuxaJT33yxmpdtpCm5q4qyI6Ewgv0VtvBc7G7g7H3
         3G6SBiu5N6IrKwCPSoPGRw73fDAD2L3AUHAXq7PIY9tDadwSCDdr+gawKfAaMjdn+cp2
         0tMLzcw243XWDC3DEpKnjkcEEoJG+cbVQQRlLoa6sOM+8QIHuQJqN4bpZYfDIqzCDx9j
         6zi1hg9WN/IeYIO2jrvXmZ/5Xw9p1t3Kh/+31dq/YBSwb0MbkasleWryMWH46lexbQha
         FskVymXpgx+ejp+EM9e54YFZ7iif18o5+a6yRFVEhcUlUK+SJkEzo9zJeiGXJf2N78OE
         4PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872464; x=1786477264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0s93EH7FWgdgKeGyihiQjp/1hFocosWfjpm4M3EJ1A=;
        b=PEfFaPeyWEbXhTJwFbK96FVM6oWc3G7EN4lZQsYrcM3DEuENDtAfqxATwUDWM0+Xvf
         FmdKd/w+rQ2K6ZS8kutOG++rL2FmJqt6x8a0Dgg4r7/CMf8jAf/CsN7lwQXF5X+FLBIW
         EVBwMDLVtsXoXfqkylXG8kdHsfXIzf8p/80tkm67xpLOQCSt8zNlYTlO62t/g6LlJb36
         n/VWe9BYiw3VFuSsyX7eRldcy49J6tsAvXZYsMtmSu66P2vbPYFPtE3f39HBtaf0pPER
         pZTAIMoZSQHImTqqF13ostWvW1kV6xGDAuCcu1OPBwntvFIHipMdUBFXnIATF/DslCSg
         cgfQ==
X-Gm-Message-State: AOJu0Yzk37EPPYkUhYMHHoHVHDmlQFuAIn1n/iu5pFH7GpgymRCHc2/C
	ccgtLAflZdi9sX8dQoZ6pyA8fR6HfH77c5l2X+dTn0WwIQ0SrktJS35l6iG8K6ho
X-Gm-Gg: AR+sD10G0pPEF2EG/fttfR3f4LeWYrMvNG+NuxCRliDKQfe+lCwQrZvvlohDSwwkFsA
	8fAHhRBCGFtuanFgDOLlauaCLp7CxFNmJG9EZTwAKc7bIyPGFG04TdTvUxo/4Xg8twp7HoCCy74
	9ByyhgvInm8udiUp31MTT7idS5FMjHiTJG2QfdqQ2edyNxro/b913sZoelNXsg8mAzG50m6xBbb
	j7Ve86XflgkFKTv8gP4nRVJWptsFmDdeXbGb9Ycq8DpSkHluoypZQ+u/Qto/GLoBjm7HjdvDySZ
	w7uCDrGKwWNx2dRFtiFTvC/+DN81raK80FfT866j2sT1wchqguKnvrDanZlL+q65ydGzcEPWyJ4
	bmnLiao0qCdeya1xTpdkt32lP90PqOCfJSpqabc/FGpSN/mGjWxntFBSawQ4QbtTO8EJ/r+XXRx
	GEYs4Phgk4ABe+t6dmawLl9gJXU8Wp/JrQqAp12261rEuXu6Zv6CeCMJJGne6WUJ9t79eWDB+ZO
	A==
X-Received: by 2002:a17:90b:3bc8:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-3903c54fbe0mr1228871a91.7.1785872464499;
        Tue, 04 Aug 2026 12:41:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-networking][wrynose][PATCH 22/36] usbredir: upgrade 0.14.0 -> 0.15.0
Date: Wed,  5 Aug 2026 07:39:49 +1200
Message-ID: <20260804194003.3158916-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128769

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

Changelog:
- usbredirect: Fix crash with multiple connections
- usbredirect: Fix win32 cross-compile warning
- usbredirtestclient: Fix memory leak

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0f1dbf97aea4b3fcff8779a5a3e1b296ca095d97)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spice/{usbredir_0.14.0.bb => usbredir_0.15.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.14.0.bb => usbredir_0.15.0.bb} (82%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb b/meta-networking/recipes-support/spice/usbredir_0.15.0.bb
similarity index 82%
rename from meta-networking/recipes-support/spice/usbredir_0.14.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.15.0.bb
index 81c7fdf0c8..5ebd6e8917 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.15.0.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1 glib-2.0"
 
-SRCREV = "2d373432e604960c1dcc14fb97098febe4d64025"
+SRCREV = "41c79583a4eecaf6cfe938278554210c718c85d2"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
+SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https;tag=${BP}"
 
 
 inherit meson pkgconfig

