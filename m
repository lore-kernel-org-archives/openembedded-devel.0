Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E65E731D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 02:50:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0C2ohHL014638
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:50:44 -0800
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.91]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Mon, 11 Jan 2016 18:50:43 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 0/2]	openjdk-8-native:	fix	do_install
	and PROVIDES
Thread-Index: AQHRTFcwgnUxnm/Mt0WSknPyw4wmW573JHdw
Date: Tue, 12 Jan 2016 02:50:42 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C78C5EC@ALA-MBA.corp.ad.wrs.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
	<9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C78A13B@ALA-MBA.corp.ad.wrs.com>
	<E0EC0FF8-2613-41F1-AC02-A0EE125D362B@gmail.com>
In-Reply-To: <E0EC0FF8-2613-41F1-AC02-A0EE125D362B@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 0/2]	openjdk-8-native:	fix	do_install	and PROVIDES
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
X-List-Received-Date: Tue, 12 Jan 2016 02:50:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> Sent: Monday, January 11, 2016 6:02 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_install=
 and PROVIDES
>=20
>=20
> > Am 09.01.2016 um 15:22 schrieb Huang, Jie (Jackie) <Jackie.Huang@windri=
ver.com>:
> >
> >
> >
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openem=
bedded-devel-
> >> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >> Sent: Friday, January 08, 2016 5:46 PM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_inst=
all and PROVIDES
> >>
> >>
> >>> Am 07.01.2016 um 04:00 schrieb Huang, Jie (Jackie) <Jackie.Huang@wind=
river.com>:
> >>>
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:open=
embedded-
> devel-
> >>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >>>> Sent: Wednesday, January 06, 2016 9:57 PM
> >>>> To: openembedded-devel@lists.openembedded.org
> >>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_in=
stall and PROVIDES
> >>>>
> >>>>
> >>>>> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) <Jackie.Huang@wi=
ndriver.com>:
> >>>>>
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:op=
enembedded-
> >> devel-
> >>>>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >>>>>> Sent: Tuesday, January 05, 2016 3:21 AM
> >>>>>> To: openembedded-devel@lists.openembedded.org
> >>>>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_=
install and PROVIDES
> >>>>>>
> >>>>>> It's insane re-introducing a virtual/javac-native without understa=
nding
> >>>>>> the issues coming with that.
> >>>>>
> >>>>> Please carefully review the patches before saying insane, I don't t=
hink it was
> >>>>> correct to remove virtual/javac-native since there are several prov=
iders.
> >>>>
> >>>> What does virtual/javac-native mean? Correctly, there can be several=
 providers.
> >>>>
> >>>> How many of them can you have in one sysroot/build? One.
> >>>>
> >>>> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE v=
irtual/javac-native,
> >>>> what happens?
> >>>
> >>> So seem like you don't really understand how it should be used.
> >>>
> >>> Yes, only one we can have when there are multiple providers, that's w=
hy we should
> >>> use PREFERRED_PROVIDER to determines which one it is, and use the vir=
tual/foo
> >>> instead of specific provider's name in DEPENDS/RDEPENDS of the recipe=
 that requires it,
> >>> so we can ensure only one will be built and avoid conflicts.
> >>
> >> And there starts your misunderstanding:
> >
> > Ok, if so, sorry that my English is not good enough to understand your =
words correctly.
>=20
> Take a number ;)
>=20
> >> You can't even install multiple providers, even when picking one.
> >
> > Picking one is to avoid installing multiple providers, why do we need t=
o install
> > multiple providers? Seems likely I'm starting to misunderstand again?
>=20
> This isn't optional!

Ok, I see why  we don't have the same understanding.

We have different definition of providers:
You mean every packages that have java/javac binary installed as providers =
regardless of the different installed locations.
Mine is based on the definition of PROVIDES, only those intall java/javac i=
n the same location and explicitly define
in PROVIDES variable:

For example:
Cacao-native and jamvm-native both install java in /usr/bin and define virt=
ual/java-native in PROVIDES,
So they are providers of virtual/java-native;
icedtea7-native installs java in /usr/lib/jvm/icedtea7-native/bin/, it's no=
t provider of virtual/java-native here.


>=20
> openjdk-7-native (provided by icedtea7) requires Java5 to build (provided=
 by ecj-initial, iirc).
