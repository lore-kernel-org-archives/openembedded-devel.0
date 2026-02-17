Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D7CE909C0
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:01:57 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13953.1771340513937571735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AO2PF+8Z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260217150151639936bf4100020791-sjaso7@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260217150151639936bf4100020791
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Feb 2026 16:01:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Ms7+dzlbcIOlpsDo0CHEXsfkUsbTUP+jKrIVNtEKWvY=;
 b=AO2PF+8Zsk4UacGXhE7UEAiTEB/T8O/TKbxQ4ElgjGMfbQgV4e9AYwYLtjhbEe34SHN5c3
 YAISYa6C8ITFEXhkyQBh9/yUeBA6++kR8R04uHk6R/sU/4QN1HT2QLt6GdlcamLEk7FYX04m
 i85rWYElKyWMdUZ3NrxhmATjVD0GKXkjrrP88AZSHdfua/MNcJTJ2tLENlnilE7Cw67/JoKd
 7ratImUCsz24ro/0srzgcDY8HkvuH9AG3FD/fgU1EmBjVEGUS8DQkNPqGYvIAZkC/CiWZQt8
 K2FHifMcX1L4R+GTib7f44UGCNM78S82NrEPI64+wnqxUIdVG2eS4Ztw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 3/3] ifenslave: update link to homepage
Date: Tue, 17 Feb 2026 16:01:37 +0100
Message-Id: <20260217150137.30232-3-peter.marko@siemens.com>
In-Reply-To: <20260217150137.30232-1-peter.marko@siemens.com>
References: <20260217150137.30232-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124458

From: Peter Marko <peter.marko@siemens.com>

The old link does not work anymore.
New page found based on other linuxfoundation.org link redirects.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
index bc0975ecc1..c902af91e7 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.14.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Configure network interfaces for parallel routing"
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding"
+HOMEPAGE = "https://wiki.linuxfoundation.org/networking/bonding"
 SECTION = "net"
 
 LICENSE = "GPL-3.0-only"

