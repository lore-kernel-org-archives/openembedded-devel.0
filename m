Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63C8D792DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 17:28:06 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id 93-v6so5415459qks.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=U7oVNYwwPCda1GjaO8t9iTUJgb1TqI9o+dV5QFYVYNk=;
	b=SX78jA5otW9SauS2D1IKmn0PHtbM+q2gFnF6AzwRtGq/yGOQSctPOnQy6+ChBgeJqv
	RO7J3QQlEINABkwb41GL+HNYDmfXWkMMIP/G1o5nvGbu3OCnbP4/Qif1yK5Qhb/VGozP
	LoOiTOp10RO6KdHvanFh0Mk/FS7VDqEJMYjVsqeWM3m5NBtymDUg09GkqL12deniqGfF
	HMYkMjpb0AkG1LXrjYDby0dmQjUBiR6U0J2bri0QKI8bKPIHmZaVY8Ng61YhyKU0VO1T
	s8FEL9poyxX3FuUGHceZlyEehDXzaXe0E0zNuxzkMiz3TqJxFC8r+oSYNIyfpzho786A
	X21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=U7oVNYwwPCda1GjaO8t9iTUJgb1TqI9o+dV5QFYVYNk=;
	b=j9hXBfYDTLRNkNLogAfE7N2n8CjDdn/ifz5tlgVVz3fj4aTBGiin1rz9+2NsH9tvwV
	iOSYfNub6+tpnYsm6GJScpBBkK5DJyomtjUz1Bjil63dMTxJQJJJBpuSRBY2CqgSAaTt
	a0ThxRelUEY3XiRYBuZ8yzqwhEK9jxKfXU97s347Bb8NfkKNMcKhVIrR8DO1mMr1uYps
	eA6bklFpluE6U+C7ZwGfzn1lI9RRvadcA2aJ1iPPbtpVKqR6vQUJwH/xSxq1SWivl0uq
	qY9RDXu8sfkSwsz16fgstdUnPsrd5oWLOjbzljlN1n7wf2RfisN9qbJNWYF6Fu1wMYwI
	iffw==
X-Gm-Message-State: AOUpUlEeyOBG/msSc29jq96MyK2bYnbkQwdpTf68cXykVIgZdjZeSrcP
	udAEOMsHbx/sqWU9is5QThrJDb5hYLqmqCcZMfA=
X-Google-Smtp-Source: AA+uWPw82EpmmX7QOCBWS2IyfJ2SafzaScKEJGfZiyLMATVqmBnZLVXXWSzpzkxssIlO4nA0rzmtkdRF37jfkgmw254=
X-Received: by 2002:a37:8f41:: with SMTP id
	r62-v6mr33175468qkd.412.1534526886854; 
	Fri, 17 Aug 2018 10:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180816024200.6394-1-joe_macdonald@mentor.com>
	<CAPr_pvtpVGhG-9N3miYOG9ZWhY=LzQWmp4Ewmj9RXh8s-_59Wg@mail.gmail.com>
	<20180816161901.GB9441@mentor.com>
	<CAPr_pvvoqkqNsZ+-eSBMa11_GKJPdPCPZjnOug=81W+vV7gLRA@mail.gmail.com>
	<20180816194526.GC13296@mentor.com>
	<CAPr_pvtGjZyVrKR7Ex8U7eSYHApncXDq2p_9HAoS+0EcEE7NKg@mail.gmail.com>
	<20180817013133.GA19232@mentor.com>
	<CAPr_pvtB4YdzajOEnEPCmbsA5EX2rR2e6-p5V7hf8DA4+FNTHg@mail.gmail.com>
	<20180817133936.GA12454@mentor.com>
	<CAPr_pvvTYbHdTamQSBzyWAG-QPypQsTR4sk23JtVzNktno1MTw@mail.gmail.com>
In-Reply-To: <CAPr_pvvTYbHdTamQSBzyWAG-QPypQsTR4sk23JtVzNktno1MTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Aug 2018 10:27:40 -0700
Message-ID: <CAMKF1soje3ik+v5rx3=hTSuW0KF=wv4J9EGXJ1bmt4EYTwdgFw@mail.gmail.com>
To: Stefan BOSAK <stefan.bosak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] bird: initial import
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
X-List-Received-Date: Fri, 17 Aug 2018 17:28:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 7:21 AM Stefan BOSAK <stefan.bosak@gmail.com> wrote=
:
>
>
>
> On Fri, Aug 17, 2018 at 3:39 PM Joe MacDonald <Joe_MacDonald@mentor.com> =
wrote:
>>
>> [Re: [meta-networking][PATCH] bird: initial import] On 18.08.17 (Fri 07:=
51) Stefan BOSAK wrote:
>>
>> > Hi Joe and Khem,
>> >
>> > @Joe
>> > I am writting within your message.
>> >
>> > @Khem Raj
>> > In the term of Bird versions:
>> > - both versions are mutually not compatible (config transitions/transf=
ormations
>> > are required), that's correct
>> > - 1.6.x is production ready (officially supported by many distribution=
s, it is
>> > kind of LTS, would be/stay maintainable for several next years)
>> > - 2.0.x would go to production ready mode later (still not supported, =
sadly i
>> > do not know about any distribution which is supporting this version)
>> >
>> > My suggestion is to import at least version 1.6.x into official reposi=
tory
>> > within Yocto ecosystem.
>>
>> This wouldn't be the first time we've encountered this scenario and
>> while it's not ideal, I don't see it as a show stopper either.  I'd had
>> it in mind that I'd start with integrating your recipe then move out the
>> 2.0.x version in favour of a git version so we can more easily track
>> updates (so ultimately it'll look more like the refpolicy recipes in
>> meta-selinux) but this seems like an okay first step.  That said,
>> there's possibly more to it than just that, in my comments below.
>
> We could hold importing of Bird version 2.0.2 for now,
> because this is not release with official support/maintainence from proje=
ct owners,
> even I do not know about any distribution which has integrated it.

