Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBFC8607BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 01:49:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t581nUnO017413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jun 2015 18:49:31 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Sun, 7 Jun 2015 18:49:30 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] libcanberra: upgrade and add
	packageconfig for gstreamer and gtk
Thread-Index: AQHQn3TTFghvGse4N0u9nvOhHV2kTp2h2ljw
Date: Mon, 8 Jun 2015 01:49:30 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF11CFD41@ALA-MBB.corp.ad.wrs.com>
References: <1433496408-24477-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LZLPgpeY+SfvUDAqc4efsRW3L8TS-vROj0FKqWKAz5C=w@mail.gmail.com>
In-Reply-To: <CAJTo0LZLPgpeY+SfvUDAqc4efsRW3L8TS-vROj0FKqWKAz5C=w@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] libcanberra: upgrade and add packageconfig for gstreamer and gtk
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
X-List-Received-Date: Mon, 08 Jun 2015 01:49:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Burton, Ross
> Sent: Friday, June 05, 2015 5:48 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] libcanberra: upgrade and add packageco=
nfig for gstreamer and
> gtk
>=20
> On 5 June 2015 at 10:26, <jackie.huang@windriver.com> wrote:
>=20
> > +
> >  ${@base_contains('DISTRO_FEATURES','gstreamer','gstreamer','',d)} \
> >
>=20
> Lets not invent distro features for no reason.

Ok, so I will remove this and left gstreamer not enabled by default, someon=
e can enable it
when needed, does that make sense?

Thanks,
Jackie

>=20
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

