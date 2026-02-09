Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CDDE7E0D3
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45792.1770637156032523230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cieHUYN9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so11408425e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637154; x=1771241954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KniZGCwMCBhyjWz7aYWTEPQ2NHfOebtBjtmslglI9k=;
        b=cieHUYN9+TOLpL/cfuuaC8mVvEP6Kh9zmdUE5EUBfTEbOwf3V29nRvF3oN8X1sJtrS
         P7cgGCfqswMz5zsFMWutKef0kK4OmjhP18mIwGXJYewU4YsYYRcX2J2PSXTObTNf3whX
         Y4aRkSiVWBZBQIMeriGo0u1KBMm/ot010J94YXNgB04YidqoQlcOCHbb6+59Y4NiwDVV
         D6IjZb/cd6Cb0FOuEOZpTjPOgkQCcD0LwYueNO2Paqk6+Ret6fempIHFXUMjTdpfH/Hd
         bb5545g5PiwI8WEQBXbDuqt8iviqwZj+llvb5ZQ0ogSDPbON80zt8usRhu++4gE7PVhG
         yayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637154; x=1771241954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KniZGCwMCBhyjWz7aYWTEPQ2NHfOebtBjtmslglI9k=;
        b=GN1XuUkDuMuLjL0OWA6nIKXPFJd6eB2omyyDUpXVj2uU8FdICmUWEaxr3aVmTnw1ig
         e73u/e+83I/IpgYUM22hARiyjhf+n+VuX/K4jRIxH/jRFi+pyMKy2+lzRMV0KjE/CBxZ
         ttDwbRtOyjFBLZTGRqAa00uN3roUUo5oC3oU1zfa42ZbHwBqFGijEM4am3e/8NeYDxE9
         dZCphAsBxcc9/sCj7aw2CH+zcKtQ+Xzy336Qq0GdZ72oeMGdfe0j09hZtxulvZO8Ntb9
         EPTqzeRfClXN9ELZaFx7JtGftMx8/2Cg/b8JXxeklzFgKRIsFcysepqjvivW8xDZJ+ex
         t0Xg==
X-Gm-Message-State: AOJu0YxiuACa7Csa54PfhittQYfUxDEbQ0WaqFAnBbz4F8rw4zRO/dWi
	yMHRBjDHwn/QugtjC/FERDEaaiJJCKYezXJdr/X5TLF7wON5LX2iB3Ydmi+G/w==
X-Gm-Gg: AZuq6aJSbVpXOTe7gPJkONhpz9r8jT26HtC/nMzBXckyMN12h9FPtBEc/qtHQzaOMMe
	l+vdUsRlouZhR60wTPD89jFtxpWNvPuKoyNyGgELD4CdGt55U+265lMGc3CjlqBkjwlnXzcHgxN
	bAQSufqLBgzS3GXzvmdxHENDvmZBAKiZMhcL/qHMk0ygqw269R82PHdFn1QbMmegQIGmhutMhs9
	rOfjvFySJlrT/JzBCpggHZTnrqvfETXBoDegrAtHtIlhOSWhRiD71zWL7ZM2rw0Lr0orTOwJyI5
	1B/f7IwnaWKWDOpRe2b8bGUoAfekKB5K7bU01b9dtiOXodnst+A9Rz64MY3P/j0imcWga3E3wZb
	/+Wi6YDNOICKAaI5+rNqM0rDj4h61IarAOJl3zenTNnKoDzvqp96DpLrvpx/tyZr84Nhd72E35H
	aJIS0HGJTJEQ7GBLw0O+ZB
X-Received: by 2002:a05:600c:5307:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-4832096671dmr167229855e9.21.1770637154207;
        Mon, 09 Feb 2026 03:39:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 13/16] tigervnc: ignore CVE-2023-6377
Date: Mon,  9 Feb 2026 12:39:00 +0100
Message-ID: <20260209113904.3442496-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124308

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6377

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0c1a93d319558fe3ab2d94f51d174b4f93810afd
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/a7bda3080d2b44eae668cdcec7a93095385b9652

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f691f2178b15eec22f09a1c17b9945fad4e330e6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index f995c1ef08..9e4d05186f 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -121,3 +121,6 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 
 # fixed-version: The vulnerable code is not present in the used version (1.11.0)
 CVE_CHECK_IGNORE += "CVE-2014-8241"
+
+# fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)
+CVE_CHECK_IGNORE += "CVE-2023-6377"

