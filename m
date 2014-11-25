Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA0C77221D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:05:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAP95b43009919
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 01:05:38 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.253]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Tue, 25 Nov 2014 01:05:37 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] There is no LAYERVERSION and LAYERDEPENDS for most
	meta-FOO layers
Thread-Index: AdAHxAmURBPbgu/aTsSQM0urNu2MkQATk92AABKbdAAADG9W0A==
Date: Tue, 25 Nov 2014 09:05:37 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD59E3A6@ALA-MBA.corp.ad.wrs.com>
References: <1B858668EC6A94408DCA5225FDFA85AABD59CFA9@ALA-MBA.corp.ad.wrs.com>
	<547304C9.1060509@topic.nl> <20141124190615.GB6210@mentor.com>
In-Reply-To: <20141124190615.GB6210@mentor.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO layers
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
X-List-Received-Date: Tue, 25 Nov 2014 09:05:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> Sent: Tuesday, November 25, 2014 3:06 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most meta=
-FOO layers
>=20
> [Re: [oe] There is no LAYERVERSION and LAYERDEPENDS for most meta-FOO lay=
ers] On 14.11.24 (Mon
> 11:13) Mike Looijmans wrote:
>=20
> > On 11/24/2014 09:53 AM, Huang, Jie (Jackie) wrote:
> > >Hi,
> > >
> > >I know LAYERVERSION is optional but I think LAYERDEPENDS is required
> > >and at least we should specify the main oe-core, but I found only meta=
-networking and meta-
> webser have this:
> > >
> > >$ grep -r LAYERDEPENDS *
> > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "cor=
e"
> > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "ope=
nembedded-layer"
> > >meta-networking/conf/layer.conf:LAYERDEPENDS_networking-layer =3D "met=
a-python"
> > >meta-webserver/conf/layer.conf:LAYERDEPENDS_webserver =3D "core"
> > >$ grep -r LAYERVERSION *
> > >meta-networking/conf/layer.conf:LAYERVERSION_networking-layer =3D "1"
> > >meta-webserver/conf/layer.conf:LAYERVERSION_webserver =3D "1"
> > >
> > >I found dependencies section in README for most of the meta-FOO layers=
, but no definition of
> LAYERDEPENDS in the layer.conf.
> > >
> > >Thanks,
> > >Jackie
> > >
> >
> > And reading this:
> >
> > LAYERDEPENDS_networking-layer =3D "core"
> > LAYERDEPENDS_networking-layer =3D "openembedded-layer"
> > LAYERDEPENDS_networking-layer =3D "meta-python"
> >
> > makes me wonder whether:
> > - The author forgot to use "+=3D" instead of "=3D"; or
> > - The syntax of LAYERDEPENDS is different from what the rest of the
> > variables use (in that case, an RFC may be in order here); or
> > - These lines are parsed by something else than bitbake's regular parse=
r.
>=20
> I wondered that too.
>=20
> % bitbake -e | grep LAYERDEPENDS_networking # $LAYERDEPENDS_networking-la=
yer [3 operations]
> LAYERDEPENDS_networking-layer=3D"meta-python"
>=20
> That answers that, then.  Guess I'll go fix that up.  :-)

Thanks, Joe.

But for other layers, I think we should add for them, right?=20

Thanks,
Jackie

>=20
> -J.
>=20
> >
> >
> >
> >
> > Met vriendelijke groet / kind regards,
> >
> > Mike Looijmans
> > System Expert
> >
> >
> > TOPIC Embedded Systems
> > Eindhovenseweg 32-C, NL-5683 KH Best
> > Postbus 440, NL-5680 AK Best
> > Telefoon: (+31) (0) 499 33 69 79
> > Telefax:  (+31) (0) 499 33 69 70
> > E-mail: mike.looijmans@topic.nl
> > Website: www.topic.nl
> >
> > Please consider the environment before printing this e-mail
> >
> > Topic zoekt gedreven (embedded) software specialisten!
> > http://topic.nl/vacatures/topic-zoekt-software-engineers/
> >
> --
> -Joe MacDonald.
> :wq

