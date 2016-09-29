Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 814946013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 01:55:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T1tBfN022369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 18:55:11 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Wed, 28 Sep 2016 18:55:10 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] ntp : Add openssl to default
	PACKAGECONFIG options
Thread-Index: AQHSGaa/a45sC/Pob06zM0utTfpOZaCPs4ww
Date: Thu, 29 Sep 2016 01:55:09 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2E31EC@ALA-MBA.corp.ad.wrs.com>
References: <20160928021717.28355-1-jackie.huang@windriver.com>
	<CAMKF1soN+e18xvZ7iuKb_Bxf++sj59=851q+_UH_UCH24_uLvA@mail.gmail.com>
In-Reply-To: <CAMKF1soN+e18xvZ7iuKb_Bxf++sj59=851q+_UH_UCH24_uLvA@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.146]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] ntp : Add openssl to default PACKAGECONFIG options
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
X-List-Received-Date: Thu, 29 Sep 2016 01:55:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Thursday, September 29, 2016 12:38 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] ntp : Add openssl to default P=
ACKAGECONFIG options
>=20
> Is this the common usecase ?

I guess so, It's been the default option in our distro, and I checked that =
it's also enabled
in popular Linux distributions like debian/Ubuntu, redhat/fedora and opensu=
se.

Thanks,
Jackie

>=20
> On Sep 27, 2016 7:35 PM, <jackie.huang@windriver.com> wrote:
>=20
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Add openssl to default PACKAGECONFIG options so ntp
> > is configured to have crypto support by default.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> > b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> > index f3344c0..202d1a3 100644
> > --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> > +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> > @@ -46,7 +46,7 @@ USERADD_PARAM_${PN} =3D "--system --home-dir
> > ${NTP_USER_HOME} \
> >                         --shell /bin/false --user-group ntp"
> >
> >  # NB: debug is default-enabled by NTP; keep it default-enabled here.
> > -PACKAGECONFIG ??=3D "cap debug refclocks \
> > +PACKAGECONFIG ??=3D "cap debug refclocks openssl \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
> >  "
> >  PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} =
\
> > --
> > 2.8.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