it seems we should only keep 1.6.x for now. if 2.0.2 is being tested active=
ly
then we can keep that too with D_P set to be -1
>>
>>
>> > On Fri, Aug 17, 2018 at 3:31 AM Joe MacDonald <Joe_MacDonald@mentor.co=
m> wrote:
>> >
>> >     Hi Stefan,
>> >
>> >     Based on the information you've share here, then, I have some addi=
tional
>> >     questions about this, because I'm now not confident I can correlat=
e what
>> >     you've said with what I'm seeing.
>> >
>> >     [Re: [meta-networking][PATCH] bird: initial import] On 18.08.16 (T=
hu 22:56)
>> >     Stefan BOSAK wrote:
>> >
>> >     > this ipv6 compilation option is still relevant for versions
>> >     > 1.6.x (this is production ready line).
>> >
>> >     This much makes sense.  So the obvious approach, then, would be to
>> >     add --enable-ipv6 to the 1.6.4 recipe's EXTRA_OECONF options and l=
eave
>> >     --enable-pthreads in the bird.inc file.
>> >
>> > Exactly, option --enable-ipv6 is specific to versions 1.6.x, it means
>> > EXTRA_OECONF should have additional extension within recipe only for v=
ersion
>> > 1.6.x.
>> >
>> >
>> >     When I do, though, the result is not what I would expect based on =
what
>> >     you're saying below.
>> >
>> >     First, the output of each of these are:
>> >
>> >        bird-2.0.2-r0.core2_64
>> >        =E2=94=9C=E2=94=80=E2=94=80 etc
>> >        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird.conf
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>> >        =E2=94=9C=E2=94=80=E2=94=80 usr
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl
>> >        =E2=94=94=E2=94=80=E2=94=80 var
>> >
>> > This seems to be not correct, because {bird, birdc}6 are missing.
>> > There are implementation reasons why authors isolated IPv4 and IPv6
>> > through dedicated applications/binaries.
>> >
>> > See these files (there are no major differences between versions):
>> > https://gitlab.labs.nic.cz/labs/bird/blob/v2.0.2/misc/bird.init
>> > https://gitlab.labs.nic.cz/labs/bird/blob/v1.6.4/misc/bird.init
>>
>> Alright, so based on this I think the recipes need some amount of rework
>> beyond just the style things Khem requested.  At a minimum, I'm going to
>> replace the bird.init in your original submission with the ones linked
>> above and I'll review what's happening with the v6 binaries, because it
>> very much looks like they're not being built in the 2.0.2 recipe.
>
> Would be sufficient to import only Bird version 1.6.x for now, as startin=
g threshold/checkpoint.
>>
>>
>> >     and
>> >
>> >        bird-1.6.4-r0.core2_64
>> >        =E2=94=9C=E2=94=80=E2=94=80 etc
>> >        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird6.conf
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>> >        =E2=94=9C=E2=94=80=E2=94=80 usr
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird6
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc6
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl6
>> >        =E2=94=94=E2=94=80=E2=94=80 var
>> >
>> >     and if I remove the --enable-ipv6 option from the 1.6.4 recipe I s=
ee:
>> >
>> >        bird-1.6.4-r0.core2_64
>> >        =E2=94=9C=E2=94=80=E2=94=80 etc
>> >        =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bird.conf
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 init.d
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 bird
>> >        =E2=94=9C=E2=94=80=E2=94=80 usr
>> >        =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sbin
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 bird
>> >        =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 birdc
>> >        =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 birdcl
>> >        =E2=94=94=E2=94=80=E2=94=80 var
>> >
>> >
>> > In this case without setting of --enable-ipv6 compilation option only =
IPv4
>> > protocol will be supported which is not sufficient.
>> >
>> >     > There is also one reminder from my side that there are to be sev=
eral
>> >     > applications and two independent
>> >     > init scripts needed at least for versions 1.6.x (the same should=
 be for
>> >     2.0.x):
>> >     > /usr/sbin/{bird,birdc}, /usr/sbin/{birdc,birdc6}; /etc/init.d/{b=
ird,
>> >     bird6}.
>> >
>> >     So then it almost looks like the --enable-ipv6 option for the 1.6.=
4
>> >     recipe will only build one of the two versions at a time whereas (=
maybe)
>> >     the single binary (client or daemon) will provide both ipv4 and v6
>> >     functionality.  Can you help we understand what's happening here? =
 Do we
>> >     potentially need two different recipes for each of the v4 and v6
>> >     versions of the 1.6.4 recipe?
>> >
>> > Dedicated binaries for both protocols (IPv4 & IPv6) are required/neede=
d to
>> > cover dual-stack mode (as I wrote there are implementation reasons for=
 this).
>> > Potentially we can have a look (get inspirations) on how debian is app=
roaching/
>> > covering this packaging (https://salsa.debian.org/debian/bird), could =
help us
>> > more and seems to be sufficient, or contact project maintainers to cle=
arly
>> > clarify this.
>>
>> Well, a quick look at
>> https://salsa.debian.org/debian/bird/blob/master/debian/rules seems to
>> provide the answer for, at least, the 1.6.4 case:
>>
>>  36 override_dh_auto_configure:
>>  37     CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" dh_auto_configure -B=
build-ipv4 -- $(COMMON_FLAGS) --disable-ipv6 --with-protocols=3Dall
>>  38     CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" dh_auto_configure -B=
build-ipv6 -- $(COMMON_FLAGS) --enable-ipv6 --with-protocols=3Dall
>>  39
>>  40 override_dh_auto_build:
>>  41     dh_auto_build -Bbuild-ipv4
>>  42     dh_auto_build -Bbuild-ipv6
>>
>> Looks to me like there are two specific configurations and builds done
>> for the v4 and v6 options.  So that'll inform my approach on the 1.6.4
>> recipe.  The 2.0.2 spec from below shows something very similar:
>>
>>  22 %build
>>  23 ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/v=
ar --enable-ipv6
>>  24 make
>>  25 mv bird bird6
>>  26 make clean
>>  27 ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/v=
ar
>>  28 make
>>
>> except, as I'd noted earlier, --enable-ipv6 isn't a valid configure
>> option for 2.0.2, so I'll take a quick look deeper into this and decide
>> on what do to with it.  I would be inclined to keep the 2.0.2 recipe
>> even if it is ipv4 only, but if you think v6 support is essential and it
>> isn't possible to make it functional in the current upstream source, I
>> suggest we keep only the 1.6.4 recipe.  What do you think?
>
> Exactly, as we already discussed there are changes between Bird versions =
1.6.x vs 2.0.x
> espetially in the term of dual-stack mode support during configuration/co=
mpilation phases,
> newer one is not supporting external configuration option anymore.
> My suggestion (friendly wish) would be to import Bird version 1.6.x
> (it is important to support dual-stack mode by default in final package)
> into official networking layer.
>>
>>
>> -J.
>>
>> > Based on my understanding of how Yocto recipes works, there are two
>> > possibilities to achieve the same results/goal:
>> > 1) more advanced approach using only one recipe
>> > Only one recipe for both cases will be needed, but i assume that two s=
eparated
>> > iterations has to be performed within configuration/compilation recipe=
 phase
