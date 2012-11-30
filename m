Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TeV2w-0002s6-ON
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 19:10:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUHuNbl018571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Nov 2012 09:56:23 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 30 Nov 2012 09:56:23 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id D7A647FE2;	Fri, 30 Nov 2012 12:55:32 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	B929D6A7E5E; Fri, 30 Nov 2012 12:56:22 -0500 (EST)
Date: Fri, 30 Nov 2012 12:56:22 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121130175622.GT6912@windriver.com>
References: <50B8DC5A.7050203@windriver.com>
	<20121130163410.GP6912@windriver.com> <5531449.L0Ch4936zy@helios>
MIME-Version: 1.0
In-Reply-To: <5531449.L0Ch4936zy@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: netperf in meta-networking
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
X-List-Received-Date: Fri, 30 Nov 2012 18:10:44 -0000
X-Groupsio-MsgNum: 41838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dBMBt2YGaTHbdllf"
Content-Disposition: inline

--dBMBt2YGaTHbdllf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] netperf in meta-networking] On 12.11.30 (Fri 16:55) Paul Eggleton=
 wrote:

> On Friday 30 November 2012 11:34:11 Joe MacDonald wrote:
> > [netperf in meta-networking] On 12.11.30 (Fri 10:18) Mark Hatle wrote:
> > > I was helping someone with building netperf from meta-networking
> > > last night, and stumbled on what I think is a bug.
> > >=20
> > > SUMMARY =3D "A networking benchmarking tool"
> > > DESCRIPTION =3D "Network performance benchmark including tests for
> > > TCP, UDP, sockets, ATM and more."
> > > SECTION =3D "console/network"
> > > HOMEPAGE =3D "http://www.netperf.org/"
> > > LICENSE =3D "netperf"
> > > LICENSE_FLAGS =3D "commercial"
> > >=20
> > > In the above, the LICENSE_FLAGS are set to 'commercial'.  I think
> > > this is incorrect.  It should be set to 'non-commercial'.
> > >=20
> > > There is a subtle difference between them which is why I think it's a
> > > bug...
> > >=20
> > > commercial -- there are some commercial requirements necessary to
> > > use this recipe in a commercial device... you are responsible for
> > > understanding them and doing whatever is necessary... (for
> > > non-commercial devices you can likely use it...)
> > >=20
> > > non-commercial -- this item is restricted to non-commercial users
> > > only.  As in the case of netperf, the license says it's only for
> > > non-commercial use.
> > >=20
> > > So anyway, my suggestion is to simply change the value of the flag.
> >=20
> > Ugh.  I had a quick look around and the first thing I found was this:
> >=20
> > http://www.netperf.org/svn/netperf4/trunk/include/netperf.h
>=20
> This is netperf4 though which I gather is distinct from the version of
> netperf we are building.

Yeah, that's what had me going back to the documentation in the tarball,
since given the previous license, this one is worlds apart even though
it's coming from the same folks.

> > So I had a look at the netperf source tree fetched by bitbake during a
> > build.  The COPYING file says this:
> >=20
> >   The enclosed software and documentation includes copyrighted works
> >   of Hewlett-Packard Co. For as long as you comply with the following
> >   limitations, you are hereby authorized to (i) use, reproduce, and
> >   modify the software and documentation, and to (ii) distribute the
> >   software and documentation, including modifications, for
> >   non-commercial purposes only.
> >=20
> > So I'm inclined to agree, this sounds like the definition of
> > non-commercial above to me.
>=20
> It's a subtlety - in either case you can't just go ahead and use it for=
=20
> commercial use. I wouldn't object to changing it to "non-commercial" thou=
gh if=20
> it makes more sense.
>=20
> Would it be practical for us to move to netperf4 which is GPLv2+ licensed=
? I'm=20
> not sure if it is a complete replacement for netperf 2.x and we'd need to=
=20
> confirm that first, but at least the license is more reasonable...

I would be happy to see a netperf4-based recipe show up, but I don't
currently have any plans for one.  It would certainly be nice to have
both available, though, since 4 is not a complete replacement for 2.x.

--=20
-Joe MacDonald.
:wq

--dBMBt2YGaTHbdllf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC480YACgkQPN8S4W6ZZncttQCfdfKrlThiMe4BAiJIJ2Rln7mF
mq0An1fvo+vuvgoyhACK2nZmikXI0P+b
=3hC3
-----END PGP SIGNATURE-----

--dBMBt2YGaTHbdllf--
