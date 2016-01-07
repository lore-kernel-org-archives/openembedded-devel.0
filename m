Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C369D731D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 03:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0730uUC016032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jan 2016 19:00:56 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.162]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Wed, 6 Jan 2016 19:00:56 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix	do_install
	and PROVIDES
Thread-Index: AQHRSIoy0rb/h1ZbgUa2XuaQ/NkMcp7vSrtw
Date: Thu, 7 Jan 2016 03:00:54 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
In-Reply-To: <9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.194]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native: fix	do_install	and PROVIDES
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
X-List-Received-Date: Thu, 07 Jan 2016 03:00:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> Sent: Wednesday, January 06, 2016 9:57 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_install=
 and PROVIDES
>=20
>=20
> > Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) <Jackie.Huang@windri=
ver.com>:
> >
> >
> >
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openem=
bedded-devel-
> >> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >> Sent: Tuesday, January 05, 2016 3:21 AM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_inst=
all and PROVIDES
> >>
> >> It's insane re-introducing a virtual/javac-native without understandin=
g
> >> the issues coming with that.
> >
> > Please carefully review the patches before saying insane, I don't think=
 it was
> > correct to remove virtual/javac-native since there are several provider=
s.
>=20
> What does virtual/javac-native mean? Correctly, there can be several prov=
iders.
>=20
> How many of them can you have in one sysroot/build? One.
>=20
> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE virtua=
l/javac-native,
> what happens?

So seem like you don't really understand how it should be used.

Yes, only one we can have when there are multiple providers, that's why we =
should
use PREFERRED_PROVIDER to determines which one it is, and use the virtual/f=
oo
instead of specific provider's name in DEPENDS/RDEPENDS of the recipe that =
requires it,=20
so we can ensure only one will be built and avoid conflicts.

FYI:
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manua=
l.html#bb-bitbake-preferences
http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-PREFERR=
ED_PROVIDER

>=20
> It is insane to have multiple providers for the same virtual/foo when at =
least a bunch

Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to handle multi=
ple providers,
(another one is update-alternatives which is not supported by -native recip=
e), and work fine
in many projects, why is it insane here?

I tested my patches to build openjdk7, openjdk8 and most recipes in meta-ja=
va with and without sstate
on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all built fin=
e (previous method
 fails to build openjdk7 sometime and always fail when build with sstate)

Thanks,
Jackie

> of them are required to finish a particular build.
>=20
> > Thanks,
> > Jackie
>=20
> You're welcome,
> Jens
>=20
> >>
> >>> Am 23.12.2015 um 11:03 schrieb jackie.huang@windriver.com:
> >>>
> >>> From: Jackie Huang <jackie.huang@windriver.com>
> >>>
> >>> I asked about this issue two days ago but no response, please careful=
ly
> >>> review and correct me if anyone have better understanding.
> >>
> >> Please excuse when people enjoy their holidays around Christmas.
> >>
> >>> My tests includes building openjdk7 and openjdk8 on qemux86-64
> >>> with/without sstate cache.
> >>>
> >>> --
> >>> The following changes since commit 35739fca028996c594b1efa2225a77c8d6=
038193:
> >>>
> >>> openjdk-8: Use zero mode on arm (2015-12-17 10:39:21 -0200)
> >>>
> >>> are available in the git repository at:
> >>>
> >>> git://git.pokylinux.org/poky-contrib.git jhuang0/d_jdk8-fix_151223_0
> >>> http://git.pokylinux.org/cgit.cgi//log/?h=3Djhuang0/d_jdk8-fix_151223=
_0
> >>>
> >>> Jackie Huang (2):
> >>> Revert "meta-java: rely on well known bootstrap-path"
> >>> openjdk-8-native: fix improper do_install and PROVIDES
> >>>
> >>> README                                             | 12 ++++++++--
> >>> classes/java-bootstrap-components.bbclass          |  7 ------
> >>> classes/java-library.bbclass                       |  3 +--
> >>> recipes-core/ant/ant-native_1.8.1.bb               |  2 +-
> >>> recipes-core/antlr/antlr_2.7.7.bb                  |  2 +-
> >>> recipes-core/cacao/cacao_1.6.1.bb                  |  6 ++---
> >>> recipes-core/classpath/classpath.inc               |  4 ++--
> >>> recipes-core/classpathx/gnujaf_1.1.1.bb            |  2 +-
> >>> recipes-core/classpathx/gnumail_1.1.2.bb           |  2 +-
> >>> recipes-core/classpathx/inetlib_1.1.1.bb           |  2 +-
> >>> recipes-core/cup/cup_0.10k.bb                      |  2 +-
> >>> recipes-core/ecj/ecj-bootstrap-native.bb           |  4 +++-
> >>> recipes-core/ecj/libecj-bootstrap.inc              |  2 +-
> >>> recipes-core/icedtea/icedtea7-native.inc           |  2 +-
> >>> recipes-core/jacl/jacl_1.4.1.bb                    |  2 +-
> >>> .../jakarta-commons/commons-logging_1.1.1.bb       |  2 --
> >>> recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  2 --
> >>> .../jakarta-libs/avalon-framework-api_4.3.bb       |  2 +-
> >>> recipes-core/jakarta-libs/bsf_2.4.0.bb             |  2 +-
> >>> recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  2 +-
> >>> recipes-core/jakarta-libs/logkit_1.2.2.bb          |  2 +-
> >>> recipes-core/jakarta-libs/oro_2.0.8.bb             |  2 +-
> >>> recipes-core/jakarta-libs/poi_3.0.bb               |  2 +-
> >>> recipes-core/jakarta-libs/regexp_1.5.bb            |  2 +-
> >>> recipes-core/jamvm/jamvm.inc                       |  4 ++--
> >>> recipes-core/jcraft/jsch_0.1.40.bb                 |  2 +-
> >>> recipes-core/jcraft/jzlib_1.0.7.bb                 |  2 +-
> >>> recipes-core/jdepend/jdepend_2.9.1.bb              |  2 +-
> >>> recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
> >>> recipes-core/junit/junit4_4.3.1.bb                 |  4 +++-
> >>> recipes-core/junit/junit_3.8.2.bb                  |  2 +-
> >>> recipes-core/openjdk/openjdk-8-native.inc          | 13 +++++------
> >>> recipes-core/openjdk/openjdk-8-native_72b05.bb     | 26 -------------=
---------
> >>> recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
> >>> recipes-core/servlet-api/servlet2.3_4.1.37.bb      |  4 +++-
> >>> recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  2 ++
> >>> recipes-core/xalan-j/xalan-j_2.7.1.bb              |  2 +-
> >>> recipes-core/xerces-j/xerces-j_2.11.0.bb           |  6 ++---
> >>> recipes-core/xml-commons/jaxp1.3_1.4.01.bb         |  4 +++-
> >>> .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  6 ++---
> >>> recipes-core/xml-commons/xpp2_2.1.10.bb            |  2 ++
> >>> recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         |  2 ++
> >>> 42 files changed, 69 insertions(+), 90 deletions(-)
> >>> delete mode 100644 classes/java-bootstrap-components.bbclass
> >>>
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >> --
> >> Jens Rehsack - rehsack@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Jens Rehsack - rehsack@gmail.com


