Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2737147D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:48:53 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id h11so10896121wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/oCmgvO7ai5dhxHMQIJilbvj1nqalNLS6xkT88UmM/s=;
	b=p6x9Mr9n9OL8hsLnRW3Bj1JAmMUzm0PoUOyJR2G4ChLem8gMUcI6ek+7ZpUgFHN/Du
	Lh6AWOVTOdt3YvMHHNAoPm9mpC7Ar2faDIJIcAeTNq/7dGcOvoO+YqVgdh1pl6qCGtrt
	f4MSAa8ESUt2hb8piRK5tA8ogF4oNQuI4v9jAmHEKCUeRHEtDrrHPhKqcKLYy15Zguso
	8CHy7nBShj2ooAVXy3QdYl7bs5t+xeHFfHwRwoZ5BfexsgBdaKE/ND9GUBN3jkkvducD
	RQ0OaAik9YDyafQ+RWs0g++UFAtatNnGHvp9XxRFX4uK/PnvGEhhdRg2TwChT3PGtxlM
	zhnQ==
X-Received: by 10.180.182.72 with SMTP id ec8mr5778632wic.53.1422442133407;
	Wed, 28 Jan 2015 02:48:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x6sm5527118wjf.24.2015.01.28.02.48.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 02:48:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 11:48:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150128104854.GD2477@jama>
References: <1422382116-22523-1-git-send-email-milo-software@users.sourceforge.net>
MIME-Version: 1.0
In-Reply-To: <1422382116-22523-1-git-send-email-milo-software@users.sourceforge.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mike Looijmans <milo-software@users.sourceforge.net>
Subject: Re: [PATCH] python-twisted: Fix dependencies of twisted modules
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
X-List-Received-Date: Wed, 28 Jan 2015 10:49:02 -0000
X-Groupsio-MsgNum: 54008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline

--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 07:08:36PM +0100, Mike Looijmans wrote:
> When installing just "twisted-web" on a device, none of the dependencies
> are being copied, it wouldn't even install python-core. Fix the recipe so
> that its packages have proper dependencies, and no longer require to inst=
all
> the empty python-twisted meta recipe.
>=20
> Add "python-contextlib" to the core dependencies and stop causing systems
> to crash with:
>   File "/usr/lib/python2.7/site-packages/twisted/python/threadpool.py", l=
ine 18, in <module>
>     ImportError: No module named contextlib

Next time please also mention that python-contextlib needs pending patch
for oe-core, because right now this change fails with:

ERROR: Nothing RPROVIDES 'python-contextlib' (but /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-python/recipes-devtools/python/python-twisted=
_13.2.0.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-contextlib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-contextlib']
NOTE: Runtime target 'python-twisted' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted', 'python-con=
textlib']
NOTE: Runtime target 'python-cloudeebus' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-cloudeebus', 'python-=
twisted', 'python-contextlib']
NOTE: Runtime target 'python-cloudeebus-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-cloudeebus-dev', 'pyt=
hon-twisted', 'python-contextlib']
NOTE: Runtime target 'python-twisted-core' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-core', 'pytho=
n-contextlib']
NOTE: Runtime target 'python-twisted-protocols' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-protocols', '=
python-contextlib']
NOTE: Runtime target 'python-autobahn' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-autobahn', 'python-tw=
isted-protocols', 'python-contextlib']
ERROR: Nothing RPROVIDES 'python-twisted-dev' (but /home/jenkins/oe/world/s=
hr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twiste=
d_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-dev'
NOTE: Runtime target 'python-twisted-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-dev']
ERROR: Nothing RPROVIDES 'python-twisted-bin' (but /home/jenkins/oe/world/s=
hr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twiste=
d_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-bin'
NOTE: Runtime target 'python-twisted-bin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-bin']
ERROR: Nothing RPROVIDES 'python-twisted-conch' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twis=
ted_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-conch'
NOTE: Runtime target 'python-twisted-conch' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-conch']
ERROR: Nothing RPROVIDES 'python-twisted-lore' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twist=
ed_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-lore'
NOTE: Runtime target 'python-twisted-lore' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-lore']
ERROR: Nothing RPROVIDES 'python-twisted-mail' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twist=
ed_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-mail'
NOTE: Runtime target 'python-twisted-mail' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-mail']
ERROR: Nothing RPROVIDES 'python-twisted-names' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twis=
ted_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-names'
NOTE: Runtime target 'python-twisted-names' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-names']
ERROR: Nothing RPROVIDES 'python-twisted-news' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twist=
ed_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-news'
NOTE: Runtime target 'python-twisted-news' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-news']
ERROR: Nothing RPROVIDES 'python-twisted-runner' (but /home/jenkins/oe/worl=
d/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twi=
sted_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-runner'
NOTE: Runtime target 'python-twisted-runner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-runner']
ERROR: Nothing RPROVIDES 'python-twisted-web' (but /home/jenkins/oe/world/s=
hr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twiste=
d_13.2.0.bb, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/=
recipes-devtools/python/python-autobahn_0.8.6.bb RDEPENDS on or otherwise r=
equires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-web'
NOTE: Runtime target 'python-twisted-web' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-web']
ERROR: Nothing RPROVIDES 'python-twisted-words' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-twis=
ted_13.2.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-twisted-words'
NOTE: Runtime target 'python-twisted-words' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-twisted-words']
ERROR: Nothing RPROVIDES 'python-autobahn-dev' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-autob=
ahn_0.8.6.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-autobahn-dev'
NOTE: Runtime target 'python-autobahn-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-autobahn-dev']

>=20
> Signed-off-by: Mike Looijmans <milo-software@users.sourceforge.net>
> ---
>  .../python/python-twisted_13.2.0.bb                |   17 ++++++++++++++=
+--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb=
 b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> index 80d64a0..8930169 100644
> --- a/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python-twisted_13.2.0.bb
> @@ -38,8 +38,7 @@ PACKAGES +=3D "\
>      ${PN}-core \
>  "
> =20
> -RDEPENDS_${PN} =3D "python-core python-zopeinterface"
> -RDEPENDS_${PN} +=3D "\
> +RDEPENDS_${PN} =3D "\
>      ${PN}-conch \
>      ${PN}-lore \
>      ${PN}-mail \
> @@ -50,6 +49,20 @@ RDEPENDS_${PN} +=3D "\
>      ${PN}-words \
>  "
> =20
> +RDEPENDS_${PN}-core =3D "python-core python-zopeinterface python-context=
lib"
> +RDEPENDS_${PN}-test =3D "${PN}"
> +RDEPENDS_${PN}-conch =3D "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-lore =3D "${PN}-core"
> +RDEPENDS_${PN}-mail =3D "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-names =3D "${PN}-core"
> +RDEPENDS_${PN}-news =3D "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-runner =3D "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-web +=3D "${PN}-core ${PN}-protocols"
> +RDEPENDS_${PN}-words +=3D "${PN}-core"
> +RDEPENDS_${PN}-flow +=3D "${PN}-core"
> +RDEPENDS_${PN}-pair +=3D "${PN}-core"
> +RDEPENDS_${PN}-dbg =3D "${PN}"
> +
>  ALLOW_EMPTY_${PN} =3D "1"
>  FILES_${PN} =3D ""
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTIvpYACgkQN1Ujt2V2gBzaNgCfVedvoRvPQjWwlulT9SJtViqN
PJ4AniYUcLp+VlLMINu8KByafxp045l7
=1tTY
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--
