Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0BDE81BA4
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45593.1770637158395511963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=inAneIpn;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso32683445e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637157; x=1771241957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM30tq9JDFYVcffCbl0L2RugcjljYynZRcrqCwMl6Zc=;
        b=inAneIpnqur/BAVeTJHH0PZAQNdkAxvkM4qiT2Tzo+kvP1YieUf12hU3spPwIxiHP8
         AIsFSfhe2zpiURJQaKkTfmI88p/BLYmRtlT/LADvGqKVO9Ov3h5FJokKxHPaU4Zg/4ho
         tEgJL1o7T8D9wtDm2MRzA5nmSjj5GNP7FzK76CuFgSKwUdgu1pNcRqwx0G9BoRkSpWBf
         xtWQgjlyMfv2QexUY5iOHAV/WP+tsdtSm28AiWi89Aj1PPRrM4cNxrIIKDkKQk0kx38U
         sCH/H7f3OPMGEFttfXU8lNstLjte+GPUpyHLmrDR3pw+FTusRJahxb+ejlcJGRo6cFfC
         f/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637157; x=1771241957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eM30tq9JDFYVcffCbl0L2RugcjljYynZRcrqCwMl6Zc=;
        b=inEpW0t4J5A42JNJuCVuKrUvCy/Bu8o4WT1c93rtXDcbZ1GSYEmVwG+t3cg74SjqSM
         zPNeVjfpjH9CpdgTMMR4XkxreA5qEcrI4U6t8sJfCy/QZY4y39/OmoxYoz2AMP2iVRsu
         5nC/F/Y4wz80OcXnMpmclc84L3sTiZuZKQ93gKCu8UFpepVkYjSSbnUk17Bz9t3ff4CL
         w03yAk9PSwVGeh2unDiytQpHB1X6YJbK9CMvxQOnLs+sqxYuGkTE+vDrZWeIVOGbPCok
         rjtH8ZNO9hw95d7+/WJa+7PT7gP4QW9GZjXhJJstnyXhrNAq4GG8WAGKDECHcs3GERwC
         F4SQ==
X-Gm-Message-State: AOJu0Yz2K7wl8T1g+dieAjE3RoaBwiUIGiptzBDFoQsdHSGm3LUMPbgk
	gwGJQsIEaAnXCnx4yB4Fba0kgxcVm2X/kB6MxkU5oSnU72kpl7Sc6zWO4214GA==
X-Gm-Gg: AZuq6aJBbEBAWSTrsFrZR8camXEqbat+A5U6ROo5cYVoUkxh870bd+l6j294t8W5+AD
	MC3ETX3nM4Qwu9Aer3cE2wVdlXHI0rpB2+iCsj8ZTWf+RNvNoRyWc41hSNg1p6AbIZrMNz2JbMt
	xbU5rFytTOAUtIVpnP9UIO7VEYfHUSQIS6ZrkUd1fR7zTTU3je0G5r/dy/ao0Ofl/qA0GInHJcL
	YpJIMXhtSQtEkvTmsKKPEDrVXa1gI1QCtZO8NA2GRDfQo9KYfjUQG4HDJMDDSdPW/BFQOAOa5A1
	zZhAA/IukkSFT1zrUZCnbmLAqquzUfjF57Bz7Fmp5nzjwIvm3bRkW/bQLvCHfPjYp6kwtDTC6gJ
	U8AmLsT3ZcR3PVWlcBVEjjvmasYrmUNAy6GC7AWSvR18U2RrAxQyvcoE5yjkX8K8jfYYYIgsK0m
	N0xJ4JlxoC
X-Received: by 2002:a05:600c:a15:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-483201e482emr164041015e9.13.1770637156665;
        Mon, 09 Feb 2026 03:39:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 16/16] tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
Date: Mon,  9 Feb 2026 12:39:03 +0100
Message-ID: <20260209113904.3442496-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124311

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
https://nvd.nist.gov/vuln/detail/CVE-2024-0409

Both of these vulnerabilities were fixed[1][2] in xserver 21.1.11,
just mark them patched.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/8d825f72da71d6c38cbb02cf2ee2dd9e0e0f50f2
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/a4f0e9466f3bc7073a8f0c28a581211c2d7adf0e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 8abcc873f3..053e8237f4 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -125,4 +125,4 @@ CVE_CHECK_IGNORE += "CVE-2014-8241"
 # fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)
 CVE_CHECK_IGNORE += "CVE-2023-6377 CVE-2023-6478 CVE-2025-26594 CVE-2025-26595 \
 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 \
-CVE-2025-26601"
+CVE-2025-26601 CVE-2024-0408 CVE-2024-0409"

