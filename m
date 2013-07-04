Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEB816AFBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 13:02:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r64D2tbW011181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2013 06:02:55 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 4 Jul 2013 06:02:55 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id B987AA06C;
	Thu,  4 Jul 2013 09:02:41 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 0C4E6410DF; Thu,
	4 Jul 2013 09:02:54 -0400 (EDT)
Date: Thu, 4 Jul 2013 09:02:53 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, <b40527@freescale.com>
Message-ID: <20130704130253.GH3831@windriver.com>
References: <1372929983-1410-1-git-send-email-B40290@freescale.com>
	<2942656.3ozBKLWcr5@helios> <20130704111809.GA3831@windriver.com>
	<1519816.5pLVqjn9PM@helios>
MIME-Version: 1.0
In-Reply-To: <1519816.5pLVqjn9PM@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 04 Jul 2013 13:02:58 -0000
X-Groupsio-MsgNum: 45279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
Content-Disposition: inline

--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with syst=
emd in DISTRO_FEATURES] On 13.07.04 (Thu 13:47) Paul Eggleton wrote:

> On Thursday 04 July 2013 07:18:09 Joe MacDonald wrote:
> > [Re: [oe] [meta-networking][PATCH] dnsmasq: install .service only with=
=20
> systemd in DISTRO_FEATURES] On 13.07.04 (Thu 11:50) Paul Eggleton wrote:
> > > On Thursday 04 July 2013 17:26:23 Chunrong Guo wrote:
> > > > Signed-off-by: Chunrong Guo <B40290@freescale.com>
> > > > ---
> > > >=20
> > > >  .../recipes-support/dnsmasq/dnsmasq.inc            |    8 +++++---
> > > >  1 files changed, 5 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > > > 0f5b273..0710893 100644
> > > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > > @@ -30,9 +30,11 @@ do_install () {
> > > >=20
> > > >      install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> > > >=20
> > > > ${D}${sysconfdir}/dnsmasq.d install -m 644 ${WORKDIR}/dnsmasq.conf
> > > > ${D}${sysconfdir}/
> > > >=20
> > > >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > > >=20
> > > > -
> > > > -    install -d ${D}${systemd_unitdir}/system
> > > > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > > > ${D}${systemd_unitdir}/system +
> > > > +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false'=
,d)};
> > > > then +        install -d ${D}${systemd_unitdir}/system
> > > > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > > > ${D}${systemd_unitdir}/system +    fi
> > > >=20
> > > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)=
}" !=3D
> > > >      ""
> > > >=20
> > > > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
> > >=20
> > > I think we should really have a global fix for this issue rather than
> > > hacking up every recipe:
> > >=20
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4309
> >=20
> > I'm inclined to agree, but looking at the bug it looks like the
> > potential solution was discussed in February and it's on the schedule
> > for Yocto 1.5, but that's October.
>=20
> The thing is it could be done by anyone at any time - the bug is at statu=
s=20
> "NEW" which means the assignee hasn't actually accepted it yet, and the=
=20
> solution being suggested is fairly straightforward. Given that I think it=
=20
> would be easier to just fix the class and then we never have to worry abo=
ut=20
> this issue again.

Sure, (thanks for the clarification on the NEW status, I didn't know
that meant it wasn't necessarily being actively worked) but I would like
to see this solved for anyone building a system with meta-networking and
without systemd.  Unfortunately I don't think I'm the person to make the
updates to systemd.bbclass I know very little about systemd in general
and nothing about systemd.bbclass.

I was a little less averse to taking this workaround (I see it purely as
a workaround until a solution is implemented) since there's precedent
and since the spot that Chunrong is changing for dnsmasq has a very
similar construct immediately following for dbus.  I would prefer,
though, if we do take this kind of workaround, it be done everywhere (at
least in meta-networking) in one operation so it's easy to back out
afterward.

Chunrong, do you want to propose a solution like the one referenced in
the above bug?  Or even the one originally suggested by Paul in the bug?
Or does someone else on the list have a WIP on this item?

--=20
-Joe MacDonald.
:wq

--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHVcn0ACgkQPN8S4W6ZZneNzwCfZj/4eiboHjRS6EIH+e+EZHhx
7gIAniVyjZvBDnl4MlWGz3fYO4WmKj8o
=1BTu
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
