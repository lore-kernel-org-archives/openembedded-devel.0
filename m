Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1PPe4a-00044B-5v
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 17:37:56 +0100
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id EA6ED186DEE6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Dec 2010 17:36:30 +0100 (CET)
Received: from gonzales.localnet (ppp-188-174-74-102.dynamic.mnet-online.de
	[188.174.74.102])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS id 1D40B1C00142
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Dec 2010 17:36:31 +0100 (CET)
From: Klaus Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 6 Dec 2010 17:36:35 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.4; x86_64; ; )
References: <1291642945.3756.16.camel@mattotaupa>
In-Reply-To: <1291642945.3756.16.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201012061736.35834.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] enjoy: Fix commit 1265ac and append to `DEPENDS`.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Dec 2010 16:37:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Am Montag, 6. Dezember 2010, 14:42:25 schrieb Paul Menzel:
> Date: Mon, 6 Dec 2010 14:11:30 +0100
>=20
> With commit 1265ac =BBenjoy_svn.bb: add missing DEPENDS for the needed
> gst-plugins=AB [1] previous `DEPENDS` assignment was discarded and task
> `configure` failed with the following error.
>=20
>         checking pkg-config is at least version 0.9.0... yes
>         checking for EDBUS... configure: error: Package requirements
> (edbus) were not met:
>=20
>         No package 'edbus' found
>=20
>         Consider adjusting the PKG_CONFIG_PATH environment variable if you
>         installed software in a non-standard prefix.
>=20
>         Alternatively, you may set the environment variables EDBUS_CFLAGS
>         and EDBUS_LIBS to avoid the need to call pkg-config.
>         See the pkg-config man page for more details.
>=20
>         ERROR: Function do_configure failed
>=20
> This patch fixes the error above and is tested using the following
> configurations.
>=20
>         Build Configuration:
>         BB_VERSION        =3D "1.10.0"
>         METADATA_BRANCH   =3D "org.openembedded.dev"
>         METADATA_REVISION =3D "2bd4f33"
>         TARGET_ARCH       =3D "arm"
>         TARGET_OS         =3D "linux-gnueabi"
>         MACHINE           =3D "beagleboard"
>         DISTRO            =3D "angstrom"
>         DISTRO_VERSION    =3D "next"
>         TARGET_FPU        =3D "hard"
>=20
>         Build Configuration:
>         BB_VERSION        =3D "1.10.0"
>         METADATA_BRANCH   =3D "org.openembedded.dev"
>         METADATA_REVISION =3D "fa3f861"
>         TARGET_ARCH       =3D "arm"
>         TARGET_OS         =3D "linux-gnueabi"
>         MACHINE           =3D "beagleboard"
>         DISTRO            =3D "minimal"
>         DISTRO_VERSION    =3D "dev-snapshot-20101206"
>         TARGET_FPU        =3D "hard"
>=20
> [1]
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1265ac068=
aa9
> f5bf0d8fee2cfbf8a1492cabe5a3
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
>  recipes/e17/enjoy_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/e17/enjoy_svn.bb b/recipes/e17/enjoy_svn.bb
> index bd1c659..20c9c63 100644
> --- a/recipes/e17/enjoy_svn.bb
> +++ b/recipes/e17/enjoy_svn.bb
> @@ -3,9 +3,9 @@ LICENSE =3D "LGPLv3"
>  DEPENDS =3D "evas ecore edje emotion lightmediascanner"
>  SRCREV =3D "${EFL_SRCREV}"
>  PV =3D "0.0+svnr${SRCPV}"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> -DEPENDS =3D "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '=
1',
> '', 'gst-plugins-ugly', d)}" +DEPENDS +=3D "gst-plugins-good
> ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
>=20
>  #1st needed for all formats
>  #2nd needed for mp3 playback

Duhh. I'm a blind man :/ Thanks for fixing :-)

=2D-=20
Klaus 'mrmoku' Kurzmann


