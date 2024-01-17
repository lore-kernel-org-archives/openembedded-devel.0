Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCA4C47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 12:13:48 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.7705.1705491576173723101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 03:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=sawisgrH;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 06B499C420E
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id e5aDdowLYWyy; Wed, 17 Jan 2024 06:39:34 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AABEC9C4199;
	Wed, 17 Jan 2024 06:39:34 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AABEC9C4199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1705491574; bh=lEHURbMxstVQXgKW/u+pYB8hrh+CwKtkJCeHoY/6mHg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=sawisgrHAXm7QeShp5loLDCzc13tjVMgUqYY/OgSlWEwiKO+D3PfkxgBhFSzVEd4M
	 zoeAFH+oFuoBBB/tPvgybU7LVLJj8lvcmfw2F9hkAtHREal+saSyrr0Xk2/v0aXAQD
	 7Y/mdV/lsHcRigG/pEkVKOf1ehfw/u7E/KZbCJ2HU4/4iH+Wxh7DdkKwbMFugZs+a9
	 IFBP/4Lkyls7IADLiwg0BWxM00BZEoPJ5ZjIWX21IvkBPSehFh9qzJCtbZrif2FrUH
	 WodhyLsbZ7Xsuyd4N1JqAovIX6Ooi1G4A9nTBUtZsNsXY9GTZ8SvmVAZBxhPHGgd3V
	 00ghPSqbVJiHA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id FE7YihjMpRyb; Wed, 17 Jan 2024 06:39:34 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3E6859C3290;
	Wed, 17 Jan 2024 06:39:34 -0500 (EST)
From: paul.leguendekerneizon@savoirfairelinux.com
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver][PATCH 0/2] add support of cockpit-machines
Date: Wed, 17 Jan 2024 12:39:09 +0100
Message-Id: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108329

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

Paul Le Guen de Kerneizon (2):
  cockpit-machines: add recipe
  cockpit: remove occurences of machines package

 .../cockpit-machines/cockpit-machines_304.bb  | 22 +++++++++++++++++++
 .../recipes-webadmin/cockpit/cockpit_304.bb   |  5 -----
 2 files changed, 22 insertions(+), 5 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit-machines/cock=
pit-machines_304.bb

--
2.34.1

