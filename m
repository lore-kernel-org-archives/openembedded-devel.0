Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEB6C02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 18:13:15 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.28762.1736964785611804347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 10:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NLWtyNPB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202501151813018e8f093a2eff7ec461-ugacvb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202501151813018e8f093a2eff7ec461
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 15 Jan 2025 19:13:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/nHVk1YLdYcaJbWTXKCobo7Ol643k9EHKaRMUmo5el8=;
 b=NLWtyNPBU0Cw5LlnaJDAuc8Q33gfPJG9RP01xFy4WUiPHYLP45W9OTaDmdDYQzPOL2NR1V
 NDaY+bm7PNySMA9KaZz0Kj7Gh9TCEL/XfAkJ4eej/wbxjG7Cc01cPk6o1Qp8HoWxoS1V3YhS
 /KlHKRnyKyKGqg3mxXzaPzy1xy7pgFwGGCdMAWX3XJK7+mDezOifYELoYxDNFQJlrUyoZV+t
 daDymYimKVNO1MsBJI4ApiB8aH8zk6/GSz9pEWhRiN5IMtLIzBhVwFCcOPr6ypkQONS+PQrC
 +Hb81QtJzRBpxYq5CGDvLhEkSdWH8+crYndwKnjeoAOe3Hr6G+n5qx1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 0/3] proftpd: upgrade 1.3.8b -> 1.3.8c
Date: Wed, 15 Jan 2025 19:11:58 +0100
Message-Id: <20250115181201.438102-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114899

Motivation is to remove CVE-2023-48795 from reports.
Although this was fixed already in 1.3.8b, NVD shows it as
"Up to (including) 1.3.8b".
We don't need to ignore it if we upgrade to higher version.

Peter Marko (3):
  proftpd: define UPSTREAM_CHECK_GITTAGREGEX
  proftpd: upgrade 1.3.8b -> 1.3.8c
  proftpd: define suffix for CVE version comparison

 .../proftpd/files/build_fixup.patch           | 20 +++++++++----------
 .../proftpd/files/contrib.patch               |  8 ++++----
 .../{proftpd_1.3.8b.bb => proftpd_1.3.8c.bb}  |  6 +++++-
 3 files changed, 19 insertions(+), 15 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.8b.bb => proftpd_1.3.8c.bb} (96%)

-- 
2.30.2


