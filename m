Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6D8C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 09:19:27 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.8584.1685697561476050983
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jun 2023 02:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZLc4qDbM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20230602091917c3bb06adbcb1758276-_9qr97@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20230602091917c3bb06adbcb1758276
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 02 Jun 2023 11:19:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7EqSQ8Mze9YfSHHcdiU9a8Q+YwDa4hNTSDqzJSy22js=;
 b=ZLc4qDbMvvMkaq1zNPbkzt5dOvJYu7yihmH8IHtZr08l/JDRD0Rub08uleIZBgoc3lV25y
 c5ouQ7HE0/yKYeNkuWadvN9u9f86uQp8h6MCvT1znY93Uoq2+vEgBa2X/U+3t0IBikbOxsb5
 oIfsSRVBihjL9aQWnCUIaQb04jD4s=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] nss: ignore CVE-2022-3479
Date: Fri,  2 Jun 2023 11:18:20 +0200
Message-Id: <20230602091820.9016-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jun 2023 09:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103097

From: Peter Marko <peter.marko@siemens.com>

Investigation based on https://bugzilla.mozilla.org/show_bug.cgi?id=1774654 leads to following:
* fixed in 3.87
  (https://hg.mozilla.org/projects/nss/rev/a7f363511333b8062945557607691002fd6e40b9)
* changed code was introduced in 3.77
  (https://hg.mozilla.org/projects/nss/rev/be6a97823bfe10fa08e17c9584938a2d525a38da)
* NVD claims fix in 3.81, but there is no evidence for it in commit history
  (https://hg.mozilla.org/projects/nss/graph/a7f363511333b8062945557607691002fd6e40b9)
* Debian also says for old versions "nss <not-affected> (Vulnerable code not present/was introduced later)"
  (https://security-tracker.debian.org/tracker/CVE-2022-3479)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/nss/nss_3.74.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index a7048f0fe..38407a7c4 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -289,3 +289,6 @@ CVE_CHECK_IGNORE += "CVE-2006-5201"
 # CVES CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698 only affect
 # the legacy db (libnssdbm), only compiled with --enable-legacy-db.
 CVE_CHECK_IGNORE += "CVE-2017-11695 CVE-2017-11696 CVE-2017-11697 CVE-2017-11698"
+
+# vulnerability was introduced in 3.77 and fixed in 3.87
+CVE_CHECK_IGNORE += "CVE-2022-3479"
-- 
2.30.2


