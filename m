Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68086CFD2E8
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15742.1763839892208465691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtU7wa8j;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso33135015e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839890; x=1764444690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QLhayZpDRtMXhd/WMu0p1dIGfWBjBGAou6JQvyGvoc=;
        b=LtU7wa8jx38JDJGo1KBMqOAgDGano4wwni9NVfMLySeBx7774NLM2hxjCnXmo9Ox0c
         CBKohdgfArNOgvsiHPfFc5yVytSnJMVSYC8W2B6djnBBDLTb2DM4JsqhWwmhSaW7cjXB
         iyBgNvoARfgdOPjpKKq4u9TI3mJBZahU+5WcrCURL9yl/QH27f0FXZbtRK2Fnpprk/gS
         2N813q6ahl1wsulQTlPYH85tt3vhaFx3UXVPPcAQXiuyNXGIdRdDbr8Buoi7H+eRIOk+
         qEOnPbQVqqd4YRU3o/C+/NyypboI4HC8+FTTmQMcKAg2PREW5JV7bX6TPe8AheuZrcHO
         KaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839890; x=1764444690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6QLhayZpDRtMXhd/WMu0p1dIGfWBjBGAou6JQvyGvoc=;
        b=hXMh4wp29pWTYcUF5ydUh6zrqRSmueirfgGGi1pPDjQMG2hIvITvyGkMugWrVwy0sq
         F8jY4OhI4nHtGHQj2VW7/K2T3q4QfJT2nJ2w04DFJm+vyhit8eulzybqqQkKxptIjeQD
         f7TbMlNgLJj7WCZ5+OD3Z6FbUXo+GJv5i0u3gEizI9DsEgoW+vwq/LlesUJ+uHRZsgR0
         BClRNGpAePSynQUeetqbwZ/Z1OvO4SL6IT8z/6sNWj00DkYDDK3v5JaPLLwJCuB656z5
         /Xhv63+uAYiM33qEU0a8KutwC9wOdIl6wyWPcoqn7OeUvrZfkWWsJmzn/zQYiyeKsYGW
         k14A==
X-Gm-Message-State: AOJu0YzYTaSm0vD3dECxAonigA59LybPwY8ibZ95QFn8uuBDT7RysXUS
	mVGk5jdAtVMGDOOAl5h3wISw2CAL41MaVbAK35703ojnH3SW0xNj7YVFe2ObAHL/
X-Gm-Gg: ASbGnctBgMdgIn/veXXETQ3ygLBJWs8MvbbEWzuBRp11yzD61XyTDgfK2rOhDQGJf4N
	+cjO2N7/2vlSIHgekaDRhCYlGEFD0MKiz5zyKKyQ+erOkoEk3g3v6Kr/m63OgdWwGNCALHsvz2t
	2imQVc9A6vjzDYsHaggHG0U2ghXHxeiLbwecgz7vdONqYEgoq0KMTVlugDUfw1EBZ7ha3PtkP06
	hMLOZ/xmtYAn/8EQOyjeZ2WOMOAsZWtn0GtdbMusyN0BSOoI2nNctpNORMZn1L79IB14g6q08Tf
	1jNbo3wIdoK/8cgByyljESwg3587Ub76Q37r28jmD5SLiPk0wCcGEvgoYxwdSKfXsa8rAn/9K8k
	MceKiJYsg5uT4QxRnIcnstPBDXDMKIkYgR0brooXczif/AT9wx9E2q4LlWT/ZkcXMWLuGwGz7mp
	kmI3muf3il
X-Google-Smtp-Source: AGHT+IEYhGhDkfPuRZOK/oRgveweWakMOHDRP37JllrT0PxTT8GV2rXwVqEmODhJKFEeY20Q/oL6ng==
X-Received: by 2002:a05:600c:3ba1:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-477c11160cdmr60593325e9.22.1763839890236;
        Sat, 22 Nov 2025 11:31:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 02/10] monkey: ignore CVE-2013-1771
Date: Sat, 22 Nov 2025 20:31:20 +0100
Message-ID: <20251122193128.1703871-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121980

From: Peter Marko <peter.marko@siemens.com>

This is gentoo specific CVE.
NVD tracks this as version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 36a7e409d8dcee804f911174291a0c72b8037934)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 7b605158e0..786e270baa 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -88,3 +88,5 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
 
 # cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0
 CVE_CHECK_IGNORE += "CVE-2013-2183"
+# not-applicable-platform: this is gentoo specific CVE
+CVE_CHECK_IGNORE += "CVE-2013-1771"

