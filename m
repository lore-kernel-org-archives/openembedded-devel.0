Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 41D7E60034
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 15:12:04 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Yqjwb-0004jS-U2 from Joe_MacDonald@mentor.com ;
	Fri, 08 May 2015 08:12:05 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Fri, 8 May 2015
	08:12:03 -0700
Received: by burninator (Postfix, from userid 1000)	id 4B44E5806FD; Fri,  8
	May 2015 11:12:08 -0400 (EDT)
Date: Fri, 8 May 2015 11:12:08 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150508151207.GA7280@mentor.com>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
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
X-List-Received-Date: Fri, 08 May 2015 15:12:05 -0000
X-Groupsio-MsgNum: 55404
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I don't know if you've noticed, but it looks like this caused an issue
with the current world build:

commit 00ea492451d221fcc4af5613732035184b8ee43a
Author: Armin Kuster <akuster808@gmail.com>
Date:   Sat Apr 4 14:52:03 2015 -0700

    networkmanger: meta-oe world build failes
   =20
    ERROR: Nothing RPROVIDES 'dnsmasq' (but /home/akuster/oss/clean/meta-op=
enembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8=
=2E10.bb RDEPENDS on or otherwise requires it)
    NOTE: Runtime target 'dnsmasq' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['dnsmasq']
    ERROR: Required build target 'networkmanager' has no buildable provider=
s.
    Missing or unbuildable dependency chain was: ['networkmanager', 'dnsmas=
q']
   =20
    move networkmanager from meta-oe to meta-networking.
   =20
    Signed-off-by: Armin Kuster <akuster808@gmail.com>

I'll see if I can reproduce it, it's not obvious to me on the surface
why this would be an issue with your patch.

-J.

[[meta-networking][PATCH] networkingmanager: QA warning for rdepends on pol=
kit] On 15.05.04 (Mon 20:18) Armin Kuster wrote:

> WARNING: QA Issue: networkmanager rdepends on polkit, but it isn't a buil=
d dependency? [build-deps]
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_0.9.8.10.bb     |=
 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_0.9.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_0.9.8.10.bb
> index 8d37c98..36a4a7e 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
0.9.8.10.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
0.9.8.10.bb
> @@ -37,11 +37,12 @@ PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURE=
S','systemd','systemd','conso
>  PACKAGECONFIG[systemd] =3D " \
>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd --enable-polkit, \
>      --without-systemdsystemunitdir, \
> -    polkit \
> +    polkit, polkit \
>  "
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
>  PACKAGECONFIG[concheck] =3D "--enable-concheck,--disable-concheck,libsou=
p-2.4"
> +PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, , polkit"
> =20
>  # Work around dbus permission problems since we lack a proper at_console
>  do_install_prepend() {
--=20
-Joe MacDonald.
:wq

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVTNI/AAoJEEn8ffcsOfaWAiAIAKzwTZrb8b2+E4LbyagKtNLR
sPt8pDW/Fi/uQ88tnCmC0GjAaBqvKCuEGwmS67gWzb6vof/EqnRVYyEQqmcUIOtZ
Ntvm+4Iqji36FcYCHEBqQVorLjUoctZ77hOn/zBj5hmm03sRyTV0/Z+GcQZ09Wks
C60eilZJceGHH3Ms35f/OZ4yri2bQhoHDTB0spau7ZBi75AY24NfKN550LOTY7Ya
XcVq9BbWJT3Fm/qnoapZlKbYZ3yc4kWoRwowNpGgFhJEm69RfmQVKmn38vCYd0Es
hXvPHm/mdKGg0LD3cyGJSK7G0B0KS46xxxQ6FpuPTA5Tby++s+OSD5cqCCbeSQU=
=gQQ5
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
