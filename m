Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE7EEB64DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:06:58 +0000 (UTC)
Received: from 2.mo576.mail-out.ovh.net (2.mo576.mail-out.ovh.net [178.33.251.80])
 by mx.groups.io with SMTP id smtpd.web11.182902.1692263214493508106
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: 3mdeb.com, ip: 178.33.251.80, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.16.60])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id D373826A38
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:06:52 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9nbqf (unknown [10.110.103.46])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 228941FE49;
	Thu, 17 Aug 2023 09:06:51 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-9nbqf with ESMTPSA
	id oYFqOSvj3WSz5wcAPgw8pg
	(envelope-from <tymoteusz.burak@3mdeb.com>); Thu, 17 Aug 2023 09:06:51 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G001d412519a-bbd3-4d3f-85b5-47774b9c773b,
                    05FB791017C74160A0BF3C0A500D873A876168E7) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	tomasz.zyjewski@3mdeb.com
Subject: [meta-oe][PATCH v2] ttf-google-fira: add recipe
Date: Thu, 17 Aug 2023 11:06:23 +0200
Message-ID: <20230817090623.26704-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16369458746833227929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudduuddguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepudektdegjeeifeejfffghfevgeehueekuedtgedtvdeiffeftdekveevtdeffeegnecuffhomhgrihhnpehgohhoghhlvgdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheejiedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 09:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104452

Added recipe for Google Fira Fonts collection (Fira Mono, Fira Code, Fira=
 Sans, Fira Sans Condensed, Fira Sans Extra Condensed) to meta-oe. This c=
ommit introduces support for integrating the highly legible and versatile=
 Fira Fonts into the project, enhancing typographic options for user inte=
rfaces and code display.

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
---
 .../ttf-fonts/ttf-google-fira.bb              | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
new file mode 100644
index 000000000000..10047c6f7da6
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-google-fira.bb
@@ -0,0 +1,58 @@
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
+SRCREV_firamono =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firacode =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasans =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasanscondensed =3D "701bd391b1a4b3238de193a8523009ecef1be42c"
+SRCREV_firasansextracondensed =3D "701bd391b1a4b3238de193a8523009ecef1be=
42c"
+
+SRC_URI =3D "git://github.com/google/fonts.git;protocol=3Dhttps;branch=3D=
main;subpath=3Dofl/firamono;name=3Dfiramono \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firacode;name=3Dfiracode \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasans;name=3Dfirasans \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasanscondensed;name=3Dfirasanscondensed \
+           git://github.com/google/fonts.git;protocol=3Dhttps;branch=3Dm=
ain;subpath=3Dofl/firasansextracondensed;name=3Dfirasansextracondensed"
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


