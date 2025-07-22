Return-Path: <serosh.deljam@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C53C83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:48:34 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.20182.1753206505954157879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=AIUjDJW5;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: serosh.deljam@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 244963D85665
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 13:48:25 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id LHza-fahje5J; Tue, 22 Jul 2025 13:48:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A9F313D85870;
	Tue, 22 Jul 2025 13:48:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A9F313D85870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1753206504; bh=sN+P728lMBXMnj3qKfXDDwBb8YsVA3GcSObwXFyl37s=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=AIUjDJW57joy5GURwhUMSovZKw9+gU5xspl+4SPhL+9XFazsMf/GfmQ10a5LwStXy
	 bf9g8xmoeNC5MOkR/EF/ZUK3+gVGnu6bomqMJbPw9qFZfWQYmQy2+g49jSWPIcOLIO
	 Q4QHcs6y/Dini5z0w52wr1p+BG7GggbF08XmplnVlo1Jq23sy4KC8LfmSSY/63lBg/
	 KT5qT5ioHS4Z2aSGCgT0TsTvImH/TTeCRPrAW593R0v+Ema5k6jhZ92FdAih8GIBqi
	 J6VFGb1+fDkfq7Ok91fV3mPAcL3flHZiOND3LT5fFrjl/Ea83ZV57I1jwPMfmBpoEV
	 ikflg8GiRiqrg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id O7rRVOpqbFtB; Tue, 22 Jul 2025 13:48:24 -0400 (EDT)
Received: from sdeljam-pc.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8BC603D85665;
	Tue, 22 Jul 2025 13:48:24 -0400 (EDT)
From: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
Subject: [PATCH] cukinia: upgrade 0.7.0 -> 0.8.0
Date: Tue, 22 Jul 2025 13:48:07 -0400
Message-ID: <20250722174807.559984-1-serosh.deljam@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118704

Signed-off-by: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
---
 .../recipes-test/cukinia/{cukinia_0.7.0.bb =3D> cukinia_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.7.0.bb =3D> cukinia_0.8.0=
.bb} (91%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb b/meta-oe/reci=
pes-test/cukinia/cukinia_0.8.0.bb
similarity index 91%
rename from meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.8.0.bb
index ad545e627b..2984d9a426 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.7.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a36=
4313df4b21ef20c29e"
=20
 SRC_URI =3D "git://github.com/savoirfairelinux/cukinia.git;protocol=3Dht=
tps;branch=3Dmaster"
=20
-SRCREV =3D "be56f653743cc0e68bef81ef35df7c50ff8919c4"
+SRCREV =3D "bacdc5437aeae25099b0271231ec8b277e0caed9"
=20
=20
 RRECOMMENDS:${PN} =3D "libgpiod-tools"
--=20
2.43.0


