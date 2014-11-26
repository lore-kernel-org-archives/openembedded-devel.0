Return-Path: <Alexandru.Vaduva@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 15E9F72051
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 14:23:10 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Wed, 26 Nov 2014 15:23:07 +0100
From: Alexandru Vaduva <Alexandru.Vaduva@enea.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Bian, Naimeng"
	<biannm@cn.fujitsu.com>
Thread-Topic: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and
	upgrade to 1.4.7
Thread-Index: AQHQCB6KpMyPYG2770eaQW21hFBzTpxwbLsAgACxwZCAARTGgIAAsJuAgAAUS9A=
Date: Wed, 26 Nov 2014 14:23:06 +0000
Message-ID: <DDB0C57E45663A458C5CACB7B5688BC21D722509@SESTOEX04.enea.se>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
	<20141124193941.GD6210@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DDB62E@G08CNEXMBPEKD02.g08.fujitsu.local>
	<DDB0C57E45663A458C5CACB7B5688BC21D721A1D@SESTOEX04.enea.se>
	<30DC4EDFD798C94083F3E083754532CC73DDDAC2@G08CNEXMBPEKD02.g08.fujitsu.local>
	<20141126140819.GA3886@mentor.com>
In-Reply-To: <20141126140819.GA3886@mentor.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.14.189]
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 26 Nov 2014 14:23:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
Sent: Wednesday, November 26, 2014 4:08 PM
To: Bian, Naimeng
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and=
 upgrade to 1.4.7

[RE: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and upgrade=
 to 1.4.7] On 14.11.26 (Wed 03:36) Bian, Naimeng wrote:

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> > Of Alexandru Vaduva
> > Sent: Tuesday, November 25, 2014 6:19 PM
> > To: openembedded-devel@lists.openembedded.org; Joe MacDonald
> > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> > openembedded and upgrade to 1.4.7
> >=20
> > It is my opinion that meta-cgl is the place for your patch being the=20
> > fact that pacemaker and the rest of the HA cluster resources are availa=
ble here.
>=20
> Thanks.
> I confirmed that corosync-1.2.8 and pacemaker are available inside meta-c=
gl.
>=20
> > Also I believe this patch should be available inside the open=20
> > embedded repository.
> >=20
>=20
> Actually, I do not know what kinds of recipes meta-openembedded likes to =
merge.
> In another hand, what kinds of recipes are no good.
> (Of course the unmaintained one such as printproto is no good.)
>=20
> If there are some rules, would you tell me what's that.
> Maybe it's helpful to a newcomer such as me. ^_^

I can't speak for everyone but in all honesty, where I do networking and CG=
L stuff I see a lot of things that go 'unmaintained' for years and are stil=
l perfectly functional and widely used.  Time since last commit isn't an im=
mediate disqualifier in my view.  That said, as I think was mentioned with =
some of your other submissions, if you have a recipe for a package that has=
n't been maintained in several years, you should expect to be asked "but wh=
y?"  There may be a very good answer to that that convinces a layer maintai=
ner to integrate your recipe.  You just need to be prepared for the questio=
n.

For what it's worth, that can also apply to brand new packages.  :-)

> I got some points from the following document, but it's not detailed.
> http://www.openembedded.org/wiki/OpenEmbedded-Core#meta-openembedded
>=20
> ----------------------------------------------------------------------
> ------------
> meta-openembedded
>=20
>   For items shared amongst multiple layers that do not fit into=20
> OE-Core or any other  existing layer, there is the meta-oe layer. This=20
> exists in a repository, also called  meta-openembedded, which contains=20
> a number of other more focused layers (meta-efl,  meta-gnome, etc.).=20
> This layer will need to be managed carefully over time to avoid  it turni=
ng into just a newer version of OE-classic.
> ----------------------------------------------------------------------
> ------------

This last is the crux of the matter, I think.  I personally want to avoid c=
ollecting a bunch of recipes that aren't regularly used and fall out of dat=
e (either with the needs of the community or with the upstream).

> Maybe we should update this document, add some suggestions like following=
.
> ----------------------------------------------------------------------
> ------------
> Attention
>  Please avoid send a patch such as following.
>  1. have not been unmaintained by upstream long time  2. ... ...
> ----------------------------------------------------------------------
> ------------
>=20
> > If it would be ok with you I would suggest to have two patches: one=20
> > sent for the OpenEmbedded and one for the meta-cgl.
> > If the porting for meta-cgl would not be possible please let me know=20
> > for assuring that the patch is ported inside meta-cgl.
>=20
> I confirmed that corosync-1.2.8 is available inside meta-cgl now.
> I will send the patch for corosync-1.4.7 to meta-cgl later.

