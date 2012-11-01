Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TTyqS-0003Tw-Ls
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Nov 2012 18:46:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA1HWhXZ004794
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Nov 2012 10:32:43 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 1 Nov 2012 10:32:41 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 405D67FCE;	Thu,  1 Nov 2012 13:32:24 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	7DFDE6A86DB; Thu,  1 Nov 2012 13:32:40 -0400 (EDT)
Date: Thu, 1 Nov 2012 13:32:40 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121101173240.GV4673@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<20121101143114.GF4673@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
	<1363930.E51Pa0kBDd@helios>
MIME-Version: 1.0
In-Reply-To: <1363930.E51Pa0kBDd@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Little, Morgan" <Morgan.Little@windriver.com>
Subject: Re: [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Thu, 01 Nov 2012 17:46:21 -0000
X-Groupsio-MsgNum: 41407
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EjUKZjov3T4fFoFJ"
Content-Disposition: inline

--EjUKZjov3T4fFoFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.01 (Thu 17:19) Paul Eggleton wrote:

> On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
> > My rational behind splitting like that is if it is just ntpdate and you=
 try
> > to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It could=
 be
> > change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provides a
> > uniquely named version.
>=20
> The ssl version could be ntpdate-ssl if it needs to be unique. I think=20
> originally though these recipes weren't intended to be built side-by-side=
 -=20
> rather they were mutually exclusive and the distro would make a choice as=
 to=20
> which one was built.

Hmm, good point.

Does it make sense to have both on a system?  That is, if you build
ntp-ssl does that imply it will only use SSL for communications?  If
that's not the case (which I suspect it isn't, but I haven't checked
myself) then there's not really a strong reason to install both on the
same system.  Which then seems fine to provide ntpdate-ssl as the
alternative.

Now that I think about it a bit more, maybe a RPROVIDES is appropriate
since ntp and ntpdate are overlapping in a lot of places.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--EjUKZjov3T4fFoFJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCSsjgACgkQPN8S4W6ZZneM6ACcDA3nbfr5h5vTzPbTh6vo9TqY
7XgAnjp4UmD9XnivuRZO9fQvjSGEaMyn
=YcrO
-----END PGP SIGNATURE-----

--EjUKZjov3T4fFoFJ--
