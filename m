Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D1EC4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 17:50:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.77225.1698601852741941224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Oct 2023 10:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=JKGShsVS;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 430E287082;
	Sun, 29 Oct 2023 18:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698601850;
	bh=02DJOzsbDj/SUrpCkJHchOfjfZep+NIfaWUSO/aR8u8=;
	h=From:To:Cc:Subject:Date:From;
	b=JKGShsVSPXVLns9jsVz4n6b+/6g8Swv8Um/lW7lx0hGFTqBxWvMzVtE3bnANqscwY
	 LmpX4vGSAz9+3rrLJ7vM/lbmi0XLXK6uG9bREOjzj7Gsv3np28awV4IxGLMSAvsS60
	 ZkamRucc/uI+0eJR9BFn4HccQ5EjyqMjMr4fr1KdOqOOLDKT7Q6kswZs8FujQFK49Z
	 bXrmwN1az5mfQqpWfmsvnzGkbH69l2Dz7Z7cYthvKmR+GRj8foACLxADno6q6VaD/A
	 XzQdMWs/rrJGCt3Jb3XUdEWKRuFlNyLcYkcpbOBaYU+mi5SWJo5F3JhbOh7j8HWo0y
	 QNbrOa4+tbXjw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] libiio: use main branch instead of master
Date: Sun, 29 Oct 2023 18:50:30 +0100
Message-ID: <20231029175033.154144-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Oct 2023 17:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105788

From: Martin Jansa <martin.jansa@gmail.com>

* the branch was renamed upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
index 0892a3693..8fbe47448 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376c=
ea0ce68d2d2da0a1b3a72c"
 SRCREV =3D "5f5af2e417129ad8f4e05fc5c1b730f0694dca12"
 PV =3D "0.19+git${SRCPV}"
=20
-SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmaster"
+SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmain"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${WORKDIR}/git"
--=20
2.42.0


