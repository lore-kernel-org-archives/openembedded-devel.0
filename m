Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TUIDn-0004P9-Mr
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 15:27:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA2EE3rG028745
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Nov 2012 07:14:03 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 2 Nov 2012 07:14:03 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 5808D7FCE;	Fri,  2 Nov 2012 10:13:45 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	9B0A06A7AA2; Fri,  2 Nov 2012 10:14:02 -0400 (EDT)
Date: Fri, 2 Nov 2012 10:14:02 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121102141401.GJ4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<5635412.CqmEY78XQ7@helios> <20121102140222.GG4416@windriver.com>
	<4865473.CrnCVaFvWL@helios>
MIME-Version: 1.0
In-Reply-To: <4865473.CrnCVaFvWL@helios>
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
X-List-Received-Date: Fri, 02 Nov 2012 14:27:44 -0000
X-Groupsio-MsgNum: 41426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZVh52eu0Ophig4D"
Content-Disposition: inline

--YZVh52eu0Ophig4D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.02 (Fri 14:10) Paul Eggleton wrote:

> On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> > On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> > > I have to say I think that these days this could be better implemented
> > > as one ntp recipe with a PACKAGECONFIG that you can use to enable
> > > OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> > > done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> > > choice as to whether this is enabled as I believe was originally
> > > intended.
> >=20
> > I'm also perfectly fine with that.  Question, though.  Do you mean that
> > the presence of OpenSSL in the distro would then mean you get ntp-ssl
> > all the time?  That would be fine for me, but I wonder if anyone else
> > might want OpenSSL on their system but a non-ssl-enabled ntp?  Probably
> > a silly case to be thinking about anyway.
>=20
> The idea with PACKAGECONFIG is it allows per-recipe control over this kin=
d of=20
> thing. The default would be for OpenSSL support to be disabled, but it co=
uld=20
> be enabled with a bbappend containing PACKAGECONFIG +=3D "openssl";=20
> alternatively you could do PACKAGECONFIG_append_pn-ntp =3D " openssl" in =
the=20
> distro .conf file or even local.conf.
>=20
> I'll send a patch.

Great.  Thanks, Paul.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--YZVh52eu0Ophig4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCT1SkACgkQPN8S4W6ZZnf4XACfT/Am1DA3BH/VHzVRYF6kmRIj
NNAAmwXszZK2KL8rITqu08OAhQEGifXE
=e8aF
-----END PGP SIGNATURE-----

--YZVh52eu0Ophig4D--
