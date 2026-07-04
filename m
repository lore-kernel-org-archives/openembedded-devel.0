Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BB9C43602
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 13:14:12 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.113485.1783170847043305318
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2026 06:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mjR1DXeO;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c1805b8a7so17132611cf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783170846; x=1783775646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MjtxTr1XiTDgh7Hqum0hvpM1K09dRZtSJmI3LQKM2ko=;
        b=mjR1DXeOpsZWhJRKqHjKZbuUvtAbA+ft746kSBYfpvW8LZkcFYA0mhB2Dk5J+XL8yN
         q/Tw3aykLDYuKVSq9zMU7PQRS8yAhXIEopTc3ZZiQ1Tr+M4lwmYIuAtlYlkAos9xl49L
         wWNnz+rCnbr50eDrl6XZlAJsygNxKMWfo8Gon8sKfsiZf8mV4ubSI0zcUEg5qwaUycDe
         UjqM+Bq4DRPDEMqWP0vMPhytZtLiVAy2mvRLvTUPr0+ajSHdN+7/n9iJI93Ur3Q4aIio
         81MikD6iYtsZ+UDbb8vMbhnJXpkZgAYM8uTuF+xPOFiol0tWNyMPoyz0zQzUzB9u/wTN
         Xh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783170846; x=1783775646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjtxTr1XiTDgh7Hqum0hvpM1K09dRZtSJmI3LQKM2ko=;
        b=dQpAFHPcAX1EANCPoDX6Y8X0tIWAqkp6q+Nq04l51uOp927KjFbLRD7BlgNWtaC/Vt
         P/ljCX1yEIsdicnWIwtLEAA6Bqbd7FUPVcq2Zv91HNrNcSGaWtQQpmK1G84A822ALNvO
         d1WrJBVgJWtVERHGrV/uMRox4UFgjZpWJG6RWfdNvew4bS08tQQc0WdEGpuH/giuUSa3
         z2IsdDaJAukiyPpFIfHLrH5RttbJvnjbQKkx/r/zv3oIrsVGQXB77H125cOX6w5CN5EV
         dJi/JjDnJrAE0ZoQHwPdaH8ocRpHlaBB9JV8WB3b6E85awj9lpFakHkKsVtzu6Oa+dpN
         3oAQ==
X-Gm-Message-State: AOJu0YxwqKgCEUVcxXoRxurdX4RgrnGID9Fir60ewNBw8l88ll4KpEkF
	Lsv2z0FxMnHthVyDkwsTJdGMSZN5/biGzBoN68obNtf/oIeNT1lo0HepJMjP9Q==
X-Gm-Gg: AfdE7cl7hme4H+Jm41VjPz7CDr09Eh0tMCKrIKv+iaDv2aj7Z0VjfklcrotPwY3c05B
	3xmIWXNSv/MtVgUKNbi28kT4hV+JFCc2u+MGTFSy7fKN+KKMZ6OgEl4WqKs2UYJRY//k9UAYior
	68U1GDidy9CHwjTVIR3i5IgQBXAz6wze9U4nwHqqHK/YiiDCvaykQXmIxE9Tue/9UrLrho/q6TT
	66oeqdSDjwu0jNGiZAiyUBkZ5MAnXJALelXMzVX2AS6tkwu9VgqawboBKxKrr/UKvL9Ljed2xI4
	yZmbJGTbnYTPWODXuGOPxAfOi3flpOgANKO19g8BfD+5dMp9oJb2RDHJqiDSBBr6JV9Y0F2xnGC
	QcDjyv0e/v5KDVXuJqG8v6/9xqlAprJwoHv8BR5t33ZvMUCl79ihkWgNSCXCgJml5SYxwTzwEzU
	TAhUrGj/68ZSFi6R1htkPYy10PSBbUaFMlbGPXxngVXMLIpLqvygbaHWs=
X-Received: by 2002:a05:622a:553:b0:51c:a70:5ed with SMTP id d75a77b69052e-51c4c2270b5mr46863921cf.30.1783170845718;
        Sat, 04 Jul 2026 06:14:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41da510dsm39840241cf.22.2026.07.04.06.14.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 06:14:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gd: restore png, zlib, and tiff in the default PACKAGECONFIG
Date: Sat,  4 Jul 2026 09:13:53 -0400
Message-ID: <20260704131354.463612-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 13:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128022

Before the PACKAGECONFIG conversion, png, zlib, and tiff support was
always enabled: those libraries were in DEPENDS and autoconf picked
them up automatically because no --without-* flag was passed for them.
The conversion introduced a regression by not including them in the
default PACKAGECONFIG, causing the mechanism to emit --without-png,
--without-zlib, and --without-tiff, silently disabling those features.

Evidence from the configure logs:

  pre-conversion:
    --with-jpeg=<sysroot>/usr/lib/.. --with-freetype=yes
    --without-fontconfig --without-webp --without-xpm --without-x
    (no --with/--without for png, zlib, or tiff; autoconf detects them)

  post-conversion, unfixed:
    --with-freetype --with-jpeg
    --without-png --without-tiff --without-zlib   <-- regression

  post-conversion, fixed:
    --with-freetype --with-jpeg
    --with-png --with-tiff --with-zlib             <-- restored

Add png, zlib, and tiff to the default PACKAGECONFIG so the out-of-
the-box feature set is unchanged from before the conversion.

Fixes: be9f029b6c10 ("gd: Support PACKAGECONFIG")
AI-Generated: codex/claude-sonnet 4.6 (high)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
index e7f8b56fd713..d3d13ee1e737 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -23,7 +23,7 @@ SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
 
 inherit autotools binconfig gettext pkgconfig
 
-PACKAGECONFIG ?= "jpeg freetype"
+PACKAGECONFIG ?= "jpeg png zlib tiff freetype"
 
 PACKAGECONFIG[avif] = "--with-avif,--without-avif"
 PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig"
-- 
2.50.0.173.g8b6f19ccfc3a


