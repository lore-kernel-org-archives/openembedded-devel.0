Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C211E6527D
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:04:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29957.1769954666103809008
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2L5Y+FN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so25794605e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769954664; x=1770559464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6537JpLmD18Km/8aPYmgynncFu9EC3KlIyQcc4FztY=;
        b=P2L5Y+FNpmsIuId0Fjk1QqkzFOBFprwWy8wr/mmJ9pXdSeTGyA2Pvj7VOQLvMSpzUk
         v9EC/6JO/K4O7FWruFD+y9xmEkefK+hOjo78ViyY3soKyOuC14TcyMQhvHZhHWsr9A/s
         DFfW5/R8/qxzm54Lqq6y7jZxoAoR9fH1hBuAuyNoqaOToGEWDE2PyftCjTpFLeE/uw0J
         MdzWK0cYEjpbRNSxLLb7mCBCrk/49DIP2fm80Dd9KVs4HqY3x9yE91Os4QEIwQHfklk2
         UAAf/ygL5gG1MCfv1KU62gK3rQZ1qrN808ZpCjXllGq5OC8arViw+2244DTDv/i4nXgX
         zbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769954664; x=1770559464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6537JpLmD18Km/8aPYmgynncFu9EC3KlIyQcc4FztY=;
        b=LDy0k88sgCMMW4aN1YEDb8DZEhR6QF3Tv0Dvc5ehQb4v/tPxzXs6nuZFF+YUxAcjt0
         RNzvy5m59YTHsTFVK9z/6oY517j59K7uWDiWPKLAH0qKQy9O5KPxG6U2aXRpE8C99vc2
         Go5Y36q21r6MQ2YZC16CVgqI2wqIxx1RShlnbLDKe57ibLU2RRsVNzWNW5NPzO7NlsGH
         HrUzCGArEhWdqd36gyTlYFUlIEPnNEMX7pmsckRooQlafZu+XnJLLWLgb6vjEODFkti9
         Wt/u3p4NVOpZVQKC/KOgBrp+WEqZwgeODOqb/+3053rm4iVlhKSShIZmm7uHM55w9ium
         lfEw==
X-Gm-Message-State: AOJu0YxoOr4K4yLHW0QjJcfzcXCgxRsrbXK4keClFNwolHdbEpx4LxHR
	ixAuXmfpQXXDpwfJgv6D94wUZ6joFkwzL42+Sl+uSYZVyz47TPu0bSBa4WFx0w==
X-Gm-Gg: AZuq6aJqHDddmYWNSP4Quub0F90Y9NbDtPIPAcgxiSyl4aLQ6JB93E7bIymR0t0QtuX
	8bZsUO3wo/cIMXNOUZ8Rz9DEzUuf6AUv9Q+BMomWvf7DsJZvWpP5wn8iGIEL0V9Xwbn7rLhRqgJ
	DqXNSTuFPQiUamTa7Aa1Z0GJWUIPOvmMMhDI2odXLlKUQ0i75gTZSfCk/VqvBj8rtvu0KkLcXEI
	XB2e6pT6gBfXziasOW+bVt7GHX0Qf+OXgJ+sPawfR1KSktQnEoK6e50DCzyg6jJuLdQGZN86odx
	OQeeGeTmhzK9CkVnxC4X5gedOPqui2dqWpdBCI2nd6LriVsoNFet4DVJt925dTLhXZJylYjGbJ6
	RUqGHqL1AP5LDZmuqIl9urA/i+l5aK+JexVglftk7ctKdJ0Q2OmQeRxUX7fHDH6K0XTEb5y5MI6
	dmgDm42G+T
X-Received: by 2002:a05:600c:3f0a:b0:480:4b59:9327 with SMTP id 5b1f17b1804b1-482db44780bmr115791235e9.1.1769954664357;
        Sun, 01 Feb 2026 06:04:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm307984695e9.7.2026.02.01.06.04.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:04:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/5] tigervnc: ignore CVE-2023-6377
Date: Sun,  1 Feb 2026 15:04:19 +0100
Message-ID: <20260201140421.768419-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201140421.768419-1-skandigraun@gmail.com>
References: <20260201140421.768419-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124035

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
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 6631995665..fc314e8ac1 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -120,3 +120,4 @@ FILES:${PN} += " \
 FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"
+CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

