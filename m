Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7665165E4C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:14:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A1EZ5w024566
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 18:14:36 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 9 Apr 2014 18:14:35 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 2/2] eject: Fix wrong return value
Thread-Index: AQHPU8uhWCQEawWPEkWqGO3IelVYrZsI9KBwgADvpACAAChVwA==
Date: Thu, 10 Apr 2014 01:14:34 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BE114E@ALA-MBA.corp.ad.wrs.com>
References: <cover.1397024315.git.jackie.huang@windriver.com>
	<d548095ff29cf093d3e6df22594476873a34a67c.1397024315.git.jackie.huang@windriver.com>
	<CAMKF1srp7jUDqxShC9TWzocrpytAeG1uTamOcZ+n3KXsOJ33ig@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAB5BDF86B@ALA-MBA.corp.ad.wrs.com>
	<CAMKF1spu1T+fGY6AW0gcBHo=_fCSTPxMEq9pjgoD8i3s=QDy3A@mail.gmail.com>
In-Reply-To: <CAMKF1spu1T+fGY6AW0gcBHo=_fCSTPxMEq9pjgoD8i3s=QDy3A@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/2] eject: Fix wrong return value
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
X-List-Received-Date: Thu, 10 Apr 2014 01:14:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Wednesday, April 09, 2014 11:49 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 2/2] eject: Fix wrong return value
>=20
> On Apr 8, 2014 10:36 PM, "Huang, Jie (Jackie)" <Jackie.Huang@windriver.co=
m>
> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-
> > > bounces@lists.openembedded.org] On Behalf Of Khem Raj
> > > Sent: Wednesday, April 09, 2014 4:13 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH 2/2] eject: Fix wrong return value
> > >
> > > On Apr 8, 2014 8:27 PM, <jackie.huang@windriver.com> wrote:
> > > >
> > > > From: Jackie Huang <jackie.huang@windriver.com>
> > > >
> > > > Remove the unnecessary return(1) from function usage(), so that
> > > > eject -h can return the right value.
> > >
> > > this is an API change i wonder if other programs rely on the value
> being >0
> >
> > I think the answer should be no, I don't see any reason to return 1
> > for
> the "-h" or
> > "--help", almost all programs return 0 for that, right?
> >
>=20
> mostly yes and change is ok too just discuss it with package community an=
d see if this is ok.

Yeah, sure, I will send it to the community, thanks!

Thanks,
Jackie


> > Thanks,
> > Jackie
> >
> > > >
> > > > Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
> > > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > > ---
> > > >  .../eject/eject/eject-2.1.5-error-return.patch     |   10 ++++++++=
++
> > > >  meta-oe/recipes-support/eject/eject_2.1.5.bb       |    4 +++-
> > > >  2 files changed, 13 insertions(+), 1 deletion(-)  create mode
> > > > 100644
> > > meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > >
> > > > diff --git
> > > a/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > > new file mode 100644
> > > > index 0000000..2cce3c3
> > > > --- /dev/null
> > > > +++
> b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> > > > @@ -0,0 +1,10 @@
> > > > +Upstream-Status: Pending
> > > > +
> > > > +--- eject/eject.c.orig 2013-09-11 18:08:36.000000000 +0800
> > > > ++++ eject/eject.c      2013-09-11 18:09:05.000000000 +0800
> > > > +@@ -207,7 +207,6 @@
> > > > + "If omitted, name defaults to `%s'.\n"
> > > > + "By default tries -r, -s, -f, and -q in order until success.\n"),
> > > > +                       DEFAULTDEVICE);
> > > > +-  exit(1);
> > > > + }
> > > > diff --git
> a/meta-oe/recipes-support/eject/eject_2.1.5.bbb/meta-oe/recipes-support/e=
ject/
> > > eject_2.1.5.bb
> > > > index 98319a3..c47c653 100644
> > > > --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > > +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> > > > @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b"
> > > >
> > > >  inherit autotools gettext update-alternatives
> > > >
> > > > -SRC_URI =3D "http://sources.openembedded.org/${BP}.tar.gz"
> > > > +SRC_URI =3D "http://sources.openembedded.org/${BP}.tar.gz \
> > > > +           file://eject-2.1.5-error-return.patch \ "
> > > >
> > > >  SRC_URI[md5sum] =3D "b96a6d4263122f1711db12701d79f738"
> > > >  SRC_URI[sha256sum] =3D
> > > "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
> > > > --
> > > > 1.7.9.5
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