That is probably best.  I have no objection to it being in meta-networking,=
 but I'm not sure it is broadly applicable and if Alex prefers to keep a co=
rosync recipe in meta-cgl, I'm all for that.

> > Another extra reason for which I would prefer this patch to be also=20
> > available inside meta-cgl would be the extra testing that will be=20
> > done for it and the fact that corosync messaging layer will be used wit=
h pacemaker.
> >
>=20
> Looks good.
> And the same question.  ^_^
> Would you tell me what kinds of recipes meta-cgl likes to merge.

Alex gave you a pointer, I would also say if you're just asking in general,=
 you can have a look at what software packages are used by CGL registered d=
istributions here:

http://www.linuxfoundation.org/collaborate/workgroups/cgl/registered-distri=
butions

and the specs, linked from the same page, if you really want to dig into it=
.  The stated goal of meta-cgl is to provide a CGL layer for Yocto, so I'd =
hazard a guess that anything that gets it closer to that goal in a sensible=
 fashion is welcome.

-J.

Thanks Joe, I forgot to also point the registered distributions, they are a=
 good source of inspiration.
Also you are perfectly right with this affirmation.=20

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
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> > Of Bian, Naimeng
> > Sent: Tuesday, November 25, 2014 2:29 AM
> > To: Joe MacDonald
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> > openembedded and upgrade to 1.4.7
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
> > > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> > > openembedded and upgrade to 1.4.7
> > >
> > > Hi Bian,
> > >
> > > [[oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and=20
> > > upgrade to 1.4.7] On 14.11.24 (Mon 14:45) Bian Naimeng wrote:
> > >
> > > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > ---
> > > >  meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31
> > > ++++++++++++++++++++++
> > > >  .../corosync/files/config-site.corosync            |  4 +++
> > > >  meta-oe/recipes-support/corosync/files/groff.patch | 12=20
> > > > +++++++++
> > > >  3 files changed, 47 insertions(+)  create mode 100644=20
> > > > meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > >  create mode 100644
> > > > meta-oe/recipes-support/corosync/files/config-site.corosync
> > > >  create mode 100644
> > > > meta-oe/recipes-support/corosync/files/groff.patch
> > >
> > > This probably belongs in meta-networking (unless there's strong=20
> > > opinion it belongs somewhere else).  Did you have a look at what=20
> > > has been done in meta-cgl (git://git.enea.com/linux/meta-cgl) with=20
> > > the recipe to see if there was anything useful there?  I know=20
> > > meta-cgl isn't very well publicized yet, but it is in the layer=20
> > > index.  If you haven't looked at what's there yet, it may be worth=20
> > > having a look to see if any of it can save you some time.
> > >
> > > For what it's worth, there does seem to be rather a lot more in=20
> > > meta-cgl and I think at least some of it still applies (eg. the=20
> > > volatiles
> > file).
> > >
> > > > diff --git a/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > new file mode 100644
> > > > index 0000000..a3b8864
> > > > --- /dev/null
> > > > +++ b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > > @@ -0,0 +1,31 @@
> > > > +SUMMARY =3D "The Corosync Cluster Engine and Application=20
> > > > +Programming
> > > Interfaces"
> > > > +DESCRIPTION =3D "This package contains the Corosync Cluster=20
> > > > +Engine Executive, several default =A5 APIs and libraries, default=
=20
> > > > +configuration
> > > files, and an init script."
> > > > +HOMEPAGE =3D "http://corosync.github.io/corosync/"
> > > > +
> > > > +inherit autotools pkgconfig
> > > > +
> > > > +SRC_URI =3D
> > > "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}.tar.g
> > > z =A5
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
> > > > +++ b/meta-oe/recipes-support/corosync/files/config-site.corosyn
> > > > +++ c
> > > > @@ -0,0 +1,4 @@
> > > > +ac_cv_func_fnmatch_works=3Dyes
> > > > +ac_cv_func_malloc_0_nonnull=3Dyes=20
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
> > > > +@@ -126,7 +126,7 @@ HTML_DOCS =3D $(dist_man_MANS:%=3D%.html)=20
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

--
-Joe MacDonald.
:wq

