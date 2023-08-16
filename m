Return-Path: <daniil.klimuk@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37A4C001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:31:07 +0000 (UTC)
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net [46.105.63.100])
 by mx.groups.io with SMTP id smtpd.web10.156601.1692174664779260734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.63.100, mailfrom: daniil.klimuk@3mdeb.com)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.146.106])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id A135827670
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:31:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-r545w (unknown [10.110.103.249])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 373171FEB3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:31:02 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-6684bf9d7b-r545w with ESMTPSA
	id hUXlAUaJ3GQsYwEAixDqPQ
	(envelope-from <daniil.klimuk@3mdeb.com>)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:31:02 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R00216e982fb-ae05-4515-9eb3-23bc42833f16,
                    020B8163BE9521A89EE9105D1EF8E601D62BF165) smtp.auth=daniil.klimuk@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
Message-ID: <6a8f811d-0ce3-f95b-303c-a65830b0adb5@3mdeb.com>
Date: Wed, 16 Aug 2023 10:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
From: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Subject: [meta-python] [PATCH] recipes-devtools/python3-piccata: piccata - a
 simple CoAP toolkit added
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 9891593634822722709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfvhffutgfgsehtkeertddtfeejnecuhfhrohhmpeffrghnihhilhcumfhlihhmuhhkuceouggrnhhiihhlrdhklhhimhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepteetudfggeduieejleekheejhedttdfgudehhfelheettedtffelfeejkeduleeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegurghnihhilhdrkhhlihhmuhhkseefmhguvggsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104418

Author: Daniil Klimuk <daniil.klimuk@3mdeb.com>
Date:=C2=A0=C2=A0 Wed Aug 16 08:47:58 2023 +0200

 =C2=A0=C2=A0=C2=A0 recipes-devtools/python3-piccata: piccata - a simple =
CoAP toolkit added

 =C2=A0=C2=A0=C2=A0 piccata is a simple CoAP (RFC7252) toolkit compatible=
 with Python 2.7.

 =C2=A0=C2=A0=C2=A0 The toolkit provides basic building blocks for using =
CoAP in an
 =C2=A0=C2=A0=C2=A0 application. piccata handles messaging between endpoi=
nts
 =C2=A0=C2=A0=C2=A0 (retransmission, deduplication) and request/response =
matching.

 =C2=A0=C2=A0=C2=A0 Handling and matching resources, blockwise transfers,=
 etc. is left to
 =C2=A0=C2=A0=C2=A0 the application but functions to faciliate this are p=
rovided.

 =C2=A0=C2=A0=C2=A0 piccata uses a transport abstraction to faciliate usi=
ng the toolkit for
 =C2=A0=C2=A0=C2=A0 communication over different link types. Transport fo=
r a UDP socket is
 =C2=A0=C2=A0=C2=A0 provided.

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com=
>

diff --git=20
a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb=20
b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
new file mode 100644
index 000000000000..898069b600f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Python CoAP Toolkit"
+HOMEPAGE =3D "https://github.com/NordicSemiconductor/piccata"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De664eb75e2791c2e505e6e1c274e6=
d4f"
+
+SRC_URI =3D=20
"https://github.com/NordicSemiconductor/piccata/archive/refs/heads/master=
.zip"
+SRC_URI[md5sum] =3D "6d198c7a09c69ffa080e419477235bea"
+SRC_URI[sha256sum] =3D=20
"017a4836cbac1e16980add49c87e35bfd4874ed25e7aa90a5bdc280ec8263bfe"
+
+S =3D "${WORKDIR}/piccata-master"
+
+inherit setuptools3
+
+RDEPENDS:${PN} +=3D "python3-core python3-datetime python3-io=20
python3-logging python3-math"


