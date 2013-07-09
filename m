Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id E773561FE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2013 20:43:03 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id t10so4099812eei.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2013 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/rh93fEP8PT+rHZ88L6PIiM2hv11mJApiRfSiIM9pW8=;
	b=iXAotkyZCzkoNOng6PvmCP/nOHKpQzoqqsUcu4CpWkeDeod1j0FKFyN9tJuzSe0b35
	khhYBoYlE+D5Jeq18L760xFanG6L63faucVHuBaQvSJByRYkCzTBB7ej+PI49tAo4xFt
	ujcy24WHcw940BoWjKDhZbXJAxjXdm+3xEukeP3Wy6PWw5Epvl34XaLEeOkNYDCb/H3O
	uxxPEO72hfuNaexTLep7GQPtYJqqMCIxNqTmlYpWeGcevPBB6CypZDnr0u+XGi8p28Zb
	66/shtQW3G5Mw+ISyD2mnc7Vm4l9rblsdCJ1NRefbgyd8GbvSEVlDkpeyzaOUtwq+35W
	wp7g==
X-Received: by 10.14.47.196 with SMTP id t44mr21389279eeb.18.1373402583723;
	Tue, 09 Jul 2013 13:43:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm53986683eeh.11.2013.07.09.13.43.02 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 13:43:03 -0700 (PDT)
Date: Tue, 9 Jul 2013 22:43:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130709204312.GV3288@jama>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios> <20130704111809.GA3831@windriver.com>
	<B21730BB6DA1D24B83348D9301EA417E1040BD1A@039-SN2MPN1-021.039d.mgd.msft.net>
	<20130709185803.GA13741@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130709185803.GA13741@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
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
X-List-Received-Date: Tue, 09 Jul 2013 20:43:04 -0000
X-Groupsio-MsgNum: 45351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hFEw+uh9kF5V6COn"
Content-Disposition: inline

--hFEw+uh9kF5V6COn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2013 at 02:58:03PM -0400, Joe MacDonald wrote:
> [RE: [oe] [meta-networking][PATCH] dnsmasq: install .service only with sy=
stemd in DISTRO_FEATURES] On 13.07.05 (Fri 07:45) Guo Chunrong-B40290 wrote:
>=20
> > Hello, Joe MacDonald
> > New  patch was submitted.
> > I do not modify (atftp/tracker/gateone)  recips and slim recipes do not=
 work.
> > SO the code in these recipes  add  ${systemd_unitdir} to FILES and thes=
e recipes work well.=20
>=20
> Just FYI, I saw your patch, I have it in a merge queue, but right now
> I'm looking at the bug Paul quoted and the mailing list discussion
> quoted therein to see if we can come up with a better, more general
> solution.

FWIW: When I was moving systemd support from meta-systemd layer I was
aware of this issue and I still believe that systemd.bbclass is right
place to solve this, instead of adding conditionals in many recipes.

Old systemd.bbclass in meta-systemd worked like this, maybe it wasn't
most elegant solution, but it could be improved instead of pushing this
issue to every recipes with .service file.

Cheers,

> > -----Original Message-----
> > From: Joe MacDonald [mailto:Joe.MacDonald@windriver.com]=20
> > Sent: Thursday, July 04, 2013 7:18 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Guo Chunrong-B40290; Yu Zongchun-B40527
> > Subject: Re: [oe] [meta-networking][PATCH] dnsmasq: install .service on=
ly with systemd in DISTRO_FEATURES
> >=20
> > [Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with =
systemd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:
> >=20
> > > On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > > > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > > > ---
> > > >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> > > >  1 files changed, 5 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > > > 0f5b273..0710893 100644
> > > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > @@ -30,9 +30,11 @@ do_install () {
> > > >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d=20
> > > > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf=
=20
> > > > ${D}${sysconfdir}/
> > > >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > > > -
> > > > -    install -d ${D}${systemd_unitdir}/system
> > > > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > > > ${D}${systemd_unitdir}/system +
> > > > +    if=20
> > > > + ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > > > then +        install -d ${D}${systemd_unitdir}/system
> > > > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > > > ${D}${systemd_unitdir}/system +    fi
> > > >=20
> > > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)=
}" !=3D ""
> > > > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
> > >=20
> > > I think we should really have a global fix for this issue rather than=
=20
> > > hacking up every recipe:
> > >=20
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309
> >=20
> > I'm inclined to agree, but looking at the bug it looks like the potenti=
al solution was discussed in February and it's on the schedule for Yocto 1.=
5, but that's October.
> >=20
> > So I did a quick survey, here's the meta-networking recipes that'll be =
impacted, if we adopt the workaround approach:
> >=20
> >    - net-snmp
> >    - dnsmasq (obviously)
> >    - ypbind-mt
> >    - yp-tools
> >    - ntp
> >    - atftp
> >=20
> > I decided I'd have a look at meta-oe for contrast (and guidance) and th=
is is what I found there:
> >=20
> >    - slim
> >    - tracker
> >    - cloud9
> >    - zram
> >    - gpsd
> >    - gateone
> >=20
> > On the other hand, xinput-calibrator and xserver-nodm-init,  already ha=
ve the same fix in it Chunrong is proposing.  So the impact of doing either=
 isn't huge, but it's not small either.
> >=20
> > Chunrong:  Would you be willing to retest and resubmit your patch with =
the above listed meta-networking recipes as a set?  I don't see a lot of se=
nse in doing this piecemeal, I'm okay with taking a workaround until
> > #4309 gets fixed, but I'd rather tear the band-aid off all at once, so =
to speak.
> >=20
> > --
> > -Joe MacDonald.
> > :wq
> >=20
>=20
> --=20
> -Joe MacDonald.
> :wq



> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hFEw+uh9kF5V6COn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHcdeAACgkQN1Ujt2V2gByVggCdE2cuZwmW6Tdc1LJpZOUWC8M8
6PcAoKd1rCfEq6GaL8usSdB1QcptJxG4
=A1ds
-----END PGP SIGNATURE-----

--hFEw+uh9kF5V6COn--
