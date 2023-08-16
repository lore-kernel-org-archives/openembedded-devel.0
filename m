Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A073C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 07:37:57 +0000 (UTC)
Received: from 7.mo581.mail-out.ovh.net (7.mo581.mail-out.ovh.net [46.105.43.131])
 by mx.groups.io with SMTP id smtpd.web11.155812.1692171475018739069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 00:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 46.105.43.131, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.156.41])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id E1A2B2654C
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 07:37:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kr8sf (unknown [10.110.115.222])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5F46C1FECF;
	Wed, 16 Aug 2023 07:37:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
	by ghost-submission-6684bf9d7b-kr8sf with ESMTPSA
	id CoAECNB83GTLWAAA7GwM1w
	(envelope-from <tymoteusz.burak@3mdeb.com>); Wed, 16 Aug 2023 07:37:52 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-105G00611b484db-2790-4435-ada6-35a99bd5c46b,
                    C01A98C016A9AA6442186A814A8EC09D4D6C7996) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH] ttf-google-fira: add recipe
Date: Wed, 16 Aug 2023 09:37:25 +0200
Message-ID: <20230816073725.9331-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8993688456024608921
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedruddtkedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfihmhhothgvuhhsiicuuehurhgrkhcuoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedukedtgeejieefjeffgffhveegheeukeeutdegtddviefffedtkeevvedtfeefgeenucffohhmrghinhepghhoohhglhgvrdgtohhmpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 07:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104415

---
 .../ttf-fonts/ttf-google-fira.bb              | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
new file mode 100644
index 000000000000..b330f40387bb
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -0,0 +1,54 @@
+SUMMARY =3D "Google Fira Fonts- TTF Edition"
+HOMEPAGE =3D "https://fonts.google.com/?query=3Dfira"
+LICENSE =3D "OFL-1.1"
+LIC_FILES_CHKSUM =3D " \
+    file://${S}/firamono/OFL.txt;md5=3D0373cf792d4b95c61399b94c02702892 =
\
+    file://${S}/firacode/OFL.txt;md5=3Dc75ca55aa0a5809a854d87db2a8ebf23 =
\
+    file://${S}/firasans/OFL.txt;md5=3Dde28deb2f8c1f23fd4d6918113ac3ddd =
\
+    file://${S}/firasanscondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d69181=
13ac3ddd \
+    file://${S}/firasansextracondensed/OFL.txt;md5=3Dde28deb2f8c1f23fd4d=
6918113ac3ddd \
+"
+SRCREV =3D "47a6c224b3e0287b2e48e3ffef8c9ce2ca4931f4"
+
+SRC_URI =3D "git://github.com/google/fonts.git;protocol=3Dhttps;branch=3D=
main;subpath=3Dofl/firamono \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firacode \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasans \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed"
+
+S =3D "${WORKDIR}"
+
+do_install:append() {
+    install -d ${D}${datadir}/fonts/truetype/
+    find ${S} -path 'fira*/*.tt[cf]' -exec install -m 0644 {} ${D}${data=
dir}/fonts/truetype/{} \;
+    install -D -m 0644 ${S}/firamono/OFL.txt ${D}${datadir}/licenses/${P=
N}mono/OFL.txt
+    install -D -m 0644 ${S}/firacode/OFL.txt ${D}${datadir}/licenses/${P=
N}code/OFL.txt
+    install -D -m 0644 ${S}/firasans/OFL.txt ${D}${datadir}/licenses/${P=
N}sans/OFL.txt
+    install -D -m 0644 ${S}/firasanscondensed/OFL.txt ${D}${datadir}/lic=
enses/${PN}sanscondensed/OFL.txt
+    install -D -m 0644 ${S}/firasansextracondensed/OFL.txt ${D}${datadir=
}/licenses/${PN}sansextracondensed/OFL.txt
+}
+
+PACKAGES =3D+ "${PN}-mono ${PN}-code ${PN}-sans ${PN}-sanscondensed ${PN=
}-sansextracondensed"
+
+FILES:${PN}-mono +=3D " \
+                    ${datadir}/fonts/truetype/FiraMono* \
+                    ${datadir}/licenses/${PN}mono/OFL.txt \
+                "
+FILES:${PN}-code +=3D " \
+                    ${datadir}/fonts/truetype/FiraCode* \
+                    ${datadir}/licenses/${PN}code/OFL.txt \
+                "
+FILES:${PN}-sans +=3D " \
+                    ${datadir}/fonts/truetype/FiraSans-* \
+                    ${datadir}/licenses/${PN}sans/OFL.txt \
+                "
+FILES:${PN}-sanscondensed +=3D " \
+                            ${datadir}/fonts/truetype/FiraSansCondensed-=
* \
+                            ${datadir}/licenses/${PN}sanscondensed/OFL.t=
xt \
+                        "
+FILES:${PN}-sansextracondensed +=3D " \
+                                    ${datadir}/fonts/truetype/FiraSansEx=
traCondensed-* \
+                                    ${datadir}/licenses/${PN}sansextraco=
ndensed/OFL.txt \
+                                 "
+
+require ttf.inc
--=20
2.41.0


