Return-Path: <Alexandru.Vaduva@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 50AFE72051
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 09:18:02 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Wed, 26 Nov 2014 10:17:56 +0100
From: Alexandru Vaduva <Alexandru.Vaduva@enea.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Joe MacDonald
	<Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and
	upgrade to 1.4.7
Thread-Index: AQHQCB6KpMyPYG2770eaQW21hFBzTpxwbLsAgACxwZCAARTGgIAAWk5g
Date: Wed, 26 Nov 2014 09:17:56 +0000
Message-ID: <DDB0C57E45663A458C5CACB7B5688BC21D7221D6@SESTOEX04.enea.se>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-7-git-send-email-biannm@cn.fujitsu.com>
	<20141124193941.GD6210@mentor.com>
	<30DC4EDFD798C94083F3E083754532CC73DDB62E@G08CNEXMBPEKD02.g08.fujitsu.local>
	<DDB0C57E45663A458C5CACB7B5688BC21D721A1D@SESTOEX04.enea.se>
	<30DC4EDFD798C94083F3E083754532CC73DDDAC2@G08CNEXMBPEKD02.g08.fujitsu.local>
In-Reply-To: <30DC4EDFD798C94083F3E083754532CC73DDDAC2@G08CNEXMBPEKD02.g08.fujitsu.local>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: yes
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
X-List-Received-Date: Wed, 26 Nov 2014 09:18:09 -0000
X-Groupsio-MsgNum: 53052
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_DDB0C57E45663A458C5CACB7B5688BC21D7221D6SESTOEX04enease_"

--_002_DDB0C57E45663A458C5CACB7B5688BC21D7221D6SESTOEX04enease_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Meta-cgl is a placeholder for the packages that offer solutions to CGL regu=
irements:
https://www.linuxfoundation.org/sites/main/files/CGL_5.0_Specification.pdf

Also here is a list with some of the packages that meta-cgl requires, of co=
urse it can be extended with similar packages that respond to the same cgl =
requirement:


Alex Vaduva

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Bian, Naimeng
Sent: Wednesday, November 26, 2014 5:36 AM
To: openembedded-devel@lists.openembedded.org; Joe MacDonald
Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and=
 upgrade to 1.4.7

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> Of Alexandru Vaduva
> Sent: Tuesday, November 25, 2014 6:19 PM
> To: openembedded-devel@lists.openembedded.org; Joe MacDonald
> Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> openembedded and upgrade to 1.4.7
>=20
> It is my opinion that meta-cgl is the place for your patch being the=20
> fact that pacemaker and the rest of the HA cluster resources are availabl=
e here.

Thanks.
I confirmed that corosync-1.2.8 and pacemaker are available inside meta-cgl=
.

> Also I believe this patch should be available inside the open embedded=20
> repository.
>=20

Actually, I do not know what kinds of recipes meta-openembedded likes to me=
rge.
In another hand, what kinds of recipes are no good.
(Of course the unmaintained one such as printproto is no good.)

If there are some rules, would you tell me what's that.
Maybe it's helpful to a newcomer such as me. ^_^

I got some points from the following document, but it's not detailed.
http://www.openembedded.org/wiki/OpenEmbedded-Core#meta-openembedded

---------------------------------------------------------------------------=
-------
meta-openembedded

  For items shared amongst multiple layers that do not fit into OE-Core or =
any other  existing layer, there is the meta-oe layer. This exists in a rep=
ository, also called  meta-openembedded, which contains a number of other m=
ore focused layers (meta-efl,  meta-gnome, etc.). This layer will need to b=
e managed carefully over time to avoid  it turning into just a newer versio=
n of OE-classic.
---------------------------------------------------------------------------=
-------

Maybe we should update this document, add some suggestions like following.
---------------------------------------------------------------------------=
-------
Attention
 Please avoid send a patch such as following.
 1. have not been unmaintained by upstream long time  2. ... ...
---------------------------------------------------------------------------=
-------

> If it would be ok with you I would suggest to have two patches: one=20
> sent for the OpenEmbedded and one for the meta-cgl.
> If the porting for meta-cgl would not be possible please let me know=20
> for assuring that the patch is ported inside meta-cgl.

I confirmed that corosync-1.2.8 is available inside meta-cgl now.
I will send the patch for corosync-1.4.7 to meta-cgl later.

