Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534E3C77B75
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 14:02:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.38520.1681912936866624527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 07:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AAdW5Fw9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2023041914021373438e6ed7d3442a0b-z4jazi@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023041914021373438e6ed7d3442a0b
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 19 Apr 2023 16:02:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jMYo31eC90EXUAhjP43XAfHsqsadrq+tp7f7kmKCwQE=;
 b=AAdW5Fw9AZjW0bSzsd0obZbjpi595KaBMuOQdyW59b/SxSRyBkvV+E7x4k69OojG8n/s9v
 Cd80FMIjepqMT4G8ah9w1JLbojvFKiZbEi+Z1d+OvAeG1vCTKrIUrO96kLSpsPzkOmo2pI6b
 Ecfu92PcHCLlXW0EZnWVqG0wVNySs=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][mickledore][langdale][kirkstone][PATCH 0/2] *** p7zip: fix CVE-2018-5996 and CVE-2016-9296 ***
Date: Wed, 19 Apr 2023 16:01:07 +0200
Message-Id: <20230419140109.58115-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 14:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102138

This is cherry-pick from dunfell which never got to newer releases.

Virendra Thakur (2):
  p7zip: fix for CVE-2018-5996
  p7zip: Fix for CVE-2016-9296

 .../p7zip/files/CVE-2016-9296.patch           |  27 +++
 .../p7zip/files/CVE-2018-5996.patch           | 227 ++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |   2 +
 3 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2016-9296.patch
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2018-5996.patch

-- 
2.30.2


