Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nv7aD-0004jF-0n for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 12:20:10 +0100
Received: from g225083006.adsl.alicedsl.de ([92.225.83.6]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nv7X9-0007Dh-W3 for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 11:17:00 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269419979-26397-1-git-send-email-sledz@dresearch.de>
References: <1269419979-26397-1-git-send-email-sledz@dresearch.de>
Date: Fri, 26 Mar 2010 12:16:58 +0100
Message-ID: <1269602218.3889.54.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rsyslog: new recipe
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
X-List-Received-Date: Fri, 26 Mar 2010 11:20:10 -0000
X-Groupsio-MsgNum: 18144
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4vEPG8diE7UeZpqk1Dea"

--=-4vEPG8diE7UeZpqk1Dea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 24.03.2010, 09:39 +0100 schrieb Steffen Sledz:
> a reliable and extended syslogd
>=20
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  recipes/rsyslog/files/initscript            |   90 +++++++++
>  recipes/rsyslog/files/rsyslog.conf          |   60 ++++++
>  recipes/rsyslog/rsyslog-5.4.0/atomics.patch |  277 +++++++++++++++++++++=
++++++
>  recipes/rsyslog/rsyslog.inc                 |   34 ++++
>  recipes/rsyslog/rsyslog_5.4.0.bb            |    7 +
>  5 files changed, 468 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/rsyslog/files/initscript
>  create mode 100644 recipes/rsyslog/files/rsyslog.conf
>  create mode 100644 recipes/rsyslog/rsyslog-5.4.0/atomics.patch
>  create mode 100644 recipes/rsyslog/rsyslog.inc
>  create mode 100644 recipes/rsyslog/rsyslog_5.4.0.bb

[=E2=80=A6]

> diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
> new file mode 100644
> index 0000000..5058176
> --- /dev/null
> +++ b/recipes/rsyslog/rsyslog.inc
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "Rsyslog is an enhanced multi-threaded syslogd"
> +DEPENDS =3D "zlib"
> +HOMEPAGE =3D "http://www.rsyslog.com/"
> +LICENSE =3D "GPLv3"
> +INC_PR =3D "r1"

=C2=BBr0=C2=AB should be enough.

> +SRC_URI =3D "http://download.rsyslog.com/rsyslog/${PN}-${PV}.tar.gz;name=
=3Darchive \

SRC_URI =3D "http://download.rsyslog.com/rsyslog/${P}.tar.gz;name=3Darchive

P =3D PN-PV

I do not know if there is a recommendation if name should be `${PN}` or =C2=
=BBarchive=C2=AB.

> +          file://rsyslog.conf \
> +          file://initscript"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}"

As far as I know, this is the default. It is generally useful if you do
not get the source as archives but from repositories. In that case it
should be adapted in the recipe.

> +inherit autotools update-rc.d
> +
> +do_install_append() {
> +        install -d ${D}/${sysconfdir}/${PN}
> +        install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
> +        install -d ${D}/${sysconfdir}/init.d
> +        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/r=
syslog
> +}
> +
> +pkg_postinst() {
> +        update-rc.d -f syslog remove
> +}
> +
> +pkg_postrm() {
> +        update-rc.d syslog add 5
> +}
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/rsyslog.conf"
> +
> +INITSCRIPT_NAME =3D "rsyslog"
> +#INITSCRIPT_PARAMS =3D "defaults 05"
> +INITSCRIPT_PARAMS =3D "remove"
> diff --git a/recipes/rsyslog/rsyslog_5.4.0.bb b/recipes/rsyslog/rsyslog_5=
.4.0.bb
> new file mode 100644
> index 0000000..b22d4e4
> --- /dev/null
> +++ b/recipes/rsyslog/rsyslog_5.4.0.bb
> @@ -0,0 +1,7 @@
> +require rsyslog.inc
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D " file://atomics.patch;patch=3D1"
> +
> +SRC_URI[archive.md5sum] =3D "291882229d50496f42bd63174076dd37"
> +SRC_URI[archive.sha256sum] =3D "d9cd21d2fcd45fcae65eb0a51927c40315cca02a=
fdc62478abd950febfcf7228"

If you change the name, than adapt this too please to `${PN}.md5sum` and
so on.


Thanks,

Paul

--=-4vEPG8diE7UeZpqk1Dea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkusl6oACgkQPX1aK2wOHVi6YACeJ3H2XbUJG1mJo4fFLi5r9CKR
dZ4AniPLQ9svdI4Wsa6+Fuak0n+0UF5+
=oT22
-----END PGP SIGNATURE-----

--=-4vEPG8diE7UeZpqk1Dea--
