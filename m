Return-Path: <serosh.deljam@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E821AC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 18:06:34 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.20483.1753207589140086565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 11:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=FQvyVP3N;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: serosh.deljam@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 29A1F3D85665
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 14:06:28 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id CPzyIcFlVOPy; Tue, 22 Jul 2025 14:06:27 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B109B3D8763C;
	Tue, 22 Jul 2025 14:06:27 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B109B3D8763C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1753207587; bh=sN+P728lMBXMnj3qKfXDDwBb8YsVA3GcSObwXFyl37s=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=FQvyVP3NgsxRYQV1tGmDrmhQuswbiyX8+HuonMe5wAVpNBjiaHqno1Pw8WExmZvKS
	 tSO3NSFS7l83bHT7gFvTatXDT8B8YTynwU8ELgyTyYdOWjZ8vt7TQsloTDxV5kKofn
	 u3zfmiCPqubMMi7zgj/Ob1fIbaLNHP22XCuMQjVpnx7LmroSYzVMuysPZq4IJMFCSv
	 6+9noav1bcyjODcmyXRIXFdg2GMtsSoSaRzLZNmzf2P7hwUxHYKSeQbbv/FZNHSjQq
	 qtZotbb/tdDO8P8hmtZAWWvg3kzbrCNVb99ARQfylp1Op3NbMzaRZakLlBsTBu5Bo1
	 jy9AJIzNUclzQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rs7eM3tPSj_g; Tue, 22 Jul 2025 14:06:27 -0400 (EDT)
Received: from sdeljam-pc.mtl.sfl (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 90B6A3D85665;
	Tue, 22 Jul 2025 14:06:27 -0400 (EDT)
From: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
Subject: [meta-oe][PATCH] cukinia: upgrade 0.7.0 -> 0.8.0
Date: Tue, 22 Jul 2025 14:06:26 -0400
Message-ID: <20250722180626.579781-1-serosh.deljam@savoirfairelinux.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 18:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118705

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


