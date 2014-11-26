Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EAA437231B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:08:22 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XtdGY-0007DG-GU from Joe_MacDonald@mentor.com ;
	Wed, 26 Nov 2014 06:08:22 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Wed, 26 Nov 2014 06:08:21 -0800
Received: by burninator (Postfix, from userid 1000)	id 4BA1E581779; Wed, 26
	Nov 2014 09:08:21 -0500 (EST)
Date: Wed, 26 Nov 2014 09:08:21 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: "Bian, Naimeng" <biannm@cn.fujitsu.com>
Message-ID: <20141126140819.GA3886@mentor.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
	<20141124193941.GD6210@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DDB62E@G08CNEXMBPEKD02.g08.fujitsu.local>
	<DDB0C57E45663A458C5CACB7B5688BC21D721A1D@SESTOEX04.enea.se>
	<30DC4EDFD798C94083F3E083754532CC73DDDAC2@G08CNEXMBPEKD02.g08.fujitsu.local>
MIME-Version: 1.0
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DDDAC2@G08CNEXMBPEKD02.g08.fujitsu.local>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade to 1.4.7
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
X-List-Received-Date: Wed, 26 Nov 2014 14:08:23 -0000
X-Groupsio-MsgNum: 53056
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[RE: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade=
 to 1.4.7] On 14.11.26 (Wed 03:36) Bian, Naimeng wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Alexandru Vaduva
> > Sent: Tuesday, November 25, 2014 6:19 PM
> > To: openembedded-devel@lists.openembedded.org; Joe MacDonald
> > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded=
 and
> > upgrade to 1.4.7
> >=20
> > It is my opinion that meta-cgl is the place for your patch being the fa=
ct that
> > pacemaker and the rest of the HA cluster resources are available here.
>=20
> Thanks.
> I confirmed that corosync-1.2.8 and pacemaker are available inside meta-c=
gl.
>=20
> > Also I believe this patch should be available inside the open embedded
> > repository.
> >=20
>=20
> Actually, I do not know what kinds of recipes meta-openembedded likes to =
merge.
> In another hand, what kinds of recipes are no good.
> (Of course the unmaintained one such as printproto is no good.)
>=20
> If there are some rules, would you tell me what's that.
> Maybe it's helpful to a newcomer such as me. ^_^

I can't speak for everyone but in all honesty, where I do networking and
CGL stuff I see a lot of things that go 'unmaintained' for years and are
still perfectly functional and widely used.  Time since last commit
isn't an immediate disqualifier in my view.  That said, as I think was
mentioned with some of your other submissions, if you have a recipe for
a package that hasn't been maintained in several years, you should
expect to be asked "but why?"  There may be a very good answer to that
that convinces a layer maintainer to integrate your recipe.  You just
need to be prepared for the question.

For what it's worth, that can also apply to brand new packages.  :-)

> I got some points from the following document, but it's not detailed.
> http://www.openembedded.org/wiki/OpenEmbedded-Core#meta-openembedded
>=20
> -------------------------------------------------------------------------=
---------
> meta-openembedded
>=20
>   For items shared amongst multiple layers that do not fit into OE-Core o=
r any other=20
>  existing layer, there is the meta-oe layer. This exists in a repository,=
 also called=20
>  meta-openembedded, which contains a number of other more focused layers =
(meta-efl,=20
>  meta-gnome, etc.). This layer will need to be managed carefully over tim=
e to avoid=20
>  it turning into just a newer version of OE-classic.
> -------------------------------------------------------------------------=
---------

This last is the crux of the matter, I think.  I personally want to
avoid collecting a bunch of recipes that aren't regularly used and fall
out of date (either with the needs of the community or with the
upstream).

> Maybe we should update this document, add some suggestions like following.
> -------------------------------------------------------------------------=
---------
> Attention
>  Please avoid send a patch such as following.
>  1. have not been unmaintained by upstream long time
>  2. ... ...
> -------------------------------------------------------------------------=
---------
>=20
> > If it would be ok with you I would suggest to have two patches: one sen=
t for
> > the OpenEmbedded and one for the meta-cgl.
> > If the porting for meta-cgl would not be possible please let me know fo=
r assuring
> > that the patch is ported inside meta-cgl.
>=20
> I confirmed that corosync-1.2.8 is available inside meta-cgl now.
> I will send the patch for corosync-1.4.7 to meta-cgl later.

