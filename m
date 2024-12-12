Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EE6E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 18:51:30 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.566.1734029488143871192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Dec 2024 10:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=K4mk/QMu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241212185121d89ce1606ce98a69f7-3m0qwp@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241212185121d89ce1606ce98a69f7
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Dec 2024 19:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UwLRnoK78kbP1p5heKw+OmV9ifKidHLf1qu/rrghZpM=;
 b=K4mk/QMuCPZUrOB97xw10xJX/+V0mREHIo294wXCmF2DHAIuwKWiUlyDkFFHyxBmEecK3H
 EoGlxwAsssZ6aHDuJp3TSWFHMfk1jjudnkoDH60N/S3ipf14nOZiMFZjz+nkx3vx+d0ci0nO
 Z9j0dyWf4SG9Yq78ycQHTKS2tOzc5ttY4gj9TmS04iW11YVhLZLB2/r5cLjr88FgZUljiUXN
 7dIATW2JSOHyPNhBI0/VLnB2iw2TmEzc7IOQBipB/NgfMakrQAhmJPXh/PJ5BjO3cl5WeKPt
 mgbx0DTIpgXva/pNVE9dTM1jq8zatLZxy1MRDuIwzc3p7yiAOUtnNh5A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][scarthgap][PATCH 0/2] backport ndisc6 buildpaths fixes
Date: Thu, 12 Dec 2024 19:50:38 +0100
Message-Id: <20241212185040.2244548-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Dec 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114292

These are clean cherry-picks.

Khem Raj (2):
  ndisc: Remove buildpaths from binaries
  ndisc6: Fix reproducible build

 ...riables-indicating-buildtime-informa.patch | 85 +++++++++++++++++++
 .../recipes-support/ndisc6/ndisc6_1.0.8.bb    |  5 ++
 2 files changed, 90 insertions(+)
 create mode 100644 meta-networking/recipes-support/ndisc6/ndisc6/0001-Remove-use-of-variables-indicating-buildtime-informa.patch

-- 
2.30.2


