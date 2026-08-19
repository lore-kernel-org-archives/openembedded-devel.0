Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4217C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:36:50 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.825.1787117806118731940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=keanZ+TI;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1047427a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117805; x=1787722605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JQB++K0qJzcAqT41TbAnLWet5PaEgN2TgpJd6D3AUg=;
        b=keanZ+TI+7aaDp9ejFIIukEtn2vCW4kD3M/ejBq3wriKsLCB+a74c/1vPvL0sdjJ1z
         c4r+sP3I9fZe9MuG2K2tFgzQSbtSdnhRsijReRrWxzT3wea+LZjmR3+IwJBfgvW0PflH
         jk+2dv1m4+CN4mzzwGiZbB0Hz5MpvNyb140M/M5zJA/fzUNdkNlHrvHIvpvH53+bKP8m
         pyJgcQDSCf/nHRgwHsTqVgoZTklgkQkuz6dB54qhRTfDkiERULWDakg4IXrnR5n7qz0K
         K/UbInM8aqIL0d44wcO1se3glte0sx1Cw2Hc7WPpJZGc+v9CuGlN781T+WdiZDCr6vex
         mbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117805; x=1787722605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JQB++K0qJzcAqT41TbAnLWet5PaEgN2TgpJd6D3AUg=;
        b=dyXD3Fr+z8sfkexrFMyPOMYSd0dfvXgYEBKN3eL7WQIjrBpAzEmJDCxlLKgtj2xIAS
         s66rICFrsuVD1WKxMJJjWrebL6/eXWn/7RN+M2VagN6kcp7st/C2s37D+104//iunH37
         +3SwG4fws0a/LnAumFRSJNV1nDK8BJodG428/68WXvZ2qs/pNNbOvo7LyQ6URM8/IhlW
         GB+E9Fov0z5+EUL7kMJaj7FMI7fhEiIMuokVWPWQrIdhPS/gZJYsF1tbCxBl/1V+89Ss
         qkWksOqCQj9LOk8M8jg4ngEyks8G+3NhdRcPDzCXKGEe2KYrhKKMsny+rcEziz8OtcBj
         h/7g==
X-Gm-Message-State: AOJu0Ywlh4z9gWIcsOnLN+8yv9Qhbb53nMDhHmK2uigRvUYB3fsBTDU4
	hrTUK8e29kMQfQAycSw5ZGjcZbgfc7EyW448+pgdC4ytvxq32MEqHOXznJvg+B58
X-Gm-Gg: AR+sD12gvMrFKU4UAFNgJrmLHtchgurtQ6whoO7cCc3F/F41bb/LMQdDDVS16ZvR0d0
	ngnaIoUp/0iY9im6mPpDhvukGn1xTra+QZXImUVg1awXWM8Hw1A7tM/dcOfRO0qpbZSLIkZstFy
	2m727RRhszRg5NgSgpELk7DoHT/q0YoerLy3GcDWMmYnQk016SD6euOwRtvdASEOAeP8CyOy0gK
	j2mpF3W+8KZA4sfNQboEeji8XQkWe1VgG8pWZEdHyZcEcMPoX2SUc9HM/XemhqsJUItWsseZNeu
	LtW7bOly0+e10oeq34EGSrohG8P2Bl6mhGqu8cZT7sIfmMiCXWD1qouS7BmKqo/OvYD9Wm+3sYX
	rePvj1kuXFBTDeGcWK9fxJVOeVT5LXd8CMEunNtdLzBB5PIUwr9rL0SeS2wB1HUsPAxIq0jSteC
	4Iawx88DRPMSWTXDfiPRQKUm+jN/ZZX7/v1uzF8vqTs/n4vyhSg8gHNA5xBTGrdvwP241MnqJ0+
	WiV8OKalS7j5A==
X-Received: by 2002:a17:90a:fc4e:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-39581116e4cmr4089814a91.17.1787117805480;
        Tue, 18 Aug 2026 22:36:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 4/25] vnstat: add UPSTREAM_CHECK variables
Date: Wed, 19 Aug 2026 17:36:08 +1200
Message-ID: <20260819053629.391864-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129248

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version
...
INFO: Current version: 2.13
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/vnstat/vnstat_2.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.13.bb b/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
index 6f67777972..6c324ddca7 100644
--- a/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.13.bb
@@ -8,6 +8,9 @@ DEPENDS = "gd sqlite3"
 SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "c9fe19312d1ec3ddfbc4672aa951cf9e61ca98dc14cad3d3565f7d9803a6b187"
 
+UPSTREAM_CHECK_URI = "https://github.com/vergoh/vnstat/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools pkgconfig systemd
 
 EXTRA_OECONF = "--disable-extra-paths"

