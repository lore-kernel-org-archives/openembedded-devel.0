Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2664E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 21:04:44 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web10.113122.1733778278958106797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 13:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id DBA6D620D8; Mon,  9 Dec 2024 21:04:36 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-149-087.um13.pools.vodafone-ip.de [46.223.149.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id BDB9D6072A;
	Mon,  9 Dec 2024 21:04:36 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: 1.0.9 -> 1.0.10
Date: Mon,  9 Dec 2024 22:04:08 +0100
Message-Id: <20241209210408.336703-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 21:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114256

Interim release with a number of bug fixes.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 .../canopenterm/{canopenterm_1.0.9.bb =3D> canopenterm_1.0.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.9.bb =3D> c=
anopenterm_1.0.10.bb} (94%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb b/=
meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
similarity index 94%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
index d52bcc363..b15a36330 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
@@ -17,7 +17,7 @@ DEPENDS =3D "cjson libinih libsdl2 lua libsocketcan poc=
ketpy"
=20
 SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
=20
-SRCREV  =3D "fcf2a49eb1ef3ac5f5d17ac1865be6dfbd9e33d5"
+SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5


