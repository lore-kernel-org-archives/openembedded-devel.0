Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82E3E65278
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:04:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29958.1769954667506868376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLedq/x6;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee07570deso29929825e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769954666; x=1770559466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/PLITga/HTBNVkjJuWisysJTKRUPwMN2T7DUd2koT4=;
        b=HLedq/x6FGfavkwzbA8Hn0wUiGQ03I7HuSaYjmMyb/uFW3jXjuqgGkw2DDE+UB+xeF
         OY0Z4AvtFdYXEiCY5a9U6ktVCobJusz8Nc24rQRSTDZbSeFo2wDdS7Rijn6bQ5hdt8yR
         TV4XbyStV0zcNwU4vjD+sOdGVi0fr47v5wy0A8AT9zl7Bjf9k2qe7Bl/LLGw7x1Ek87f
         1kfTFh/8gYlT97tJCMa+HE0eUrVKQFUVt1/2/FIp1r/tXO7QJAZp+FBdepSAwRVBjLNC
         GOvzacSUEALmpoG3U7U9sMuFT0IENGH6Xfve4Y2pJHL2aM6cRmBEUMi9JbMvhy19vDW1
         B+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769954666; x=1770559466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/PLITga/HTBNVkjJuWisysJTKRUPwMN2T7DUd2koT4=;
        b=Jl0CyG/Q75l1NbHyGODI8QcHi1Hdn59nYeFxYQfNL/J2tuY2yv7FL49lwdpN9wSlyd
         uA7uPp4+XSJLZ9iZt3FQjmM6mUXYwhVLdNLt4reEm/GYvHBHwC7HE5ZiHdc8yDgbuy2r
         yiZEVGa+4CYR23O2QRjLnALHRnR0MOBBztC7b/gDTsaEjPJ4s+EgYg/+3zWKufFgHiG8
         2wr0ll7KTOlmZGRHNHxojgN6xOtM5DrdxaH6A20Te73EKTCGQdVruWYvn45NmeGHy2dH
         XHn+2jnhukz3ua0+H/5JDdCyYyHzUhTm+3c3xQCZQgqifoJqzOvlEAbb8VYeHvwknsvQ
         Eggw==
X-Gm-Message-State: AOJu0YyU488yXV0CNRyH+erWBnbZqxSE1NBNa/W2plI50ohTax5n5NYY
	7uwMFq8C0UzTYt6++lNUf2UX7UFUiYSPaf3qehwGNROD22sb0rMjLm8lF/qYbw==
X-Gm-Gg: AZuq6aLqd1tdzk7ihHE2+xxNtu1BOWiE3x93ERI0FkAIQD3lKT86o8VQxjYywXcWhlU
	XtZ8I4RIO+LLX1FYORIXWvpDL/IajnjBqGpdPo7QgKq0atuwPqEOGRwTy2ftb2uYEISfuaePIjV
	3ihclMUcR/2ssiRWYl/ypVY+Svhzl93TaHqX8qDAyTysZgaiFNuOc4Ve1ldwUGCK9CR463lCE5C
	lLlRjlA4KyP1TDRYrPIl3JGdJZmA2fYl0h8ZcyR3N1YgaoMJ5/97g0Rf7j9ogO03VLOX0cp9TAd
	XgYMe0NZLWXfWOgyCpOQW0DIVELOSm+toGXPH0E8YXKXncYzAczewM6keAjS9wn8eadRnxtPLSd
	Cr0lFChg6T/mmBhcdi8d65bcHKucweRK0TH/aNOuORFLe3S28d0Xzfd5P9QUNNFAe//rilBIxkU
	x7EcWON+12
X-Received: by 2002:a05:600c:6298:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-482db4bda82mr109523955e9.10.1769954665830;
        Sun, 01 Feb 2026 06:04:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm307984695e9.7.2026.02.01.06.04.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:04:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/5] tigervnc: ignore CVE-2025-26594...26601
Date: Sun,  1 Feb 2026 15:04:21 +0100
Message-ID: <20260201140421.768419-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201140421.768419-1-skandigraun@gmail.com>
References: <20260201140421.768419-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124037

Ignore the following CVEs: CVE-2025-26594, CVE-2025-26595, CVE-2025-26596,
CVE-2025-26597, CVE-2025-26598, CVE-2025-26599, CVE-2025-26600, CVE-2025-26601

Details:
https://nvd.nist.gov/vuln/detail/CVE-2025-26594
https://nvd.nist.gov/vuln/detail/CVE-2025-26595
https://nvd.nist.gov/vuln/detail/CVE-2025-26596
https://nvd.nist.gov/vuln/detail/CVE-2025-26597
https://nvd.nist.gov/vuln/detail/CVE-2025-26598
https://nvd.nist.gov/vuln/detail/CVE-2025-26599
https://nvd.nist.gov/vuln/detail/CVE-2025-26600
https://nvd.nist.gov/vuln/detail/CVE-2025-26601

TigerVNC compiles its own xserver, this is why these CVEs are associated
with it - despite the vulnerabilities being in xserver.

All of these vulnerabilities were fixed by the same PR[1], which has
been part of xserver since version 21.1.16 (the currently used xserver
version in TigerVNC is 21.1.18).

Due to this, ignore these vulnerabilities, and just mark them as patched.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4924e89bb77fe5486063229c50039a458d60f8ea)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 8ff5e3185b..57b1682e95 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -122,3 +122,11 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26594] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26595] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26596] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26597] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26598] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26599] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26600] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2025-26601] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

