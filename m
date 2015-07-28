Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98ADF76280
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 19:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6SJdkGc025580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 12:39:46 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.8]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0235.001;
	Tue, 28 Jul 2015 12:39:30 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency
	but keep as broken
Thread-Index: AQHQxK/LUTyu+Kr1YUe4f4jP1GRfq53oZr2AgAjpbGA=
Date: Tue, 28 Jul 2015 19:39:29 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF848235F768@ALA-MBA.corp.ad.wrs.com>
References: <1437591250-9247-1-git-send-email-jslater@windriver.com>
	<20150722203127.GM22729@mentor.com>
In-Reply-To: <20150722203127.GM22729@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
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
X-List-Received-Date: Tue, 28 Jul 2015 19:39:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> Sent: Wednesday, July 22, 2015 1:31 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency =
but keep as
> broken
>=20
> [[oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as =
broken] On
> 15.07.22 (Wed 11:54) Joe Slater wrote:
>=20
> > We will need the conditional dependency on systemd.  It is
> > not a good idea to use PNBLACKLIST in a recipe, and the
>=20
> It isn't a good idea to have a recipe that needs to be blacklisted.  :-)
>=20
> That said, it's here and there's still an argument for supporting it, so
> why remove PNBLACKLIST and replace it with something less obvious?

Blacklisting oneself is esthetically unpleasing.  But, beyond that, it does=
n't work
for multilib variants, and for some reason PNBLACKLIST[${PN}] does not pars=
e.

Joe


>=20
> No objection to a conditional dependency on systemd.
>=20
> -J.
>=20
> > version here does not suppress lib32-ypbind-mt.
> >
> > Signed-off-by: Joe Slater <jslater@windriver.com>
> > ---
> >  recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/met=
a-
> networking/recipes-support/nis/ypbind-mt_2.2.bb
> > index 4f8bf48..359b020 100644
> > --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > @@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Binds to =
\
> >  the server which answered as first. \
> >  "
> >  HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> > -DEPENDS =3D "yp-tools"
> > +DEPENDS =3D "yp-tools ${@base_contains('DISTRO_FEATURES', 'systemd', '=
systemd', '', d)}"
> >  PROVIDES +=3D "ypbind"
> >
> > -PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> > +python () {
> > +    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-tools")
> > +}
> >
> >  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2=
 \
> >             file://ypbind-yocto.init \
> > --
> > 1.7.9.5
> >
> --
> -Joe MacDonald.
> :wq

