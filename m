Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C165C35FF1
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:45 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.39888.1742165741578162775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=eQpn7/uh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202503162255391ed72cc8346724bb2c-a0vd6y@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202503162255391ed72cc8346724bb2c
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7nHeVJLlYQg0zjhozsrZ7f9Jh+KRrWxAxFIOewKXjM8=;
 b=eQpn7/uhNgW1q/N05L0dIlWo6kRN3T3Ic1fz6WUuOpLM9GBWFvjKRvKrMATO4G8nbVv1Rz
 aj6/qALjY/UThyeObaIdIbKUzhyZHSLSl325xL2H64EkdfrlyJXJakey+sLnNopTv7hQZLTA
 es2MA1fPr64d41Rpka0nlfYrA5ujFeV0egejDi8gcVA2ydQ0sSGs3mk6S38QLnG/oUfpttby
 mi5b7AVKw6JYBElJNIvBEb066xhaBg9hz8we4FdBTJhZEqE87LRg0CD5eNI1JDi7ml12SJwJ
 CnGD4MjphNEIwQKlVvV0mjxll2fvTOSewk0Fz/pJT5Gc11gnqLIE9LtA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 12/12] sox: mark CVE-2023-34432 as patched
Date: Sun, 16 Mar 2025 23:53:58 +0100
Message-Id: <20250316225358.2816208-12-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116017

From: Peter Marko <peter.marko@siemens.com>

Patch for CVE-2021-23159 fixes also this CVE.
Stated by:
* https://security-tracker.debian.org/tracker/CVE-2023-34432
* https://sourceforge.net/p/sox/bugs/367/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2021-23159_CVE-2021-2317.patch                   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch
index 472e4bac60..df27cbcd65 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2021-23159_CVE-2021-2317.patch
@@ -7,6 +7,7 @@ Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git2
 
 CVE: CVE-2021-23159
 CVE: CVE-2021-23172
+CVE: CVE-2023-34432
 Upstream-Status: Inactive-Upstream [lastrelease: 2015]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

