Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TWqLR-0008OC-3g
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2012 16:18:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA9F4FjP009621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2012 07:04:15 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Fri, 9 Nov 2012 07:04:15 -0800
Received: from yow-jmacdona-d2.wrs.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 859167FE2;	Fri,  9 Nov 2012 10:03:49 -0500 (EST)
Received: by yow-jmacdona-d2.wrs.com (Postfix, from userid 1000)	id
	E5D466A3602; Fri,  9 Nov 2012 10:04:14 -0500 (EST)
Date: Fri, 9 Nov 2012 10:04:14 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: "Little, Morgan" <Morgan.Little@windriver.com>
Message-ID: <20121109150414.GA8308@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<4865473.CrnCVaFvWL@helios> <20121102141401.GJ4416@windriver.com>
	<3131993.6qyQprBZ04@helios> <20121104184340.GB12556@windriver.com>
	<FCBA1E696337B442ADB5A7C30428F0689AE6E4@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <FCBA1E696337B442ADB5A7C30428F0689AE6E4@ALA-MBB.corp.ad.wrs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 09 Nov 2012 15:18:17 -0000
X-Groupsio-MsgNum: 41471
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline

--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.09 (Fri 09:55) Little, Morgan wrote:

> On 11/04/2012 01:43 PM, Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On 12.11.02 (Fri 17:26) Paul Eggleton wrote:
> >
> >> On Friday 02 November 2012 10:14:02 Joe MacDonald wrote:
> >>> [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up reci=
pes] On=20
> >> 12.11.02 (Fri 14:10) Paul Eggleton wrote:
> >>>> On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> >>>>> On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> >>>>>> I have to say I think that these days this could be better impleme=
nted
> >>>>>> as one ntp recipe with a PACKAGECONFIG that you can use to enable
> >>>>>> OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> >>>>>> done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> >>>>>> choice as to whether this is enabled as I believe was originally
> >>>>>> intended.
> >>>>>
> >>>>> I'm also perfectly fine with that.  Question, though.  Do you mean =
that
> >>>>> the presence of OpenSSL in the distro would then mean you get ntp-s=
sl
> >>>>> all the time?  That would be fine for me, but I wonder if anyone el=
se
> >>>>> might want OpenSSL on their system but a non-ssl-enabled ntp?  Prob=
ably
> >>>>> a silly case to be thinking about anyway.
> >>>>
> >>>> The idea with PACKAGECONFIG is it allows per-recipe control over thi=
s kind
> >>>> of thing. The default would be for OpenSSL support to be disabled, b=
ut it
> >>>> could be enabled with a bbappend containing PACKAGECONFIG +=3D "open=
ssl";
> >>>> alternatively you could do PACKAGECONFIG_append_pn-ntp =3D " openssl=
" in the
> >>>> distro .conf file or even local.conf.
> >>>>
> >>>> I'll send a patch.
> >>>
> >>> Great.  Thanks, Paul.
> >>
> >> Unfortunately when I tested the OpenSSL part I found that it's not
> >> actually linking against the OpenSSL libraries (!) This is due to
> >> libssl and libcrypto being split between /usr/lib and /lib
> >> respectively instead of being in the same directory as the configure
> >> script expects.
> >
> > Is that intentional?  I mean is that a misconfiguration or something
> > reasonably easily changed, or are there specific reasons for that split,
> > do you know?
> >
> >> Also the OpenSSL include directory being specified does not match with
> >> what the configure script tests for (it's supposed to be the parent of
> >> the openssl directory, not the openssl directory itself).
> >
> > Yeah, that's interesting.  Present in the existing recipe as well, from
> > what I can see, so I'm thinking that hasn't worked since at least the
> > update to 4.2.6p5.
> >
> > Morgan, can you confirm that you've got SSL support working in your
> > updated recipe(s)?
> Looking at the configure output, it seems that my builds don't take ssl i=
n either.
> I'm not sure if 4.2.6p3 worked since without changes the old recipe doesn=
't build.

Yeah, that's expected based on Paul's findings.  I just meant could you
ensure it's working in the next version of the recipe update you send
out?  At some point in the past it was supposed to work, we should
probably try to get back there.  :-)

> >> I've also noticed that the ${PN}-utils package ends up empty and the $=
{PN}-bin=20
> >> directory contains a bunch of binaries I would have assumed belonged i=
n that=20
> >> package. What should be in these packages? Should there just be one?
> >
> > I think so.  Given that ntpd lives in FILES_${PN}, I'm thinking
> > everything listed in -bin looks appropriate for -utils.  Or dumping
> > -utils and leaving them in -bin.  Looking at the recipe it seems like
> > -utils was intended to be a housecleaning collection.  Did you find
> > other non-named binaries living in ${bindir} on some builds, Morgan?
> >
> I didn't find any non-named binaries living in ${bindir}.

Okay, so dump one of -utils or -bin, I'm leaning toward keeping the
former and dumping the latter, but that's really up to you.

--=20
Joe MacDonald, Sr. Member of Technical Staff, Linux Products Group, Wind Ri=
ver
direct 613.270.5750     mobile 613.291.7421     fax 613.592.2283

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCdG24ACgkQPN8S4W6ZZndS8ACfSzlF8I5q63T2OQU8hQLGtSUp
7ZAAmgOQ9y5MYSkeo9Vj7eLA2raUGuIP
=j1H5
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
