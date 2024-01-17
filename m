Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C8DC47DBA
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.1295.1705454006081128700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xr7ETBjv;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ff5c00e3b4so9624497b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454005; x=1706058805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpH49eBxwbMWr6GHVfKDoRF9Lnhmvefnv870nYDwqz4=;
        b=Xr7ETBjvDp0VchUEZBw6hQH/QfSqx2Fcx/6Jl65f1857Av5BKhsKl2SD9Z6zCxUIsp
         uQTbBcwwfbGzEOhvOre3YGHASIWPG4W2F8Pcfl+As9D12N84D3QLfensCReRom8ZIXGo
         VdSuWR998OGugwwwnRSyLHeqsMCRsPtokoBBGlb4ncJyQDYpZ6HHEL2DhQitVNS83NXm
         9XhwGZswEFqB90nHdtSjdrAcFYawoppj/y1erT6AtMe8fgRHsKiQvzkcE2+QBWep2h3L
         zbvFp2bgsTLhfI6awf35JWfILiIkAAP+/yWYIFdhgu5gl6SckHUPuRLAitTiM5/8MPWk
         0oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454005; x=1706058805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpH49eBxwbMWr6GHVfKDoRF9Lnhmvefnv870nYDwqz4=;
        b=iw6PzbK8qLmHSi2pj29A7IDf4KMQhhAYHgtrC1P8AQca6Z31lWcAULv8cx9K7JZz78
         8rCY0Vb2l6mmV3MOGzlyrtUaretOW386djk7K85EUkVHMV6vrqS8arr/IAqfBarnQ7pd
         9Wg1ugE33K9GF9rEazCm5/hSgemKB95fkHWg+rkGgKfSXgW1a/NkVH3HzdaVzDeV6VMu
         xyHBDwqlPobXO40y4iCBc0Srch5x7rX6w/67SlwhZhfoaUDoqH/obmleaNETjYAOrFJ/
         ItAgvJO/M54PgWCbqfk9sNaNQ70rcOZI+PvpQkQO5MKEU0xJR89aoB69mq2QQpAgfMBf
         zbfw==
X-Gm-Message-State: AOJu0YzUOP/5OK5tNhVjKzQszpow2+HSCI8bJ0bQbJ1Y8XBpAnZgetCl
	aBVXb6fH4RgXPHtJSEyIk5kI7DfMxl9YHQ==
X-Google-Smtp-Source: AGHT+IHEpIhKC6zLCSESGNnijhBBIxL7va6tLjvMBdHUispC+6ZXTxoQZ4dg4SX+D+8hTjr5QcQzHg==
X-Received: by 2002:a0d:df0f:0:b0:5ff:49ab:f15f with SMTP id i15-20020a0ddf0f000000b005ff49abf15fmr1954982ywe.32.1705454004862;
        Tue, 16 Jan 2024 17:13:24 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 06/11] webkitgtk3: upgrade 2.42.2 -> 2.42.3
Date: Tue, 16 Jan 2024 20:13:15 -0500
Message-Id: <20240117011320.1856392-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108316

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 - Fix flickering while playing videos with DMA-BUF sink.
 - Fix color picker being triggered in the inspector when typing "tan".
 - Do not special case the "sans" font family name.
 - Fix build failure with libxml2 version 2.12.0 due to an API change.
 - Fix several crashes and rendering issues.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a474db2702c59702c414f4c8ed4487251f10df6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webkitgtk/{webkitgtk3_2.42.2.bb => webkitgtk3_2.42.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.42.2.bb => webkitgtk3_2.42.3.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
index ac75afb90e..6149a7ac49 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.2.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://no-musttail-arm.patch \
            "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
+SRC_URI[sha256sum] = "0a1a4630045628b3a6fe95da72dc47852cff20d66be1ac6fd0d669c88c13d8e2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


