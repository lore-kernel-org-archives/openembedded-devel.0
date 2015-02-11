Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD3C2609B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:31:10 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YLesJ-0006HS-91 from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 13:31:11 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 13:31:10 -0800
Received: by burninator (Postfix, from userid 1000)	id 04F0A581332; Wed, 11
	Feb 2015 16:31:09 -0500 (EST)
Date: Wed, 11 Feb 2015 16:31:09 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150211213109.GH30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
	<1423673755.1873.5.camel@tycho.nsa.gov>
MIME-Version: 1.0
In-Reply-To: <1423673755.1873.5.camel@tycho.nsa.gov>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, yocto@yoctoproject.org
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
X-List-Received-Date: Wed, 11 Feb 2015 21:31:18 -0000
X-Groupsio-MsgNum: 54190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+PbGPm1eXpwOoWkI"
Content-Disposition: inline

--+PbGPm1eXpwOoWkI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-selinux] On 15.02.11 (Wed 11:55) dpquigl wrote:

> On Wed, 2015-02-11 at 16:29 +0000, Paul Eggleton wrote:
> > (Adding yocto@yoctoproject.org to CC since that is where meta-selinux p=
atches=20
> > tend to go at least)
> >=20
> > On Wednesday 11 February 2015 10:53:03 dpquigl wrote:
> > > I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> > > by the yocto project. I'm trying to use it with a base openembedded c=
ore
> > > and its not in sync with oe-core because its based on pokey.=20
> >=20
> > To be clear, poky and OE-Core are in lock-step. No patch to core recipe=
s goes=20
> > into Poky directly, they are applied to OE-Core and then they flow into=
 Poky=20
> > immediately thereafter (Richard, who does the merging of patches into O=
E-Core,=20
> > does the sync to Poky immediately afterwards.)
> >=20
> > What's more likely happening I suspect is that you are on a newer=20
> > branch/revision of OE-Core/Poky than the meta-selinux maintainers have =
tested.=20
> > I can't speak to the maintenance schedule for meta-selinux but maybe ot=
hers=20
> > with knowledge there can chime in.
>=20
>=20
> I think this makes the most sense. 3 of the problems were bbappend files
> trying to append the wrong version of a recipe (although with these
> changes I should move them over to a wildcard) and the last one was with
> LXC. After that I encountered a typo in one of the recipes where it
> wasn't able to pull the sources down.=20

I merged a set of patches just in the last couple of days that addresses
a SRC_URI issue and wildcards for bbappends that I hope resolves all of
the current crop of these.  If you update your tree now you will likely
see those go away.  If not, please let me know.

Alternatively, I'm not aware of any issues in 1.7 of that sort (though
now that I think about it, I need to check the SRC_URI one, I bet that's
there), so using the latest released Yocto with a like-named branch in
meta-selinux should always be safe.

-J.

> > > This made me think of two questions. 1) Why is this not in OE core si=
nce so
> > > many packages in core can potentially have SELinux support enabled an=
d 2) if
> > > its not supposed to be in core where should turning on SELinux support
> > > in a recipe go? For example coreutils can have SELinux support enable=
d.
> > > Currently this is in meta-selinux as a bbappend to the coreutils
> > > package. This works out because its always going to be there. However
> > > there is also a bbappend for an LXC recipe. LXC isn't in core which
> > > means it has a dependency on a layer not in core.
> > >=20
> > > Ideally I would put the recipes needed for SELinux support in core and
> > > have a distro feature which is checked in the recipes in core for
> > > whether or not to add --with-selinux to the build flags. Then LXC cou=
ld
> > > check a core distro feature and enable SELinux if it wants to.
> >=20
> > We have to draw the line somewhere for what to include in OE-Core, and =
at the=20
> > moment I guess we have considered SELinux to be outside its scope. Obvi=
ously=20
> > these things get re-evaluated from time to time, and SELinux is a littl=
e bit=20
> > painful for this because of how many recipes it has to touch. Ultimatel=
y it=20
> > depends on how many people in the embedded space want to enable and use=
=20
> > SELinux.
> >=20
> > Thoughts from others?
> >=20
>=20
> In OpenXT we're using OE to generate images for dom0, a user interface
> domain, a network driver domain, and various other service domains for
> isolating tasks in the platform. In addition to that we're using
> openembedded for building on various embedded research platforms. I'm
> assuming yocto is using SELinux to some extent since they are
> maintaining the repository for it and there are quite a few developers
> using SELiunx on embedded products in Japan.
>=20
>=20
> Dave
>=20
>=20
>=20
--=20
-Joe MacDonald.
:wq

--+PbGPm1eXpwOoWkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU28odAAoJEEn8ffcsOfaWoYYH/2olELkUmvPQ6ZLQCwhk6uKW
i3GETf07eRXmGFXftVePUMdiJO7q69JvWOVpM4k7oMmc4lbJ4KmaMziIAFhBPIPq
0gZq1cw62RITZXNDqmwrpUL0s4v6RKbHohOHhOzLYImIDXqsLrYhPFEJabzYYSf4
7rBI31ah+FTZYt7GiN0zrOQCwruQjcZu3LqZnadLOuv+HRB/0rQR3vCMMOBDFckO
ARI/RyccchVv2PM7ShKYLyTtJ9TOob8bRaApYBPC8WUX5w2Og6kg9v2lWGDX1qIZ
hM+A/mdabjOAQj+QxtJhfepwnZLQt42ZZVyAs9dCFlnFdhPCI2NsS4EvUdPTzC4=
=/+fm
-----END PGP SIGNATURE-----

--+PbGPm1eXpwOoWkI--
