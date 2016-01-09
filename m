Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B47E973695
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jan 2016 14:22:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u09EMgD5013173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 9 Jan 2016 06:22:42 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.105]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Sat, 9 Jan 2016 06:22:41 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH 0/2] openjdk-8-native:	fix	do_install
	and PROVIDES
Thread-Index: AQHRSflvPu31SLBeT02PsKgmicCjB57xYHQw
Date: Sat, 9 Jan 2016 14:22:38 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA010C78A13B@ALA-MBA.corp.ad.wrs.com>
References: <cover.1450864063.git.jackie.huang@windriver.com>
	<0E1F3B26-55DA-44FC-BEC4-8AE2277A9D07@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C786816@ALA-MBA.corp.ad.wrs.com>
	<9C9059BF-A1B5-4E59-97F3-BF2C2CC028F2@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C7876F5@ALA-MBA.corp.ad.wrs.com>
	<9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
In-Reply-To: <9E3A8ABC-AAB1-4EA5-8F80-B1E2A1B161BE@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH 0/2] openjdk-8-native:	fix	do_install	and PROVIDES
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
X-List-Received-Date: Sat, 09 Jan 2016 14:22:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> Sent: Friday, January 08, 2016 5:46 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_install=
 and PROVIDES
>=20
>=20
> > Am 07.01.2016 um 04:00 schrieb Huang, Jie (Jackie) <Jackie.Huang@windri=
ver.com>:
> >
> >
> >
> >> -----Original Message-----
> >> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openem=
bedded-devel-
> >> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >> Sent: Wednesday, January 06, 2016 9:57 PM
> >> To: openembedded-devel@lists.openembedded.org
> >> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_inst=
all and PROVIDES
> >>
> >>
> >>> Am 06.01.2016 um 08:03 schrieb Huang, Jie (Jackie) <Jackie.Huang@wind=
river.com>:
> >>>
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: openembedded-devel-bounces@lists.openembedded.org [mailto:open=
embedded-
> devel-
> >>>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
> >>>> Sent: Tuesday, January 05, 2016 3:21 AM
> >>>> To: openembedded-devel@lists.openembedded.org
> >>>> Subject: Re: [oe] [meta-java][PATCH 0/2] openjdk-8-native: fix do_in=
stall and PROVIDES
> >>>>
> >>>> It's insane re-introducing a virtual/javac-native without understand=
ing
> >>>> the issues coming with that.
> >>>
> >>> Please carefully review the patches before saying insane, I don't thi=
nk it was
> >>> correct to remove virtual/javac-native since there are several provid=
ers.
> >>
> >> What does virtual/javac-native mean? Correctly, there can be several p=
roviders.
> >>
> >> How many of them can you have in one sysroot/build? One.
> >>
> >> So - when in an openjdk-7 or openjdk-8 bootstrap 4 recipes PROVIDE vir=
tual/javac-native,
> >> what happens?
> >
> > So seem like you don't really understand how it should be used.
> >
> > Yes, only one we can have when there are multiple providers, that's why=
 we should
> > use PREFERRED_PROVIDER to determines which one it is, and use the virtu=
al/foo
> > instead of specific provider's name in DEPENDS/RDEPENDS of the recipe t=
hat requires it,
> > so we can ensure only one will be built and avoid conflicts.
>=20
> And there starts your misunderstanding:

Ok, if so, sorry that my English is not good enough to understand your word=
s correctly.

>=20
> You can't even install multiple providers, even when picking one.

Picking one is to avoid installing multiple providers, why do we need to in=
stall
multiple providers? Seems likely I'm starting to misunderstand again?

> But doesn't icedtea7-native provide virtual/java-native and virtual/javac=
-native?
> Doesn't openjdk-8-native provide virtual/java-native and virtual/javac-na=
tive?
>=20
> When virtual/java-native is only for bootstrapping, that it's misused and
> must be removed. Providers are for abstraction, not for confusing.

I think you mean that there are two java: one for bootstrapping and another=
 is normal java,
So maybe you need something like virtual/java-bootstrap-native and virtual/=
java-native to
avoid confusing.
For now, the followings can provide java:
cacao-native, jamvm-native, icedtea7-native, openjdk8-native

which ones are for bootstrapping only?

>=20
> > FYI:
> > http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-m=
anual.html#bb-
> bitbake-preferences
> > http://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html#var-PRE=
FERRED_PROVIDER
> >
> >>
> >> It is insane to have multiple providers for the same virtual/foo when =
at least a bunch
> >
> > Virtual/foo and PREFERRED_PROVIDER is one of the mechanisms to handle m=
ultiple providers,
> > (another one is update-alternatives which is not supported by -native r=
ecipe), and work fine
> > in many projects, why is it insane here?
>=20
> Insane is, that you cannot choose - you have to install all until you rea=
ch the required
> Java language level.

Again, I may misunderstand, I don't know why I have to install all (provide=
rs?)?

>=20
> > I tested my patches to build openjdk7, openjdk8 and most recipes in met=
a-java with and without
> sstate
> > on qemux86-64, qemuarm, qemuppc and some of our BSPs and they all built=
 fine (previous method
> > fails to build openjdk7 sometime and always fail when build with sstate=
)
>=20
> That has nothing to do with the providers, it has to do with the wrong in=
stall of same
> binary to a place where another one has been installed. This has to do wi=
th alternatives,

I agree that the alternatives may be a better solution than providers, but =
the problem is the
update-alternative.bbclass doesn't support -native packages, please send pa=
tch to fix it if you
think it's needed.

Anyway, these patches have been merged and it works fine for now in our pro=
ject, no insane error
happens. Feel free to send your patch to fix the insane part you think, but=
 please remember to do
enough tests to ensure it doesn't break others. Thanks!

Thanks,
Jackie

> not providers.
>=20
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com


