Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F342060616
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 01:18:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u891IQvd017745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 18:18:27 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Thu, 8 Sep 2016 18:18:26 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] waf-samba.bbclass: Append
	PACKAGECONFIG_CONFARGS to EXTRA_OECONF
Thread-Index: AQHSCazIjI9p9aeLXUCH72fJxaqh/6BwWc5g
Date: Fri, 9 Sep 2016 01:18:25 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131074A68@ALA-MBB.corp.ad.wrs.com>
References: <20160908051048.15948-1-jackie.huang@windriver.com>
	<20160908084015.GA2636@jama>
In-Reply-To: <20160908084015.GA2636@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.137]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF
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
X-List-Received-Date: Fri, 09 Sep 2016 01:18:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, September 08, 2016 4:40 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] waf-samba.bbclass: Append
> PACKAGECONFIG_CONFARGS to EXTRA_OECONF
>=20
> On Thu, Sep 08, 2016 at 01:10:48PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF for waf-samba.bbclass
> > because the PACKAGECONFIG will not be handled for all recipes after
> > the following commit in oe-core:
> >
> > commit c98fb5f5129e71829ffab4449b3d28082bc95ab4
> > Author: Martin Jansa <martin.jansa@gmail.com>
> > Date:   Tue Aug 30 16:19:58 2016 +0200
> >
> >     base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only=
 in
> autotools.bbclass
> >
> >     * recipes which don't inherit autotools or cmake bbclass and want t=
o
> >       use the configure options from PACKAGECONFIG need to handle
> >       PACKAGECONFIG_CONFARGS themselves.
> >
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-networking/classes/waf-samba.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networkin=
g/classes/waf-
> samba.bbclass
> > index 772bc75..a58ca2c 100644
> > --- a/meta-networking/classes/waf-samba.bbclass
> > +++ b/meta-networking/classes/waf-samba.bbclass
> > @@ -20,6 +20,8 @@ CONFIGUREOPTS =3D " --prefix=3D${prefix} \
> >                    --mandir=3D${mandir} \
> >                  "
> >
> > +EXTRA_OECONF_append =3D " ${PACKAGECONFIG_CONFARGS}"
>=20
> Cannot we append it to CONFIGUREOPTS and remove EXTRA_OECONF from this
> bbclass completely?

Yes, we can, but why do we need to remove EXTRA_OECONF from this bbclass
completely? Is it going to be deprecated?

And I see that EXTRA_OECONF  is used in several recipes that inherit waf-sa=
mba,
If it's remove from the bbclass, it's should also be removed from those rec=
ipes, right?

Thanks,
Jackie

>=20
> > +
> >  # Three methods for waf cross compile:
> >  # 1. answers:
> >  #    Only --cross-answers - try the cross-answers file, and if
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

