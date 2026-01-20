Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858A9D2ED15
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 06:48:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1277.1768891687911526372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 22:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrhXGGFR;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so32582765e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 22:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768891686; x=1769496486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3fQDnsP6pFuJuKDjUbrBDRnKqSQDGtd994qE+btv9I=;
        b=YrhXGGFR44P0c2uKxYW6pOlFgE9BsfpH3n2I0K/B9D+1jYe9TfGA500Xf9m1S7haPE
         cjtuEbhNqSSkUOndzLOOEY3Ry3bI2aJ4NtN8C2N+pFusxURTrNb91aWmUO43E8lTni5n
         4vDaa8arpY+2F2iI3kTof2yADiMF+DYlpIXzDb92ZFlU3nqT4bNh0r+3L4am54MOaETy
         FcNPibGFt0KsXFsL/femIHSGgqnUIvGkWwt9ZVrRj4AyptPGou8qYcopLNRT/WjkCbGP
         wL6oysiGJtrVOeA85siZrBbrAuZkLP9BU7DPIu2yY/b55XtFQGaOqwfoQ90epYpOgj/B
         2O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891686; x=1769496486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3fQDnsP6pFuJuKDjUbrBDRnKqSQDGtd994qE+btv9I=;
        b=nmli1RmeoJWujyWQm4nAzeAMpVYPbP7yAuP+k5dIg67QuqA/yqvFJEp8YiJFsX3q7a
         cNjpHJHpqOydtGhHDdgecHiSm1XKAOI1U2UDZPzvwJPjGsKGTFYwndz9XeOH1qSE6LY/
         BQlowjqIx2l8JTBYKaZ9W2PRE9CMj7t/HLtcF/74nttO7TROXWkGCCXTm3ED99S9Ft1g
         SzJNVyHDEu0YybMiAjlhBFDx71ZTmSXRoRq2LmCz/sG/1k+kdgroSZUsZKGAZKFzH0Xg
         bWxOvZm2V35tV2DEDKrY6yTMygRuf8e3GTgmOSrL4KY1it93QSBqhwudfod++b8atioB
         KKOg==
X-Gm-Message-State: AOJu0YyXJeDO9cu7XFeuhgpJGsj3sKWEOHUlqKiNqfJk7DNJggtN1H2D
	fj1uLwcP4HBuPfIwqQwnuhHnlkXGitj6QqLlLFQCYdM2uGqYQiFWx2T4HXyJyQ==
X-Gm-Gg: AY/fxX7Otg+/8hyCenzqasS2mtcY9V8URBx85BLsenK33XDVz41tdx+vLfTXIRgzjml
	nS3Nd7KiT5lPC5SXbuvjqZn/6db7zsW1LT4Ix3uNbxxhmFSLz0Qppdq/MWmWNHTqaCu0k8/epH7
	AIP2EmVYievdOOxWhmhXPWQXwlaA77cc+cUmaJQ09/Dx0ASEz2WSPTq91x4wH5QPpW9wwnffnmc
	3If0y5G60DUalxXPSsIShYALq//p6XZdGNUkBenBZyqfWdLU0TRnxiXlvnJPCWNYIGf/lgJyWGf
	z/3frUlpLC3uyePFEnFEbdUvjqmbwF0cGYNU6v5ERF4rtjxeDZ4pVG+jO6ChZ0QrVzaV0MpFBFm
	EvDt9ElaSCH+UBMOPLI46sF44GeG433PZjMZNHBET4LsZW+GEQ0JJar6FuzRB1MfZjLsbFzlMwi
	nIEuDt0AHA/E6ecGIpy4Q=
X-Received: by 2002:a05:600c:868f:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-4803e9fd887mr5783115e9.0.1768891686170;
        Mon, 19 Jan 2026 22:48:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm26469633f8f.38.2026.01.19.22.48.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:48:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] freerdp: mark CVE-2022-39317 patched
Date: Tue, 20 Jan 2026 07:48:01 +0100
Message-ID: <20260120064803.831507-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120064803.831507-1-skandigraun@gmail.com>
References: <20260120064803.831507-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 06:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123656

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-39317

Both Ubuntu[1] and Red Hat[2] confirms that this vulenrability is
fixed by the same patch as CVE-2022-39316.

Therefore add this CVE ID to the patch's tag also.

[1]: https://ubuntu.com/security/CVE-2022-39317
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=2143643

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
index a60b2854c8..d13ad42958 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
@@ -1,5 +1,5 @@
 https://github.com/FreeRDP/FreeRDP/commit/e865c24efc40ebc52e75979c94cdd4ee2c1495b0
-CVE: CVE-2022-39316
+CVE: CVE-2022-39316 CVE-2022-39317
 Upstream-Status: Backport
 Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
 

