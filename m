Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627B9C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 23:43:25 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2283.1652398989820972112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 16:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88A0440CE7
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHnYehQMPTsn
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6DE0040CE8
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 23:43:08 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2CF41174931
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 19:43:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH 3/3] devmem2: update SRC_URI according to redirect
Date: Thu, 12 May 2022 23:43:07 +0000
Message-Id: <20220512234307.1189721-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512234307.1189721-1-denis@denix.org>
References: <20220512234307.1189721-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 23:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97085

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

http://www.free-electrons.com now redirects to https://bootlin.com

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes=
-support/devmem2/devmem2.bb
index ba7aad8ab..70d413521 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,7 +3,7 @@ LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://devmem2.c;endline=3D38;md5=3Da9eb9f38903845=
19f435aedf986297cf"
 PR =3D "r7"
=20
-SRC_URI =3D "http://www.free-electrons.com/pub/mirror/devmem2.c;download=
filename=3Ddevmem2-new.c \
+SRC_URI =3D "https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=3D=
devmem2-new.c \
            file://devmem2-fixups-2.patch;apply=3Dyes;striplevel=3D0 \
            file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-fo=
r-6.patch \
            file://0001-devmem2-support-different-page-sizes-at-run-time.=
patch \
--=20
2.25.1


