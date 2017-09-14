Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0416F71A50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 08:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 955DA182B0;
	Thu, 14 Sep 2017 10:07:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id jpeY8kgNvfeB; Thu, 14 Sep 2017 10:07:16 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1A7AA1844C;
	Thu, 14 Sep 2017 10:07:16 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0580C1E089;
	Thu, 14 Sep 2017 10:07:16 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE6DB1E086;
	Thu, 14 Sep 2017 10:07:15 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Sep 2017 10:07:15 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id E283CEE9;
	Thu, 14 Sep 2017 10:07:15 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 14 Sep 2017 10:07:16 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 14 Sep 2017 10:07:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Dengke Du <dengke.du@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] apache2: add a configure file for sysvinit
Thread-Index: AQHTLSYEVksJ+KZKr0mnR3IXE7xmc6K0BioA
Date: Thu, 14 Sep 2017 08:07:15 +0000
Message-ID: <5e4808bc02384d6189a57703ace59b4b@XBOX02.axis.com>
References: <1505371912-190862-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1505371912-190862-1-git-send-email-dengke.du@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] apache2: add a configure file for sysvinit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 08:07:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Dengke Du
> Sent: den 14 september 2017 08:52
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] apache2: add a configure file for sysvinit

This does a lot more than the subject suggests. Was this intentional?

> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb | 18
> +++++++++++++++++-
>  .../recipes-httpd/apache2/files/volatiles.04_apache2   |  3 +++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta-webserver/recipes-
> httpd/apache2/files/volatiles.04_apache2
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
> index f053e37..333e2dc 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2
> \
>             file://init \
>             file://apache2-volatile.conf \
>             file://apache2.service \
> +           file://volatiles.04_apache2 \
>            "
>=20
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddbff5a2b542fa58854455bf1a0b94b83"
> @@ -58,9 +59,13 @@ EXTRA_OECONF =3D "--enable-ssl \
>      ac_cv_have_threadsafe_pollset=3Dno"
>=20
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'selinux',
> d)}"
> -PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-
> selinux,libselinux,libselinux"
> +PACKAGECONFIG[selinux] =3D "--enable-selinux --enable-layout=3DDebian --
> prefix=3D${base_prefix}/,--disable-selinux,libselinux,libselinux"
>  PACKAGECONFIG[openldap] =3D "--enable-ldap --enable-authnz-ldap,--
> disable-ldap --disable-authnz-ldap,openldap"
>=20
> +do_configure_prepend() {
> +        sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-
> bin:g' ${S}/config.layout
> +}
> +
>  do_install_append() {
>      install -d ${D}/${sysconfdir}/init.d
>      cat ${WORKDIR}/init | \
> @@ -90,6 +95,9 @@ do_install_append() {
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
>          install -d ${D}${sysconfdir}/tmpfiles.d/
>          install -m 0644 ${WORKDIR}/apache2-volatile.conf
> ${D}${sysconfdir}/tmpfiles.d/
> +    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/volatiles.04_apache2
> ${D}${sysconfdir}/default/volatiles/04_apache2
>      fi
>=20
>      install -d ${D}${systemd_unitdir}/system
> @@ -107,6 +115,7 @@ do_install_append_class-target() {
>=20
>      sed -i -e 's,${STAGING_DIR_HOST},,g' \
>             -e 's,".*/configure","configure",g'
> ${D}${datadir}/apache2/build/config.nice
> +    rm -rf ${D}${localstatedir}/run
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "apache_sysroot_preprocess"
> @@ -180,3 +189,10 @@ FILES_${PN}-dbg +=3D
> "${libdir}/${BPN}/modules/.debug"
>  RDEPENDS_${PN} +=3D "openssl libgcc"
>  RDEPENDS_${PN}-scripts +=3D "perl ${PN}"
>  RDEPENDS_${PN}-dev =3D "perl"
> +
> +FILES_${PN} +=3D "${libdir}/cgi-bin"
> +
> +#Disable parallel make install
> +PARALLEL_MAKEINST =3D ""
> +
> +FILES_${PN} +=3D "${datadir}/${BPN}/"
> diff --git a/meta-webserver/recipes-
> httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-
> httpd/apache2/files/volatiles.04_apache2
> new file mode 100644
> index 0000000..922075b
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
> @@ -0,0 +1,3 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d root root 0755 /var/run/apache2 none
> +d root root 0755 /var/log/apache2 none
> --
> 2.8.1

//Peter


