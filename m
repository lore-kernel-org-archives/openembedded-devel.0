Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6706AFB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2013 18:58:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r69Iw4YJ022493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 11:58:04 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 9 Jul 2013 11:58:04 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id D261F4D8B3;
	Tue,  9 Jul 2013 14:57:44 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4FA8C410DF; Tue,
	9 Jul 2013 14:58:03 -0400 (EDT)
Date: Tue, 9 Jul 2013 14:58:03 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>
Message-ID: <20130709185803.GA13741@windriver.com>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios> <20130704111809.GA3831@windriver.com>
	<B21730BB6DA1D24B83348D9301EA417E1040BD1A@039-SN2MPN1-021.039d.mgd.msft.net>
MIME-Version: 1.0
In-Reply-To: <B21730BB6DA1D24B83348D9301EA417E1040BD1A@039-SN2MPN1-021.039d.mgd.msft.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-networking][PATCH] dnsmasq: install .service only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 09 Jul 2013 18:58:07 -0000
X-Groupsio-MsgNum: 45350
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [meta-networking][PATCH] dnsmasq: install .service only with syst=
emd in DISTRO_FEATURES] On 13.07.05 (Fri 07:45) Guo Chunrong-B40290 wrote:

> Hello, Joe MacDonald
> New  patch was submitted.
> I do not modify (atftp/tracker/gateone)  recips and slim recipes do not w=
ork.
> SO the code in these recipes  add  ${systemd_unitdir} to FILES and these =
recipes work well.=20

Just FYI, I saw your patch, I have it in a merge queue, but right now
I'm looking at the bug Paul quoted and the mailing list discussion
quoted therein to see if we can come up with a better, more general
solution.

-J.

>=20
> Thanks,
> chunrong
>=20
> -----Original Message-----
> From: Joe MacDonald [mailto:Joe.MacDonald@windriver.com]=20
> Sent: Thursday, July 04, 2013 7:18 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Guo Chunrong-B40290; Yu Zongchun-B40527
> Subject: Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only=
 with systemd in DISTRO_FEATURES
>=20
> [Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with sy=
stemd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:
>=20
> > On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > > ---
> > >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> > >  1 files changed, 5 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > > 0f5b273..0710893 100644
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > @@ -30,9 +30,11 @@ do_install () {
> > >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d=20
> > > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf=20
> > > ${D}${sysconfdir}/
> > >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > > -
> > > -    install -d ${D}${systemd_unitdir}/system
> > > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +
> > > +    if=20
> > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > > then +        install -d ${D}${systemd_unitdir}/system
> > > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +    fi
> > >=20
> > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}"=
 !=3D ""
> > > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
> >=20
> > I think we should really have a global fix for this issue rather than=
=20
> > hacking up every recipe:
> >=20
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309
>=20
> I'm inclined to agree, but looking at the bug it looks like the potential=
 solution was discussed in February and it's on the schedule for Yocto 1.5,=
 but that's October.
>=20
> So I did a quick survey, here's the meta-networking recipes that'll be im=
pacted, if we adopt the workaround approach:
>=20
>    - net-snmp
>    - dnsmasq (obviously)
>    - ypbind-mt
>    - yp-tools
>    - ntp
>    - atftp
>=20
> I decided I'd have a look at meta-oe for contrast (and guidance) and this=
 is what I found there:
>=20
>    - slim
>    - tracker
>    - cloud9
>    - zram
>    - gpsd
>    - gateone
>=20
> On the other hand, xinput-calibrator and xserver-nodm-init,  already have=
 the same fix in it Chunrong is proposing.  So the impact of doing either i=
sn't huge, but it's not small either.
>=20
> Chunrong:  Would you be willing to retest and resubmit your patch with th=
e above listed meta-networking recipes as a set?  I don't see a lot of sens=
e in doing this piecemeal, I'm okay with taking a workaround until
> #4309 gets fixed, but I'd rather tear the band-aid off all at once, so to=
 speak.
>=20
> --
> -Joe MacDonald.
> :wq
>=20

--=20
-Joe MacDonald.
:wq

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHcXTsACgkQPN8S4W6ZZnf55ACeJnz15AWjre5t4cF6N5tt8dRm
LnoAnRKHHVdIWh72Cmdi9+m12lG3QBen
=KQga
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
