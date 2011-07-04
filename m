Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qdex1-0002ck-Dw for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 10:56:19 +0200
Received: from g225080152.adsl.alicedsl.de ([92.225.80.152]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qdeta-0006yw-90 for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jul 2011 08:52:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309768279-4797-1-git-send-email-sledz@dresearch-fe.de>
References: <1309454880.4401.32.camel@mattotaupa>
	<1309768279-4797-1-git-send-email-sledz@dresearch-fe.de>
Date: Mon, 04 Jul 2011 10:52:31 +0200
Message-ID: <1309769551.4472.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2 1/2] ppp-2.4.5: own package for PPPoL2TP plugin
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
X-List-Received-Date: Mon, 04 Jul 2011 08:56:19 -0000
X-Groupsio-MsgNum: 32971
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9CaFe7hGjO9jYuppN6RS"

--=-9CaFe7hGjO9jYuppN6RS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 04.07.2011, 10:31 +0200 schrieb Steffen Sledz:

Could you please add the following to the commit message before you
commit?

Adding that package fixes the following error message.

        NOTE: package ppp-2.4.5-r1: task do_qa_staging: Started
        WARNING: the following files were installed but not shipped in any =
package:
        WARNING:   /usr/lib/pppd/2.4.5/pppol2tp.so
        WARNING:   /usr/lib/pppd/2.4.5/openl2tp.so

> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/ppp/ppp_2.4.5.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/ppp/ppp_2.4.5.bb b/recipes/ppp/ppp_2.4.5.bb
> index 2b6b6f7..883b695 100644
> --- a/recipes/ppp/ppp_2.4.5.bb
> +++ b/recipes/ppp/ppp_2.4.5.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Point-to-Point Protocol (PPP) daemon"
>  HOMEPAGE =3D "http://samba.org/ppp/"
>  DEPENDS =3D "libpcap"
>  LICENSE =3D "BSD GPLv2"
> -PR =3D "r1"
> +PR =3D "r2"
>  # Not well tested
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> @@ -49,11 +49,12 @@ do_install_append () {
>  }
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/cha=
p-secrets ${sysconfdir}/ppp/options"
> -PACKAGES =3D+ "ppp-oa ppp-oe ppp-radius ppp-winbind ppp-minconn ppp-pass=
word ppp-tools"
> +PACKAGES =3D+ "ppp-oa ppp-l2tp ppp-oe ppp-radius ppp-winbind ppp-minconn=
 ppp-password ppp-tools"
>  FILES_${PN}        =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindi=
r}/pppd"
>  FILES_${PN}_nylon  =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindi=
r}/pppd ${sbindir}/tdbread"
>  FILES_${PN}-dbg +=3D "${libdir}/pppd/${PV}/.debug"
>  FILES_${PN}-oa       =3D "${libdir}/pppd/${PV}/pppoatm.so"
> +FILES_${PN}-l2tp     =3D "${libdir}/pppd/${PV}/pppol2tp.so ${libdir}/ppp=
d/${PV}/openl2tp.so"
>  FILES_${PN}-oe       =3D "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV=
}/rp-pppoe.so"
>  FILES_${PN}-radius   =3D "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/=
${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
>  FILES_${PN}-winbind  =3D "${libdir}/pppd/${PV}/winbind.so"
> @@ -61,6 +62,7 @@ FILES_${PN}-minconn  =3D "${libdir}/pppd/${PV}/minconn.=
so"
>  FILES_${PN}-password =3D "${libdir}/pppd/${PV}/pass*.so"
>  FILES_${PN}-tools    =3D "${sbindir}/pppstats ${sbindir}/pppdump"
>  DESCRIPTION_ppp-oa       =3D "Plugin for PPP needed for PPP-over-ATM"
> +DESCRIPTION_ppp-l2tp     =3D "Plugin for PPP needed for PPP-over-L2TP"
>  DESCRIPTION_ppp-oe       =3D "Plugin for PPP needed for PPP-over-Etherne=
t"
>  DESCRIPTION_ppp-radius   =3D "Plugin for PPP that are related to RADIUS"
>  DESCRIPTION_ppp-winbind  =3D "Plugin for PPP to authenticate against Sam=
ba or Windows"

Putting these additions one line above would sort it alphabetically,
would not it? If yes, it would be nice to fix this too before pushing
the commit.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-9CaFe7hGjO9jYuppN6RS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4Rf08ACgkQPX1aK2wOHViZwgCeI9moxr8eUdaVcC5Lfbh1h5mB
1g4An2oSY5X+p/KKQIiMXViqFEk+E63H
=Yuqt
-----END PGP SIGNATURE-----

--=-9CaFe7hGjO9jYuppN6RS--
