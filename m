Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1URjV0-0003hk-El
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 15:31:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3FDDfmf022649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 06:13:41 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 15 Apr 2013 06:13:40 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 9E1DF7FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:12:29 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id DEAA743E4B; Mon,
	15 Apr 2013 09:13:39 -0400 (EDT)
Date: Mon, 15 Apr 2013 09:13:39 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130415131339.GK3914@windriver.com>
References: <20130413134648.GE2477@jama>
	<1365891129-8299-1-git-send-email-Martin.Jansa@gmail.com>
	<kkelis$rj6$1@ger.gmane.org> <20130415124259.GI3914@windriver.com>
	<20130415130715.GA10628@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130415130715.GA10628@jama.dyndns-home.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] recipes: Unify indentation
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
X-List-Received-Date: Mon, 15 Apr 2013 13:31:22 -0000
X-Groupsio-MsgNum: 44195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NPWyolIJAVLYbHY6"
Content-Disposition: inline

--NPWyolIJAVLYbHY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-oe][PATCH] recipes: Unify indentation] On 13.04.15 (Mon 15:=
07) Martin Jansa wrote:

> On Mon, Apr 15, 2013 at 08:42:59AM -0400, Joe MacDonald wrote:
> > [Re: [oe] [meta-oe][PATCH] recipes: Unify indentation] On 13.04.14 (Sun=
 18:30) Koen Kooi wrote:
> >=20
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > Op 14-04-13 00:12, Martin Jansa schreef:
> > > > * This change is only aesthetic (unlike indentation in Python tasks=
). *
> > > > Some recipes were using tabs. * Some were using 8 spaces. * Some we=
re
> > > > using mix or different number of spaces. * Make them consistently u=
se 4
> > > > spaces everywhere. * Yocto styleguide advises to use tabs (but the =
only
> > > > reason to keep tabs is the need to update a lot of recipes). Lately=
 this
> > > > advice was also merged into the styleguide on the OE wiki. * Using 4
> > > > spaces in both types of tasks is better because it's less error pro=
ne
> > > > when someone is not sure if e.g. do_generate_toolchain_file() is Py=
thon
> > > > or shell task and also allows to highlight every tab used in .bb, .=
inc,
> > > > .bbappend, .bbclass as potentially bad (shouldn't be used for inden=
ting
> > > > of multiline variable assignments and cannot be used for Python tas=
ks).
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >=20
> > > I still hate spaces for shell methods, but I support the reasons behi=
nd it, so:
> > >=20
> > > Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> >=20
> > I completely agree.  The only spot where I see this as being not optimal
> > is something like this (hunk simplified for clarity):
> >=20
> >  PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
> > -            ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> > -             ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> > +    ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> > +    ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
>=20
> the off-by-one was probably reason why it was moved to 4-space
> indentation. Sometimes it wasn't off-by-one, but when tabs and spaces
> were mixed to indent them (with ${PN} aligned) then after replacing tabs
> with 4 spaces it was probably broken a bit more.

Ah, okay.

>=20
> > The former state wasn't great, but in general if I'm doing this type of
> > thing, I'll tend to align them thus:
> >=20
> > PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
> >              ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
> >              ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
>=20
> It it was aligned like this (after replacing tabs) I was keeping it.
>=20
> Examples like:
> PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>           ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>           ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
> were unified to use only 4 spaces.
>=20
> The same for less spaces, e.g.
> PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>   ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>   ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc"
>=20
> I was also tempted to remove trailing spaces and move closing quote to
> be always on new line (easier to add/remove lines when all end with \).
> But that was a bit more difficult for my shell/sed monkeys, because
> shell tasks has many matching '"$' lines following line which also
> starts with spaces. So I kept closing quotes as they were, only on lines
> with only quote I've moved it to beginning.
>=20
> PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>     ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>     ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc \
> "
> looks better than
> PACKAGES +=3D "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
>     ${PN}-tcptraceroute6 ${PN}-rltraceroute6 \
>     ${PN}-tracert6 ${PN}-rdnssd ${PN}-misc \
>        "

Yep, I agree.

Okay, so thanks for the detailed explanation, Martin.  I'm quite happy
with this.

-J.

>=20
> Some changes were manual (git grep to find suspicious lines and then
> check them manually) so it isn't 100% perfect but as you said, it's
> better then it was before.
>=20
> git diff -w shows only few removed empty lines (e.g. begining or end of
> shell task) and 2-3 lines which I've manually splitted to multiline.
>=20
> With 3 acks already I'll merge this together with systemd changes today.
>=20
> We should update OE styleguide after this :).
>=20
> > Probably leaving such things as they are in the tree is more trouble
> > than it's worth, but we could, I'd like to avoid restyling after a line
> > continuation.  I won't object to the proposal as it stands, though,
> > since on the whole it looks to be doing much more good than harm.
>=20
--=20
-Joe MacDonald.
:wq

--NPWyolIJAVLYbHY6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFr/QMACgkQPN8S4W6ZZneMnwCfeJIrPWyzoekGjwVQvlpefdCs
XqAAn3SAw4jkXd2OYonJ8I8/3IcmgblC
=J4Oj
-----END PGP SIGNATURE-----

--NPWyolIJAVLYbHY6--