>> > and one packaging/installation has to be proceeded. This means additio=
nal
>> > complexity within given recipe, but only one package has to be install=
ed by
>> > user.
>> > 2) simpler approach using two recipes
>> > Two recipes will be needed to cover related scope for simplification o=
f
>> > configuration/compilation phases within recipe workflows,
>> > but every time when needed user has to take care about installing of t=
wo
>> > packages.
>> >
>> > See these files for details (there are no major differences between ve=
rsions):
>> > https://gitlab.labs.nic.cz/labs/bird/blob/v2.0.2/misc/bird.spec
>> > https://gitlab.labs.nic.cz/labs/bird/blob/v1.6.4/misc/bird.spec
>> >
>> > Let me know what could i do to help you if needed, I would try to do m=
y best.
>> > I belive that at the end we would be able to add really useful recipe =
into
>> > Yocto ecosystem which help the community to build/prepare
>> > optimized, highly available solutions using one of the well configurab=
le,
>> > reasonable reliable and high performance BGP tool available worldwide.
>> >
>> > Thank you for your support including all effort behind.
>> >
>> > Have a nice day.
>> >
>> >
>> >
>> >     Thanks,
>> >     -Joe.
>> >
>> >     > As I wrote in my first message I am not Yocto recipe expert (sti=
ll in
>> >     kind of
>> >     > learning phase), potentially some additional alignment would be =
needed.
>> >     > Bird is one of the best BGP daemon available worldwide and would=
 be
>> >     really
>> >     > great to have this tool within native Yocto ecosystem.
>> >     > Again let me say thank you to all contributors and supporters in=
 this
>> >     scope.
>> >     >
>> >     > Have a nice day.
>> >     >
>> >     > Ing. Stefan Bosak
>> >     >
>> >     > M +421 948 852 092
>> >     > E stefan.bosak@gmail.com
>> >     >
>> >     >
>> >     > On Thu, Aug 16, 2018 at 9:45 PM Joe MacDonald <Joe_MacDonald@men=
tor.com>
>> >     wrote:
>> >     >
>> >     >     Hi Stefan,
>> >     >
>> >     >     [Re: [meta-networking][PATCH] bird: initial import] On 18.08=
.16 (Thu
>> >     19:59)
>> >     >     Stefan BOSAK wrote:
>> >     >
>> >     >     > Hi Joe and other contributors/supporters,
>> >     >     >
>> >     >     > i got through changes prepared by Joe, one important confi=
guration
>> >     >     attribute is
>> >     >     > missing (--enable-ipv6):
>> >     >     > meta-networking/recipes-protocols/bird/bird.inc:
>> >     >     > EXTRA_OECONF  +=3D "\
>> >     >     > --enable-pthreads \
>> >     >     > --enable-ipv6 \
>> >     >     > "
>> >     >     > May I kindly ask you to add above mentioned within changes=
 coming
>> >     into
>> >     >     official
>> >     >     > branches please ?
>> >     >
>> >     >     I had a quick look at the configure options for bird 2.0.2 a=
nd I
>> >     don't
>> >     >     see --enable-ipv6 listed:
>> >     >
>> >     >        /build/jjm/misc/buildx $ ../bird-2.0.2/configure --enable=
-ipv6
>> >     >        configure: WARNING: unrecognized options: --enable-ipv6
>> >     >
>> >     >     It looks like it might have been removed last December maybe=
 from the
>> >     >     changelog:
>> >     >
>> >     >        commit b5257bea853850809be7f03eb0e1dbb398c56c34
>> >     >        Author: Ondrej Filip <feela@network.cz>
>> >     >        Date:   Tue Dec 12 10:43:56 2017 +0100
>> >     >
>> >     >            Removed '--enable-ipv6' reference.
>> >     >
>> >     >
>> >     >     Are you sure it's still required?
>> >     >
>> >     >     -J.
>> >     >
>> >     >     >
>> >     >     > Huge thank you for the support to all of you.
>> >     >     >
>> >     >     > Have a nice day.
>> >     >     >
>> >     >     > Ing. Stefan Bosak
>> >     >     >
>> >     >     > M +421 948 852 092
>> >     >     > E stefan.bosak@gmail.com
>> >     >     >
>> >     >     >
>> >     >     > On Thu, Aug 16, 2018 at 6:19 PM Joe MacDonald <
>> >     Joe_MacDonald@mentor.com>
>> >     >     wrote:
>> >     >     >
>> >     >     >     [Re: [meta-networking][PATCH] bird: initial import] On=
 18.08.16
>> >     (Thu
>> >     >     07:06)
>> >     >     >     Stefan BOSAK wrote:
>> >     >     >
>> >     >     >     > Hi Joe and other contributors,
>> >     >     >     >
>> >     >     >     > thank you very much for your kind support in the ter=
m of
>> >     adding of
>> >     >     >     > bird (BGP daemon) recipe into meta-networking layer.
>> >     >     >     > I would like to ask you about expected merge/commit =
time line
>> >     into
>> >     >     >     > official branch(es).
>> >     >     >
>> >     >     >     Generally something like this won't take long to make =
it into
>> >     the
>> >     >     master
>> >     >     >     branch.  Already released branches are rarely (as a ru=
le never,
>> >     I
>> >     >     would
>> >     >     >     say) updated with new content.
>> >     >     >
>> >     >     >     -J.
>> >     >     >
>> >     >     >     >
>> >     >     >     > Thanks.
>> >     >     >     >
>> >     >     >     > Have a nice day.
>> >     >     >     >
>> >     >     >     > Ing. Stefan Bosak
>> >     >     >     >
>> >     >     >     > M +421 948 852 092
>> >     >     >     > E stefan.bosak@gmail.com
>> >     >     >     >
>> >     >     >     >
>> >     >     >     > On Thu, Aug 16, 2018 at 4:42 AM Joe MacDonald <
>> >     >     joe_macdonald@mentor.com>
>> >     >     >     wrote:
>> >     >     >     >
>> >     >     >     >     Initial integration of the two stable BIRD relea=
ses,
>> >     1.6.4 and
>> >     >     2.0.2.
>> >     >     >     >
>> >     >     >     >     Signed-off-by: Joe MacDonald <joe_macdonald@ment=
or.com>
>> >     >     >     >     ---
>> >     >     >     >
>> >     >     >     >     This set of recipes came my way quite a while ba=
ck from
>> >     Stefan
>> >     >     >     Bosak.  I've
>> >     >     >     >     updated the recipes a bit, made them compile wit=
h MUSL
>> >     and
>> >     >     verified
>> >     >     >     basic
>> >     >     >     >     functionality on x86_64 and qemuarm.
>> >     >     >     >
>> >     >     >     >      .../recipes-protocols/bird/bird.inc           |=
   32 +
>> >     >     >     >      .../recipes-protocols/bird/bird_1.6.4.bb      |=
    9 +
>> >     >     >     >      .../recipes-protocols/bird/bird_2.0.2.bb      |=
    9 +
>> >     >     >     >      ...-extend-config.sub-to-recognize-musl.patch |=
 4428
