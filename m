Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C13875662
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:40:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t558eiQs021586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jun 2015 01:40:45 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0224.002;
	Fri, 5 Jun 2015 01:40:43 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 0/4] Add GStreamer 0.10 and things that depend on
	it from oe-core
Thread-Index: AQHQlKoGquTv+ZLMZkG2E9YTsXU+6J2IpT2AgBUFCeA=
Date: Fri, 5 Jun 2015 08:40:43 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAF11CE3C0@ALA-MBB.corp.ad.wrs.com>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama> <555F5517.5000100@gmail.com>
	<CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
In-Reply-To: <CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Fri, 05 Jun 2015 08:40:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Burton, Ross
> Sent: Saturday, May 23, 2015 12:30 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 0/4] Add GStreamer 0.10 and things that depend o=
n it from oe-core
>=20
> On 22 May 2015 at 17:11, akuster808 <akuster808@gmail.com> wrote:
>=20
> > I have noticed some breakages when building xfce, (libcanberra DEPENDS
> > =3D
> > 'gstreamer') now needs to be "gstream1.0". I suspect some of it is do
> > to gstreamer transitioning. I will give a few days to settle before
> > sending patches.
> >
>=20
> libcanberra 0.29 only supports GStreamer 0.10, libcanberra 0.30 depends o=
n 1.0.
>=20
> I suspect the problem you're hitting is that libcanberra 0.29 depends on =
gstreamer which isn't in oe-
> core anymore, but switching gstreamer to
> gstreamer1.0 whilst letting the build run will mean libcanberra doesn't a=
ctually support GStreamer...

We are hitting the same issue, I think we should upgrade libcanberra to ver=
sion 0.30 and make it depend on
Gstream1.0,  and I think the dependency on gstreamer is not mandatory for l=
ibcanberra, it's an optional support,=20
we should make it into PACKAGECONFIG and use DISTRO_FEATURES to decide if i=
t's needed.

Thanks,
Jackie

>=20
> Either xfce should keep with GStreamer 0.10 and so depend on meta-multime=
dia, or xfce and related
> recipes migrate to GStreamer 1.x.
>=20
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

