Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TUHIK-0008Ea-3P
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 14:28:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA2DEdbu017179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Nov 2012 06:14:40 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 2 Nov 2012 06:14:39 -0700
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 9CCAA7FCE	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2012 09:14:21 -0400 (EDT)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	D48936A7AA2; Fri,  2 Nov 2012 09:14:38 -0400 (EDT)
Date: Fri, 2 Nov 2012 09:14:38 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121102131438.GE4416@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<20121101143114.GF4673@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689A9978@ALA-MBB.corp.ad.wrs.com>
	<1363930.E51Pa0kBDd@helios> <20121101173240.GV4673@windriver.com>
	<50936F79.2040507@gmail.com> <20121102130111.GB4416@windriver.com>
	<5093C620.2030706@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5093C620.2030706@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Fri, 02 Nov 2012 13:28:20 -0000
X-Groupsio-MsgNum: 41421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.02 (Fri 14:09) Martin Erts=E5s wrote:

> On 11/02/12 14:01, Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On 12.11.02 (Fri 08:00) Martin Erts=E5s wrote:
> >
> >> On 11/01/12 18:32, Joe MacDonald wrote:
> >>> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up reci=
pes] On 12.11.01 (Thu 17:19) Paul Eggleton wrote:
> >>>
> >>>> On Thursday 01 November 2012 17:09:59 Little, Morgan wrote:
> >>>>> My rational behind splitting like that is if it is just ntpdate and=
 you try
> >>>>> to add ntp-ssl and ntpdate it will use ntp to provide ntpdate. It c=
ould be
> >>>>> change add RPROVIDES so ntp will provide ntpdate and ntp-ssl provid=
es a
> >>>>> uniquely named version.
> >>>> The ssl version could be ntpdate-ssl if it needs to be unique. I thi=
nk=20
> >>>> originally though these recipes weren't intended to be built side-by=
-side -=20
> >>>> rather they were mutually exclusive and the distro would make a choi=
ce as to=20
> >>>> which one was built.
> >>> Hmm, good point.
> >>>
> >>> Does it make sense to have both on a system?  That is, if you build
> >>> ntp-ssl does that imply it will only use SSL for communications?  If
> >>> that's not the case (which I suspect it isn't, but I haven't checked
> >>> myself) then there's not really a strong reason to install both on the
> >>> same system.  Which then seems fine to provide ntpdate-ssl as the
> >>> alternative.
> >>>
> >>> Now that I think about it a bit more, maybe a RPROVIDES is appropriate
> >>> since ntp and ntpdate are overlapping in a lot of places.
> >>>
> >>>
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> Are you thinking of ntp providing ntpdate then? In my mind at least,
> >> this makes sense, as ntp seems able to do whatever ntpdate does, so I
> >> don't really see the rational of having both on the same system.
> > Yeah, exactly.  The only time I've ever wanted both ntp and ntpdate on
> > the same system at the same time was when I had a system with a clock
> > that was so badly damaged occasionally ntp couldn't recover it and I
> > needed to just do a reset on the time.  But I could have even
> > accomplished that with ntp -q.  In fact, a quick check of the ntp
> > manpage on my system says:
> >
> >        -q     Exit the ntpd just after the first time the clock is set.
> >               This behavior mimics that of the ntpdate  program, which
> >               is to be retired.  The -g and -x options can be used with
> >               this option.  Note: The kernel time discipline is disabled
> >               with this option.
> >
> > So I'm thinking that ntpdate can be completely replaced with ntp if
> > you're putting that on your system.  The obvious fallout would be in any
> > scripts specifically relying on something called 'ntpdate', but it looks
> > to me like the ntp package is already providing an ntpdate binary.
> > Seeing that, it seems to me that ntp/ntp-ssl and ntpdate actually
> > conflict with each other.
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> Then I agree, and think a nice solution to this would be that ntp
> provides ntpdate, as we don't want both. If you install ntp, you won't
> need ntpdate, and if you want ntpdate, you don't need all of ntp, and
> therefor just install ntpdate, and the same goes of course if what you
> want is ntp-ssl.
>=20
> If ntp is actually providing a ntpdate binary, I agree that it should
> actually conflict, and not only provide ntpdate.

Yep, my thoughts exactly.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCTxz4ACgkQPN8S4W6ZZncP4wCfTXa1YERpNccWhYDRCl8llNJ6
HR0An1KN4JJAWenMH+R39QFMJEThMMRY
=taHK
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
