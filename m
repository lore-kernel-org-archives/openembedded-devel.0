Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B9735609B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 21:39:55 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YLf0m-0000qA-5Z from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 13:39:56 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 13:39:55 -0800
Received: by burninator (Postfix, from userid 1000)	id AE32B581332; Wed, 11
	Feb 2015 16:39:54 -0500 (EST)
Date: Wed, 11 Feb 2015 16:39:54 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150211213954.GI30457@mentor.com>
References: <1423669983.23617.78.camel@tycho.nsa.gov>
	<6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <6445648.XiRzhvmYHl@peggleto-mobl5.ger.corp.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org
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
X-List-Received-Date: Wed, 11 Feb 2015 21:39:57 -0000
X-Groupsio-MsgNum: 54192
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline

--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] meta-selinux] On 15.02.11 (Wed 16:29) Paul Eggleton wrote:

> (Adding yocto@yoctoproject.org to CC since that is where meta-selinux pat=
ches=20
> tend to go at least)
>=20
> On Wednesday 11 February 2015 10:53:03 dpquigl wrote:
> > I'm working on OpenXT and it makes use of the meta-selinux repo hosted
> > by the yocto project. I'm trying to use it with a base openembedded core
> > and its not in sync with oe-core because its based on pokey.=20
>=20
> To be clear, poky and OE-Core are in lock-step. No patch to core recipes =
goes=20
> into Poky directly, they are applied to OE-Core and then they flow into P=
oky=20
> immediately thereafter (Richard, who does the merging of patches into OE-=
Core,=20
> does the sync to Poky immediately afterwards.)
>=20
> What's more likely happening I suspect is that you are on a newer=20
> branch/revision of OE-Core/Poky than the meta-selinux maintainers have te=
sted.=20
> I can't speak to the maintenance schedule for meta-selinux but maybe othe=
rs=20
> with knowledge there can chime in.

Our master tends to lag behind oe-core's master for a few reasons, but
none of them are really insurmountable.  Certainly the intent is that
meta-selinux/master will build successfully with oe-core/master at any
given time.

> > This made me think of two questions. 1) Why is this not in OE core sinc=
e so
> > many packages in core can potentially have SELinux support enabled and =
2) if
> > its not supposed to be in core where should turning on SELinux support
> > in a recipe go? For example coreutils can have SELinux support enabled.
> > Currently this is in meta-selinux as a bbappend to the coreutils
> > package. This works out because its always going to be there. However
> > there is also a bbappend for an LXC recipe. LXC isn't in core which
> > means it has a dependency on a layer not in core.
> >=20
> > Ideally I would put the recipes needed for SELinux support in core and
> > have a distro feature which is checked in the recipes in core for
> > whether or not to add --with-selinux to the build flags. Then LXC could
> > check a core distro feature and enable SELinux if it wants to.
>=20
> We have to draw the line somewhere for what to include in OE-Core, and at=
 the=20
> moment I guess we have considered SELinux to be outside its scope. Obviou=
sly=20
> these things get re-evaluated from time to time, and SELinux is a little =
bit=20
> painful for this because of how many recipes it has to touch. Ultimately =
it=20
> depends on how many people in the embedded space want to enable and use=
=20
> SELinux.
>=20
> Thoughts from others?

I've been doing SELinux stuff for rather a long time and it's generally
been my experience that there's a set of developers / vendors that
*really* want it and know what they're doing, there's another set that
*really* want nothing to do with it and a group that say they want
SELinux support but then immediately start needing to turn stuff off
because it causes their system to behave too differently.

Taken as a simple maintenance thing, I think it's easier to have SELinux
be part of OE-Core.  Given, though, it's really not possible to divorce
much of SELinux functionality from python on the target, so then I don't
know if it really makes sense for something like that to be part of
oe-core, proper.  I would think no.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
--=20
-Joe MacDonald.
:wq

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU28wqAAoJEEn8ffcsOfaWmlMH/28WZjhwBxDhAYQCa8fPCn/n
+3mw9CC7wTJWPSSPnT2U9KxtXdj8tgqWLctg3dHyYRc5uprfvdAomgmqULCBWH9t
9o3Yxfct9fxw2/wXi1PgqNO1b/795QXxWPREMhbrkLMcHRECjgHIsb0gF3Pb6MUh
2+sLnFfoOC8dFWxAcjCKoBszC6xWSY2bAsK9SWCHFZoCQe6/PmEzW1c+lA8VkGcG
1BxX+tjMnmwpBOadvvvYt57p1SDZSR3yqKdXostskDM726qsL5BWC/4UciLcpvXD
f+M7QijWZTEJrzojn+fD4HNqtR0Z3iJeUqZjNsjM54QUFmHXLX9TbChb03gg5gI=
=PCXs
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--
