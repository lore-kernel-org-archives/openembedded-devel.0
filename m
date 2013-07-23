Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6029C61EEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 09:32:55 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so4380505eei.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 02:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uH05z/SYzCpFO2HwyHaVatHQGPdqC0UAD44zrbhI+ns=;
	b=BR0frTc0wXlkRtnNOuJ2N7w3L4nqNZHKypoE/ZIuGRBQ+1PostO0kVqwDY5/i2weeD
	QpJ+FloP2D48vD5Kt+eHQr0sy0dOTpHk6PMl7Z58gle2BMrHaf/b9Z5P/i33ew5LW+kS
	LDnSfC9RP5UF4xfpIhT1z61vvsW/qIVdYGy60ZEODr1DkWl0lw3gtFjOISTkBJzlWbka
	OSWQ8+P4NPXUeUZlwGVYfiCScn3ZN8GxvnEL01gNGoldz7DjcuVl08iTSRPZTd8lWiz1
	9w+daryXX1PXuFAULL15ZhulahvswOQWhAwGKuH0E24ikgBKoYJXXfM9j0LEAWGD8kL+
	n0nA==
X-Received: by 10.14.3.73 with SMTP id 49mr31772646eeg.72.1374571974912;
	Tue, 23 Jul 2013 02:32:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm57188783eeo.14.2013.07.23.02.32.53 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 02:32:53 -0700 (PDT)
Date: Tue, 23 Jul 2013 11:33:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130723093315.GK9527@jama>
References: <1373002142-5129-1-git-send-email-B40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E104258EA@039-SN2MPN1-021.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E104258EA@039-SN2MPN1-021.039d.mgd.msft.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-networking][PATCH] Install a systemd unit into ${systemd_unitdir} only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 23 Jul 2013 09:32:56 -0000
X-Groupsio-MsgNum: 45445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline

--2feizKym29CxAecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 06:34:11AM +0000, Guo Chunrong-B40290 wrote:
> Please apply the patch .

There is patch for systemd.bbclass on oe-core ML which should resolve
this for all recipes with systemd service files:

http://lists.openembedded.org/pipermail/openembedded-core/2013-July/081547.=
html

I would prefer to wait until it's resolved in oe-core.

>=20
>=20
> -----Original Message-----
> From: Guo Chunrong-B40290=20
> Sent: Friday, July 05, 2013 1:29 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Yu Zongchun=
-B40527; Guo Chunrong-B40290
> Subject: [meta-networking][PATCH] Install a systemd unit into ${systemd_u=
nitdir} only with systemd in DISTRO_FEATURES
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |   11 +++++++----
>  .../recipes-support/dnsmasq/dnsmasq.inc            |    5 ++++-
>  .../recipes-support/nis/yp-tools_2.12.bb           |    8 +++++---
>  .../recipes-support/nis/ypbind-mt_1.36.bb          |    8 +++++---
>  meta-networking/recipes-support/ntp/ntp.inc        |   12 +++++++-----
>  5 files changed, 28 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> index d21995a..2eece50 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=
=3D8;md5=3D7f7f00ba639ac8e8deb5
> =20
>  DEPENDS =3D "openssl libnl pciutils"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
>          file://init \
> @@ -51,9 +51,12 @@ do_install_append() {
>          -e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
>          -e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
>          -i ${STAGING_BINDIR}/net-snmp-config
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/syst=
em
> -    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/=
system
> +   =20
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/=
system
> +        install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitd=
ir}/system
> +    fi
>  }
> =20
>  PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static=
 ${PN}-libs \ diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.=
inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> index 0f5b273..242f143 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> @@ -31,9 +31,11 @@ do_install () {
>      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
>      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> =20
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};=
=20
> + then
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/sy=
stem
> -
> +    fi
> +  =20
>      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D "" ]; then
>          install -d ${D}${sysconfdir}/dbus-1/system.d
>          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system=
=2Ed/
> @@ -46,3 +48,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> +
> diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-=
networking/recipes-support/nis/yp-tools_2.12.bb
> index 0017845..65c4429 100644
> --- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> +++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> @@ -1,7 +1,7 @@
>  # This package builds tools to manage NIS  # The source package is utils=
/net/NIS/yp-tools  # -PR =3D "r3"
> +PR =3D "r4"
>  DESCRIPTION=3D"\
>  Network Information Service tools.  \
>  This package contains ypcat, ypmatch, ypset, \ @@ -26,6 +26,8 @@ RCONFLI=
CTS_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> =20
>  do_install_append() {
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}=
/system
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unit=
dir}/system
> +    fi
>  }
> diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta=
-networking/recipes-support/nis/ypbind-mt_1.36.bb
> index 35ef16a..85ecaf8 100644
> --- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> @@ -1,7 +1,7 @@
>  # This package builds the NIS ypbind daemon  # The source package is uti=
ls/net/NIS/ypbind-mt  # -PR =3D "r3"
> +PR =3D "r4"
>  DESCRIPTION=3D"\
>  Multithreaded NIS bind service (ypbind-mt).  \  ypbind-mt is a complete =
new implementation of a NIS \ @@ -40,8 +40,10 @@ do_install_append () {
>      # TODO, use update-rc.d
>      ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
> =20
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/sys=
tem
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}=
/system
> +    fi
>  }
> =20
>  inherit systemd
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networkin=
g/recipes-support/ntp/ntp.inc
> index 79e7401..6006aeb 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -8,7 +8,7 @@ SECTION =3D "console/network"
>  LICENSE =3D "NTP"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9ca5=
12670"
> =20
> -INC_PR =3D "r6"
> +INC_PR =3D "r7"
> =20
>  SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-$=
{PV}.tar.gz \
>             file://tickadj.c.patch \
> @@ -59,10 +59,12 @@ do_install_append() {
>      install -d ${D}/${sysconfdir}/network/if-up.d
>      ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
> =20
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/sy=
stem/
> -    install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/syste=
m/
> -    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/syste=
m/
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir=
}/system/
> +        install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/s=
ystem/
> +        install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/s=
ystem/
> +    fi
>  }
> =20
>  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> --
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHuTdsACgkQN1Ujt2V2gBydnACdEXuim2R39oubET3TjTwQ0gRA
76UAniPRP5co/jegrLC6R6tNioPSy2v0
=SUV/
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--
