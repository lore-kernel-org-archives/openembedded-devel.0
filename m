Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F3A2A72DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:22:23 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YLejo-0003qP-K1 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2015 13:22:24 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 13:22:24 -0800
Received: by burninator (Postfix, from userid 1000)	id 883A8581332; Wed, 11
	Feb 2015 16:22:23 -0500 (EST)
Date: Wed, 11 Feb 2015 16:22:23 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150211212223.GF30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANn4cy3YzOYgpSh6hC=vAA=NpyEPghs_jPNY433OeYWKSA@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: meta-selinux
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
X-List-Received-Date: Wed, 11 Feb 2015 21:22:33 -0000
X-Groupsio-MsgNum: 54188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline

--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-selinux] On 15.02.11 (Wed 09:25) Christopher Larson wrote:

> On Wed, Feb 11, 2015 at 8:53 AM, dpquigl <dpquigl@tycho.nsa.gov> wrote:
>=20
> > I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> > by the yocto project. I'm trying to use it with a base openembedded core
> > and its not in sync with oe-core because its based on pokey. This made
> > me think of two questions. 1) Why is this not in OE core since so many
> > packages in core can potentially have SELinux support enabled and 2) if
> > its not supposed to be in core where should turning on SELinux support
> > in a recipe go? For example coreutils can have SELinux support enabled.
> > Currently this is in meta-selinux as a bbappend to the coreutils
> > package. This works out because its always going to be there. However
> > there is also a bbappend for an LXC recipe. LXC isn't in core which
> > means it has a dependency on a layer not in core.
> >
>=20
> This is a bug in the layer. It's fairly trivial to construct a layer in
> such a way that you can have per-layer bbappends that are only applied wh=
en
> that layer exists. This is likely the approach meta-selinux should take to
> address this implicit dependency upon meta-virtualization.

I agree.  As Philip mentioned, there's been creep in meta-selinux
dependencies that I really would prefer to avoid but I haven't gotten
around to making the dependencies optional and proposing a patch set on
the list yet.  It's something I think we need, though, particularly for
meta-selinux, but I imagine it's not the only layer that could use such
a change.

> That said, I think most folks would be open to PACKAGECONFIGs for selinux
> capability going into the main recipes, as that's not an invasive change,
> nor a patch, but just a tweak in configuration.

I know that's been the case in several places already, and in a lot of
cases I think that's probably the better place to do such things, so
that at least in theory the layer maintainers themselves are aware of
selinux issues, but I try to be a practical sort and since I don't
expect up-stream developers to be maintaining their own policy modules,
I also don't expect layer maintainers to be testing with selinux all
that often.  :-)

FWIW, though, there're plenty of examples in oe-core of SELinux
PACKAGECONFIGs and that works out pretty well for everyone, I think.

--=20
-Joe MacDonald.
:wq

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU28gPAAoJEEn8ffcsOfaWsa4H/0eJKjVZrElLtzogSmCgEvYq
9MCd38JzSadH8WcgdP0O4KniO2f4oLp4zwGJeR9Wky+4wLPwCBnVR2CTk61p4TkI
6Kqb0CMfdgzvg798SfjhQBmZgxWeZoqwMIuujGeVTGBKnkmjkzXe4rLVr39iQ1mR
h6drRMaJY0xCTpYUKOmL0n4WA5JQOODGsF2cgDJidh+Mw1Dhu26Ft/vTtu+JfaDM
mLJDDzunJc4F6CLrpaQ4cKhzAl6kE3DZIlv0MbC2wFut3P9gVjtqZhKVSgVYnBHl
Mj1kiu52oa60/hnk+2ZkqbdH41UEJ080u00v4XH2uTGJ+S8xGKk2CR5v+KWk/es=
=nvAG
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--
