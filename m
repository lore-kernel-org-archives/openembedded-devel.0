Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD359C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 17:03:35 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.225])
 by mx.groups.io with SMTP id smtpd.web11.121647.1719162204773873294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jun 2024 10:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=X8M//ZKU;
 spf=pass (domain: freemail.hu, ip: 46.107.16.225, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4W6cqY5yWmz5xv;
	Sun, 23 Jun 2024 19:03:21 +0200 (CEST)
From: egyszeregy@freemail.hu
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [meta-oe][master][scarthgap][PATCH] tree: fix broken links
Date: Sun, 23 Jun 2024 19:03:11 +0200
Message-ID: <20240623170311.1504-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1719162202;
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jun 2024 17:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110997

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=1206; bh=Ke2TmVinFfnyAHgidfu7y+4I7YFV2foXJ+eca1cmPFA=;

	b=X8M//ZKUnHER658jxg/M1OqFG7uE+IZuaawAiXUeQtQMSuU58rmuIqQx7+j8rBLT

	7XzNDMlAO3VUEVze4WRcaWPfekHh2//UeO1avsoGVUEOY3YnVkNs2FcSIWqpV7njvKd

	+oXtLpFNyeRAsN6LwbooCO9brrniBROd5/XfQUbzFP2BV27+upS7eNaRAXYI732qOve

	FijTd2+uSohWJvjg01DVWhVsnEDZ0BOpAXe8og+k1vl2E4qgMkkRGXUbgTQjPZKJAgo

	bO2Iy/rDiJvVd8vd7M+5uJwCqgS1VlLzQiv1evfZHN3xPK8k2cKFcuckNw7nny/ThI2

	znfw1K3NZA==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

New tarball location is:
http://oldmanprogrammer.net/tar/tree/

Homepage is:
http://oldmanprogrammer.net/source.php?dir=3Dprojects/tree

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta-oe/recipes-support/tree/tree_2.1.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/tree/tree_2.1.1.bb b/meta-oe/recipes=
-support/tree/tree_2.1.1.bb
index 0b6114960..1eaea6a22 100644
--- a/meta-oe/recipes-support/tree/tree_2.1.1.bb
+++ b/meta-oe/recipes-support/tree/tree_2.1.1.bb
@@ -1,10 +1,10 @@
 SUMMARY =3D "A recursive directory listing command"
-HOMEPAGE =3D "http://mama.indstate.edu/users/ice/tree/"
+HOMEPAGE =3D "https://oldmanprogrammer.net/source.php?dir=3Dprojects/tre=
e"
 SECTION =3D "console/utils"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f=
833"
=20
-SRC_URI =3D "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
+SRC_URI =3D "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
 SRC_URI[sha256sum] =3D "d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab=
60a49d8367ab90d5"
=20
 # tree's default CFLAGS for Linux
--=20
2.45.2.windows.1


