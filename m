Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15411E7E0D2
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45592.1770637157062453034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eRwINMes;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so2005185e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637155; x=1771241955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MT5NRjeHBxN2fbWKBJMx9Qy1U6c7sQEsoyn5FdtMiQ=;
        b=eRwINMesKdRrRzCY5jAsxn4EroAoWCE0JYt4sS4YBEnNgeNez3W+wXesXGBWKF4Tqc
         ufMDEIf7YT5+h4wg7UjIeH59Qapq58UZx9EQaupI5HaLldYrmJ48/rpzVacymPIL8eHa
         vquCRhpev7IdVVbPPaCiJmmNd4fw+y4FGwLXujcUO1/9JcvaRcnRy9CEOexpK8neZ87t
         ckRubP9JNcrkdqQ6t2E49yBVAjtxERpJbpj7Ko5yNywxOvQ4jnhWPTJSVjtOCCRJDbcG
         x92cPfrAdshWE1Bgeb3CMFaGcoyr2muS06RyFVntgHD20Za8tjMwxJnUs5A+CQOE8LSm
         BNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637155; x=1771241955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MT5NRjeHBxN2fbWKBJMx9Qy1U6c7sQEsoyn5FdtMiQ=;
        b=YaCVo/dfgtEepNYeKWf9qj6uhPPbV7BgDV/LAcJNULdFKIeNRrpv4AW/1CeIKQYpz8
         vNPicDwcgXWT+sO/Ll5rEOvLDnOnBC5Sod6foLkznL7T00fL2ZqmD0dek6xJZM5Y4Lva
         YGLHaWLAIhnnAHQMUSHkdNv9DDBJUxpaETCmX+CCsk/1bD0QRiTxdxfuIxvRpqrMw2KL
         WG6DtIREO2zanXDityln4jkul1DFfh0osXY1uwgmOwJvMEsQ8cwrTblnRSOPzEu0K7Xv
         sY02EANcJKoMY+No/e4Vp5cSrWDOTt/hpX3h3MAeDtrSOtH9IevVPh2Ky7ZsQpqJ48Yq
         NR3Q==
X-Gm-Message-State: AOJu0YwIRb8LXtUUw2yDy4KUK+/m+0Vj2eo73B1vWbhkm4RxR4zma2BN
	fcC1TLO+EiyaJA7KqkMpzat59XtWyw6V1IN/GIqhu1KvVtUJfP9r76flY45KiA==
X-Gm-Gg: AZuq6aI3Lok/sPFWhcO/fBFR9VlkDbKtOApkn8BZsGAuJ3y22Y4q6Dq5/RfHbiLE05w
	9zE5Ge7BitpRJTQnQ+tgmA3J0FB09H66nfQnxrcsl7HYgK0ylmRnYPqFxOZXGEOKqAJdhgn56bn
	NUwlf8L8V/LNJbetvOVuNCkQaZ2FCmq9ZHQmRba50sAAjysmgcbmNKKZDwVnxVdJ1t+XfFcojOI
	JSf4DFySFLXwSsAMiwzNNFR8KOwhMgNg4Y0xIVkIz6gM6ACZ7VDtVqbepHeIpyPbtPQySTFt+vs
	kNhi+M2xm4ebLfooMy1h3aF0FlFBfZr1KEBEG3Br5yYW0o9FTVFZmhXeRp2QJJtRVFwmLSnQFJY
	Ozb1Cn3Cj+0zV3xl87rwQp+MmTgGkUia0DhnhHdhmpu3DuWBR6R6B33hBXdnRzJO2yhoLvsUFXY
	npPxpesiJT
X-Received: by 2002:a05:600c:3b87:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-48320966a0cmr164359105e9.18.1770637155213;
        Mon, 09 Feb 2026 03:39:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/16] tigervnc: ignore CVE-2023-6478
Date: Mon,  9 Feb 2026 12:39:01 +0100
Message-ID: <20260209113904.3442496-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124309

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6478

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/58e83c683950ac9e253ab05dd7a13a8368b70a3c

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62a78f8ba7c8bd229cc82cf81bcc6a6d8116ebca)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 9e4d05186f..4f9b9f7267 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -123,4 +123,4 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 CVE_CHECK_IGNORE += "CVE-2014-8241"
 
 # fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)
-CVE_CHECK_IGNORE += "CVE-2023-6377"
+CVE_CHECK_IGNORE += "CVE-2023-6377 CVE-2023-6478"