That is probably best.  I have no objection to it being in
meta-networking, but I'm not sure it is broadly applicable and if Alex
prefers to keep a corosync recipe in meta-cgl, I'm all for that.

> > Another extra reason for which I would prefer this patch to be also ava=
ilable
> > inside meta-cgl would be the extra testing that will be done for it and=
 the
> > fact that corosync messaging layer will be used with pacemaker.
> >
>=20
> Looks good.
> And the same question.  ^_^
> Would you tell me what kinds of recipes meta-cgl likes to merge.

Alex gave you a pointer, I would also say if you're just asking in
general, you can have a look at what software packages are used by CGL
registered distributions here:

http://www.linuxfoundation.org/collaborate/workgroups/cgl/registered-distri=
butions

and the specs, linked from the same page, if you really want to dig into
it.  The stated goal of meta-cgl is to provide a CGL layer for Yocto, so
I'd hazard a guess that anything that gets it closer to that goal in a
sensible fashion is welcome.

-J.

>=20
> Regards
>  Bian
>=20
> >=20
> > Thank you,
> > Alex Vaduva
> >=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of=
 Bian,
> > Naimeng
> > Sent: Tuesday, November 25, 2014 2:29 AM
> > To: Joe MacDonald
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded=
 and
> > upgrade to 1.4.7
> >=20
> > Hi Joe
> >=20
> > Thanks for your advices.
> > I will look at meta-cgl.
> >=20
> > Regards
> >  Bian
> >=20
> > > -----Original Message-----
> > > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > > Sent: Tuesday, November 25, 2014 3:40 AM
> > > Cc: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from
> > > openembedded and upgrade to 1.4.7
> > >
> > > Hi Bian,
> > >
> > > [[oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and
> > > upgrade to 1.4.7] On 14.11.24 (Mon 14:45) Bian Naimeng wrote:
> > >
> > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > ---
> > > >  meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31
> > > ++++++++++++++++++++++
> > > >  .../corosync/files/config-site.corosync            |  4 +++
> > > >  meta-oe/recipes-support/corosync/files/groff.patch | 12 +++++++++
> > > >  3 files changed, 47 insertions(+)
> > > >  create mode 100644
> > > > meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > >  create mode 100644
> > > > meta-oe/recipes-support/corosync/files/config-site.corosync
> > > >  create mode 100644
> > > > meta-oe/recipes-support/corosync/files/groff.patch
> > >
> > > This probably belongs in meta-networking (unless there's strong
> > > opinion it belongs somewhere else).  Did you have a look at what has
> > > been done in meta-cgl (git://git.enea.com/linux/meta-cgl) with the
> > > recipe to see if there was anything useful there?  I know meta-cgl
> > > isn't very well publicized yet, but it is in the layer index.  If you
> > > haven't looked at what's there yet, it may be worth having a look to
> > > see if any of it can save you some time.
> > >
> > > For what it's worth, there does seem to be rather a lot more in
> > > meta-cgl and I think at least some of it still applies (eg. the volat=
iles
> > file).
> > >
> > > > diff --git a/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > new file mode 100644
> > > > index 0000000..a3b8864
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > @@ -0,0 +1,31 @@
> > > > +SUMMARY =3D "The Corosync Cluster Engine and Application Programmi=
ng
> > > Interfaces"
> > > > +DESCRIPTION =3D "This package contains the Corosync Cluster Engine
> > > > +Executive, several default =A5 APIs and libraries, default
> > > > +configuration
> > > files, and an init script."
> > > > +HOMEPAGE =3D "http://corosync.github.io/corosync/"
> > > > +
> > > > +inherit autotools pkgconfig
> > > > +
> > > > +SRC_URI =3D
> > > "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}.tar.gz =
=A5
> > > > +           file://config-site.corosync =A5
> > > > +           file://groff.patch =A5
> > > > +	   "
> > >
> > > Please remove the tab before space above.
> > >
> > > > +
> > > > +SRC_URI[md5sum] =3D "da9b2cf0b55f08ac4cf7cd82ac2f977a"
> > > > +SRC_URI[sha256sum] =3D
> > > "c1d005b2093e9a725abd1dfb2be936114b561c0b3145aca11f58c1a733a05af8"
> > > > +
> > > > +LICENSE =3D "BSD"
> > >
> > > I think this is actually a BSD-3-Clause license, isn't it?
> > >
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D25656171d1e4054c636a9893067f8c30"
> > > > +
> > > > +CONFIG_SITE =3D "${WORKDIR}/config-site.corosync"
> > > > +
> > > > +DEPENDS =3D "groff-native nss"
> > > > +
> > > > +EXTRA_OECONF +=3D " --enable-nss "
> > > > +CFLAGS_append +=3D " -fPIC "
> > > > +
> > > > +do_compile() {
> > > > +    DESCPATH=3D"${STAGING_DATADIR_NATIVE}/groff/`groff -v | awk
> > > '{if(NR=3D=3D1)print $4}'`/font"
> > > > +    oe_runmake DESCPATH=3D${DESCPATH} }
> > > > +
> > > > +FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
> > > > diff --git
> > > > a/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > > b/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > > new file mode 100644
> > > > index 0000000..3472dec
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > > @@ -0,0 +1,4 @@
> > > > +ac_cv_func_fnmatch_works=3Dyes
> > > > +ac_cv_func_malloc_0_nonnull=3Dyes
> > > > +ac_cv_func_realloc_0_nonnull=3Dyes
> > > > +
> > > > diff --git a/meta-oe/recipes-support/corosync/files/groff.patch
> > > > b/meta-oe/recipes-support/corosync/files/groff.patch
> > >
> > > Can you add a header to this patch please?
> > >
> > > Thanks.
> > >
> > > -J.
> > >
> > > > new file mode 100644
> > > > index 0000000..da1378a
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/corosync/files/groff.patch
> > > > @@ -0,0 +1,12 @@
> > > > +diff -Nurp corosync-1.3.1.org/man/Makefile.am
> > > corosync-1.3.1/man/Makefile.am
> > > > +--- corosync-1.3.1.org/man/Makefile.am	2011-04-25
> > > 10:37:50.000000000 +0800
> > > > ++++ corosync-1.3.1/man/Makefile.am	2014-11-24 10:33:36.583426707
> > > +0800
> > > > +@@ -126,7 +126,7 @@ HTML_DOCS =3D $(dist_man_MANS:%=3D%.html)
> > > > +INDEX_HTML =3D index.html
> > > > +
> > > > + %.html: %
> > > > +-	$(GROFF) -mandoc -Thtml $^ > $@
> > > > ++	$(GROFF) -F $(DESCPATH) -mandoc -Thtml $^ > $@
> > > > +
> > > > + install-data-local:
> > > > + 	$(INSTALL) -d $(DESTDIR)/${docdir}/html
> > > > --
> > > > 1.9.1
> > > >
> > > --
> > > -Joe MacDonald.
> > > :wq
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUdd7TAAoJEEn8ffcsOfaWpocIAJM/tmC79AktBOV3TybhTBcZ
57Kdoir03dtLYF/56OpeazByquxjFTXiz5sNQ3aVjq61dhS6m2zbxjNV1slfikmx
3sajlXfBUHs98BAB2hcgK4ttJgTmfRbcjVu+FZJqEHZKZCIgRAYd6xpnwNapmFW2
VkcZlTb014yvYQdjg8JZcLcp37NKT5dMrp5mXR+DMY/RTwTo3QET6nxOptvfGkEZ
WKSpcvgXXPI72MHNwCd6mRWMFkOWi1bCqYEDPOck2zd61OnwX8qUMyDgKuu9/gd9
8CH/RkKoRSH/BRTunjva93e28Xl3HBFMCGQDNjC2NbV1wdA3E0Ae2HooIjpv+9o=
=ufgd
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
