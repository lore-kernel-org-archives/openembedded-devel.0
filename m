Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D67C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:05:01 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.7918.1740490386845092155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=QRfz+1ad;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D4DAD9C89F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 08:33:05 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Jz8t3IqiAnwh; Tue, 25 Feb 2025 08:33:05 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7C0939C89E5;
	Tue, 25 Feb 2025 08:33:05 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7C0939C89E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740490385; bh=TtWmhyerAmEbZyUU7VLlEpGGMSN23nVNEGR6LePQpDk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=QRfz+1ad6SCfa5Tt3ynd7qnihSRtAVNqr6lGeLhaUQa0rzI16YZjWrEpdrZPNbqP4
	 2T4VLML2HhUSbBDElO741GrAzxSNRS90nh59xjqC/mS6JLC3FCj+BGFs55Exf5Bm95
	 i8ZP003ZxzjeBXtVb90tieAZ9CdhkWcuHKH6t54cryLAbcKiJyUaRPAtZqmQV6oWpg
	 wg/fycFOk55e3GBFrY618QemhQhXVQss+F/OIXiEhJOUIgJPh+8Pyi3Ja1mxBSyjig
	 XW2bHiUcSC1GS3AoAEB9SKegxyTkbfWNeaTvyQCVDEwoyN/K3Nv2l6ZwPCB1397YMw
	 r7dSJcHjFElWA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id MoH1EU69NbHq; Tue, 25 Feb 2025 08:33:05 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 088E99C12F2;
	Tue, 25 Feb 2025 08:33:04 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver]PATCH 0/1] cockpit: remove deprecated packages
Date: Tue, 25 Feb 2025 14:32:50 +0100
Message-Id: <20250225133251.33993-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115581

Hello community,
This patch fixes dead and deprecated code in cockpit package recipe due
to recent Cockpit releases.

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

Paul Le Guen de Kerneizon (1):
  cockpit: remove deprecated packages

 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 10 ----------
 1 file changed, 10 deletions(-)

--
2.34.1

