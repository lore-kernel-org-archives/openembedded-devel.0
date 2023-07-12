Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBE3EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 01:11:59 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3213.1689124310636793532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 18:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=K9nTamvZ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 304D186902;
	Wed, 12 Jul 2023 03:11:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1689124308;
	bh=Atazz+FIkL/14gaxSPeENgfF4h6iT3II4dEWA/19eek=;
	h=From:To:Cc:Subject:Date:From;
	b=K9nTamvZ7D8sMpaxpfAkj6Q9AG77Hmi59D+fjVVmkQn2891yPQQXigeGzr829NWg6
	 OPeBM+pIGlNqgj/DLnhTHhNobNvDjsPe39DCXc4ePmthD9JXF2kn5cdHVxpLQVQ9xe
	 wexY6VjOYLtnkqXexesviepSa/BHToAkIXt4dLKQg9mbTtnsOcsREL6Lb2vs4vzGjJ
	 HOHhZmMu4M1XENDiUV8V3A8fDFZOAML4ANAYbbgZNwntbJWQ0KXZHxbhG+ldJw3W4n
	 6iP5lvVWvN5tobVmJt4+sJfWnGAt6T8e2N2sCo7NRpyqekN0tp4h4DHWnH4IH6wagn
	 YKhM0pp/LuQIA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Christian Eggers <ceggers@arri.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Siegumfeldt <mns@gomspace.com>
Subject: [meta-oe][PATCH 1/2] libiio: update to version 0.25
Date: Wed, 12 Jul 2023 03:11:21 +0200
Message-Id: <20230712011122.105264-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 01:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103735

The version 0.25 has been released, it has not been tagged however.
Update the this version anyway.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Siegumfeldt <mns@gomspace.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recip=
es-support/libiio/libiio_git.bb
index ea51c19f4..b89ae29ea 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -4,8 +4,8 @@ SECTION =3D "libs"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7c13b3376cea0ce68d2d2da0a=
1b3a72c"
=20
-SRCREV =3D "c4498c27761d04d4ac631ec59c1613bfed079da5"
-PV =3D "0.24"
+SRCREV =3D "eee8cba6f42177a094ebe16759606a719676fda7"
+PV =3D "0.25"
=20
 SRC_URI =3D "git://github.com/analogdevicesinc/libiio.git;protocol=3Dhtt=
ps;branch=3Dmaster"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.40.1