>> >     >     >     +++++++++++++++++
>> >     >     >     >      .../recipes-protocols/bird/files/bird.init    |=
    2 +
>> >     >     >     >      5 files changed, 4480 insertions(+)
>> >     >     >     >      create mode 100644 meta-networking/recipes-prot=
ocols/
>> >     bird/
>> >     >     bird.inc
>> >     >     >     >      create mode 100644 meta-networking/recipes-prot=
ocols/
>> >     bird/
>> >     >     >     bird_1.6.4.bb
>> >     >     >     >      create mode 100644 meta-networking/recipes-prot=
ocols/
>> >     bird/
>> >     >     >     bird_2.0.2.bb
>> >     >     >     >      create mode 100644 meta-networking/recipes-prot=
ocols/
>> >     bird/
>> >     >     files/
>> >     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.pa=
tch
>> >     >     >     >      create mode 100755 meta-networking/recipes-prot=
ocols/
>> >     bird/
>> >     >     files/
>> >     >     >     bird.init
>> >     >     >     >
>> >     >     >     >     diff --git a/meta-networking/recipes-protocols/b=
ird/
>> >     bird.inc b/
>> >     >     >     >     meta-networking/recipes-protocols/bird/bird.inc
>> >     >     >     >     new file mode 100644
>> >     >     >     >     index 000000000..33d17dcb7
>> >     >     >     >     --- /dev/null
>> >     >     >     >     +++ b/meta-networking/recipes-protocols/bird/bir=
d.inc
>> >     >     >     >     @@ -0,0 +1,32 @@
>> >     >     >     >     +SUMMARY =3D "BIRD Internet Routing Daemon"
>> >     >     >     >     +DESCRIPTION =3D "\
>> >     >     >     >     +BIRD is dynamic routing daemon supporting IPv4 =
and IPv6
>> >     >     versions of
>> >     >     >     >     routing \
>> >     >     >     >     +protocols BGP, RIP and OSPF."
>> >     >     >     >     +HOMEPAGE =3D "http://bird.network.cz"
>> >     >     >     >     +SECTION =3D "console/network"
>> >     >     >     >     +LICENSE =3D "GPLv2"
>> >     >     >     >     +LIC_FILES_CHKSUM =3D "file://README;beginline=
=3D87;endline=3D
>> >     103;md5
>> >     >     =3D
>> >     >     >     >     0efecc23f039022580d0bac9a52f6117"
>> >     >     >     >     +DEPENDS =3D "flex bison ncurses readline"
>> >     >     >     >     +
>> >     >     >     >     +inherit autotools
>> >     >     >     >     +
>> >     >     >     >     +EXTRA_OECONF  +=3D "\
>> >     >     >     >     +--enable-pthreads \
>> >     >     >     >     +"
>> >     >     >     >     +
>> >     >     >     >     +do_configure() {
>> >     >     >     >     +    oe_runconf ${EXTRA_OECONF}
>> >     >     >     >     +}
>> >     >     >     >     +
>> >     >     >     >     +do_install_append() {
>> >     >     >     >     +    install -m 0755 -d ${D}${sysconfdir}/init.d
>> >     >     >     >     +    install -m 0755 ${WORKDIR}/bird.init ${D}$
>> >     {sysconfdir}/
>> >     >     init.d/
>> >     >     >     bird
>> >     >     >     >     +    rm -rf ${D}/run ${D}/var/run
>> >     >     >     >     +}
>> >     >     >     >     +
>> >     >     >     >     +PACKAGES +=3D " bird-client"
>> >     >     >     >     +
>> >     >     >     >     +FILES_${PN} +=3D "/run /var/run"
>> >     >     >     >     +FILES_${PN}-client =3D "/usr/sbin/birdc*"
>> >     >     >     >     +
>> >     >     >     >     +RUNIT_SERVICES =3D "bird"
>> >     >     >     >     diff --git a/meta-networking/recipes-protocols/b=
ird/
>> >     >     bird_1.6.4.bb b/
>> >     >     >     >     meta-networking/recipes-protocols/bird/bird_1.6.=
4.bb
>> >     >     >     >     new file mode 100644
>> >     >     >     >     index 000000000..27c62aeee
>> >     >     >     >     --- /dev/null
>> >     >     >     >     +++ b/meta-networking/recipes-protocols/bird/
>> >     bird_1.6.4.bb
>> >     >     >     >     @@ -0,0 +1,9 @@
>> >     >     >     >     +require bird.inc
>> >     >     >     >     +
>> >     >     >     >     +SRC_URI =3D "\
>> >     >     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}=
.tar.gz \
>> >     >     >     >     +    file://bird.init \
>> >     >     >     >     +    file://
>> >     0001-musl-extend-config.sub-to-recognize-musl.patch
>> >     >     \
>> >     >     >     >     +    "
>> >     >     >     >     +SRC_URI[md5sum] =3D "d62ec2547338e8d3dfb934b4c7=
b2faa4"
>> >     >     >     >     +SRC_URI[sha256sum] =3D
>> >     >     >     >
>> >     >      "c26b8caae988dba81a9dbbee93502463d4326d1b749d728d62aa5529c6=
05afc0"
>> >     >     >     >     diff --git a/meta-networking/recipes-protocols/b=
ird/
>> >     >     bird_2.0.2.bb b/
>> >     >     >     >     meta-networking/recipes-protocols/bird/bird_2.0.=
2.bb
>> >     >     >     >     new file mode 100644
>> >     >     >     >     index 000000000..92d858869
>> >     >     >     >     --- /dev/null
>> >     >     >     >     +++ b/meta-networking/recipes-protocols/bird/
>> >     bird_2.0.2.bb
>> >     >     >     >     @@ -0,0 +1,9 @@
>> >     >     >     >     +require bird.inc
>> >     >     >     >     +
>> >     >     >     >     +SRC_URI =3D "\
>> >     >     >     >     +    ftp://bird.network.cz/pub/${PN}/${PN}-${PV}=
.tar.gz \
>> >     >     >     >     +    file://bird.init \
>> >     >     >     >     +    file://
>> >     0001-musl-extend-config.sub-to-recognize-musl.patch
>> >     >     \
>> >     >     >     >     +    "
>> >     >     >     >     +SRC_URI[md5sum] =3D "de17645b045fa13912409aea59=
420132"
>> >     >     >     >     +SRC_URI[sha256sum] =3D
>> >     >     >     >
>> >     >      "035f91d6f568f8ed438a0814235ac4c5c79147cd2acf201322c3077328=
83480f"
>> >     >     >     >     diff --git a/meta-networking/recipes-protocols/b=
ird/files
>> >     /
>> >     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.pa=
tch b/
>> >     >     meta-networking
>> >     >     >     /
>> >     >     >     >     recipes-protocols/bird/files/
>> >     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.pa=
tch
>> >     >     >     >     new file mode 100644
>> >     >     >     >     index 000000000..4feb7f786
>> >     >     >     >     --- /dev/null
>> >     >     >     >     +++ b/meta-networking/recipes-protocols/bird/fil=
es/
>> >     >     >     >     0001-musl-extend-config.sub-to-recognize-musl.pa=
tch
>> >     >     >     >     @@ -0,0 +1,4428 @@
>> >     >     >     >     +From 21baaa6870edb68f0a417ea3b4de5c75e5cf5a0d M=
on Sep 17
>> >     >     00:00:00
>> >     >     >     2001
>> >     >     >     >     +From: Joe MacDonald <joe_macdonald@mentor.com>
>> >     >     >     >     +Date: Thu, 16 Aug 2018 01:56:05 +0000
>> >     >     >     >     +Subject: [PATCH] musl: update config.guess and
>> >     config.sub
>> >     >     >     >     +
>> >     >     >     >     +Just bringing config.guess and config.sub up to=
 date is
