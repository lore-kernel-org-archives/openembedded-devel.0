Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 737E8732A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:46:32 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YLf7B-0002g3-58 from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 13:46:33 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 13:46:32 -0800
Received: by burninator (Postfix, from userid 1000)	id D9081581332; Wed, 11
	Feb 2015 16:46:31 -0500 (EST)
Date: Wed, 11 Feb 2015 16:46:31 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Philip Tricca <flihp@twobit.us>
Message-ID: <20150211214631.GJ30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
	<1423673755.1873.5.camel@tycho.nsa.gov>
	<54DBB0FF.6090305@twobit.us>
MIME-Version: 1.0
In-Reply-To: <54DBB0FF.6090305@twobit.us>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
Subject: Re: [yocto] meta-selinux
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
X-List-Received-Date: Wed, 11 Feb 2015 21:46:39 -0000
X-Groupsio-MsgNum: 54193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IA03tywDYuoVKXrw"
Content-Disposition: inline

--IA03tywDYuoVKXrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [yocto] [oe] meta-selinux] On 15.02.11 (Wed 14:43) Philip Tricca wrote:

> On 02/11/2015 11:55 AM, dpquigl wrote:
> > On Wed, 2015-02-11 at 16:29 +0000, Paul Eggleton wrote:
> >> (Adding yocto@yoctoproject.org to CC since that is where meta-selinux =
patches=20
> >> tend to go at least)
> >>
> >> On Wednesday 11 February 2015 10:53:03 dpquigl wrote:
> >>> I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> >>> by the yocto project. I'm trying to use it with a base openembedded c=
ore
> >>> and its not in sync with oe-core because its based on pokey.=20
> >>
> >> To be clear, poky and OE-Core are in lock-step. No patch to core recip=
es goes=20
> >> into Poky directly, they are applied to OE-Core and then they flow int=
o Poky=20
> >> immediately thereafter (Richard, who does the merging of patches into =
OE-Core,=20
> >> does the sync to Poky immediately afterwards.)
> >>
> >> What's more likely happening I suspect is that you are on a newer=20
> >> branch/revision of OE-Core/Poky than the meta-selinux maintainers have=
 tested.=20
> >> I can't speak to the maintenance schedule for meta-selinux but maybe o=
thers=20
> >> with knowledge there can chime in.
> >=20
> >=20
> > I think this makes the most sense. 3 of the problems were bbappend files
> > trying to append the wrong version of a recipe (although with these
> > changes I should move them over to a wildcard) and the last one was with
> > LXC. After that I encountered a typo in one of the recipes where it
> > wasn't able to pull the sources down.=20
>=20
> I sent out patches to fix these 4 issues to the list a week or so back.
> Reviewing these things and getting them merged takes time though. AFAIK
> the meta-selinux master branch hasn't built for months now mostly
> because of bbappends trailing behind versions in oe-core. I've been
> playing whack-a-mole on this but by the time patches get merged a new
> version has changed elsewhere. I've been using wild-cards as much as
> possible on account of this.
>=20
> >>> This made me think of two questions. 1) Why is this not in OE core si=
nce so
> >>> many packages in core can potentially have SELinux support enabled an=
d 2) if
> >>> its not supposed to be in core where should turning on SELinux support
> >>> in a recipe go? For example coreutils can have SELinux support enable=
d.
> >>> Currently this is in meta-selinux as a bbappend to the coreutils
> >>> package. This works out because its always going to be there. However
> >>> there is also a bbappend for an LXC recipe. LXC isn't in core which
> >>> means it has a dependency on a layer not in core.
> >>>
> >>> Ideally I would put the recipes needed for SELinux support in core and
> >>> have a distro feature which is checked in the recipes in core for
> >>> whether or not to add --with-selinux to the build flags. Then LXC cou=
ld
> >>> check a core distro feature and enable SELinux if it wants to.
> >>
> >> We have to draw the line somewhere for what to include in OE-Core, and=
 at the=20
> >> moment I guess we have considered SELinux to be outside its scope. Obv=
iously=20
> >> these things get re-evaluated from time to time, and SELinux is a litt=
le bit=20
> >> painful for this because of how many recipes it has to touch. Ultimate=
ly it=20
> >> depends on how many people in the embedded space want to enable and us=
e=20
> >> SELinux.
> >>
> >> Thoughts from others?
>=20
> If SELinux support were to be integrated into oe-core directly this
> would force similar support into other layers too no? The reach of
> meta-selinux has expanded and the layers that must be pulled in to get
> it to build has expanded from just oe-core to meta-virtualization (for
> LXC) as well as a few layers in meta-oe.

All of these I would like to extract again, but I'm concerned we may not
be able to do this without some duplication of meta-python recipes.
Still, that's what I was hoping for.

> I don't know much about the process here but these cross layer
> dependencies would complicate things. I guess this would mean
> integrating SELinux support as a distro feature (or whatever is
> appropriate) into all of these layers directly. Not impossible but
> getting buy-in from the relevant maintainers is necessary.
>=20
> > In OpenXT we're using OE to generate images for dom0, a user interface
> > domain, a network driver domain, and various other service domains for
> > isolating tasks in the platform. In addition to that we're using
> > openembedded for building on various embedded research platforms. I'm
> > assuming yocto is using SELinux to some extent since they are
> > maintaining the repository for it and there are quite a few developers
> > using SELiunx on embedded products in Japan.
>=20
> I guess I've been wondering the same thing. For OpenXT we had
> implemented our own SELinux support on top of OE (we weren't OSS at the
> time). Now that we are OSS we've re-based on meta-selinux but I don't
> know of anyone else using this layer or at least discussing it publicly.

There's certainly a few other groups / companies, but I'm certain
they're all using the 1.7 branch for now, not master, and manually
updating to the latest refpolicy release (which came out days after we
branched for 1.7) in their own tree.  I'm preparing an update to the
newest refpolicy now, but we're also not far away from the next one, so
I'm almost tempted to wait it out at this point and jump right to the
201503* refpolicy.  I'd be interested to hear opinions on that from
anyone using meta-selinux and wanting to use the master branch.

--=20
-Joe MacDonald.
:wq

--IA03tywDYuoVKXrw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU2823AAoJEEn8ffcsOfaWZ8AH/i1cHlxUMMtW6fMx64jlP4nh
0+UDfKd3Ihomf5b2aQt5d9gVrUmg5gS5pOgzMqgTGF2XrOLCVZuvzd+Ox87mf4li
8mztbgWNMPcQ2JOnlaEyMfzhEcFIPsNewgd3jkJd/xXEQbzyXpMtpYHCis3CFj2c
j3vyokVtZj0D/zSHK/7VMJMKHMF/AOrkgFd4WewCoQ5/fK4H24w6bKqJEjokd7PC
QBMp8nE7kq/z58fTZAkGAgkPJMsUnulL0JWnsQ/tsQCGcHMhwU6lgqQm1zT4XqK5
lgKfm2SpcoXId/GLVPvz4mw5vgjBQUtRR3DsepTGmiwuVKTMtCwS3U+l/NX2QuU=
=G06q
-----END PGP SIGNATURE-----

--IA03tywDYuoVKXrw--
