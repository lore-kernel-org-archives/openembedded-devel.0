Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id CD4F57F30E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 16:45:00 +0000 (UTC)
IronPort-SDR: hNfFbhFlT4/OsYIR+NvPVxrU5mM6mUHdPdqafzo2Ad4YTKuaszLhm31KnEAfn+7DQ0ATGbGJ5c
	uymoAH/4YAWsZL/BjnfxM1FcIy8JOZifohaxbUYJIaZELo+C6PSJCc9ENdQQ8VsyryuswwY/vf
	pPnBEwcYlRYCVG2A086JBTs51JxL1lFoZ1mbZS4SC9nNVIMYnp69mZMS//96VDTR3+g2++GXIZ
	S3IK15W0i4hgApqrzlD0+axfNDD1/EosDjTpx3p80KBD8w/6iYdOdLuC7ucumQSzPK1/9ZEoRa
	2Zs=
X-IronPort-AV: E=Sophos;i="5.69,257,1571695200"; 
   d="scan'208";a="3082439"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Lei YU <mine260309@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] googletest: move to release 1.10.0
Thread-Index: AQHVoC74AOqDo/17j0SLvK+PtOCo9qebKhmAgAAJL4CAABbugIAHHW0A
Date: Fri, 29 Nov 2019 16:44:59 +0000
Message-ID: <6f8d742dac2642ba8e954322554e761a@XBOX03.axis.com>
References: <1574315133-73046-1-git-send-email-mine260309@gmail.com>
	<20191125030831.GA16252@localhost>
	<CAARXrtkhU3UhmQ8kTv6w5TVfBLT0QxoZDK-0P0VqgQhguD=MxA@mail.gmail.com>
	<CAMKF1so86g6hCzATiFO5UcWFoRTxO8WVg-tQeimAj2YXgcRqZg@mail.gmail.com>
In-Reply-To: <CAMKF1so86g6hCzATiFO5UcWFoRTxO8WVg-tQeimAj2YXgcRqZg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] googletest: move to release 1.10.0
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
X-List-Received-Date: Fri, 29 Nov 2019 16:45:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 25 november 2019 06:03
> To: Lei YU <mine260309@gmail.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>; Adrian
> Bunk <bunk@stusta.de>
> Subject: Re: [oe] [meta-oe][PATCH] googletest: move to release 1.10.0
>=20
> On Sun, Nov 24, 2019 at 7:41 PM Lei YU <mine260309@gmail.com> wrote:
> >
> > On Mon, Nov 25, 2019 at 11:08 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, Nov 21, 2019 at 01:45:33PM +0800, Lei YU wrote:
> > > > The googletest recipe was using 1.8.1 tag, and in the recipe it was
> > > > using the git revision instead of the tag release.
> > > >
> > > > Rename it to googletest_git.bb and use the 1.10.0 release revision
> to
> > > > get the latest release.
> > > >...
> > >
> > > When removing the version from the recipe name you have to set PV
> manually.
> >
> > Fixed and sent v2 patch.
>=20
> Thanks, I have rebased this one on top of v1, as v1 was already merged.
>=20
> > Thanks.

Please move the version back to the file name rather than setting PV.
Since the SRCREV matches the 1.10.0 tag there is no reason to set PV=20
in the recipe instead of having it in the file name.

Not having the version in the file name prevents having versioned=20
bbappend files.

//Peter