>> >     enough
>> >     >     to
>> >     >     >     enable
>> >     >     >     >     +musl to build BIRD.
>> >     >     >     >     +
>> >     >     >     >     +Signed-off-by: Joe MacDonald <joe_macdonald@men=
tor.com>
>> >     >     >     >     +---
>> >     >     >     >     + tools/config.guess | 1193 ++++++++++++++------=
---------
>> >     >     >     >     + tools/config.sub   | 1810
>> >     >     >     +++++++++++++++++++++++---------------------
>> >     >     >     >     + 2 files changed, 1520 insertions(+), 1483 dele=
tions(-)
>> >     >     >     >     +
>> >     >     >     >     +diff --git a/tools/config.guess b/tools/config.=
guess
>> >     >     >     >     +index da83314..445c406 100755
>> >     >     >     >     +--- a/tools/config.guess
>> >     >     >     >     ++++ b/tools/config.guess
>> >     >     >     >     +@@ -1,14 +1,12 @@
>> >     >     >     >     + #! /bin/sh
>> >     >     >     >     + # Attempt to guess a canonical system name.
>> >     >     >     >     +-#   Copyright (C) 1992, 1993, 1994, 1995, 1996=
, 1997,
>> >     1998,
>> >     >     1999,
>> >     >     >     >     +-#   2000, 2001, 2002, 2003, 2004, 2005, 2006, =
2007,
>> >     2008
>> >     >     >     >     +-#   Free Software Foundation, Inc.
>> >     >     >     >     ++#   Copyright 1992-2018 Free Software Foundati=
on, Inc.
>> >     >     >     >     +
>> >     >     >     >     +-timestamp=3D'2009-04-27'
>> >     >     >     >     ++timestamp=3D'2018-06-26'
>> >     >     >     >     +
>> >     >     >     >     + # This file is free software; you can redistri=
bute it
>> >     and/or
>> >     >     modify
>> >     >     >     it
>> >     >     >     >     + # under the terms of the GNU General Public Li=
cense as
>> >     >     published by
>> >     >     >     >     +-# the Free Software Foundation; either version=
 2 of the
>> >     >     License, or
>> >     >     >     >     ++# the Free Software Foundation; either version=
 3 of the
>> >     >     License, or
>> >     >     >     >     + # (at your option) any later version.
>> >     >     >     >     + #
>> >     >     >     >     + # This program is distributed in the hope that=
 it will
>> >     be
>> >     >     useful,
>> >     >     >     but
>> >     >     >     >     +@@ -17,26 +15,22 @@ timestamp=3D'2009-04-27'
>> >     >     >     >     + # General Public License for more details.
>> >     >     >     >     + #
>> >     >     >     >     + # You should have received a copy of the GNU G=
eneral
>> >     Public
>> >     >     License
>> >     >     >     >     +-# along with this program; if not, write to th=
e Free
>> >     Software
>> >     >     >     >     +-# Foundation, Inc., 51 Franklin Street - Fifth=
 Floor,
>> >     Boston,
>> >     >     MA
>> >     >     >     >     +-# 02110-1301, USA.
>> >     >     >     >     ++# along with this program; if not, see <https:=
//
>> >     www.gnu.org/
>> >     >     >     licenses/>.
>> >     >     >     >     + #
>> >     >     >     >     + # As a special exception to the GNU General Pu=
blic
>> >     License,
>> >     >     if you
>> >     >     >     >     + # distribute this file as part of a program th=
at
>> >     contains a
>> >     >     >     >     + # configuration script generated by Autoconf, =
you may
>> >     include
>> >     >     it
>> >     >     >     under
>> >     >     >     >     +-# the same distribution terms that you use for=
 the rest
>> >     of
>> >     >     that
>> >     >     >     program.
>> >     >     >     >     +-
>> >     >     >     >     +-
>> >     >     >     >     +-# Originally written by Per Bothner <per@bothn=
er.com>.
>> >     >     >     >     +-# Please send patches to <config-patches@gnu.o=
rg>.
>> >     Submit a
>> >     >     >     context
>> >     >     >     >     +-# diff and a properly formatted ChangeLog entr=
y.
>> >     >     >     >     ++# the same distribution terms that you use for=
 the rest
