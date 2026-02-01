Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9974E65275
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:04:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29979.1769954666812688675
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AdlUbI67;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43601e96f72so380408f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769954665; x=1770559465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+mOP0aQOGF34HTkbZwqjiKXvYuBf8eCdlqGZJevD58=;
        b=AdlUbI67Wjm+9btjf1TmYX+Dp/3BjmDQWosk+nZgeY1l/bvkwTQFJwk7DFtTddeY4d
         EeO0e+uje0+XV5rDPGVg4xmRxYDa3Xu3ubjbbdEydB3+176W7BOgwvMVbNQsPvC4T+z1
         2L/qy3Y3VbngJWPq58QwkhlPJSjPWtXfyc8zUyqIAEulpwXwW3OByisme8HHXXL260HY
         fRUfoI+mB6klXsaoOn1k7mj6Ub5jNjdjHaMqwlOMch7hPJxlztQiBJAy49pikhbfvfzL
         AfOncqYb3zywgK4RAmFxQQKZfGrGQqYCUIAh6D82PBBvlz9n9RFcThsdsXpc7T9aUkCs
         eOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769954665; x=1770559465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+mOP0aQOGF34HTkbZwqjiKXvYuBf8eCdlqGZJevD58=;
        b=FCuFSkE8NIkQeApSJm4eJr+qgMRC4fZ0HILRILmISlp/ODiKw5lAcAUBEuWL26d5Zv
         twDJWM5lBVYxFGmj0dG7P/JoQgeuOYCXywzGNt4gPffk+kxbNaO0zEnkPamJ2yE3g1TY
         Re2Fb4IcT9GwsT/e1n5aoT5JBf9xse4LD8+YJyi18fNsNpwlBsKGsW/YxSSIKKj7Ifqg
         jWo7QASSF2TiSWDZf/DUGaAGCMyVMVEuN8gN31Hcnf2buvZIF64R9kEQeTEnLlaJlYN0
         DPIxJdqVBE5s0UHaK13XRS4Z5VSRUqdweh4DddfF/PQ6OohHJ4RW92JKmnZWn+UIZb+x
         RBjw==
X-Gm-Message-State: AOJu0Yxu3XGMpRCfifKN0COYzkmWzahRnxWnAOf5deSZRnUTYYLH05Cp
	JEEUAcaeWcJvCVcoQo4Ab2ZjJyrnuDxwjGSPEMAH9c9Kk8LK5EmAWgYr6lIVJg==
X-Gm-Gg: AZuq6aJgmr6KOs5u95FZsPEXxd2zTqpFxDqlYoEcx2n8vnv4r25WRuiu5luzEzEB+30
	sbcJkZB+L6PNd6lYwPuXEjZMhBCgfYsaTly5FMPGVmCMVHU2RugrXt4Mvb4q5+834YzDKtW4ynP
	y33ekavP8y8u8Tj3g35iD9RMVKsAcYdE0ln0xsZMdnoe13qTwo1adSZ8y+GteHi0lD8StO/1sgQ
	uDecwQb3XPiBfWYlKVu+aLagy7AO6FDM9pZ4gGM3mtrU4G1ubNyJlYlBtNclGH+8Nln6IyY1+MY
	pgzFKCTc0HfHinS6Z2lY+enxARJXNkVSDYHt/4VUhtQpoMAtQ3D+MkOlorzugc9P+poVDabIHj/
	E7DSSSCrCMKfBR47FEtKWkEmXl/QgNS21o0fZwOw5NsoWsgETkhJ9nUVzwmCVQgORV2dyVh23JO
	6z34Agyv9l
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr134780775e9.4.1769954665099;
        Sun, 01 Feb 2026 06:04:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm307984695e9.7.2026.02.01.06.04.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:04:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/5] tigervnc: ignore CVE-2023-6478
Date: Sun,  1 Feb 2026 15:04:20 +0100
Message-ID: <20260201140421.768419-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201140421.768419-1-skandigraun@gmail.com>
References: <20260201140421.768419-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124036

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
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index fc314e8ac1..8ff5e3185b 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -121,3 +121,4 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

