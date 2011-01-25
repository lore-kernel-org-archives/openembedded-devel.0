Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Phlf5-0001BU-EN
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:22:32 +0100
Received: by wwi17 with SMTP id 17so4960213wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:21:44 -0800 (PST)
Received: by 10.216.181.76 with SMTP id k54mr3878422wem.58.1295972504505;
	Tue, 25 Jan 2011 08:21:44 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id b30sm7248270wen.25.2011.01.25.08.21.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 08:21:42 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3d0c09dc2f178a8c355b544d1afa98cb46db2617.1295971903.git.vjaquez@igalia.com>
Date: Tue, 25 Jan 2011 17:21:41 +0100
Message-Id: <510CB87D-0184-457D-89F1-45BBC6ABE130@dominion.thruhere.net>
References: <cover.1295971903.git.vjaquez@igalia.com>
	<3d0c09dc2f178a8c355b544d1afa98cb46db2617.1295971903.git.vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] python-scons_1.3.0: add missing dependencies
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
X-List-Received-Date: Tue, 25 Jan 2011 16:22:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jan 2011, om 17:16 heeft V=EDctor Manuel J=E1quez Leal het =
volgende geschreven:

> In order to launch scons in a board it depends on a couple python =
packages
> which were not managed by the recipe.
>=20
> This patch adds them.
>=20
> Signed-off-by: V=EDctor Manuel J=E1quez Leal <vjaquez@igalia.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> recipes/python/python-scons_1.3.0.bb |    9 +++++++++
> 1 files changed, 9 insertions(+), 0 deletions(-)
>=20
> diff --git a/recipes/python/python-scons_1.3.0.bb =
b/recipes/python/python-scons_1.3.0.bb
> index 792e3a5..a0690d1 100644
> --- a/recipes/python/python-scons_1.3.0.bb
> +++ b/recipes/python/python-scons_1.3.0.bb
> @@ -3,6 +3,7 @@ SECTION =3D "devel/python"
> PRIORITY =3D "optional"
> LICENSE =3D "GPL"
> SRCNAME =3D "scons"
> +PR =3D "r1"
>=20
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz;name=3Dscons=
 \
>            file://toolchain-from-env.SConscript \
> @@ -21,3 +22,11 @@ do_install_append() {
>=20
> NATIVE_INSTALL_WORKS =3D "1"
> BBCLASSEXTEND =3D "native"
> +
> +RDEPENDS_${PN} =3D "python-shell \
> +	       python-stringold \
> +	       python-lang \
> +	       python-io \
> +	       python-fcntl \
> +	       python-pickle \
> +	       python-crypt"
> --=20
> 1.7.2.3
>=20



