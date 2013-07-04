Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C932605F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r64BIDkA003643
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2013 04:18:13 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 4 Jul 2013 04:18:11 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C884A52D0B;
	Thu,  4 Jul 2013 07:17:57 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 02272410DF; Thu,
	4 Jul 2013 07:18:09 -0400 (EDT)
Date: Thu, 4 Jul 2013 07:18:09 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130704111809.GA3831@windriver.com>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios>
MIME-Version: 1.0
In-Reply-To: <2942656.3ozBKLWcr5@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: b40527@freescale.com
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
X-List-Received-Date: Thu, 04 Jul 2013 11:18:15 -0000
X-Groupsio-MsgNum: 45276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with syst=
emd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:

> On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > ---
> >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> >  1 files changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > 0f5b273..0710893 100644
> > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > @@ -30,9 +30,11 @@ do_install () {
> >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf
> > ${D}${sysconfdir}/
> >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > -
> > -    install -d ${D}${systemd_unitdir}/system
> > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +
> > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};
> > then +        install -d ${D}${systemd_unitdir}/system
> > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > ${D}${systemd_unitdir}/system +    fi
> >=20
> >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
=3D ""
> > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
>=20
> I think we should really have a global fix for this issue rather than hac=
king=20
> up every recipe:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309

I'm inclined to agree, but looking at the bug it looks like the
potential solution was discussed in February and it's on the schedule
for Yocto 1.5, but that's October.

So I did a quick survey, here's the meta-networking recipes that'll be
impacted, if we adopt the workaround approach:

   - net-snmp
   - dnsmasq (obviously)
   - ypbind-mt
   - yp-tools
   - ntp
   - atftp

I decided I'd have a look at meta-oe for contrast (and guidance) and
this is what I found there:

   - slim
   - tracker
   - cloud9
   - zram
   - gpsd
   - gateone

On the other hand, xinput-calibrator and xserver-nodm-init,  already
have the same fix in it Chunrong is proposing.  So the impact of doing
either isn't huge, but it's not small either.

Chunrong:  Would you be willing to retest and resubmit your patch with
the above listed meta-networking recipes as a set?  I don't see a lot of
sense in doing this piecemeal, I'm okay with taking a workaround until
#4309 gets fixed, but I'd rather tear the band-aid off all at once, so
to speak.

--=20
-Joe MacDonald.
:wq

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHVWe4ACgkQPN8S4W6ZZnf3CACdE02FH8TlAb95hgVwjAr6Cox0
p4kAn3TKn86rLdBaWm+9Iau3o2Vl5cZM
=hNKA
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
