Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id BA9A071A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 16:18:04 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id y129so24869031pgy.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CnVeRNz6q74Ambr6pVfQ6Q1lpPVmEfMioPf/5r1Mfjc=;
	b=T4ZeeNHwqIRrUMxVieg75g9ei/h0Aoo4ztltYyJZm8wQcJk6JH1BNrR9Fo+rErZ/Qm
	YPxJgWpZA8WTHIXxCdPQO12S3TuGq5H+iYJQz6InWPDkBTtHAbg66tjXW7lvuLcUMuti
	9/IhETitVb2E7HoP916mrWyzeyoFZJjRlEge8KYYAD0aj73E7utOykIVlwMxDsa2KHPM
	CHLW9sjEDrtuU/EdSJGujaUt/NN1ntCmuGFCvE/1/H0FIbGnE2QgeKAlW4INZmT9hyIi
	zn2mrK2Xi9JRLEFYtFfvcJ5faNFShpPE82eFWcZwGzWG70VvYq1g49c7WCwp3lfbtnTk
	L/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CnVeRNz6q74Ambr6pVfQ6Q1lpPVmEfMioPf/5r1Mfjc=;
	b=LG7VSzoUgikd2LPpq1FLdxVZ+GmncQdaw6LXkGVTpc++jmvo/GdiFMDaUqLFGgWIp9
	vZbHDfpjHzjvgYA0wWwC+MdYJnqihPIz1hz8Ri2kD8fLqOSm1W9SGA+puQc5Ya5RK6vC
	pIkdUZJwgKP5JWVBN9mwY4JoruTk9KEoxG1ah2+Ygy7AbPYDF5Ajg2Oqt1I7vSKNnaOs
	r6Stykf9BGDAG0km2B9d2VWMedq76w0A/zdExp+pJSkRj/T46CiP4Ezbc5IhRmI4rIvs
	TIRl7xB9yJBojQapeAU9Z3t+Pf6qhUcnfhZj02/DxeeW6bwIc6h1N25wefkzB9rW14C/
	p8xw==
X-Gm-Message-State: AHYfb5hHuIZwmJdtLVLN/Kw2cP1opV6DAqIpI/n8ufI4TUnCXllXwqln
	SCi70yqxkXIM4gl2Cdv5l/Ug+3VKvQ==
X-Received: by 10.99.3.197 with SMTP id 188mr2184072pgd.288.1502900285917;
	Wed, 16 Aug 2017 09:18:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 09:17:35 -0700 (PDT)
In-Reply-To: <CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 09:17:35 -0700
Message-ID: <CAMKF1sqeqWHmkuwaHnH=odzmxOssavrzX3hJKYZSerYwKjz3tQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Wed, 16 Aug 2017 16:18:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2017 at 9:12 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> I think nodejs fails because of openssl-1.1 like most of the failures fro=
m
> last report.
> http://errors.yoctoproject.org/Errors/Details/150582/
>
> it was building fine with gcc7 before openssl upgrade.
>

yes there are many failures in meta-openembedded layers due to
openssl11, I  guess we should just add
DEPENDS =3D "openssl10"  to these recipes until they are fixed to work
with openssl1.1

> Regards,
>
> On Wed, Aug 16, 2017 at 6:06 PM, Trevor Woerner <twoerner@gmail.com> wrot=
e:
>
>> On Tue 2017-08-15 @ 11:53:42 PM, Andreas M=C3=BCller wrote:
>> > On Tue, Aug 15, 2017 at 6:23 PM, Raphael Kubo da Costa
>> > <raphael.kubo.da.costa@intel.com> wrote:
>> > > Khem Raj <raj.khem@gmail.com> writes:
>> > >
>> > >> what are main architectures targetted with crosswalk ? I think scop=
e
>> is
>> > >> important, since meta-browser supports, almost all oe-core supporte=
d
>> > >> architectures. including x86/arm/mips/ppc, any cross build patches =
are
>> > >> required in anycase, but architecture patches will be additional if
>> you
>> > >> were only considering a subset of architectures.
>>
>> I was wondering the same thing myself :-) This recipe lists "armv7a" in
>> COMPATIBLE_MACHINE but the (32-bit version of) raspberrypi3, for
>> example, is armv7ve. Therefore I get:
>>
>>         ERROR: Nothing PROVIDES 'chromium'
>>         chromium was skipped: incompatible with machine raspberrypi3 (no=
t
>> in COMPATIBLE_MACHINE)
>>
>> > > There's nothing Crosswalk-related in my Chromium recipe; it's in
>> > > meta-crosswalk simply due to a historical accident and the fact that=
 I
>> > > haven't found a proper home for it so far.
>>
>> Okay, good to know.
>>
>> > > With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
>> > > Chromium doesn't support earlier ARM processors) and aarch64.
>>
>> Can you provide a list of "MACHINE =3D ..." that were used?
>>
>> > I think the update stopper for chromium on meta browser is the new
>> > build system (don't remember the name).
>>
>> Maybe you're referring to "gn"? If so, it's not a show-stopper. The sour=
ce
>> tarballs for chromium now include working sources for gn that can be bui=
lt
>> prior to the configure step.
>>
>> gn is a "makefile generator" much like the autotools. It's not the build
>> system itself. However, instead of generating makefiles for make (as the
>> autotools does), gn generates ninja files for ninja (which is the build
>> system, and remains unchanged from earlier versions of chromium).
>>
>> > To take this step and have a
>> > more recent version of chromium in meta-browser would be really great!
>>
>> The problem I was having was in trying to force the build system to use =
the
>> toolchain I wanted it to use. The Igalia people solved this problem by
>> tricking the build system to think it was building for CrOS, and then
>> redefining the toolchain for CrOS to use the toolchain generated by OE.
>> This
>> worked for x86_64 (minnowboard) but would fail for the raspberrypi3 with
>> "illegal instruction". So somewhere in the build, the specified toolchai=
n
>> was
>> being ignored and the host's toolchain was being used instead.
>>
>> I'd be happy to work on trying to integrate Raphael's excellent work int=
o
>> meta-browser. However, it depends on nodejs, and nodejs is currently
>> failing
>> to build (Martin's "State of Bitbake World" just exploded in the last
>> iteration). I'm looking into that now, somewhat. node hasn't been happy
>> since
>> the switch to gcc7.
>>
>> There are (now) a number of distros that make a distribution for the
>> raspberrypi, many of which include chromium. It would be great if it wer=
e
>> easy/possible to find the scripts/steps/setup they're using for comparat=
ive
>> reasons:
>>         - raspbian
>>         - suse
>>         - fedora
>>         - arch
>>         - (others?)
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

