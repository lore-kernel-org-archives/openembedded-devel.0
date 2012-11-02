Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TUHBf-0007vX-E3
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 14:21:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA2D7jk4025379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Nov 2012 06:07:45 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 2 Nov 2012 06:07:44 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 7F8577FCE;	Fri,  2 Nov 2012 09:07:26 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	B316C6A7A94; Fri,  2 Nov 2012 09:07:43 -0400 (EDT)
Date: Fri, 2 Nov 2012 09:07:43 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121102130743.GC4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
	<2240810.9tyY23JxNH@helios>
MIME-Version: 1.0
In-Reply-To: <2240810.9tyY23JxNH@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "Little, Morgan" <Morgan.Little@windriver.com>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 02 Nov 2012 13:21:27 -0000
X-Groupsio-MsgNum: 41418
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.02 (Fri 09:59) Paul Eggleton wrote:

> On Thursday 01 November 2012 13:32:40 Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On=20
> 12.11.01 (Thu 17:19) Paul Eggleton wrote:
> > > On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
> > > > My rational behind splitting like that is if it is just ntpdate and=
 you
> > > > try
> > > > to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It c=
ould
> > > > be
> > > > change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provid=
es a
> > > > uniquely named version.
> > >=20
> > > The ssl version could be ntpdate-ssl if it needs to be unique. I think
> > > originally though these recipes weren't intended to be built side-by-=
side
> > > -
> > > rather they were mutually exclusive and the distro would make a choic=
e as
> > > to which one was built.
> >=20
> > Hmm, good point.
> >=20
> > Does it make sense to have both on a system?  That is, if you build
> > ntp-ssl does that imply it will only use SSL for communications?  If
> > that's not the case (which I suspect it isn't, but I haven't checked
> > myself) then there's not really a strong reason to install both on the
> > same system.  Which then seems fine to provide ntpdate-ssl as the
> > alternative.
>=20
> I'm not sure that it does. I think the split was made just to avoid bring=
ing
> in OpenSSL on systems where it was not needed or desired. Phil Blundell (=
on=20
> CC) made the split quite a while ago in OE-Classic - Phil can you comment?
>=20
> > Now that I think about it a bit more, maybe a RPROVIDES is appropriate
> > since ntp and ntpdate are overlapping in a lot of places.
>=20
> Sorry, I don't quite understand what you mean here... ?

Sorry about that, I've been interleaving writing and thinking, usually
not a good recipe.  :-)

It's been so long since I had to actually pay attention to what's in
ntp that I'm just getting back clued up on it.  I was thinking that it
should be made explicit in the ntp recipe that it provides ntpdate and
therefore you would never need to have ntpdate and ntp/ntp-ssl installed
on the same system at the same time.

So going back to Morgan's thing, I think now that the case of "add
ntp-ssl and ntpdate" is invalid, and the result should be using ntp-ssl
to provide ntpdate.  As long as that's what is happening with his
recipe, I'm okay with it.  If it's actually dragging in ntp in addition
to ntp-ssl purely to provide ntpdate, I think we have a problem.  And
nothing should result in ntp[-ssl] and ntpdate (as in the things
provided by two or more recipes) being on the same system at the same
time, since ntp provides ntpdate anyway.  At least it looks like it does
on my test build.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCTxZ8ACgkQPN8S4W6ZZneKMQCfbbeuBblqSUr6NVbHacFISG1q
YqEAn2sGQOEPtnGFuPY+1jwf5+52qkRk
=uAxP
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