> openjdk-7 requires openjdk-7-native - so at least here you have 2 provide=
rs for java-native in your
> sysroot/x86_64 ...
>=20
> openjdk-8-native requires Java7 or Java8 to build, which is provided by i=
cedtea7 or a previous build of
> openjdk-8-native (for reliability I let openjdk-8-native depend on icedte=
a7).
> openjdk-8 requires Java7 or Java8 to build (icedtea7-native or openjdk-8-=
native), for reliability I let
> openjdk-8 depend on openjdk-8-native.

I surely knew this, that's why I removed the symlink and PROVIDES, here is =
the comments in my fix:
    - Do not let openjdk-8-native provides jar, java and javac,
      just like what we do in icedtea7-native, which can provides
      but not to avoid circular dependencies and conflicts.

>=20
> Bootstrapping Java7 means, you have 3 javac and 3 javavm's in you native =
sysroot (jikes, ecj-initial,
> icedtea7), bootstrapping openjdk-8 adds openjdk-8-native.
>=20
> >> But doesn't icedtea7-native provide virtual/java-native and virtual/ja=
vac-native?
> >> Doesn't openjdk-8-native provide virtual/java-native and virtual/javac=
-native?
> >>
> >> When virtual/java-native is only for bootstrapping, that it's misused =
and
> >> must be removed. Providers are for abstraction, not for confusing.
> >
> > I think you mean that there are two java: one for bootstrapping and ano=
ther is normal java,
> > So maybe you need something like virtual/java-bootstrap-native and virt=
ual/java-native to
> > avoid confusing.
> > For now, the followings can provide java:
> > cacao-native, jamvm-native, icedtea7-native, openjdk8-native
> >
> > which ones are for bootstrapping only?
>=20
> Depends what you want to bootstrap ;)
> That's why the virtual/java*-native is such annoying.

I don't think it's annoying. It depends how you define it, just like I said=
, you can clearly define
something like virtual/java-bootstrap-native and others to avoid confusing.

>=20
> >>
> >>> FYI:
> >>> http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user=
-manual.html#bb-
> >> bitbake-preferences
> >>> http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-P=
REFERRED_PROVIDER
> >>>
> >>>>
> >>>> It is insane to have multiple providers for the same virtual/foo whe=
n at least a bunch
> >>>
> >>> Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to handle=
 multiple providers,
> >>> (another one is update-alternatives which is not supported by -native=
 recipe), and work fine
> >>> in many projects, why is it insane here?
> >>
> >> Insane is, that you cannot choose - you have to install all until you =
reach the required
> >> Java language level.
> >
> > Again, I may misunderstand, I don't know why I have to install all (pro=
viders?)?
> >
> >>
> >>> I tested my patches to build openjdk7, openjdk8 and most recipes in m=
eta-java with and without
> >> sstate
> >>> on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all bui=
lt fine (previous
> method
> >>> fails to build openjdk7 sometime and always fail when build with ssta=
te)
> >>
> >> That has nothing to do with the providers, it has to do with the wrong=
 install of same
> >> binary to a place where another one has been installed. This has to do=
 with alternatives,
> >
> > I agree that the alternatives may be a better solution than providers, =
but the problem is the
> > update-alternative.bbclass doesn't support -native packages, please sen=
d patch to fix it if you
> > think it's needed.
>=20
> And provides is the wrong logic.

I don't think it's wrong, you just need a clearer definition.

> That's why 04d5d0bf4 eliminates that to reach a reliable
> bootstrap path.

But this introduced conflicts(along with the incorrect do_install of openjd=
k8-native) and it always
fail when build with sstate.

Thanks,
Jackie

>=20
> > Anyway, these patches have been merged and it works fine for now in our=
 project, no insane error
> > happens. Feel free to send your patch to fix the insane part you think,
>=20
> But you patch and the way you pushed it makes it impossible for me to sha=
re work based on that,
> since I don't go and revert your reverts to wait for the next moment you =
don't get it and override
> it again. As long as you stick on your idea, feel free to cherry-pick rec=
ipes I build on meta-java
> or cross-compiled java from my github repositories.
>=20
> > but please remember to do
> > enough tests to ensure it doesn't break others. Thanks!
>=20
> I tested as good as I could in my environment and asked for more than 4 w=
eeks people on ML to test.
> When you work on master, expect some breaking. No hurry insane revert nee=
ded.
>=20
> Best regards
> --
> Jens Rehsack - rehsack@gmail.com


