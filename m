Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35F5A605FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:05:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAN25slj027158
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 18:05:54 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.225]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Sun, 22 Nov 2015 18:05:54 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lmsensors: allow lmsensors-isatools to
	be empty
Thread-Index: AQHRI4e4maAlC/J8f0Cj5gWUbPg4956o32jA
Date: Mon, 23 Nov 2015 02:05:53 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C744B3E@ALA-MBA.corp.ad.wrs.com>
References: <1448018524-16308-1-git-send-email-jackie.huang@windriver.com>
	<20151120113641.GD2241@jama>
In-Reply-To: <20151120113641.GD2241@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.136]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] lmsensors: allow lmsensors-isatools to be empty
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
X-List-Received-Date: Mon, 23 Nov 2015 02:05:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Friday, November 20, 2015 7:37 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] lmsensors: allow lmsensors-isatools to=
 be empty
>=20
> On Fri, Nov 20, 2015 at 07:22:04PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > isadump and isaset are only built on x86 machines,
> > so allow lmsensors-isatools to be empty.
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/me=
ta-oe/recipes-
> support/lm_sensors/lmsensors_3.4.0.bb
> > index 62ea131..364eb9e 100644
> > --- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
> > +++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
> > @@ -131,3 +131,7 @@ RDEPENDS_${PN}-pwmconfig =3D "${PN}-fancontrol"
> >  FILES_${PN}-isatools =3D "${sbindir}/isa*"
> >  FILES_${PN}-isatools-dbg =3D "${sbindir}/.debug/isa*"
> >  FILES_${PN}-isatools-doc =3D "${mandir}/man8/isa*"
> > +
> > +# isadump and isaset are only built on x86 machines,
> > +# so allow it to be empty.
> > +ALLOW_EMPTY_${PN}-isatools =3D "1"
>=20
> Why should anyone on !x86 install lmsensors-isatools package?
>=20
> And if (s)he does, then why should s(he) be happy with empty package?

Sorry, this is not appropriate, we fixed it another way in our layer, pleas=
e ignore it.

Thanks,
Jackie

>=20
> Package manager saying that the package doesn't exist is much better
> user experience than it happily installing completely useless empty
> package.
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

