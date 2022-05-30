Return-Path: <jubalh@iodoru.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598CAC433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 12:39:50 +0000 (UTC)
Received: from mail.desaster-games.net (mail.desaster-games.net
 [176.9.84.136])
 by mx.groups.io with SMTP id smtpd.web12.36536.1653914389319198835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 05:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: iodoru.org, ip: 176.9.84.136,
 mailfrom: jubalh@iodoru.org)
Received: from localhost (localhost [127.0.0.1])
	by mail.desaster-games.net (Postfix) with ESMTP id BD2B920006;
	Mon, 30 May 2022 14:39:46 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
	by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U814wYPCc+zk; Mon, 30 May 2022 14:39:33 +0200 (CEST)
Received: from linux-es2v.dns1.suse.de (unknown [81.95.8.244])
	by mail.desaster-games.net (Postfix) with ESMTPSA id 3415D95A3;
	Mon, 30 May 2022 14:39:24 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Vetter <jubalh@iodoru.org>
Subject: [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 3.0.3
Date: Mon, 30 May 2022 14:39:22 +0200
Message-Id: <20220530123922.7311-2-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220530123922.7311-1-jubalh@iodoru.org>
References: <20220530123922.7311-1-jubalh@iodoru.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 12:39:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97330

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 .../jasper/{jasper_2.0.33.bb =3D> jasper_3.0.33.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_2.0.33.bb =3D> jasper_3.0=
.33.bb} (93%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/r=
ecipes-graphics/jasper/jasper_3.0.33.bb
similarity index 93%
rename from meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
rename to meta-oe/recipes-graphics/jasper/jasper_3.0.33.bb
index 4c17105a9..87608b231 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_3.0.33.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da80440d1d8f17d041c71c7271d6e0=
6eb"
=20
 SRC_URI =3D "git://github.com/jasper-software/jasper.git;protocol=3Dhttp=
s;branch=3Dmaster"
-SRCREV =3D "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
+SRCREV =3D "020ec588d59d6ef13aef73aa0d86343ddda600b5"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.31.1


