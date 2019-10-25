Return-Path: <m.schwan@phytec.de>
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
	by mail.openembedded.org (Postfix) with ESMTP id CB3336D561
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1571989179; x=1574581179;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nKtxfLuAcBiw+No3QBRJ2j6yF5aW6MrQ5/AlEnXERCw=;
	b=CJv2EGpV3Dpca+GnKKs9tREu9LDUqGiOzpjhv3l6IU+wwl9MLcjfhb8SP2X6Os4I
	ZbKSIwmv+x8O2Oz5iiSpO4gRQD+ymYRKnm2D7W0nw25M7HzTG/PnQeRS3HuMhJcS
	vMHWRqtJ/elt9jF8AZxufm5lEhk0kTDTrUtuTW2BaJA=;
X-AuditID: c39127d2-df9ff7000000408f-66-5db2a6bb5945
Received: from Kokolorix.phytec.de (Kokolorix.phytec.de [172.16.0.3])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
	5E.80.16527.BB6A2BD5; Fri, 25 Oct 2019 09:39:39 +0200 (CEST)
Received: from lws-schwan.phytec.de ([172.16.23.192])
	by Kokolorix.phytec.de (IBM Domino Release 9.0.1FP9)
	with ESMTP id 2019102509393968-6168 ;
	Fri, 25 Oct 2019 09:39:39 +0200 
Message-ID: <9254d78a3ffd70fbda4f7fe4e5a10e8058a413cf.camel@phytec.de>
From: Martin Schwan <m.schwan@phytec.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 09:39:39 +0200
In-Reply-To: <CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
References: <20191009123218.19821-1-m.schwan@phytec.de>
	<84402ad74c6fc2da7db63f59d9082c35b6686ee4.camel@phytec.de>
	<CAMKF1srpMJYKpH05Z5Ubv7CB_nAQ3O70-z3V0O+MwedsOQrtEA@mail.gmail.com>
	<CAMKF1sotEEJe9NwkD5+pht-MZW+WKAY+CKjyJ7h5miovyVZs1w@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Kokolorix/Phytec(Release
	9.0.1FP9|August 14, 2017) at 25.10.2019 09:39:39,
	Serialize by Router on Kokolorix/Phytec(Release 9.0.1FP9|August  14,
	2017) at 25.10.2019 09:39:39,
	Serialize complete at 25.10.2019 09:39:39
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWyRoCBWXf3sk2xBkvnaVpcPLyU2aLt+ixG
	ByaPnbPusnuc27iCMYApissmJTUnsyy1SN8ugSvjwfx7jAVzFSredhxlbmBcItXFyMkhIWAi
	cXjzLqYuRi4OIYG9jBIb/kxnBkkICVxilNj+xBjE5hVwk1gx+RkLiC0MZP+fMIURxGYT0JB4
	d+YxG4gtIqAo0dzyG6yXWcBR4kfXFrAaFgFViTfb1gD1cnBwCgRKPLtrBrGrlUniyP89TCA1
	ogLyEuufLmKE2CUocXLmExaI49qZJH63e0PYQhKnF5+Fmq8tsWzhayhbU6J1+2/2CYyCs5C0
	z0JSNgtJ2QJG5lWMQrmZydmpRZnZegUZlSWpyXopqZsYgYF6eKL6pR2MfXM8DjEycTAeYpTg
	YFYS4d2ttjFWiDclsbIqtSg/vqg0J7X4EKM0B4uSOO8G3pIwIYH0xJLU7NTUgtQimCwTB6dU
	A2NcQpGL0OR5sRp/3k66t/jU9P/m2zN2nvFZ0sc3Uybgx2uRoG/te0/Fyv7+dOyLxt23OnpJ
	U70PvdP5mvW2pM5EKWh98bI/atuKfOvuHGuUdYu1+SZ36157hF+V9Of9l3w5lx2wTbnouWhD
	btNfdvduZp5aKfe31n9nFB+2fX88K4dxi8W2xU5KLMUZiYZazEXFiQASCHwhQgIAAA==
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2] python-waitress: Add recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 07:39:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Ah, thank you! I should have checked that before. I expected to get a
notification email for merged or otherwise updated patches.

