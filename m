Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F5EE606D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 09:43:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M9hol9001619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 02:43:50 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.80]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Tue, 22 Apr 2014 02:43:50 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 0/3] collectd: three fixes
Thread-Index: AQHPXHg65Exk6hTvIUKfS4DeYUun7JsdZaVQ
Date: Tue, 22 Apr 2014 09:43:49 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BF7A94@ALA-MBB.corp.ad.wrs.com>
References: <cover.1396947706.git.jackie.huang@windriver.com>
	<20140420090913.GS2486@jama>
In-Reply-To: <20140420090913.GS2486@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v2 0/3] collectd: three fixes
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
X-List-Received-Date: Tue, 22 Apr 2014 09:43:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Sunday, April 20, 2014 5:09 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2 0/3] collectd: three fixes
>=20
> On Tue, Apr 08, 2014 at 05:07:47PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > v2 comment:
> > "collectd: explicitly enable/disable libsensors support":
> > changed the config option to be a PACKAGECONFIG option
>=20
> I'm going to merge all 3, but can you add load.so, disk.so, threshold.so =
to PRIVATE_LIBS to hide
> following warnings?

Sure, I will do that.

Thanks,
Jackie

>=20
> log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was registe=
red as shlib provider for
> load.so, changing it to collectd-5.2.2 because it was built later
> log.world.20140418_190059.log/bitbake.log:WARNING:
> libgphoto2-camlibs-2.4.11 was registered as shlib provider for disk.so, c=
hanging it to collectd-5.2.2
> because it was built later
> log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was registe=
red as shlib provider for
> threshold.so, changing it to
> collectd-5.2.2 because it was built later
>=20
> >
> > ---
> > The following changes since commit bc969d3705c45928de8525ef3d2d9d286731=
1864:
> >
> >   inetutils: add -dbg packages for tftpd, telnetd and rshd (2014-04-02
> > 11:18:54 -0400)
> >
> > are available in the git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib jhuang0/r_collectd_1
> >
> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Djhuang0/r_colle=
c
> > td_1
> >
> > Ming Liu (1):
> >   collectd: explicitly enable/disable libsensors support
> >
> > Wenzong Fan (2):
> >   collectd: enable/disable libpq explicitly
> >   collectd: fix init status
> >
> >  .../collectd/collectd/collectd.init                |   13 ++++++++++++=
-
> >  .../recipes-extended/collectd/collectd_5.2.2.bb    |    6 ++++--
> >  2 files changed, 16 insertions(+), 3 deletions(-)
> >
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

