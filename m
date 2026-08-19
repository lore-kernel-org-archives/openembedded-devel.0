Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DEDC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:36:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.821.1787117800923383638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q6czMH3v;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caea3f742bso9088215ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117800; x=1787722600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHIAuCdFT5v67xU+45+H+cLK/6c9lehsQMs4B0crZPg=;
        b=q6czMH3v1wwthgk5bm2DJ4OXQ+VuzuXbLR8BNtgLZONhJIW+deu1XFCjjRiWS4E8WO
         XL0y5z947WKekxn6VuO1j/rKj5PvlHFiq9ELwDWhB8s6nuKqCW4KZEN9hL6y6bozpzIE
         Zv2WmdX/NTpO+b4+J51rPIxZSYqf7f0kVTCx1/XkZP0AH4e8cECwDoNRnZvkvdNpoJea
         8CHgP8CZa4Avu1hElRja34zSsJB8ShX8GgcbAk4bJLrBXcVCEZcNucTJ6kAiWcVZfKD6
         wIkfdKJTfLP4dRSB6pK7KzuOLlxdTooEW+Y2izjh+ddpdF6UHRx58DOrI4CXJKWEIl13
         RB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117800; x=1787722600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHIAuCdFT5v67xU+45+H+cLK/6c9lehsQMs4B0crZPg=;
        b=lwou7fexFwfuYhIhSzEpDIRcGpqQj3wsVvRTwiZOz2Dsyhiqt6AxsQnvTUZN6pjtJk
         Ueu5IwXBXy6k/1HTWE5sRCns2yr9zy0xRXQN43Fa5NmaOAGnxhIf7//TnoSJlYncX44e
         Zf3UQ+OdQe15fItluQHYia5BFDtd2wdTqJjbkA4Py9Vnyw1gRnvwy1sE+tiPjOjwQv96
         PC0w9BW7YLFHlNUUzeXaDt8Je7ThVlxBoWIWxsY3iKFL5MhgBlWXcZ/Kuale/YYuaSiC
         Gca10Fzsf/puBTbY3ooq33siDD8MmS6/K+LcQu3f3kfcMm53soB+s+y2WaI64GvggGul
         D+zA==
X-Gm-Message-State: AOJu0YzQaJ17UxaGrfBeg8PI8rPx8kR1ub0ETvbhtw7l5FOu4dMShD9F
	VZ5y7OS3opXv02+yldBQIxphq6b01Drzz6ziqDqYTbOGNoEWj3Yo96AvV5q0u+PZ
X-Gm-Gg: AR+sD13riS9tWOw9dLDfwLd6p9BOWJ+TQyp8yViMZF+NffEIkl4FJg+KWGpzF8VhgYt
	8RnKWbHzsH/ps4Cxtr1bj+LdlDIu4onmfAXly4jWWBEEbHToNiGP0tY2MXUdAlB6nxF7GFtXlVn
	RlIBwQ+0OG11dP93cYs4qhBzUhH+NTor+YAOagXn8NUTu0V70s/rHWbecYx3ONk3gefmNvTvqcW
	YWhHH/1Nwq8Xtpdd+/bl0Uss87FapGNL+EU+rDQt8R/8o1ziFwFAve+kRv++IRNDjmKkoAXwFDp
	YY8jP83FbWjujoI6Eq9UJ5gTFjjsdI4EhAPaqYhpBrU6e/UadSKyOLmPGg3J6YiPOlTSd9hMKDm
	CdpniFlKwn9Y8/fo33qFekHGfPYgxisBfIwpKt5rwuBN0kzJyVt9PpigikOIWDfIIQE/wtL5orw
	wJuTnKFEgd+U8qbuL6LCg9/RGM5pAjJCvRIJvTkLw/+QAnHRKcAXlZxIatrTsuJSLs1V3VY3Pvl
	g==
X-Received: by 2002:a17:90b:1cc8:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39580a5052fmr4490442a91.4.1787117800143;
        Tue, 18 Aug 2026 22:36:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:36:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 2/25] macchanger: add UPSTREAM_CHECK variables
Date: Wed, 19 Aug 2026 17:36:06 +1200
Message-ID: <20260819053629.391864-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129246

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version macchanger
...
INFO: Current version: 1.7.0
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
index f965c0db1b..1d57cc1402 100644
--- a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-$
 SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
 SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
 
+UPSTREAM_CHECK_URI = "https://github.com/alobbs/macchanger/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 FILES:${PN} = " \
     ${bindir}/${BPN} \
     ${datadir}/${BPN}/wireless.list \