On Fri, 2019-10-25 at 00:00 +0100, Khem Raj wrote:
> Now I see that its already in master see
>=20
> https://git.openembedded.org/meta-openembedded/commit/?id=3Daaeb37656349d=
b7f8562bf0ac1c11685f20a5212
>=20
> On Thu, Oct 24, 2019 at 1:46 PM Khem Raj <raj.khem@gmail.com> wrote:
> > Hi Martin
> >=20
> > Thanks for following up on this usually patches appear on patchwork.ope=
nembedded.org and I pick it up from there it seems either I missed it or it=
 did not appear on patchwork
> >=20
> > If it=E2=80=99s not staged in master-next and there is no response to i=
t then it went missing I am traveling these days so a bit sporadic on respo=
nses I will check it next time I am near computer and stage it if all is ok
> >=20
> > Thanks for your contribution
> >=20
> > On Thu, Oct 24, 2019 at 12:38 PM Martin Schwan <m.schwan@phytec.de> wro=
te:
> > > Hi,
> > >=20
> > > just wanted to kindly ask if anyone had time reviewing this patch? Th=
is
> > > is my first patch for this project, maybe I am missing something. Is
> > > there anything that stops this from being merged?
> > >=20
> > > On Wed, 2019-10-09 at 14:32 +0200, Martin Schwan wrote:
> > > > Waitress is a pure-Python WSGI server.
> > > >=20
> > > > Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> > > > ---
> > > > Changes in v2:
> > > >  - Fixed missing "K" in "LIC_FILES_CHKSUM"
> > > > ---
> > > >  .../recipes-devtools/python/python-waitress.inc        | 10 ++++++=
++++
> > > >  .../recipes-devtools/python/python-waitress_1.3.1.bb   |  2 ++
> > > >  .../recipes-devtools/python/python3-waitress_1.3.1.bb  |  2 ++
> > > >  3 files changed, 14 insertions(+)
> > > >  create mode 100644 meta-python/recipes-devtools/python/python-wait=
ress.inc
> > > >  create mode 100644 meta-python/recipes-devtools/python/python-wait=
ress_1.3.1.bb
> > > >  create mode 100644 meta-python/recipes-devtools/python/python3-wai=
tress_1.3.1.bb
> > > >=20
> > > > diff --git a/meta-python/recipes-devtools/python/python-waitress.in=
c b/meta-python/recipes-devtools/python/python-waitress.inc
> > > > new file mode 100644
> > > > index 000000000..732c31dbd
> > > > --- /dev/null
> > > > +++ b/meta-python/recipes-devtools/python/python-waitress.inc
> > > > @@ -0,0 +1,10 @@
> > > > +SUMMARY =3D "A WSGI server for Python"
> > > > +DESCRIPTION =3D "Waitress is meant to be a production-quality pure=
-Python WSGI \
> > > > +    server with very acceptable performance."
> > > > +HOMEPAGE =3D "https://github.com/Pylons/waitress"
> > > > +SECTION =3D "devel/python"
> > > > +LICENSE =3D "ZPL-2.1"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D78ccb3640dc841e1bae=
cb3e27a6966b2"
> > > > +
> > > > +SRC_URI[md5sum] =3D "d9132d313de0c5e0fec34ef9ede5442e"
> > > > +SRC_URI[sha256sum] =3D "278e09d6849acc1365404bbf7d790d0423b159802e=
850c726e8cd0a126a2dac7"
> > > > diff --git a/meta-python/recipes-devtools/python/python-waitress_1.=
3.1.bb b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> > > > new file mode 100644
> > > > index 000000000..26a628ea0
> > > > --- /dev/null
> > > > +++ b/meta-python/recipes-devtools/python/python-waitress_1.3.1.bb
> > > > @@ -0,0 +1,2 @@
> > > > +inherit setuptools pypi
> > > > +require python-waitress.inc
> > > > diff --git a/meta-python/recipes-devtools/python/python3-waitress_1=
.3.1.bb b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> > > > new file mode 100644
> > > > index 000000000..83c8b66d8
> > > > --- /dev/null
> > > > +++ b/meta-python/recipes-devtools/python/python3-waitress_1.3.1.bb
> > > > @@ -0,0 +1,2 @@
> > > > +inherit setuptools3 pypi
> > > > +require python-waitress.inc
> > > > --
> > > > 2.23.0
> > > >=20
> > >=20
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel


