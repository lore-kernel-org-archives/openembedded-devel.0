Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD283C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:46 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.18962.1705659619145891432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jan 2024 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=O+sJNaVZ;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CF8F29C3675
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 05:20:17 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4UyB-OZdAivh; Fri, 19 Jan 2024 05:20:17 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 635E29C3394;
	Fri, 19 Jan 2024 05:20:17 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 635E29C3394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1705659617; bh=9fGDb8OHjw+TloCK+B7PR3/YVIKtKR/2RmVXOjGoZls=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=O+sJNaVZLDkiYWiYYlYTeV/KuiXACofwyhIErmMp31l6GP9TaZMHltI3PAsk7o0QG
	 /uVreERmO/2+9CL+mcEZeGATkkIWzq+UaQ3H06z6uzdDNDwWZ1+sTS6iwUVO90iQE0
	 q8oK+V6MNlku4KrKxP/yXclMAY5CiIhiwJDsrsNsnY7Tyy9Q+y/n6860+16u0fo8So
	 EV5+b7ikV/nZtjFin6kHKJT+ArpEGg5UeXIUrod4B1CIoPneccTqk14lwfyeJIvfUJ
	 j4RfDFmE5EWH9NQCKr6HTuPYc9tPlUDcfMBzuRGmUE7SdxsB7bLabS24OWIJAvkng3
	 GyhmE4XH8vlEQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id hxClponKUW8O; Fri, 19 Jan 2024 05:20:17 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EB9589C3335;
	Fri, 19 Jan 2024 05:20:16 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver][PATCH v2 0/2] add support of cockpit-machines
Date: Fri, 19 Jan 2024 11:20:07 +0100
Message-Id: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 11:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108358

Hello community,

Since version 242 of Cockpit package, plugin `cockpit-machines` has been =
moved
to a dedicated repository. This cockpit plugin is used to manage in web U=
I
virtual machines. There is currently no support of the new cockpit-machin=
es
package in any Yocto meta and the following patches bring it:
  - Patch 1 adds the recipe of cockpit-machines
  - Patch 2 remove all the old occurences of cockpit-machines package ins=
ide
    cockpit recipe.

Waiting for your review, feel free to ask any questions or remarks.
Regards,
Paul Le Guen de Kerneizon, Savoir-faire Linux

V2 changelog:
- add needed distro features to match cockpit recipe constraints
- add needed compatible host to match cockpit recipe constraints

V1 patch: https://lists.openembedded.org/g/openembedded-devel/message/108=
327
Paul Le Guen de Kerneizon (2):
  cockpit-machines: add recipe
  cockpit: remove occurences of machines package

 .../cockpit-machines/cockpit-machines_304.bb  | 28 +++++++++++++++++++
 .../recipes-webadmin/cockpit/cockpit_304.bb   |  5 ----
 2 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/cock=
pit-machines_304.bb

--
2.34.1

