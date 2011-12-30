Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgcBd-0007KT-JW
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 14:07:53 +0100
Received: by eeit10 with SMTP id t10so8668798eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z4RIq1cSazevqZmPUV8BPBA1N/R5S79K64cEkEYQUEQ=;
	b=f/B5BuNmY1NSaVQMhUSw+HdKYkBXonfhSBiS02HGMy2w9sIdhcxLeSKzBCsT1n2SFY
	6dLqvfLbP0evNIXMfbWUHpYi+MZ6FWtYRUsCUBnjzyQrz0WJUqtVFcoddVQjnN2Jz8Ky
	dkDtltJOPzkPeZX9FNSW//T74ZXpGPyneP6Yo=
Received: by 10.213.3.201 with SMTP id 9mr8046983ebo.45.1325250029179;
	Fri, 30 Dec 2011 05:00:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm147520564eef.2.2011.12.30.05.00.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 05:00:28 -0800 (PST)
Date: Fri, 30 Dec 2011 14:00:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230130026.GH16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <06b8fd4ed68ad3e735b54d661f66737048ce9597.1325248824.git.otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 3/3] task-x11: use xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 13:07:53 -0000
X-Groupsio-MsgNum: 36314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwxaKO075aXzzOz0"
Content-Disposition: inline

--RwxaKO075aXzzOz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 12:40:56PM +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-core/tasks/task-x11_1.0.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-core/tasks/task-x11_1.0.bb b/meta-oe/recipes=
-core/tasks/task-x11_1.0.bb
> index 67ff93b..af92e49 100644
> --- a/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> +++ b/meta-oe/recipes-core/tasks/task-x11_1.0.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The X Window System -- install this task=
 to get a client/server b
>  SECTION =3D "x11/server"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> -PR =3D "r9"
> +PR =3D "r10"
> =20
>  inherit task
> =20
> @@ -17,7 +17,7 @@ RRECOMMENDS_${PN} =3D "\
>  VIRTUAL-RUNTIME_xserver_common ?=3D "xserver-common"
> =20
>  # elsa, xserver-nodm-init
> -VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init"
> +VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init-systemd"

There are still people not using systemd _only_ and I belive that this
change drops sysvinit script completely (xserver-nodm-init-systemd
correctly doesn't rdepend on xserver-nodm-init, because is using only
xinit and xserver-common provider).

You can add both like=20
VIRTUAL-RUNTIME_graphical_init_manager ?=3D "xserver-nodm-init xserver-nodm=
-init-systemd"
but that would make xserver-nodm-init-systemd separation not so usefull.
So I think that xserver-nodm-init-systemd should be added to
VIRTUAL-RUNTIME_graphical_init_manager only by distribution config or
only to some task-* used to build systemd images (I'm using
task-shr-systemd_1.0.bb for that).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RwxaKO075aXzzOz0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79teoACgkQN1Ujt2V2gBz0awCfTWNcaffBM4T0vsGauUx81jCH
HxAAn1aOxYmxARNQpV2k6DC0JILX8Oym
=URma
-----END PGP SIGNATURE-----

--RwxaKO075aXzzOz0--