>> >     of
>> >     >     that
>> >     >     >     >     ++# program.  This Exception is an additional pe=
rmission
>> >     under
>> >     >     >     section 7
>> >     >     >     >     ++# of the GNU General Public License, version 3
>> >     ("GPLv3").
>> >     >     >     >     + #
>> >     >     >     >     +-# This script attempts to guess a canonical sy=
stem name
>> >     >     similar to
>> >     >     >     >     +-# config.sub.  If it succeeds, it prints the s=
ystem
>> >     name on
>> >     >     stdout,
>> >     >     >     and
>> >     >     >     >     +-# exits with 0.  Otherwise, it exits with 1.
>> >     >     >     >     ++# Originally written by Per Bothner; maintaine=
d since
>> >     2000 by
>> >     >     Ben
>> >     >     >     >     Elliston.
>> >     >     >     >     + #
>> >     >     >     >     +-# The plan is that this can be called by confi=
gure
>> >     scripts if
>> >     >     you
>> >     >     >     >     +-# don't specify an explicit build system type.
>> >     >     >     >     ++# You can get the latest version of this scrip=
t from:
>> >     >     >     >     ++# https://git.savannah.gnu.org/gitweb/?p=3Dcon=
fig.git;a=3D
>> >     >     blob_plain;f=3D
>> >     >     >     >     config.guess
>> >     >     >     >     ++#
>> >     >     >     >     ++# Please send patches to <config-patches@gnu.o=
rg>.
>> >     >     >     >     ++
>> >     >     >     >     +
>> >     >     >     >     + me=3D`echo "$0" | sed -e 's,.*/,,'`
>> >     >     >     >     +
>> >     >     >     >     +@@ -45,7 +39,7 @@ Usage: $0 [OPTION]
>> >     >     >     >     +
>> >     >     >     >     + Output the configuration name of the system \`=
$me' is
>> >     run on.
>> >     >     >     >     +
>> >     >     >     >     +-Operation modes:
>> >     >     >     >     ++Options:
>> >     >     >     >     +   -h, --help         print this help, then exi=
t
>> >     >     >     >     +   -t, --time-stamp   print date of last modifi=
cation,
>> >     then
>> >     >     exit
>> >     >     >     >     +   -v, --version      print version number, the=
n exit
>> >     >     >     >     +@@ -56,8 +50,7 @@ version=3D"\
>> >     >     >     >     + GNU config.guess ($timestamp)
>> >     >     >     >     +
>> >     >     >     >     + Originally written by Per Bothner.
>> >     >     >     >     +-Copyright (C) 1992, 1993, 1994, 1995, 1996, 19=
97, 1998,
>> >     1999,
>> >     >     2000,
>> >     >     >     2001,
>> >     >     >     >     +-2002, 2003, 2004, 2005, 2006, 2007, 2008 Free =
Software
>> >     >     Foundation,
>> >     >     >     Inc.
>> >     >     >     >     ++Copyright 1992-2018 Free Software Foundation, =
Inc.
>> >     >     >     >     +
>> >     >     >     >     + This is free software; see the source for copy=
ing
>> >     conditions.
>> >     >     >     There is
>> >     >     >     >     NO
>> >     >     >     >     + warranty; not even for MERCHANTABILITY or FITN=
ESS FOR A
>> >     >     PARTICULAR
>> >     >     >     >     PURPOSE."
>> >     >     >     >     +@@ -113,10 +106,10 @@ trap "rm -f \$tmpfiles 2>=
/dev/
>> >     null;
>> >     >     rmdir \
>> >     >     >     $tmp 2>/
>> >     >     >     >     dev/null; exit 1" 1 2 13 15 ;
>> >     >     >     >     +  { echo "$me: cannot create a temporary direct=
ory in
>> >     $TMPDIR"
>> >     >     >&2 ;
>> >     >     >     exit
>> >     >     >     >     1 ; } ;
>> >     >     >     >     + dummy=3D$tmp/dummy ;
>> >     >     >     >     + tmpfiles=3D"$dummy.c $dummy.o $dummy.rel $dumm=
y" ;
>> >     >     >     >     +-case $CC_FOR_BUILD,$HOST_CC,$CC in
>> >     >     >     >     +- ,,)    echo "int x;" > $dummy.c ;
>> >     >     >     >     ++case ${CC_FOR_BUILD-},${HOST_CC-},${CC-} in
>> >     >     >     >     ++ ,,)    echo "int x;" > "$dummy.c" ;
>> >     >     >     >     +       for c in cc gcc c89 c99 ; do
>> >     >     >     >     +-        if ($c -c -o $dummy.o $dummy.c) >/dev/=
null 2>&1
>> >     ;
>> >     >     then
>> >     >     >     >     ++        if ($c -c -o "$dummy.o" "$dummy.c") >/=
dev/null
>> >     2>&1 ;
>> >     >     then
>> >     >     >     >     +            CC_FOR_BUILD=3D"$c"; break ;
>> >     >     >     >     +         fi ;
>> >     >     >     >     +       done ;
>> >     >     >     >     +@@ -139,12 +132,40 @@ UNAME_RELEASE=3D`(uname -=
r) 2>/dev/
>> >     null` |
>> >     >     |
>> >     >     >     >     UNAME_RELEASE=3Dunknown
>> >     >     >     >     + UNAME_SYSTEM=3D`(uname -s) 2>/dev/null`  || UN=
AME_SYSTEM=3D
>> >     >     unknown
>> >     >     >     >     + UNAME_VERSION=3D`(uname -v) 2>/dev/null` || UN=
AME_VERSION
>> >     =3D
>> >     >     unknown
>> >     >     >     >     +
>> >     >     >     >     ++case "$UNAME_SYSTEM" in
>> >     >     >     >     ++Linux|GNU|GNU/*)
>> >     >     >     >     ++      # If the system lacks a compiler, then j=
ust pick
>> >     glibc.
>> >     >     >     >     ++      # We could probably try harder.
>> >     >     >     >     ++      LIBC=3Dgnu
>> >     >     >     >     ++
>> >     >     >     >     ++      eval "$set_cc_for_build"
>> >     >     >     >     ++      cat <<-EOF > "$dummy.c"
>> >     >     >     >     ++      #include <features.h>
>> >     >     >     >     ++      #if defined(__UCLIBC__)
>> >     >     >     >     ++      LIBC=3Duclibc
>> >     >     >     >     ++      #elif defined(__dietlibc__)
>> >     >     >     >     ++      LIBC=3Ddietlibc
>> >     >     >     >     ++      #else
>> >     >     >     >     ++      LIBC=3Dgnu
>> >     >     >     >     ++      #endif
>> >     >     >     >     ++      EOF
>> >     >     >     >     ++      eval "`$CC_FOR_BUILD -E "$dummy.c" 2>/de=
v/null |
>> >     grep '
>> >     >     ^LIBC'
>> >     >     >     | sed
>> >     >     >     >     's, ,,g'`"
>> >     >     >     >     ++
>> >     >     >     >     ++      # If ldd exists, use it to detect musl l=
ibc.
>> >     >     >     >     ++      if command -v ldd >/dev/null && \
>> >     >     >     >     ++              ldd --version 2>&1 | grep -q ^mu=
sl
>> >     >     >     >     ++      then
>> >     >     >     >     ++          LIBC=3Dmusl
>> >     >     >     >     ++      fi
>> >     >     >     >     ++      ;;
>> >     >     >     >     ++esac
>> >     >     >     >     ++
>> >     >     >     >     + # Note: order is significant - the case branch=
es are
>> >     not
>> >     >     exclusive.
>> >     >     >     >     +
>> >     >     >     >     +-case "${UNAME_MACHINE}:${UNAME_SYSTEM}:$
>> >     {UNAME_RELEASE}:$
>> >     >     >     {UNAME_VERSION}"
>> >     >     >     >     in
>> >     >     >     >     ++case
>> >     >     "$UNAME_MACHINE:$UNAME_SYSTEM:$UNAME_RELEASE:$UNAME_VERSION"
>> >     >     >     in
>> >     >     >     >     +     *:NetBSD:*:*)
>> >     >     >     >     +       # NetBSD (nbsd) targets should (where ap=
plicable)
>> >     match
>> >     >     one
>> >     >     >     or
>> >     >     >     >     +-      # more of the tupples: *-*-netbsdelf*,
>> >     *-*-netbsdaout*,
>> >     >     >     >     ++      # more of the tuples: *-*-netbsdelf*,
>> >     *-*-netbsdaout*,
>> >     >     >     >     +       # *-*-netbsdecoff* and *-*-netbsd*.  For=
 targets
>> >     that
>> >     >     >     recently
>> >     >     >     >     +       # switched to ELF, *-*-netbsd* would sel=
ect the
>> >     old
>> >     >     >     >     +       # object file format.  This provides bot=
h forward
>> >     >     >     >     +@@ -154,23 +175,33 @@ case "${UNAME_MACHINE}:$
>> >     {UNAME_SYSTEM}:$
>> >     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>> >     >     >     >     +       # Note: NetBSD doesn't particularly care=
 about
>> >     the
>> >     >     vendor
>> >     >     >     >     +       # portion of the name.  We always set it=
 to
>> >     "unknown".
>> >     >     >     >     +       sysctl=3D"sysctl -n hw.machine_arch"
>> >     >     >     >     +-      UNAME_MACHINE_ARCH=3D`(/sbin/$sysctl 2>/=
dev/null ||
>> >     \
>> >     >     >     >     +-          /usr/sbin/$sysctl 2>/dev/null || ech=
o
>> >     unknown)`
>> >     >     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>> >     >     >     >     ++      UNAME_MACHINE_ARCH=3D`(uname -p 2>/dev/n=
ull || \
>> >     >     >     >     ++          "/sbin/$sysctl" 2>/dev/null || \
>> >     >     >     >     ++          "/usr/sbin/$sysctl" 2>/dev/null || \
>> >     >     >     >     ++          echo unknown)`
>> >     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>> >     >     >     >     +           armeb) machine=3Darmeb-unknown ;;
>> >     >     >     >     +           arm*) machine=3Darm-unknown ;;
>> >     >     >     >     +           sh3el) machine=3Dshl-unknown ;;
>> >     >     >     >     +           sh3eb) machine=3Dsh-unknown ;;
>> >     >     >     >     +           sh5el) machine=3Dsh5le-unknown ;;
>> >     >     >     >     +-          *) machine=3D${UNAME_MACHINE_ARCH}-u=
nknown ;;
>> >     >     >     >     ++          earmv*)
>> >     >     >     >     ++              arch=3D`echo "$UNAME_MACHINE_ARC=
H" | sed -e
>> >     's,^e
>> >     >     \(armv
>> >     >     >     [0-9]
>> >     >     >     >     \).*$,\1,'`
>> >     >     >     >     ++              endian=3D`echo "$UNAME_MACHINE_A=
RCH" | sed
>> >     -ne
>> >     >     's,^.*\
>> >     >     >     (eb\)$,
>> >     >     >     >     \1,p'`
>> >     >     >     >     ++              machine=3D"${arch}${endian}"-unk=
nown
>> >     >     >     >     ++              ;;
>> >     >     >     >     ++          *) machine=3D"$UNAME_MACHINE_ARCH"-u=
nknown ;;
>> >     >     >     >     +       esac
>> >     >     >     >     +       # The Operating System including object =
format,
>> >     if it
>> >     >     has
>> >     >     >     switched
>> >     >     >     >     +-      # to ELF recently, or will in the future=
.
>> >     >     >     >     +-      case "${UNAME_MACHINE_ARCH}" in
>> >     >     >     >     ++      # to ELF recently (or will in the future=
) and
>> >     ABI.
>> >     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>> >     >     >     >     ++          earm*)
>> >     >     >     >     ++              os=3Dnetbsdelf
>> >     >     >     >     ++              ;;
>> >     >     >     >     +           arm*|i386|m68k|ns32k|sh3*|sparc|vax)
>> >     >     >     >     +-              eval $set_cc_for_build
>> >     >     >     >     ++              eval "$set_cc_for_build"
>> >     >     >     >     +               if echo __ELF__ | $CC_FOR_BUILD =
-E - 2>/
>> >     dev/
>> >     >     null \
>> >     >     >     >     +-                      | grep __ELF__ >/dev/nul=
l
>> >     >     >     >     ++                      | grep -q __ELF__
>> >     >     >     >     +               then
>> >     >     >     >     +                   # Once all utilities can be =
ECOFF
>> >     >     (netbsdecoff)
>> >     >     >     or
>> >     >     >     >     a.out (netbsdaout).
>> >     >     >     >     +                   # Return netbsd for either. =
 FIX?
