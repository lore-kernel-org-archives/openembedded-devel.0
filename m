Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TUI2Y-0003fp-L2
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 15:16:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA2E2NAZ026748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Nov 2012 07:02:24 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 2 Nov 2012 07:02:23 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id E36607FCE;	Fri,  2 Nov 2012 10:02:05 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	21E2F6A7AA2; Fri,  2 Nov 2012 10:02:23 -0400 (EDT)
Date: Fri, 2 Nov 2012 10:02:23 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121102140222.GG4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<2240810.9tyY23JxNH@helios> <20121102130743.GC4416@windriver.com>
	<5635412.CqmEY78XQ7@helios>
MIME-Version: 1.0
In-Reply-To: <5635412.CqmEY78XQ7@helios>
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
X-List-Received-Date: Fri, 02 Nov 2012 14:16:07 -0000
X-Groupsio-MsgNum: 41424
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xs+9IvWevLaxKUtW"
Content-Disposition: inline

--xs+9IvWevLaxKUtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.02 (Fri 13:38) Paul Eggleton wrote:

> On Friday 02 November 2012 09:07:43 Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On=20
> 12.11.02 (Fri 09:59) Paul Eggleton wrote:
> > > On Thursday 01 November 2012 13:32:40 Joe MacDonald wrote:
> > > > Does it make sense to have both on a system?  That is, if you build
> > > > ntp-ssl does that imply it will only use SSL for communications?  If
> > > > that's not the case (which I suspect it isn't, but I haven't checked
> > > > myself) then there's not really a strong reason to install both on =
the
> > > > same system.  Which then seems fine to provide ntpdate-ssl as the
> > > > alternative.
> > >=20
> > > I'm not sure that it does. I think the split was made just to avoid
> > > bringing in OpenSSL on systems where it was not needed or desired. Ph=
il
> > > Blundell (on CC) made the split quite a while ago in OE-Classic - Phil
> > > can you comment?
> >
> > > > Now that I think about it a bit more, maybe a RPROVIDES is appropri=
ate
> > > > since ntp and ntpdate are overlapping in a lot of places.
> > >=20
> > > Sorry, I don't quite understand what you mean here... ?
> >=20
> > Sorry about that, I've been interleaving writing and thinking, usually
> > not a good recipe.  :-)
> >=20
> > It's been so long since I had to actually pay attention to what's in
> > ntp that I'm just getting back clued up on it.  I was thinking that it
> > should be made explicit in the ntp recipe that it provides ntpdate and
> > therefore you would never need to have ntpdate and ntp/ntp-ssl installed
> > on the same system at the same time.
> >=20
> > So going back to Morgan's thing, I think now that the case of "add
> > ntp-ssl and ntpdate" is invalid, and the result should be using ntp-ssl
> > to provide ntpdate.  As long as that's what is happening with his
> > recipe, I'm okay with it.  If it's actually dragging in ntp in addition
> > to ntp-ssl purely to provide ntpdate, I think we have a problem.  And
> > nothing should result in ntp[-ssl] and ntpdate (as in the things
> > provided by two or more recipes) being on the same system at the same
> > time, since ntp provides ntpdate anyway.  At least it looks like it does
> > on my test build.
>=20
> I have to say I think that these days this could be better implemented
> as one ntp recipe with a PACKAGECONFIG that you can use to enable
> OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> choice as to whether this is enabled as I believe was originally
> intended.

I'm also perfectly fine with that.  Question, though.  Do you mean that
the presence of OpenSSL in the distro would then mean you get ntp-ssl
all the time?  That would be fine for me, but I wonder if anyone else
might want OpenSSL on their system but a non-ssl-enabled ntp?  Probably
a silly case to be thinking about anyway.

I'm fine with a single recipe and using PACKAGECONFIG to control the
sslness of it.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--xs+9IvWevLaxKUtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCT0m4ACgkQPN8S4W6ZZnf1VgCeKTtLFmj20M+TR2Ly1D4Oi7iD
ar0AnAk83e9/OTn4JIoQWyaFrGCWIYep
=Hkk7
-----END PGP SIGNATURE-----

--xs+9IvWevLaxKUtW--
