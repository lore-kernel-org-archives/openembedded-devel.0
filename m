Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B3BE9411F
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.5569.1696626409174612526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fk7omgUn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20231006210646a7563e0eb1226722a9-xwqw8w@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20231006210646a7563e0eb1226722a9
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=p6IM+r5/DB5cU3WbR8VE0MGWkOc9OAmh47nXQcUR8gQ=;
 b=fk7omgUnICQu4jKakz/h6IRO0sbWVxVEIqrpFZ02TJDTHF4X6At7x8tovxg9U+4jlLnijp
 j3dMhNsL4GDQ+Cxj4GL6TOVrSruOZAoIQvZxqCfXdQx2sZf+jwg87cSG6TPlxMVjvUcvbMpz
 8dvKMrUxR9rgzfa2nww1KvuLW3dLM=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 0/5] mosquitto: upgrade 2.0.14 -> 2.0.18
Date: Fri,  6 Oct 2023 23:05:02 +0200
Message-Id: <20231006210507.556767-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 21:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105373

Addresses CVE-2023-0809, CVE-2023-3592 and CVE-2023-28366

Cherry pick all commits for mosquitto recipe from master.

All applied without fuzz/conflict, just upstream status commit
was also updating different recipe which is not in kirkstone yet.

Gianfranco Costamagna (3):
  mosquitto: do not automatically depend on dlt-daemon, it's a
    non-mandatory logging system
  mosquitto: upgrade 2.0.15 -> 2.0.17
  mosquitto: upgrade 2.0.17 -> 2.0.18

Martin Jansa (1):
  mosquitto: add missing Upstream-Status

Wang Mingyu (1):
  mosquitto: upgrade 2.0.14 -> 2.0.15

 .../mosquitto/files/2894.patch                | 25 +++++++++++++++++
 .../mosquitto/files/2895.patch                | 27 +++++++++++++++++++
 .../mosquitto/files/mosquitto.init            | 20 +++++++-------
 ...osquitto_2.0.14.bb => mosquitto_2.0.18.bb} |  6 +++--
 4 files changed, 66 insertions(+), 12 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2894.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2895.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.18.bb} (94%)

-- 
2.30.2