>> >     >     >     >     +@@ -180,7 +211,14 @@ case "${UNAME_MACHINE}:$
>> >     {UNAME_SYSTEM}:$
>> >     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>> >     >     >     >     +               fi
>> >     >     >     >     +               ;;
>> >     >     >     >     +           *)
>> >     >     >     >     +-              os=3Dnetbsd
>> >     >     >     >     ++              os=3Dnetbsd
>> >     >     >     >     ++              ;;
>> >     >     >     >     ++      esac
>> >     >     >     >     ++      # Determine ABI tags.
>> >     >     >     >     ++      case "$UNAME_MACHINE_ARCH" in
>> >     >     >     >     ++          earm*)
>> >     >     >     >     ++              expr=3D's/^earmv[0-9]/-eabi/;s/e=
b$//'
>> >     >     >     >     ++              abi=3D`echo "$UNAME_MACHINE_ARCH=
" | sed -e
>> >     >     "$expr"`
>> >     >     >     >     +               ;;
>> >     >     >     >     +       esac
>> >     >     >     >     +       # The OS release
>> >     >     >     >     +@@ -188,42 +226,62 @@ case "${UNAME_MACHINE}:$
>> >     {UNAME_SYSTEM}:$
>> >     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>> >     >     >     >     +       # thus, need a distinct triplet. However=
, they do
>> >     not
>> >     >     need
>> >     >     >     >     +       # kernel version information, so it can =
be
>> >     replaced
>> >     >     with a
>> >     >     >     >     +       # suitable tag, in the style of linux-gn=
u.
>> >     >     >     >     +-      case "${UNAME_VERSION}" in
>> >     >     >     >     ++      case "$UNAME_VERSION" in
>> >     >     >     >     +           Debian*)
>> >     >     >     >     +               release=3D'-gnu'
>> >     >     >     >     +               ;;
>> >     >     >     >     +           *)
>> >     >     >     >     +-              release=3D`echo ${UNAME_RELEASE}=
|sed -e 's/
>> >     [-_].*
>> >     >     /\./'`
>> >     >     >     >     ++              release=3D`echo "$UNAME_RELEASE"=
 | sed -e
>> >     's/
>> >     >     [-_].*//'
>> >     >     >     | cut
>> >     >     >     >     -d. -f1,2`
>> >     >     >     >     +               ;;
>> >     >     >     >     +       esac
>> >     >     >     >     +       # Since
>> >     CPU_TYPE-MANUFACTURER-KERNEL-OPERATING_SYSTEM:
>> >     >     >     >     +       # contains redundant information, the sh=
orter
>> >     form:
>> >     >     >     >     +       # CPU_TYPE-MANUFACTURER-OPERATING_SYSTEM=
 is used.
