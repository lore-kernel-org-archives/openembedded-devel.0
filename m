Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D711BC47DB7
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:46 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.18963.1705659619450835454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jan 2024 02:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=QqHVN0B9;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CC2E89C3335
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 05:20:18 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7LfO5E_JeI6G; Fri, 19 Jan 2024 05:20:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 893EC9C3394;
	Fri, 19 Jan 2024 05:20:18 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 893EC9C3394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1705659618; bh=Y6yagZ5ih8egqq7xxEquevFbzsP2CT/EmZUGl8mWJWk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=QqHVN0B9MabkW7NYGqvoXQHIJd/Nfb9FYJNEykTnw8LXSFwl4oRcdLSsbGOi4TxKh
	 BmpzAS1uGtXisFmHtL1w1Ic016HYRPdZx4nElbxi82/qNfrjjkdJOHAIDbKlk3YWAs
	 utr0PSir++uCuyv2YaLO2qnyt121tWwWuOOvFhYDbKIdG842+tGFex5wh+M7ZT09PB
	 q0qBbKMMa8vttr5FXQYDSdrJh3v5Ue5UM3HkmBjiaU8dmd8X3lEH4OA+6G6qe9c+Fo
	 zWee4MyjqmY5l2ehxs4vD74NGjlTfXOS2dtAog+OOXsAo2w8FAQ2wh0psRevs4JADe
	 2+zRRfuZAxX3w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id TOf5sy-UbbvP; Fri, 19 Jan 2024 05:20:18 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 20AB69C3335;
	Fri, 19 Jan 2024 05:20:18 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver][PATCH v2 2/2] cockpit: remove occurences of machines package
Date: Fri, 19 Jan 2024 11:20:09 +0100
Message-Id: <20240119102009.18867-3-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20240119102009.18867-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 11:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108357

Since Cockpit version 242, `cockpit-machines` has been moved in a
dedicated repository. So it is not needed anymore to keep the old
cockpit-machines package in the cockpit recipe.

Thus, this commit removes all occurences of `cockpit-machines` in
cockpit recipe.

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/met=
a-webserver/recipes-webadmin/cockpit/cockpit_304.bb
index df7f47a11..ad512c04c 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -59,7 +59,6 @@ PACKAGES =3D+ " \
     ${PN}-sosreport \
     ${PN}-storaged \
     ${PN}-networkmanager \
-    ${PN}-machines \
     ${PN}-selinux \
     ${PN}-playground \
     ${PN}-docker \
@@ -102,10 +101,6 @@ FILES:${PN}-networkmanager =3D " \
 "
 RDEPENDS:${PN}-networkmanager =3D "networkmanager"
=20
-FILES:${PN}-machines =3D " \
-    ${datadir}/cockpit/machines \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
-"
 FILES:${PN}-selinux =3D " \
     ${datadir}/cockpit/selinux \
     ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.xml=
 \
--=20
2.34.1


