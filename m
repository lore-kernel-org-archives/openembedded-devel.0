Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74734C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:42 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5636.1784575712220887881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dYAM7J/n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260720192830b73f70a6ed00020727-p1dm_k@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260720192830b73f70a6ed00020727
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5W74j91QvdxL/HpAnuuMgulnXTfGlkgCWDX0KVWu0Hw=;
 b=dYAM7J/ngTfxwLLMbajVqrCPP+pQyXQhkiWjGJGovgj0mTaok6cvnGvn/8wXjtcitPjLhH
 /BbqZIq+CCXLTrh4aDW7JmmlX039nzQVCuZZ5dyvE81n5Wx5yj4K1s0svtm7XKZmWYWkl5ux
 5ax2lZTz6ZcopyHbTf8+QzCvxcClQH3A0ZblS/u3jubxrTTTsaGuh7bEhC5Rmy58U8Ct/a2G
 YDkGxcdDHoXCmhof01UZs/kcEHBwXGUleTQkbHTfMKPJPOEysk81hP53QLTwlXMUdAYE4Hgp
 ZQqPLb8BI2Gx90sze0LYw4utgF8jXEIyvlMwvoP1lt0pVbQjvcNQ8NkA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][wrynose][PATCH 5/6] tcpdump: set status for CVE-2024-2397
Date: Mon, 20 Jul 2026 21:28:08 +0200
Message-ID: <20260720192809.28277-5-peter.marko@siemens.com>
In-Reply-To: <20260720192809.28277-1-peter.marko@siemens.com>
References: <20260720192809.28277-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128298

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed with commit [1] included in release 4.99.5.
It is a cherry-pick of commit [2] mentioned in NVD report [3].

cvelistV5 and FKIE list hash as fixed version ("lessThan": "b9811ef"),
which causes a false positive thus needs to be handled explicitly.

[1] https://github.com/the-tcpdump-group/tcpdump/commit/e9bff173f9833b5532f3b6dce8c049e955140169
[2] https://github.com/the-tcpdump-group/tcpdump/commit/b9811ef5bb1b7d45a90e042f81f3aaf233c8bcb2
[3] https://nvd.nist.gov/vuln/detail/CVE-2024-2397

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
index f1bd32485c..af7e8b6ba4 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.6.bb
@@ -52,3 +52,5 @@ do_install:append() {
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
 }
+
+CVE_STATUS[CVE-2024-2397] = "fixed-version: Fixed since 4.99.5"

