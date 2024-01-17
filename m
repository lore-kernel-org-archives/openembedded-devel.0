Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1752C47DA7
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 12:13:48 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.7706.1705491576820115705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 03:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=W1W091Ip;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 22CF09C2810
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 06:39:36 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id wcZT6XSzaiWe; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D13769C4199;
	Wed, 17 Jan 2024 06:39:35 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com D13769C4199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1705491575; bh=Y6yagZ5ih8egqq7xxEquevFbzsP2CT/EmZUGl8mWJWk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=W1W091IpUB2oqepX+RJLR6267AzYvgGk587wPAA5omc/BI22idcpz9gNPsGnuy6px
	 Yu+PA1n7McUmKcGfW4hUfFB9XhpqQ2ltrJMqJdYNio8nqdOnjUOUsONWYoBEGXDjKj
	 VWjw8N98OzkflddLqMIll0zSQjrbvn5tqA2DHWwMHh/gdw0fEch4+Xsw0bLBkNmcA7
	 82L9aE6N2jRFuJTSARx77MnCVp9wQGl6Sp0xfXKABPy4oV4rCyJD/6Xoka/J0K61Qp
	 QXwJHBTpuD9xlT8Zn+L8Ji6T4GV6QyH+3cmBlcGA1NcNxKi1Nk3vlex5w8ut+Cr5A7
	 KWmspLPRb28Xw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OpneptPn2OLp; Wed, 17 Jan 2024 06:39:35 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 676459C3290;
	Wed, 17 Jan 2024 06:39:35 -0500 (EST)
From: paul.leguendekerneizon@savoirfairelinux.com
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver][PATCH 2/2] cockpit: remove occurences of machines package
Date: Wed, 17 Jan 2024 12:39:11 +0100
Message-Id: <20240117113911.15322-3-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20240117113911.15322-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 12:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108328

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


