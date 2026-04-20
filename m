Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596E2F557FA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16001.1776677610536490900
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iVVRbMr9;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso6417855e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677609; x=1777282409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRZc7ncDLgeA9v/MGJfU+RC6smWWWCog7MF0OBIIEyg=;
        b=iVVRbMr9BF5yzBJSih93wFbPf6RaH9GdEDJPW0oingfyjOvjItd42eHzGyC7wYhYsM
         7nGpjxHK49ohhhhYUmg4p52ZbznGRxmI/VEQjWVpZORqutRUVC0ELw+bZoFTS4NOG5tr
         vXz1SxBKHlQF8lWkUhDtLKPQG7DBlwgB9ta/VLuIk6JsVODg7SHzD90MFUx90ndzIiCm
         Knrs/YKau+0IlpYVmSpnKVbSFk3fkHP2xfpBti0DczW0+CJeiOgmyiEfKA0wGYahbdJ7
         9SwNQlPRnLUCDRiXzMqd3/w/cTx778TqA5+0LXDPg4mdVHNeRdbziCTne4mOtUCk+qR6
         fEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677609; x=1777282409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eRZc7ncDLgeA9v/MGJfU+RC6smWWWCog7MF0OBIIEyg=;
        b=GXUFhBHT5BjvrWvzekwgKz+12DMqswqwWbtrlV8XbgzE88a3fSrJaoZhEMakCFTDWd
         94eXvpBLBid4FfXOCNvNdyEKt/R5auVKdvepeozdwN8y7zXScNgdEcUgZNadv2KHjtc4
         GereSLwzO05CADzkFaEYSBJ1e5e2DrYfrIjRl+w7HVRGtyroyoF8Et56Rr0f7TfES+mq
         nWj2tugIi2ShwJQKVBVHNotKKmwVmrzJosw+MalfAjnwewJ0qhSXijKgtHgxhublDlgr
         3sNfQ/nGy3fg4whnFNlonJ4ToGWFWzviJYTWOfZ7nfiZsivDX0YTSYPpy7Fd9UigzSe4
         83lg==
X-Gm-Message-State: AOJu0YzAc+w67VC8cqP+IFd4JeYLkjCNyfWCNGZGFQIRE7gfuSDHnaG0
	yWj1hqdy9eGUut6MahnvT/eqVmOvES7c2AZuzja9dFEsvha2xB0TebQrPBs3ug==
X-Gm-Gg: AeBDietjEPJewYV5hKxuqmejW3iR30yf5t2KnuiXodnXyFTr4AAARs5jpVFX5HiRqPe
	aCMHLQjaOr6Fl4R0r6Rtid0mFYZhqLSPwaVoqGwzwYTtyhTepSY+WEjzqzY2nT3CvQWocRs1qh1
	ybPBQ9/IpqtB+y1fyRAsPfWWajM3AyS+j9e1Cvr+stuLyE9dvA8g2ez//TZjOtSTnF3DAEYVqZt
	+bVnAY/Zht9f0bbicCSfybmLGWb0yGxMaGt+xRVR/96glxxoLGjwl5Qtbwa8aFBvgPQua6pcfi2
	jS73r1uFDj3b4mmkCSg/ZgQWpumW1WTBjLFV2x+P5rQtst1WHjtcXtX20Ll3kEg5QK5ppkP4Tvd
	fRKmgZvL3EvwLiUplYm5Bwo8ZzyBAtnlr3XnwUdjS8XlEu9OUDkEzAaYQaFcSpoD4Wj7A0L/hjc
	dUJL58EqVykaHHJM8+JeTa8LFWgf/f7ko=
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488fb6e8eb5mr179920335e9.0.1776677608781;
        Mon, 20 Apr 2026 02:33:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 6/8] wolfssl: mark fixed CVEs as patched
Date: Mon, 20 Apr 2026 11:33:21 +0200
Message-ID: <20260420093323.357053-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126492

Details:  https://nvd.nist.gov/vuln/detail/CVE-2026-5188
https://nvd.nist.gov/vuln/detail/CVE-2026-5392
https://nvd.nist.gov/vuln/detail/CVE-2026-5393
https://nvd.nist.gov/vuln/detail/CVE-2026-5447
https://nvd.nist.gov/vuln/detail/CVE-2026-5448
https://nvd.nist.gov/vuln/detail/CVE-2026-5460
https://nvd.nist.gov/vuln/detail/CVE-2026-5466
https://nvd.nist.gov/vuln/detail/CVE-2026-5479
https://nvd.nist.gov/vuln/detail/CVE-2026-5500

All of these CVEs are fixed in the current recipe version, however
NVD tracks them without version. Each NVD advisory references the
corresponding fix, and each of them are contained in 5.9.1.

Mark all of them as patched explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/wolfssl/wolfssl_5.9.1.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 22ab04a02c..2978ff1cc1 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -51,10 +51,19 @@ CVE_STATUS[CVE-2026-0819] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-2646] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-3503] = "fixed-version: fixed in 5.9.0"
 CVE_STATUS[CVE-2026-3548] = "fixed-version: fixed in 5.9.0"
+CVE_STATUS[CVE-2026-5188] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5194] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5263] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5264] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5392] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5393] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5446] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5447] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5448] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5460] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5466] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5479] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2026-5500] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5503] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"

