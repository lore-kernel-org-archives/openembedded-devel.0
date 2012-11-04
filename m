Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TV5O1-00063i-Gx
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Nov 2012 19:57:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA4Ihj8c005839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Nov 2012 10:43:46 -0800 (PST)
Received: from skynet (172.25.44.2) by ALA-HCA.corp.ad.wrs.com (147.11.189.50)
	with Microsoft SMTP Server id 14.2.318.4;
	Sun, 4 Nov 2012 10:43:45 -0800
Received: by skynet (Postfix, from userid 1000)	id D4E07600C77; Sun,  4 Nov
	2012 13:43:40 -0500 (EST)
Date: Sun, 4 Nov 2012 13:43:40 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Little, Morgan"
	<Morgan.Little@windriver.com>
Message-ID: <20121104184340.GB12556@windriver.com>
References: <1351009220-30119-1-git-send-email-morgan.little@windriver.com>
	<4865473.CrnCVaFvWL@helios> <20121102141401.GJ4416@windriver.com>
	<3131993.6qyQprBZ04@helios>
MIME-Version: 1.0
In-Reply-To: <3131993.6qyQprBZ04@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 04 Nov 2012 18:57:33 -0000
X-Groupsio-MsgNum: 41432
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline

--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipes] O=
n 12.11.02 (Fri 17:26) Paul Eggleton wrote:

> On Friday 02 November 2012 10:14:02 Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][meta-networking][PATCH V2 3/3] ntp: Clean up recipe=
s] On=20
> 12.11.02 (Fri 14:10) Paul Eggleton wrote:
> > > On Friday 02 November 2012 10:02:23 Joe MacDonald wrote:
> > > > On 12.11.02 (Fri 13:38) Paul Eggleton wrote:
> > > > > I have to say I think that these days this could be better implem=
ented
> > > > > as one ntp recipe with a PACKAGECONFIG that you can use to enable
> > > > > OpenSSL support if desired. (At the time the ntp/ntp-ssl split was
> > > > > done, PACKAGECONFIG did not exist). Then it becomes a distro-level
> > > > > choice as to whether this is enabled as I believe was originally
> > > > > intended.
> > > >=20
> > > > I'm also perfectly fine with that.  Question, though.  Do you mean =
that
> > > > the presence of OpenSSL in the distro would then mean you get ntp-s=
sl
> > > > all the time?  That would be fine for me, but I wonder if anyone el=
se
> > > > might want OpenSSL on their system but a non-ssl-enabled ntp?  Prob=
ably
> > > > a silly case to be thinking about anyway.
> > >=20
> > > The idea with PACKAGECONFIG is it allows per-recipe control over this=
 kind
> > > of thing. The default would be for OpenSSL support to be disabled, bu=
t it
> > > could be enabled with a bbappend containing PACKAGECONFIG +=3D "opens=
sl";
> > > alternatively you could do PACKAGECONFIG_append_pn-ntp =3D " openssl"=
 in the
> > > distro .conf file or even local.conf.
> > >=20
> > > I'll send a patch.
> >=20
> > Great.  Thanks, Paul.
>=20
> Unfortunately when I tested the OpenSSL part I found that it's not
> actually linking against the OpenSSL libraries (!) This is due to
> libssl and libcrypto being split between /usr/lib and /lib
> respectively instead of being in the same directory as the configure
> script expects.

Is that intentional?  I mean is that a misconfiguration or something
reasonably easily changed, or are there specific reasons for that split,
do you know?

> Also the OpenSSL include directory being specified does not match with
> what the configure script tests for (it's supposed to be the parent of
> the openssl directory, not the openssl directory itself).

Yeah, that's interesting.  Present in the existing recipe as well, from
what I can see, so I'm thinking that hasn't worked since at least the
update to 4.2.6p5.

Morgan, can you confirm that you've got SSL support working in your
updated recipe(s)?

> I've also noticed that the ${PN}-utils package ends up empty and the ${PN=
}-bin=20
> directory contains a bunch of binaries I would have assumed belonged in t=
hat=20
> package. What should be in these packages? Should there just be one?

I think so.  Given that ntpd lives in FILES_${PN}, I'm thinking
everything listed in -bin looks appropriate for -utils.  Or dumping
-utils and leaving them in -bin.  Looking at the recipe it seems like
-utils was intended to be a housecleaning collection.  Did you find
other non-named binaries living in ${bindir} on some builds, Morgan?

--=20
-Joe MacDonald.
:wq

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlCWt1wACgkQPN8S4W6ZZndGmQCeMH4PbL+8UP2O5QWby1hdIdqu
5sYAn2gAEPvLlPUGO4dndIlo1SuC4O/5
=sD81
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
