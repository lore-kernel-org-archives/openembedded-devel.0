Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1991C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 12:21:20 +0000 (UTC)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
 by mx.groups.io with SMTP id smtpd.web11.13044.1720614077897385831
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 05:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@3mdeb.com header.s=ovhmo3617313-selector1 header.b=jBLMIEa1;
 spf=softfail (domain: 3mdeb.com, ip: 178.33.251.80, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.23])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4WJxmC5jkvz1qcx
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:21:15 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-n9d85 (unknown [10.110.178.240])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6A5A81FEA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:21:15 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
	by ghost-submission-6684bf9d7b-n9d85 with ESMTPSA
	id jLxFCbt8jmaupgAACtcDNQ
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:21:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G004d8eda472-db84-4211-bf34-250dd6957f81,
                    FB799132E38566D80A4D61B1AA074CE58FBB4984) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 153.19.216.89
Message-ID: <d9633459-8887-4e85-ac2f-33c5b97a32b5@3mdeb.com>
Date: Wed, 10 Jul 2024 14:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Danill Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-networking][PATCH] meta-networking: recipes-support: miniocli:
 add
Autocrypt: addr=daniil.klimuk@3mdeb.com; keydata=
 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
 TIx3Est5
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 8987777483593716885
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfvffhufgtgfesthekredttddvjeenucfhrhhomhepffgrnhhilhhlucfmlhhimhhukhcuoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejgfeileeutdegveejjefhtdekgfelgfffueelgeefgeejvdelgeevheeutdeftdenucffohhmrghinhepmhhinhdrihhopdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpudehfedrudelrddvudeirdekledpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepuggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeeipdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=AICSf847sQAdJUZ83IrJDBU5iPVQZQGHoln0ZPQe/M4=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1720614075; v=1;
 b=jBLMIEa1pRByhyOzXmfg7Y/8eV3rp9xEQ+d8PRpgLqma7y/bJ71SAfs7kSY6gLJkyG489bN0
 pPNAPWWeqJosHP/CVAJI7k3pu6hrPIcR2Cmi8DDPKrXfREwp5a7EwJnLJPdrGzyxCPOfC4xbziy
 xj3/Z2kjJJxJKqA4ncRuK0qUBtLShLDiuS8pJ2tLergDUkdAlKbbWt0QJBPeFcMgXqSXJmnbU+K
 Air/Bq65w4cp2unLgd5RbcMT8b9bbEqNAPm90ZpOn4/ajp3H5G5LzSIDG6F51nBZhhNBZPUTxCB
 Qm8pkbzBtko0hoc7Nbbrcn2/aTUY0coj2p9Xj87DtoiYA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 12:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111296

Adds CLI tool to manage MinIO S3 deployments.


Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
---
 =C2=A0.../recipes-support/miniocli/miniocli_git.bb=C2=A0 | 20 ++++++++++=
+++++++++
 =C2=A01 file changed, 20 insertions(+)
 =C2=A0create mode 100644=20
meta-networking/recipes-support/miniocli/miniocli_git.bb

diff --git a/meta-networking/recipes-support/miniocli/miniocli_git.bb=20
b/meta-networking/recipes-support/miniocli/miniocli_git.bb
new file mode 100644
index 000000000000..55cf8b917146
--- /dev/null
+++ b/meta-networking/recipes-support/miniocli/miniocli_git.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Simple and fast CLI tool to manage MinIO deployments."
+HOMEPAGE =3D "https://min.io/docs/minio/linux/reference/minio-mc.html"
+SECTION =3D "net"
+
+GO_IMPORT =3D "github.com/minio/mc"
+
+inherit go-mod
+
+LICENSE =3D "AGPL-3.0"
+LIC_FILES_CHKSUM =3D=20
"file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32af"
+
+SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;branch=3Dmaster"
+SRCREV =3D "e7c9a733c680fe62066d24e8718f81938b4f6606"
+
+FILES:${PN} +=3D "${bindir}/mc"
+
+# MinIO CLI depends on getent which is a part of glibc-utils.
+RDEPENDS:${PN} =3D "glibc-utils"
+# github.com/minio/mc has some Bash scripts.
+RDEPENDS:${PN}-dev =3D "bash"
--=20
2.45.2


