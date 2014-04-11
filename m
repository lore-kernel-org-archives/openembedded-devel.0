Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9021565EA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 02:22:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3B2MkuB016758
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 19:22:46 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Thu, 10 Apr 2014 19:22:45 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] dialog: update to version 1.1-20120706
Thread-Index: AQHPVJdCfEh5QzDFNUGABSQllLYDrpsLsFzg
Date: Fri, 11 Apr 2014 02:22:44 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BE372D@ALA-MBA.corp.ad.wrs.com>
References: <1396945948-5006-1-git-send-email-jackie.huang@windriver.com>
	<20140410083020.GN2132@jama>
In-Reply-To: <20140410083020.GN2132@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] dialog: update to version 1.1-20120706
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
X-List-Received-Date: Fri, 11 Apr 2014 02:22:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, April 10, 2014 4:30 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] dialog: update to version 1.1-20120706
>=20
> On Tue, Apr 08, 2014 at 04:32:28PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> > - add SUMMARY and HOMEPAGE
> > - remove the use of PRINC
>=20
> There is no PRINC, did you mean INC_PR?

Yes, that's what I meant, I will fix it and also use -M to resend.

Thanks,
Jackie

>=20
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  .../dialog/dialog-static_1.1-20111020.bb           |    7 -------
> >  .../dialog/dialog-static_1.1-20120706.bb           |    6 ++++++
> >  meta-oe/recipes-extended/dialog/dialog.inc         |    4 ++--
> >  .../recipes-extended/dialog/dialog_1.1-20111020.bb |    5 -----
> >  .../recipes-extended/dialog/dialog_1.1-20120706.bb |    4 ++++
> >  5 files changed, 12 insertions(+), 14 deletions(-)  delete mode
> > 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> >  create mode 100644
> > meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> >  delete mode 100644
> > meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> >  create mode 100644
> > meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> >
> > diff --git
> > a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> > b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> > deleted file mode 100644
> > index e21a914..0000000
> > --- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20111020.bb
> > +++ /dev/null
> > @@ -1,7 +0,0 @@
> > -require dialog.inc
> > -PR =3D "${INC_PR}.0"
> > -
> > -LDFLAGS +=3D "-static"
> > -
> > -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> > -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbc=
ad9faffb496cae8a7a"
> > diff --git
> > a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> > b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> > new file mode 100644
> > index 0000000..595f323
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> > @@ -0,0 +1,6 @@
> > +require dialog.inc
> > +
> > +LDFLAGS +=3D "-static"
> > +
> > +SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> > +SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b=
44d079cb87cf0ce2f5"
> > diff --git a/meta-oe/recipes-extended/dialog/dialog.inc
> > b/meta-oe/recipes-extended/dialog/dialog.inc
> > index 27e4e60..c1c28fd 100644
> > --- a/meta-oe/recipes-extended/dialog/dialog.inc
> > +++ b/meta-oe/recipes-extended/dialog/dialog.inc
> > @@ -1,13 +1,13 @@
> > +SUMMARY =3D "display dialog boxes from shell scripts"
> >  DESCRIPTION =3D "Dialog lets you to present a variety of questions \
> > or display messages using dialog boxes from a shell \  script (or any
> > scripting language)."
> > +HOMEPAGE =3D "http://invisible-island.net/dialog/"
> >  SECTION =3D "console/utils"
> >  DEPENDS =3D "ncurses"
> >  LICENSE =3D "LGPL-2.1"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343"
> >
> > -INC_PR =3D "r0"
> > -
> >  SRC_URI =3D "ftp://invisible-island.net/dialog/dialog-${PV}.tgz"
> >
> >  # hardcoded here for use in dialog-static recipe diff --git
> > a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> > b/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> > deleted file mode 100644
> > index 73079a1..0000000
> > --- a/meta-oe/recipes-extended/dialog/dialog_1.1-20111020.bb
> > +++ /dev/null
> > @@ -1,5 +0,0 @@
> > -require dialog.inc
> > -PR =3D "${INC_PR}.0"
> > -
> > -SRC_URI[md5sum] =3D "15dd2ce9f537c0400f600d1a383aa0a3"
> > -SRC_URI[sha256sum] =3D "746bf18b8414985864835b61536cee826ac916e6827fbc=
ad9faffb496cae8a7a"
> > diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> > b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> > new file mode 100644
> > index 0000000..c87fb61
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> > @@ -0,0 +1,4 @@
> > +require dialog.inc
> > +
> > +SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> > +SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b=
44d079cb87cf0ce2f5"
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

