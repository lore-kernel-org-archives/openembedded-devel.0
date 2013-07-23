Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6A2860629
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 11:50:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6NBoIWO001636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jul 2013 04:50:18 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 23 Jul 2013 04:50:18 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id D26007FE3;
	Tue, 23 Jul 2013 07:50:10 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 67A5D40521; Tue,
	23 Jul 2013 07:50:17 -0400 (EDT)
Date: Tue, 23 Jul 2013 07:50:17 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130723115016.GA3643@windriver.com>
References: <1373002142-5129-1-git-send-email-B40290@freescale.com>
	<B21730BB6DA1D24B83348D9301EA417E104258EA@039-SN2MPN1-021.039d.mgd.msft.net>
	<20130723093315.GK9527@jama>
MIME-Version: 1.0
In-Reply-To: <20130723093315.GK9527@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
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
X-List-Received-Date: Tue, 23 Jul 2013 11:50:20 -0000
X-Groupsio-MsgNum: 45447
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] Install a systemd unit into ${systemd_un=
itdir} only with systemd in DISTRO_FEATURES] On 13.07.23 (Tue 11:33) Martin=
 Jansa wrote:

> On Tue, Jul 23, 2013 at 06:34:11AM +0000, Guo Chunrong-B40290 wrote:
> > Please apply the patch .
>=20
> There is patch for systemd.bbclass on oe-core ML which should resolve
> this for all recipes with systemd service files:
>=20
> http://lists.openembedded.org/pipermail/openembedded-core/2013-July/08154=
7.html
>=20
> I would prefer to wait until it's resolved in oe-core.

As would I.  Sorry about that, I should've followed up with you guys
last week.  I'd started working on basically the same thing, though I
was implementing it in slightly a different way.  With the current patch
under discussion, I think the right thing to do is to instead remove the
workarounds in the other recipes I mentioned that already have them once
it has been merged.

-J.

>=20
> >=20
> >=20
> > -----Original Message-----
> > From: Guo Chunrong-B40290=20
> > Sent: Friday, July 05, 2013 1:29 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Yu Zongch=
un-B40527; Guo Chunrong-B40290
> > Subject: [meta-networking][PATCH] Install a systemd unit into ${systemd=
_unitdir} only with systemd in DISTRO_FEATURES
> >=20
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |   11 +++++++----
> >  .../recipes-support/dnsmasq/dnsmasq.inc            |    5 ++++-
> >  .../recipes-support/nis/yp-tools_2.12.bb           |    8 +++++---
> >  .../recipes-support/nis/ypbind-mt_1.36.bb          |    8 +++++---
> >  meta-networking/recipes-support/ntp/ntp.inc        |   12 +++++++-----
> >  5 files changed, 28 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> > index d21995a..2eece50 100644
> > --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> > +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endli=
ne=3D8;md5=3D7f7f00ba639ac8e8deb5
> > =20
> >  DEPENDS =3D "openssl libnl pciutils"
> > =20
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
> >          file://init \
> > @@ -51,9 +51,12 @@ do_install_append() {
> >          -e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
> >          -e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
> >          -i ${STAGING_BINDIR}/net-snmp-config
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/sy=
stem
> > -    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir=
}/system
> > +   =20
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir=
}/system
> > +        install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_uni=
tdir}/system
> > +    fi
> >  }
> > =20
> >  PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-stat=
ic ${PN}-libs \ diff --git a/meta-networking/recipes-support/dnsmasq/dnsmas=
q.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > index 0f5b273..242f143 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -31,9 +31,11 @@ do_install () {
> >      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
> >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > =20
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
;=20
> > + then
> >      install -d ${D}${systemd_unitdir}/system
> >      install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/=
system
> > -
> > +    fi
> > +  =20
> >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D "" ]; then
> >          install -d ${D}${sysconfdir}/dbus-1/system.d
> >          install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/syst=
em.d/
> > @@ -46,3 +48,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
> >  RREPLACES_${PN} +=3D "${PN}-systemd"
> >  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> >  SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> > +
> > diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/met=
a-networking/recipes-support/nis/yp-tools_2.12.bb
> > index 0017845..65c4429 100644
> > --- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> > +++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
> > @@ -1,7 +1,7 @@
> >  # This package builds tools to manage NIS  # The source package is uti=
ls/net/NIS/yp-tools  # -PR =3D "r3"
> > +PR =3D "r4"
> >  DESCRIPTION=3D"\
> >  Network Information Service tools.  \
> >  This package contains ypcat, ypmatch, ypset, \ @@ -26,6 +26,8 @@ RCONF=
LICTS_${PN} +=3D "${PN}-systemd"
> >  SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> > =20
> >  do_install_append() {
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdi=
r}/system
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_un=
itdir}/system
> > +    fi
> >  }
> > diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/me=
ta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> > index 35ef16a..85ecaf8 100644
> > --- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> > +++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
> > @@ -1,7 +1,7 @@
> >  # This package builds the NIS ypbind daemon  # The source package is u=
tils/net/NIS/ypbind-mt  # -PR =3D "r3"
> > +PR =3D "r4"
> >  DESCRIPTION=3D"\
> >  Multithreaded NIS bind service (ypbind-mt).  \  ypbind-mt is a complet=
e new implementation of a NIS \ @@ -40,8 +40,10 @@ do_install_append () {
> >      # TODO, use update-rc.d
> >      ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
> > =20
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/s=
ystem
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdi=
r}/system
> > +    fi
> >  }
> > =20
> >  inherit systemd
> > diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-network=
ing/recipes-support/ntp/ntp.inc
> > index 79e7401..6006aeb 100644
> > --- a/meta-networking/recipes-support/ntp/ntp.inc
> > +++ b/meta-networking/recipes-support/ntp/ntp.inc
> > @@ -8,7 +8,7 @@ SECTION =3D "console/network"
> >  LICENSE =3D "NTP"
> >  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9c=
a512670"
> > =20
> > -INC_PR =3D "r6"
> > +INC_PR =3D "r7"
> > =20
> >  SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp=
-${PV}.tar.gz \
> >             file://tickadj.c.patch \
> > @@ -59,10 +59,12 @@ do_install_append() {
> >      install -d ${D}/${sysconfdir}/network/if-up.d
> >      ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
> > =20
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/=
system/
> > -    install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/sys=
tem/
> > -    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/sys=
tem/
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
> > +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitd=
ir}/system/
> > +        install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}=
/system/
> > +        install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}=
/system/
> > +    fi
> >  }
> > =20
> >  PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
> > --
> > 1.7.5.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
--=20
-Joe MacDonald.
:wq

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHubfUACgkQPN8S4W6ZZndB0wCeP1oTdG7vCnNW+hdcdbT9Pys4
BYUAn2G0fjuz+thwEgjMzDooXroZpDvv
=RjLI
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
