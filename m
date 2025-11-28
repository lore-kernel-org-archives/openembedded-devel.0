Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5731FD116FC
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3260.1764361132556431188
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eVFT0YJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47789cd2083so11813265e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361131; x=1764965931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMq/nFeahgVjCUk0uE7ZD5Pme7SbGmR9rG4PWj8iCxU=;
        b=eVFT0YJ4nmqHvjZHHo5pOhjzeWDzL5BJoR9SwTOBiUfT4yisF8CMNVjFHy6zCq4nIc
         zrPu7CVu3m5jAoDv3oz93f7ZvjSfLLz73e6g0fxYsDsxlGHI9KDicqm3HVGslk6GzMPK
         1xZwypHku6BPZK3+Db1O4Is+ugvJecrp/GACirywIssVMzaqrBrXqvhP4bRr0sC/aPL0
         ME72DxUKNC9ngoebJZC12q9SbC+vwkHDbgiJO1nYiWBb06MsFoWg4blZ40d9RHLV6m10
         tOdOARS7IpyD/sNXy2uBJgeqMjmHmraajKFzVzrJlys4KTGeFGEbgq4OeANAHYvB2oBd
         mKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361131; x=1764965931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GMq/nFeahgVjCUk0uE7ZD5Pme7SbGmR9rG4PWj8iCxU=;
        b=AP2wnxKgumfSJgi97l9+BmzF2mYLKusmePsho1ExdLGL93t8zEH2upG95TL+ft9WY2
         he5dB9eHhmU6AHBVZJzMGMFpU76uq8AxZFNEjCUhDZTaIzmekUXID2NxQPpojXkt3bd9
         f65NpmCQAu3ufg+5coTIFIliEDMCLiIab5pPMmBWb1Mc9ULFyTB8klqVIlEPWsEGrcDY
         YbgZYiWENsPGHGEYsDLiQ04umnfj/MJeH32Ef8PkqtEz1F7yL2M14Mzy3pEVsabkvL5i
         Qa1oJhV9YT8SMMfowv7EhXD79Qw0BeTRKcQWUiNmtuBDk1KPbkRLb0C7sF4D0l3tUeQO
         E0DQ==
X-Gm-Message-State: AOJu0Yz1cT+QKLqccmMH/xFkc7GnZ2je3hVl6Sp7II+Dg4Wo9P3u1eoX
	rd37Gsomovx+htXaKO2+xqyEJwiQnHtHvK1Ev5XKBukBEiNMfFKACWObNM/b3g==
X-Gm-Gg: ASbGnctzyqVgL9Xk7m1vaA/RTkjtT8LT5l7NhN28vf0LVsw9fo1eDllXE6vYLlboh0s
	8/mKtp8Wtx9sOo4WX/Yniy/2Jq2Y9rl1MUNEgm+D1iKK/oq0R9CEkqwovqfLdoiEC3KQjN0HuKj
	eKn8L6yw7wlCtdnTpfg831CxLwZ0ebfoxEaTnQv8wu+318uW6m/0q6Rjk+fXR3W3zbiWRb9Ix01
	WJL4plCzIvo7TqFhgUGNvQLKwzbaMKE5riOCgo5fVG6XWDfIsOqWxnvL3AZFK1kBYBiJ+C40VVz
	sGP+z9cXLSrIdWhBf353LcZaIWamXp/K1Gy3noBQhdj9FfOxvNwFRM3ewwnOr9CQEGU8+LNGupZ
	adrtUpNUVI4ov8mEJO2YNs1bOiivJFD9wwbFEA38r0gJAlo+YoHTUd4mfeTYB7uS+s0uA9U5t02
	jncG1TVe/IFoYmeGYQ9nw=
X-Google-Smtp-Source: AGHT+IGRlG032OxkzP4pFjPg6Nc5GM5wgpQhcJ/0p5LGLH0DV7T6NhHCc6QE06HSyvd6E4jtm3W/7Q==
X-Received: by 2002:a5d:64e9:0:b0:42b:3a1b:f700 with SMTP id ffacd0b85a97d-42cc1cbd1d4mr32791153f8f.20.1764361130872;
        Fri, 28 Nov 2025 12:18:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/14] libraw: ignore CVE-2020-35533
Date: Fri, 28 Nov 2025 21:18:39 +0100
Message-ID: <20251128201845.2578315-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128201845.2578315-1-skandigraun@gmail.com>
References: <20251128201845.2578315-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122140

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-35533

The fix is already included in the currently used revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.20.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
index ee64c33d78..41aac581f1 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
@@ -11,4 +11,9 @@ inherit autotools pkgconfig
 DEPENDS = "jpeg jasper lcms"
 
 # The fixes are already included in the current versin (0.20.2)
-CVE_CHECK_IGNORE += "CVE-2020-35530 CVE-2020-35531 CVE-2020-35532"
+CVE_CHECK_IGNORE += " \
+    CVE-2020-35530 \
+    CVE-2020-35531 \
+    CVE-2020-35532 \
+    CVE-2020-35533 \
+    "