>=20
> Another extra reason for which I would prefer this patch to be also=20
> available inside meta-cgl would be the extra testing that will be done=20
> for it and the fact that corosync messaging layer will be used with pacem=
aker.
>

Looks good.
And the same question.  ^_^
Would you tell me what kinds of recipes meta-cgl likes to merge.

Regards
 Bian

>=20
> Thank you,
> Alex Vaduva
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf=20
> Of Bian, Naimeng
> Sent: Tuesday, November 25, 2014 2:29 AM
> To: Joe MacDonald
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> openembedded and upgrade to 1.4.7
>=20
> Hi Joe
>=20
> Thanks for your advices.
> I will look at meta-cgl.
>=20
> Regards
>  Bian
>=20
> > -----Original Message-----
> > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > Sent: Tuesday, November 25, 2014 3:40 AM
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH 6/6] [meta-oe] Port corosync from=20
> > openembedded and upgrade to 1.4.7
> >
> > Hi Bian,
> >
> > [[oe] [PATCH 6/6] [meta-oe] Port corosync from openembedded and=20
> > upgrade to 1.4.7] On 14.11.24 (Mon 14:45) Bian Naimeng wrote:
> >
> > > Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
> > > ---
> > >  meta-oe/recipes-support/corosync/corosync_1.4.7.bb | 31
> > ++++++++++++++++++++++
> > >  .../corosync/files/config-site.corosync            |  4 +++
> > >  meta-oe/recipes-support/corosync/files/groff.patch | 12 +++++++++
> > >  3 files changed, 47 insertions(+)  create mode 100644=20
> > > meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > >  create mode 100644
> > > meta-oe/recipes-support/corosync/files/config-site.corosync
> > >  create mode 100644
> > > meta-oe/recipes-support/corosync/files/groff.patch
> >
> > This probably belongs in meta-networking (unless there's strong=20
> > opinion it belongs somewhere else).  Did you have a look at what has=20
> > been done in meta-cgl (git://git.enea.com/linux/meta-cgl) with the=20
> > recipe to see if there was anything useful there?  I know meta-cgl=20
> > isn't very well publicized yet, but it is in the layer index.  If=20
> > you haven't looked at what's there yet, it may be worth having a=20
> > look to see if any of it can save you some time.
> >
> > For what it's worth, there does seem to be rather a lot more in=20
> > meta-cgl and I think at least some of it still applies (eg. the=20
> > volatiles
> file).
> >
> > > diff --git a/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > new file mode 100644
> > > index 0000000..a3b8864
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/corosync/corosync_1.4.7.bb
> > > @@ -0,0 +1,31 @@
> > > +SUMMARY =3D "The Corosync Cluster Engine and Application=20
> > > +Programming
> > Interfaces"
> > > +DESCRIPTION =3D "This package contains the Corosync Cluster Engine=20
> > > +Executive, several default \ APIs and libraries, default=20
> > > +configuration
> > files, and an init script."
> > > +HOMEPAGE =3D "http://corosync.github.io/corosync/"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +SRC_URI =3D
> > "http://build.clusterlabs.org/corosync/releases/${BPN}-${PV}.tar.gz=20
> > \
> > > +           file://config-site.corosync \
> > > +           file://groff.patch \
> > > +	   "
> >
> > Please remove the tab before space above.
> >
> > > +
> > > +SRC_URI[md5sum] =3D "da9b2cf0b55f08ac4cf7cd82ac2f977a"
> > > +SRC_URI[sha256sum] =3D
> > "c1d005b2093e9a725abd1dfb2be936114b561c0b3145aca11f58c1a733a05af8"
> > > +
> > > +LICENSE =3D "BSD"
> >
> > I think this is actually a BSD-3-Clause license, isn't it?
> >
> > > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D25656171d1e4054c636a9893067f8c30"
> > > +
> > > +CONFIG_SITE =3D "${WORKDIR}/config-site.corosync"
> > > +
> > > +DEPENDS =3D "groff-native nss"
> > > +
> > > +EXTRA_OECONF +=3D " --enable-nss "
> > > +CFLAGS_append +=3D " -fPIC "
> > > +
> > > +do_compile() {
> > > +    DESCPATH=3D"${STAGING_DATADIR_NATIVE}/groff/`groff -v | awk
> > '{if(NR=3D=3D1)print $4}'`/font"
> > > +    oe_runmake DESCPATH=3D${DESCPATH} }
> > > +
> > > +FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
> > > diff --git
> > > a/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > b/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > new file mode 100644
> > > index 0000000..3472dec
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/corosync/files/config-site.corosync
> > > @@ -0,0 +1,4 @@
> > > +ac_cv_func_fnmatch_works=3Dyes
> > > +ac_cv_func_malloc_0_nonnull=3Dyes
> > > +ac_cv_func_realloc_0_nonnull=3Dyes
> > > +
> > > diff --git a/meta-oe/recipes-support/corosync/files/groff.patch
> > > b/meta-oe/recipes-support/corosync/files/groff.patch
> >
> > Can you add a header to this patch please?
> >
> > Thanks.
> >
> > -J.
> >
> > > new file mode 100644
> > > index 0000000..da1378a
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/corosync/files/groff.patch
> > > @@ -0,0 +1,12 @@
> > > +diff -Nurp corosync-1.3.1.org/man/Makefile.am
> > corosync-1.3.1/man/Makefile.am
> > > +--- corosync-1.3.1.org/man/Makefile.am	2011-04-25
> > 10:37:50.000000000 +0800
> > > ++++ corosync-1.3.1/man/Makefile.am	2014-11-24 10:33:36.583426707
> > +0800
> > > +@@ -126,7 +126,7 @@ HTML_DOCS =3D $(dist_man_MANS:%=3D%.html)=20
> > > +INDEX_HTML =3D index.html
> > > +
> > > + %.html: %
> > > +-	$(GROFF) -mandoc -Thtml $^ > $@
> > > ++	$(GROFF) -F $(DESCPATH) -mandoc -Thtml $^ > $@
> > > +
> > > + install-data-local:
> > > + 	$(INSTALL) -d $(DESTDIR)/${docdir}/html
> > > --
> > > 1.9.1
> > >
> > --
> > -Joe MacDonald.
> > :wq
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--_002_DDB0C57E45663A458C5CACB7B5688BC21D7221D6SESTOEX04enease_
Content-Type: text/plain; name="cgl-packages-list.txt"
Content-Description: cgl-packages-list.txt
Content-Disposition: attachment; filename="cgl-packages-list.txt"; size=564;
	creation-date="Wed, 26 Nov 2014 08:31:53 GMT";
	modification-date="Wed, 26 Nov 2014 08:31:53 GMT"
Content-Transfer-Encoding: base64

YWNsDQpjb3Jvc3luYw0KZGV2aWNlLW1hcHBlci1tdWx0aXBhdGgNCkRldmljZS1tYXBwZXItbXVs
dGlwYXRoDQpkaGNwDQplMmZzcHJvZ3MNCmV4dDQNCmdjYw0KZ2RiDQppcHNlYy10b29scw0KSXBz
ZWMtdG9vbHMNCmlzY3NpLWluaXRpYXRvci11dGlscw0Ka2VybmVsDQprZXhlYy10b29scw0KbGli
ZXZlbnQNCmxrc2N0cC10b29scw0KbG0tc2Vuc29ycw0KTFNCDQpsdm0yDQptZGFkbQ0KbW9uaXQN
Cm5ldC1zbm1wDQpudHANCm9wZW5haXMNCm9wZW5pcG1pDQpvcGVuc3NsDQpwYWNlbWFrZXINCnBh
bQ0KcXVvdGENCnJwbQ0Kc2VsaW51eA0Kc21hcnRtb250b29scw0Kc3Ryb25nc3dhbg0Kc3lzbG9n
LW5nDQp1ZGV2DQp2bGFuDQprZXJuZWwgKCtjb3JyZXNwb25kaW5nIHBhdGNoZXMpDQoNCmV2bG9n
DQppZmVuc2xhdmUNCm1pcHY2LWRhZW1vbi11bWlwDQpvcGVubDJ0cA0KY3Jhc2gNCg0KZHJiZA0K
Z3JzZWN1cml0eQ0KbG9nY2hlY2sNCm1ha2VkdW1wZmlsZQ0KbnVtYWN0bA0Kb2NmczItdG9vbHMN
CnBhbV9wYXNzd2RxYw0Kc2FtaGFpbg0KZnRyYWNlDQpsdHQtdXNlcnNwYWNlDQoNCg0K

--_002_DDB0C57E45663A458C5CACB7B5688BC21D7221D6SESTOEX04enease_--
