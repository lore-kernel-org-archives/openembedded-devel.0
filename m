Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7FB6F19F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:29:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,504,1389740400"; d="scan'208";a="41410572"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 19 Feb 2014 11:29:33 +0100
Received: from COSNADEXC11.usr.ingenico.loc (10.31.4.211) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 19 Feb 2014 11:29:32 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC11.usr.ingenico.loc ([10.31.4.211]) with mapi id
	14.02.0328.009; Wed, 19 Feb 2014 11:29:33 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] bash-completion: fix 'files already exist'
	WARNING	message
Thread-Index: AQHPKYoBCxOLZda8FE2zpMPVC5g6qJq8Z7aA
Date: Wed, 19 Feb 2014 10:29:32 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B575425A8@COSNADEXC13.usr.ingenico.loc>
References: <1392384763-2300-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1392384763-2300-1-git-send-email-Matthieu.Crapet@ingenico.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH] bash-completion: fix 'files already exist' WARNING	message
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2014 10:29:35 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Oops forgot Signed-off line, should I repost it ?

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Matthieu Crapet
Envoy=E9=A0: vendredi 14 f=E9vrier 2014 14:33
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: [oe] [PATCH] bash-completion: fix 'files already exist' WARNING m=
essage

Some bash completion commands are already provided by util-linux recipe.
Also disable parallel build because "symlinks" rule is buggy (see completio=
ns/Makefile.am).
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 10 ++++++=
++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb=
 b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index 411b9b7..014d122 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -5,6 +5,8 @@ BUGTRACKER =3D "https://alioth.debian.org/projects/bash-com=
pletion/"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bb=
e"
=20
+PR =3D "r1"
+
 SECTION =3D "console/utils"
=20
 SRC_URI=3D"http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar=
.bz2"
@@ -12,11 +14,19 @@ SRC_URI=3D"http://bash-completion.alioth.debian.org/fil=
es/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] =3D "0d903f398be8c8f24bc5ffa6f86127f8"
 SRC_URI[sha256sum] =3D "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9=
393a5852af5804"
=20
+PARALLEL_MAKE =3D ""
+
 inherit allarch autotools
=20
 do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
 	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_comple=
tion
+
+	# Delete files already provided by util-linux
+	local i
+	for i in cal dmesg hwclock ionice look renice rtcwake; do
+		rm ${D}${datadir}/${BPN}/completions/$i
+	done
 }
=20
 RDEPENDS_${PN} =3D "bash"
--=20
1.8.5.4

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

