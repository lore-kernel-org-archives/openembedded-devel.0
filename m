Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B27C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:15 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.39871.1742165709649645793
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OgdbgJPV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202503162255075c44e4fcdd4f0badfc-gtdolj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202503162255075c44e4fcdd4f0badfc
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=05LfuNA2mIf0QO9gTS2aJk48243HDrg72vWEi+yUV8c=;
 b=OgdbgJPVlw/HWdMoslGVxNTxzh6E5R1nrFgQk5ze+MuNGdutspqUJXkbGJJfbHtjQT1tTI
 0ZHUHebXq4kI8AGqTTJxAFInjsmRpsf7ZT5Q3M2JyoQbmZVqoVaFZ9mC5LBn/PsndyoR4Lbw
 YLoLauULzVpmK7wKrD5FwC+xHlKiP2WIYGOjjyPCcI0R33N3Kg8piEdqjU/8qwhVXtBkvyUF
 xAUYymtwaipueZRrVRMpHGuCCuC6vx/F9hHJ/1ZWVzd/iBLbwkY5WChJs0b39FG3mDKrr9sB
 th+t3dmoJDku/vwBSnfNCZ7SRXm1r7t9fxTm5n22bJSPFSU0QA9zVLwg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 04/12] sox: mark CVEs included in hash update as fixed
Date: Sun, 16 Mar 2025 23:53:50 +0100
Message-Id: <20250316225358.2816208-4-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116009

From: Peter Marko <peter.marko@siemens.com>

git log sox-14.4.2..HEAD | grep -o 'CVE-[0-9-]*' | sort -u
CVE-2017-11332
CVE-2017-11358
CVE-2017-11359
CVE-2017-15370
CVE-2017-15371
CVE-2017-15372
CVE-2017-15642
CVE-2017-18189
CVE-2019-13590
CVE-2019-8354
CVE-2019-8355
CVE-2019-8356
CVE-2019-8357

Following remaining CVEs are handled in commits:
CVE-2019-1010004
- NVD: https://nvd.nist.gov/vuln/detail/CVE-2019-1010004
- report: https://sourceforge.net/p/sox/bugs/299/
- patch: https://sourceforge.net/p/sox/code/ci/09d7388c8ad5701ed9c59d1d600ff6154b066397/
- same commit as CVE-2017-18189 as mentioned in NVD and bugreport texts
- https://security-tracker.debian.org/tracker/CVE-2019-1010004 links it
- it's only commit in src/xa.c in last 15 years

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index e3c228858c..e8294a05af 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -38,6 +38,14 @@ S = "${WORKDIR}/git"
 
 CVE_PRODUCT:append = " libsox_project:libsox sound_exchange_project:sound_exchange"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_HASH_UPDATE"
+CVE_STATUS_HASH_UPDATE = " \
+    CVE-2017-11332 CVE-2017-11358 CVE-2017-11359 CVE-2017-15370 CVE-2017-15371 \
+    CVE-2017-15372 CVE-2017-15642 CVE-2017-18189 CVE-2019-13590 CVE-2019-8354 \
+    CVE-2019-8355 CVE-2019-8356 CVE-2019-8357 CVE-2019-1010004 \
+"
+CVE_STATUS_HASH_UPDATE[status] = "fixed-version: patched in current git hash"
+
 inherit autotools pkgconfig
 
 # Enable largefile support

