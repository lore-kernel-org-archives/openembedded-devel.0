Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TbAcL-0008Ul-M1
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:45:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qALDVKU3019623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Nov 2012 05:31:20 -0800 (PST)
Received: from yow-jmacdona-d2.wrs.com (172.25.44.2) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 21 Nov 2012 05:31:19 -0800
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	BF2A36A3B14; Wed, 21 Nov 2012 08:31:18 -0500 (EST)
Date: Wed, 21 Nov 2012 08:31:18 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121121133118.GD5455@windriver.com>
References: <1353503878-26344-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1353503878-26344-1-git-send-email-koen@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-networking][PATCH] Revert "ntp: Clean up recipes"
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
X-List-Received-Date: Wed, 21 Nov 2012 13:45:33 -0000
X-Groupsio-MsgNum: 41604
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] Revert "ntp: Clean up recipes"] On 12.11.21 =
(Wed 14:17) Koen Kooi wrote:

> This breaks the upgrade path since 'ntpdate' has been renamed to 'ntp-dat=
e'. I don't know why this patch was applied when it was shot down on review.

It was an ordering problem, I believe.  The patch passed review, then on
a subsequent update we discovered the problems with it.  I was hoping
we'd have it sorted out with the submitter in short order, but it's
taking longer than I expected.  So, merged this.

Thanks.

-J.

>=20
> This reverts commit d102fc3fe64844f5c85ff350874728139a63fe78.
> ---
>  .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         |   11 +++--
>  meta-networking/recipes-support/ntp/ntp.inc        |   49 ++------------=
------
>  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   43 ++++++++++++++=
++-
>  3 files changed, 53 insertions(+), 50 deletions(-)
>=20
> diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/met=
a-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> index e5851ae..a158990 100644
> --- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> @@ -1,10 +1,11 @@
> -require ntp.inc
> +require ntp_${PV}.bb
>  DEPENDS =3D "openssl"
> =20
>  S =3D "${WORKDIR}/ntp-${PV}"
> =20
> -EXTRA_OECONF +=3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
> -		 --with-openssl-incdir=3D${STAGING_INCDIR}/openssl \
> -		 --with-crypto"
> +EXTRA_OECONF =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
> +	        --with-openssl-incdir=3D${STAGING_INCDIR}/openssl"
> =20
> -FILES_${PN} +=3D "${bindir}/sntp ${bindir}/ntp-keygen"
> +
> +SRC_URI[md5sum] =3D "98e16c7aa4ecd4c004b51bff18962e95"
> +SRC_URI[sha256sum] =3D "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de46=
59007cfff278671a"
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index e2dbdad..1d740f0 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -8,19 +8,14 @@ LICENSE =3D "ntp"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9ca5=
12670"
>  RSUGGESTS_${PN} =3D "iana-etc"
> =20
> -INC_PR =3D "r1"
> -
> -SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-$=
{PV}.tar.gz \
> -	file://tickadj.c.patch \
> -	file://ntp-4.2.4_p6-nano.patch \
> +SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.=
tar.gz \
> +	file://ipv6only-workaround.patch \
>  	file://ntpd \
>  	file://ntp.conf \
>  	file://ntpdate \
> +	file://ntpd.service \
>  "
> =20
> -SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> -SRC_URI[sha256sum] =3D "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23e=
a25ac1405432f91c"
> -
>  inherit autotools update-rc.d
> =20
>  INITSCRIPT_NAME =3D "ntpd"
> @@ -29,46 +24,12 @@ INITSCRIPT_PARAMS =3D "defaults"
> =20
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
> -EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv=
_header_readline_history_h=3Dno"
> +EXTRA_OECONF =3D "--without-openssl --without-crypto ac_cv_header_readli=
ne_history_h=3Dno"
>  CFLAGS_append =3D " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
> =20
> -do_configure(){
> -	oe_runconf
> -}
> -
> -do_install_append() {
> -	install -d ${D}/${sysconfdir}/init.d
> -	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
> -	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
> -	install -d ${D}/${sysconfdir}/network/if-up.d
> -	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> -}
> -
> -FILES_${PN}-bin =3D "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq $=
{bindir}/ntptime ${bindir}/ntptrace"
> -FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/ini=
t.d/ntpd ${sbindir} ${libdir}"
> -FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> -FILES_${PN}-utils =3D "${bindir}/*"
> -FILES_${PN}-date +=3D "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/n=
tpdate"
> -
> -# ntp originally includes tickadj. It's split off for inclusion in small=
 firmware images on platforms
> -# with wonky clocks (e.g. OpenSlug)
> -RDEPENDS_${PN} =3D "${PN}-tickadj"
> -
> -PACKAGES +=3D "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
> +PACKAGES +=3D "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
>  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
>  # or the ntpdate systemd service
> =20
>  # This should use rc.update
>  FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
> -
> -pkg_postinst_ntpdate() {
> -if test "x$D" !=3D "x"; then
> -        exit 1
> -else
> -        if ! grep -q -s ntpdate /var/spool/cron/root; then
> -                echo "adding crontab"
> -                test -d /var/spool/cron || mkdir -p /var/spool/cron
> -                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.o=
rg" >> /var/spool/cron/root
> -        fi
> -fi
> -}
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-ne=
tworking/recipes-support/ntp/ntp_4.2.6p5.bb
> index 175a1b0..f7c5b68 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> @@ -1,4 +1,45 @@
>  require ntp.inc
> =20
> -EXTRA_OECONF +=3D "--without-openssl --without-crypto"
> +SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-$=
{PV}.tar.gz \
> +        file://tickadj.c.patch \
> +        file://ntp-4.2.4_p6-nano.patch \
> +        file://ntpd \
> +        file://ntp.conf \
> +        file://ntpdate \
> +"
> +
> +SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> +SRC_URI[sha256sum] =3D "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8=
a02e78be85a7c40e"
> +
> +EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"=20
> +
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}/init.d
> +	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
> +	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
> +	install -d ${D}/${sysconfdir}/network/if-up.d
> +	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> +}
> +
> +FILES_${PN}-bin =3D "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq $=
{bindir}/ntptime ${bindir}/ntptrace"
> +FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/ini=
t.d/ntpd"
> +FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> +FILES_ntp-utils =3D "${bindir}/*"
> +FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpda=
te"
> +
> +# ntp originally includes tickadj. It's split off for inclusion in small=
 firmware images on platforms
> +# with wonky clocks (e.g. OpenSlug)
> +RDEPENDS_${PN} =3D "${PN}-tickadj"
> +
> +pkg_postinst_ntpdate() {
> +if test "x$D" !=3D "x"; then
> +        exit 1
> +else
> +        if ! grep -q -s ntpdate /var/spool/cron/root; then
> +                echo "adding crontab"
> +                test -d /var/spool/cron || mkdir -p /var/spool/cron
> +                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.o=
rg" >> /var/spool/cron/root
> +        fi
> +fi
> +}
> =20
--=20
-Joe MacDonald.
:wq

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCs16YACgkQPN8S4W6ZZnfUMgCfeO8FAraZvVTaTGqJS93pJKB+
bgoAmgMpDr1TJnT+NP12O8NBFu2FTnxU
=7ExE
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
