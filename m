Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75D9C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:05:01 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.7858.1740490387141066333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:33:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=VqZTeyw4;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: paul.leguendekerneizon@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 75CA89C12F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 08:33:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ROjUbbOIfmfh; Tue, 25 Feb 2025 08:33:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 151399C89E5;
	Tue, 25 Feb 2025 08:33:06 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 151399C89E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1740490386; bh=GmHTw9TYLEQV2ALZ3a69l81Wh3nL1jxKN++xcck+HFk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=VqZTeyw4kQTYQoTC4aG4jYW1P9cbzdLXXNFYs9HQCDLHDuzpsrXYEFdCZl7gWKP2d
	 fuLkIAtk5gJmM9xVQmTlA9uo/J350fURI9W2WKZZ5HB01gYZXRTzDdD1jKheCakS6b
	 +xqfCwATAJyR6Q0Y6k5yhLptmqYE0UPd9b497FKRYfixF/pVHJS0cDiiKyaSd0BMMn
	 Likr/0LZ94c1ETbwWNOQp4uzFnlITPEHHcxdzsXJGkgYquWOD1Q/nacjMgMttiu9No
	 LGcE3ylPMaPF9dGY0qbZNEoLMgzylAhiw8/usvsn4wFZex4zFrJwL0Nhd5a2pb3htu
	 91kpvgpdoEA3Q==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id t2Jx8yh29aUh; Tue, 25 Feb 2025 08:33:06 -0500 (EST)
Received: from pleguen-ThinkPad-P14s-Gen-2a.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 9D4C19C12F2;
	Tue, 25 Feb 2025 08:33:05 -0500 (EST)
From: "Paul Le Guen de Kerneizon" <paul.leguendekerneizon@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfairelinux.com>
Subject: [meta-webserver]PATCH 1/1] cockpit: remove deprecated packages
Date: Tue, 25 Feb 2025 14:32:51 +0100
Message-Id: <20250225133251.33993-2-paul.leguendekerneizon@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225133251.33993-1-paul.leguendekerneizon@savoirfairelinux.com>
References: <20250225133251.33993-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115580

This commit removes from the recipe the following deprecated packages:
- `cockpit-docker`: cockpit project no longer supports Docker since versi=
on 228
  [1]
- `cockpit-machines`: cockpit-machines is now provided in a dedicated
  repository [2], and code base has been removed since version 242 [3]

[1]: https://cockpit-project.org/blog/cockpit-228.html
[2]: https://github.com/cockpit-project/cockpit-machines
[3]: https://cockpit-project.org/blog/cockpit-242.html

Signed-off-by: Paul Le Guen de Kerneizon <paul.leguendekerneizon@savoirfa=
irelinux.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/met=
a-webserver/recipes-webadmin/cockpit/cockpit_304.bb
index 98a5aef680..edd51bc671 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -60,10 +60,8 @@ PACKAGES =3D+ " \
     ${PN}-sosreport \
     ${PN}-storaged \
     ${PN}-networkmanager \
-    ${PN}-machines \
     ${PN}-selinux \
     ${PN}-playground \
-    ${PN}-docker \
     ${PN}-dashboard \
     ${PN}-packagekit \
     ${PN}-apps \
@@ -103,19 +101,11 @@ FILES:${PN}-networkmanager =3D " \
 "
 RDEPENDS:${PN}-networkmanager =3D "networkmanager"

-FILES:${PN}-machines =3D " \
-    ${datadir}/cockpit/machines \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-machines.metainfo.xm=
l \
-"
 FILES:${PN}-selinux =3D " \
     ${datadir}/cockpit/selinux \
     ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.xml=
 \
 "
 FILES:${PN}-playground =3D "${datadir}/cockpit/playground"
-FILES:${PN}-docker =3D " \
-    ${datadir}/cockpit/docker \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-docker.metainfo.xml =
\
-"
 FILES:${PN}-dashboard =3D "${datadir}/cockpit/dashboard"
 ALLOW_EMPTY:${PN}-dashboard =3D "1"

--
2.34.1

