Return-Path: <hroussille@adeneo-embedded.com>
Received: from smtp.adetelgroup.com (smtp.adetelgroup.com [94.247.26.71])
	by mail.openembedded.org (Postfix) with ESMTP id 097DE600B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 11:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.adetelgroup.com (Postfix) with ESMTP id 3F7E941DF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 13:41:30 +0200 (CEST)
Received: from smtp.adetelgroup.com ([127.0.0.1])
	by localhost (hbg-pa71.hmc-pa.adm [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6KPfp_jL10kt
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 13:41:30 +0200 (CEST)
Received: from hbg-pa74.hmc-pa.adm (unknown [10.210.21.3])
	by smtp.adetelgroup.com (Postfix) with ESMTP id 29ADD41DF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 13:41:30 +0200 (CEST)
Date: Wed, 27 May 2015 13:41:30 +0200 (CEST)
From: ROUSSILLE Hector <hroussille@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <746866001.144064.1432726890076.JavaMail.zimbra@adeneo-embedded.com>
In-Reply-To: <5565AC43.6070406@mlbassoc.com>
References: <1432725212-14933-1-git-send-email-hroussille@adeneo-embedded.com>
	<5565AC43.6070406@mlbassoc.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.6.0_GA_1169 (ZimbraWebClient - FF37 (Linux)/8.6.0_GA_1169)
Thread-Topic: Adding support for directFB to mplayer2 recipe
Thread-Index: usIyzd37f3wNNp2tP48WkOYBarr8fQ==
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] Adding support for directFB to mplayer2 recipe
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
X-List-Received-Date: Wed, 27 May 2015 11:41:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I Thought the PACKAGECONFIG option was enough, well that's the answer i had=
 on the IRC=20


De: "Gary Thomas" <gary@mlbassoc.com>=20
=C3=80: openembedded-devel@lists.openembedded.org=20
Envoy=C3=A9: Mercredi 27 Mai 2015 13:36:35=20
Objet: Re: [oe] [PATCH] Adding support for directFB to mplayer2 recipe=20

On 2015-05-27 05:13, Hector Roussille wrote:=20
> Signed-off-by: Hector Roussille <hroussille@adeneo-embedded.com>=20
> ---=20
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 3 ++-=20
> 1 file changed, 2 insertions(+), 1 deletion(-)=20
>=20
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe=
/recipes-multimedia/mplayer/mplayer2_git.bb=20
> index 5b0e1de..b208144 100644=20
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=20
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=20
> @@ -121,6 +121,7 @@ PACKAGECONFIG[postproc] =3D ",--disable-libpostproc,l=
ibpostproc"=20
> PACKAGECONFIG[vorbis] =3D ",--disable-libvorbis,libvorbis"=20
> PACKAGECONFIG[portaudio] =3D ",--disable-portaudio,portaudio-v19"=20
> PACKAGECONFIG[mpg123] =3D ",--disable-mpg123,mpg123"=20
> +PACKAGECONFIG[directfb] =3D "--enable-directfb,--disable-directfb,direct=
fb"=20
>=20
> FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -fr=
ename-registers -O4 -ffast-math"=20
> BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"=20
> @@ -134,7 +135,7 @@ do_configure() {=20
> sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure=20
> sed -i 's|_install_strip=3D"-s"|_install_strip=3D""|g' ${S}/configure=20
> sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile=20
> -=20
> + sed -i 's|extra_cflags=3D"-I. $extra_cflags"|extra_cflags=3D"-I. -I${ST=
AGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure=20
> export SIMPLE_TARGET_SYS=3D"$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}=
::g)"=20
> ./configure ${EXTRA_OECONF}=20
>=20

Shouldn't this at least be conditional on directfb support in=20
DISTRO_FEATURES? It won't do much good to enable it in this=20
recipe if the rest of the system isn't using directfb as well.=20

--=20
------------------------------------------------------------=20
Gary Thomas | Consulting for the=20
MLB Associates | Embedded world=20
------------------------------------------------------------=20
--=20
_______________________________________________=20
Openembedded-devel mailing list=20
Openembedded-devel@lists.openembedded.org=20
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=20

