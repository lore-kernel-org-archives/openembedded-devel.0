Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DAAD3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44426.1767019921615953801
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQzSLRMn;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3718838f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019920; x=1767624720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIKBLszpdxwVAzZ1KRFvm8KHEDICMZv3uTubCJyELw4=;
        b=jQzSLRMnXuA4LE0IwjcvubW8DS1nzEKbY6IOdfT/Ttf2FaImLqXk2v6gZv57DfYO60
         FVUgeDAjrJhcWfMXMyqVqDB5XLqndFwdx8YSIaiYtaNXzASDGImn+UPlszGyy+2iqfX/
         QwOU1tezKr1E0mZKkZ8piHuxXF8aJenIw88n+TZWiah6BBc5EI1JVD2ppWxs4SJhryQk
         7cdqybTyS2yFcpawMfgnFzlHQhIGu5k8G4IV0LNF5r4QsyylKJVb4R9DaeNyABJZ4rN1
         3OdfOTwdtoVXuzkAdD/75S9SfYaAa0McNoKHk2AOFvnuQidtVyttle255Pom02isEtdz
         x5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019920; x=1767624720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIKBLszpdxwVAzZ1KRFvm8KHEDICMZv3uTubCJyELw4=;
        b=j+lVZBP1fCw3AMAi1zMbS5LRscxpkX2SxIYSMLBO1prfzRTsUlP0Uu0pFWjLS2rNJY
         pBlWY0gLMLhz46SE54drrYnfOTxpfv6FtMoiFgF8UHuzbTjnVR6LvE5uJjj7KfZw4pKc
         URkngdtsLakWVsgOt0IiJLfDgTfIqPKoPpeAeyWGmpayRBFT3PEHdaSWrupGMJXGUun0
         cHZhh/08/kBS/B+BWua8PYHloU7otJ4OUcK6O3187cRshdRPnMrIk9lh266CNVKe98fQ
         xrgaEgfGg+J2W6I/X+EU0WzRWmXLHYTRQs1/acCwH/SWpBjZzuIxNgIMXZjs8/Yx0f8y
         L1Cw==
X-Gm-Message-State: AOJu0Yy8nyDzc9h8iAVFj/3Sa24iWQlmNKsuqqeN6kDB/oEnXExpgjBF
	ZPqCjhvMFFXCuNQ65y930w8okG82Ps/fGizQFcTnNrZq+p+3qEeEHa5BqxQggw==
X-Gm-Gg: AY/fxX4mpycRB7eHvfG13EfXwxyKxBDceAxLDVOpV8keNCvLRGIT1Z75lpMKuQSvqBI
	/NzRPrGQHDngPOBZ/lXs20COAA1kdVaHIon9WgiKF9iTHwmsXPDkTLg5RauySLAXmj0eh6wui0h
	qcK7XpwRnfV0qndG3DzhizY4yjD1oPIIpMKbA9NNtn5S/yHWa6QB+PER/4Xf9jJAV61m2lHyqPz
	KTGQVSyT0fBvuDQW0NL+W8rQzuUri/XK4vugKhagaVVGlU+Pe3ispl5ftyU0Rf35lfqjvaan6S4
	gbbFrxaKU2LrpUdoJExnljIBPZDe0ryEuObgLCSya7kp1wyEG2xObBREb4be83nZR7YrD+imm8C
	yOPLRa1OdI+yopM863SDQhut62WOCVNSmlUpIQ9gcZNWEKwU4AxQOjEHJhxnE9LUkT+mXkOBXfy
	ylnxoT1foN
X-Google-Smtp-Source: AGHT+IHU03p93QiwZU9vuQ/YOrKDJD5Ck2YmK36mdo2UHIr7GYfbCbk+gyut+wexwUDIr+LSVxWc+A==
X-Received: by 2002:a05:6000:290b:b0:430:8583:d189 with SMTP id ffacd0b85a97d-4324e4fb659mr39148892f8f.39.1767019919890;
        Mon, 29 Dec 2025 06:51:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 11/11] tigervnc: ignore CVE-2025-26594...26601
Date: Mon, 29 Dec 2025 15:51:52 +0100
Message-ID: <20251229145152.489068-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122989

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
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 89704f421d..9fb7abf8f3 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -89,3 +89,11 @@ SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
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

