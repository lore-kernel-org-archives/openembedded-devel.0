Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 64C2D6F60E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 08:41:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,606,1389740400"; d="scan'208";a="42293492"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 07 Mar 2014 09:41:23 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 7 Mar 2014 09:41:23 +0100
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.243]) by
	COSNADEXC12.usr.ingenico.loc ([10.31.4.212]) with mapi id
	14.02.0328.009; Fri, 7 Mar 2014 09:41:22 +0100
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] bash-completion: remove allarch
Thread-Index: AQHPOV46nBScCo3iOUiYSuuUC46eEZrVTvPg
Date: Fri, 7 Mar 2014 08:41:21 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050B57548165@COSNADEXC13.usr.ingenico.loc>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Fri, 07 Mar 2014 08:41:23 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Does it mean that " allarch " is incompatible with "autotools" ? Is this tr=
ue for all recipes?

M

-----Message d'origine-----
De=A0: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedd=
ed-devel-bounces@lists.openembedded.org] De la part de Martin Jansa
Envoy=E9=A0: jeudi 6 mars 2014 18:05
=C0=A0: openembedded-devel@lists.openembedded.org
Objet=A0: [oe] [meta-oe][PATCH] bash-completion: remove allarch

* it has runtime dependency on TUNE_PKGARCH bash, so it cannot be allarch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb=
 b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
index ad7fd28..155fe90 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "e5a490a4301dfb228361bdca2ffca5979=
58e47dd6056005ef9393a5852
=20
 PARALLEL_MAKE =3D ""
=20
-inherit allarch autotools
+inherit autotools
=20
 do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
--=20
1.9.0

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