>> >     >     >     >     +-      echo "${machine}-${os}${release}"
>> >     >     >     >     ++      echo "$machine-${os}${release}${abi-}"
>> >     >     >     >     ++      exit ;;
>> >     >     >     >     ++    *:Bitrig:*:*)
>> >     >     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/Bitr=
ig.//'`
>> >     >     >     >     ++      echo
>> >     >     "$UNAME_MACHINE_ARCH"-unknown-bitrig"$UNAME_RELEASE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     +     *:OpenBSD:*:*)
>> >     >     >     >     +       UNAME_MACHINE_ARCH=3D`arch | sed 's/Open=
BSD.//'`
>> >     >     >     >     +-      echo ${UNAME_MACHINE_ARCH}-unknown-openb=
sd$
>> >     >     {UNAME_RELEASE}
>> >     >     >     >     ++      echo
>> >     >     "$UNAME_MACHINE_ARCH"-unknown-openbsd"$UNAME_RELEASE"
>> >     >     >     >     ++      exit ;;
>> >     >     >     >     ++    *:LibertyBSD:*:*)
>> >     >     >     >     ++      UNAME_MACHINE_ARCH=3D`arch | sed 's/^.*B=
SD\.//'`
>> >     >     >     >     ++      echo
>> >     >     "$UNAME_MACHINE_ARCH"-unknown-libertybsd"$UNAME_RELEASE"
>> >     >     >     >     ++      exit ;;
>> >     >     >     >     ++    *:MidnightBSD:*:*)
>> >     >     >     >     ++      echo
>> >     >     "$UNAME_MACHINE"-unknown-midnightbsd"$UNAME_RELEASE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     +     *:ekkoBSD:*:*)
>> >     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-ekkobsd$
>> >     {UNAME_RELEASE}
>> >     >     >     >     ++      echo
>> >     "$UNAME_MACHINE"-unknown-ekkobsd"$UNAME_RELEASE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     +     *:SolidBSD:*:*)
>> >     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-solidbsd$
>> >     {UNAME_RELEASE}
>> >     >     >     >     ++      echo
>> >     "$UNAME_MACHINE"-unknown-solidbsd"$UNAME_RELEASE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     +     macppc:MirBSD:*:*)
>> >     >     >     >     +-      echo powerpc-unknown-mirbsd${UNAME_RELEA=
SE}
>> >     >     >     >     ++      echo powerpc-unknown-mirbsd"$UNAME_RELEA=
SE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     +     *:MirBSD:*:*)
>> >     >     >     >     +-      echo ${UNAME_MACHINE}-unknown-mirbsd$
>> >     {UNAME_RELEASE}
>> >     >     >     >     ++      echo
>> >     "$UNAME_MACHINE"-unknown-mirbsd"$UNAME_RELEASE"
>> >     >     >     >     +       exit ;;
>> >     >     >     >     ++    *:Sortix:*:*)
>> >     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-sortix
>> >     >     >     >     ++      exit ;;
>> >     >     >     >     ++    *:Redox:*:*)
>> >     >     >     >     ++      echo "$UNAME_MACHINE"-unknown-redox
>> >     >     >     >     ++      exit ;;
>> >     >     >     >     ++    mips:OSF1:*.*)
>> >     >     >     >     ++        echo mips-dec-osf1
>> >     >     >     >     ++        exit ;;
>> >     >     >     >     +     alpha:OSF1:*:*)
>> >     >     >     >     +       case $UNAME_RELEASE in
>> >     >     >     >     +       *4.0)
>> >     >     >     >     +               UNAME_RELEASE=3D`/usr/sbin/sizer=
 -v | awk '
>> >     {print
>> >     >     $3}'`
>> >     >     >     >     +               ;;
>> >     >     >     >     +       *5.*)
>> >     >     >     >     +-              UNAME_RELEASE=3D`/usr/sbin/sizer=
 -v | awk '
>> >     {print
>> >     >     $4}'`
>> >     >     >     >     ++              UNAME_RELEASE=3D`/usr/sbin/sizer=
 -v | awk '
>> >     {print
>> >     >     $4}'`
>> >     >     >     >     +               ;;
>> >     >     >     >     +       esac
>> >     >     >     >     +       # According to Compaq, /usr/sbin/psrinfo=
 has been
>> >     >     available
>> >     >     >     on
>> >     >     >     >     +@@ -233,60 +291,54 @@ case "${UNAME_MACHINE}:$
>> >     {UNAME_SYSTEM}:$
>> >     >     >     >     {UNAME_RELEASE}:${UNAME_VERSION}" in
>> >     >     >     >     +       ALPHA_CPU_TYPE=3D`/usr/sbin/psrinfo -v |=
 sed -n -e
>> >     's/^
>> >     >     The
>> >     >     >     alpha \
>> >     >     >     >     (.*\) processor.*$/\1/p' | head -n 1`
>> >     >     >     >     +       case "$ALPHA_CPU_TYPE" in
>> >     >     >     >     +           "EV4 (21064)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>> >     >     >     >     +           "EV4.5 (21064)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>> >     >     >     >     +           "LCA4 (21066/21068)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alpha" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalpha ;;
>> >     >     >     >     +           "EV5 (21164)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev5" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev5 ;;
>> >     >     >     >     +           "EV5.6 (21164A)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev56" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev56 ;;
>> >     >     >     >     +           "EV5.6 (21164PC)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphapca56" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphapca56 ;;
>> >     >     >     >     +           "EV5.7 (21164PC)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphapca57" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphapca57 ;;
>> >     >     >     >     +           "EV6 (21264)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev6" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev6 ;;
>> >     >     >     >     +           "EV6.7 (21264A)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev67" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev67 ;;
>> >     >     >     >     +           "EV6.8CB (21264C)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>> >     >     >     >     +           "EV6.8AL (21264B)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>> >     >     >     >     +           "EV6.8CX (21264D)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev68" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev68 ;;
>> >     >     >     >     +           "EV6.9A (21264/EV69A)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev69" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev69 ;;
>> >     >     >     >     +           "EV7 (21364)")
>> >     >     >     >     +-              UNAME_MACHINE=3D"alphaev7" ;;
>> >     >     >     >     ++              UNAME_MACHINE=3Dalphaev7 ;;
>> >     >     >     >     +           "EV7.9 (21364A)")
>> >     >     >

