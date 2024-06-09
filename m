Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF991C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 19:55:06 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4084.1717962904584430902
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 12:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id 896B628B97
	for <openembedded-devel@lists.openembedded.org>; Sun,  9 Jun 2024 21:55:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.230]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGOd4-16PbOb0; Sun, 9 Jun 2024 21:55:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdbd-mysql-perl: update 4.050 -> 5.006
Date: Sun,  9 Jun 2024 21:55:37 +0200
Message-ID: <20240609195537.743209-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717962902-4FFC9D42-BF6C78E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 76ccd795-160e-4f6f-8c9e-99a913c640f1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 19:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110786

- add workaround for incompatible-pointer-types
  [https://github.com/perl5-dbi/DBD-mysql/issues/430]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libdbd-mysql-perl_4.050.bb =3D> libdbd-mysql-perl_5.006.bb}  | 2 ++
 1 file changed, 2 insertions(+)
 rename meta-oe/recipes-devtools/perl/{libdbd-mysql-perl_4.050.bb =3D> li=
bdbd-mysql-perl_5.006.bb} (95%)

diff --git a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb b/m=
eta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
similarity index 95%
rename from meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
rename to meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
index fc505fe1e..7e215847d 100644
--- a/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb
+++ b/meta-oe/recipes-devtools/perl/libdbd-mysql-perl_5.006.bb
@@ -19,4 +19,6 @@ SRC_URI =3D "git://github.com/perl5-dbi/DBD-mysql.git;p=
rotocol=3Dhttps;branch=3Dmaster
=20
 S =3D "${WORKDIR}/git"
=20
+CFLAGS +=3D "-Wno-incompatible-pointer-types"
+
 inherit cpan
--=20
2.45.1


