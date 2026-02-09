Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942A2E81BA4
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45793.1770637157715369420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZcCgW5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so24572525e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637156; x=1771241956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLco60jHYu4uv1ONY8evyh1w4dlV5t0QSl1wssbr/YE=;
        b=lZcCgW5np8V9pGIzVXRLkFX9VtxBWZ7MV0FMMcDJ3aA/YClO/t9EPJQt4WHW4hyant
         eA/4iH+eFuQUjmxKZ0EvYJgFPxyFyd/HYRttPJ5SRexmRUsK2atE7QSu+sKsQzRxAcrm
         IzOVwdameNZLgVcLZlX7ZCtGv9JU7yQjC1ohwZnicOD2lHDRJRE7M43QKPZ0PNBgeG5S
         ABiqGCdSDRYh1WJovuMCCzyZtymH8ePlYWX19+wUgYmAs1rZwOSzyjvrwZuIGKwV+K1Z
         nk0w9F6iNP5rShv+96LyKVvo1p8esmxijd9MEIGjTug2mZxBMNH4AOHH6PUAAqVfUgmV
         jwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637156; x=1771241956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLco60jHYu4uv1ONY8evyh1w4dlV5t0QSl1wssbr/YE=;
        b=V2hHYf5GsYV+VDqYIOW9ZJkSx4/B9TvJOxoiSYMxLC1v+ClO+xGwpP33sltvQZNyPw
         QYcCs76rurBge9MGaKbcygz6Y0uxO6KiRvqBc1rZynYufdIeCOIcUhsejXOr0HSxj5Zd
         /VQDWsQAu+bCG7O8+b8uNLHyg1z6ocO7j6HsuVOLJ+AJVJnBtGatLIOmFBX/IbS1PyHF
         JjV0o9J8Nd364GiTaIzLLJNS8FHYED3FmRfXNUJ8Ffw5A5sus+bD97Kzvk9E31BelG5Y
         oQ8y8QKPss1gUnglWWzJvzYuUL2Qw6R/RsbiViSP5UFakNi69+n2CozNHNSFd0upMPW4
         gkKQ==
X-Gm-Message-State: AOJu0YytvSRJ819q0tKz5N7UIT4/MovWCdVWIxxqfsW/RwaAcpFX3khW
	fLKakkAreYWVlW3zWN+qBzm0nBMQLYrxyRrSib7VXIKZx7VdeJLZJjNYoN9Uww==
X-Gm-Gg: AZuq6aJtDrkMoJwCB6yqG+AHsxaFqPc81KOZ+pSB23VcJYyJTznMK2ZvB5LfO1cMVSX
	f4jYIXzmOMUoZH2wMfG3AQdodqnj3FLlnYJO1zBQfvwheaq5yORHrUzjTLAkQwS7MT5LaWWuZi8
	Hjf1Os5DBpPVIX9BSyKvXiKatA+Im6VYp7GEPAnNubIJ/AJWdJ31p4hh5c2TFuD9CGcvjdIJ5yB
	GogrP0/5W3CgzRE9614b+0HEf8HU2oLuKgPKeEwdrQLTP9vKnco8TuHfueUi/81yQgJXzATbmKO
	zSLISPTaV771/IfYey0DLB8xhi55nbVBJNZxnU2IKylU7o1EuX8ibZ2ny+gCEQZVMlkOkkpqoOY
	yU4DANOs55+a/PUWvaTU70aaRyF0p3pwk+9dF/7Yzt9x89ZEQ9+9p79TFC4X2eskJX16x1A9sAl
	zkH+ekyRrG
X-Received: by 2002:a05:600c:458c:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-483201da2e1mr152976535e9.1.1770637155963;
        Mon, 09 Feb 2026 03:39:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/16] tigervnc: ignore CVE-2025-26594...26601
Date: Mon,  9 Feb 2026 12:39:02 +0100
Message-ID: <20260209113904.3442496-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124310

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
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 4f9b9f7267..8abcc873f3 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -123,4 +123,6 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 CVE_CHECK_IGNORE += "CVE-2014-8241"
 
 # fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)
-CVE_CHECK_IGNORE += "CVE-2023-6377 CVE-2023-6478"
+CVE_CHECK_IGNORE += "CVE-2023-6377 CVE-2023-6478 CVE-2025-26594 CVE-2025-26595 \
+CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 \
+CVE-2025-26601"

