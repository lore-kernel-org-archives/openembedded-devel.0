Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjZNs-0005cB-4B
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 17:44:44 +0100
Received: by pbcc11 with SMTP id c11so1265649pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AYdUR3wYuheVmsQJrshBVZJydH5jrkK4qB0psb75cIc=;
	b=lmkzcRjU1hc2sZjiMaU5xrDZorRqff2+CV2yzxD2ejzstUomCrO45omzLR29Lza3qu
	lHSKiVcErnqCvdCc+B155vAeUBF0di4M4QA7qwDjIm+V2/2LGCTZ+180GxNkbo9VWpI3
	/R+iEiUl7ci0zPSXGyL+craB6F1km+wGhHXW8=
MIME-Version: 1.0
Received: by 10.68.192.74 with SMTP id he10mr24964721pbc.24.1325954236923;
	Sat, 07 Jan 2012 08:37:16 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Sat, 7 Jan 2012 08:37:16 -0800 (PST)
In-Reply-To: <20120107134210.GC3938@jama.jama.net>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
	<20120107104945.GB3938@jama.jama.net>
	<CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
	<20120107134210.GC3938@jama.jama.net>
Date: Sat, 7 Jan 2012 17:37:16 +0100
Message-ID: <CAAQYJAvAypCLck2mpJzoZ3ZF=yMh4gEzcDNnh+W8MbndZguLcg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jan 2012 16:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 2:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sat, Jan 07, 2012 at 02:22:24PM +0100, Andrea Adami wrote:
>> On Sat, Jan 7, 2012 at 11:49 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > On Sat, Jan 07, 2012 at 08:41:51AM -0200, Otavio Salvador wrote:
>> >> On Sat, Jan 7, 2012 at 06:05, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> >>
>> >> > -----BEGIN PGP SIGNED MESSAGE-----
>> >> > Hash: SHA1
>> >> >
>> >> > Op 07-01-12 00:55, Andrea Adami schreef:
>> >> > > * delete patches meant for BSP layers * bump PR
>> >> >
>> >> > With a recipe like xserver-common I don't see a point in going all =
out BSP
>> >> > on it. This patch just moves things to layers just for the sake of =
moving
>> >> > it
>> >> > to layers. I strongly suspect that applying this patch will be a ne=
t burden
>> >> > on device maintainers instead of a gain.
>> >> >
>> >>
>> >> I agree this is going to be bad at first but those kind of improvemen=
ts
>> >> always cause some problems for a later gain. Dropping things that oug=
ht to
>> >> be in BSP layers is a good thing but only after the "fix other layers=
" time
>> >> window.
>> >>
>> >> I think this is worth it however it might be better to instead port t=
he
>> >> needed changes to OE-Core and ask other layers to adopt x11-common al=
lowing
>> >> us to remove this later on. This makes the change easier and avoid so=
me
>> >> problems for users IMO.
>> >
>> > This whole recipe has machine specific bits and removing those bits
>> > only of some machines (in this case all from meta-smartphone BSPs)
>> > doesn't improve that recipe.
>> >
>> > So if you want to improve it, merge extra functionality (like
>> > xinput-pointercal) to oe-core and drop this completely, but breaking
>> > some machines doesn't make thinks better.
>> >
>> > Instead of "fixing" it in meta-smartphone BSPs I would just copy whole
>> > xserver-common back to meta-shr, because I don't have time now to fix =
it
>> > properly and spending time on .bbappends is not worth it in this case.
>> >
>> > Cheers,
>> >
>> > JaMa, from daywork..ffs
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> I try to explain again my intent:
>>
>> 1) we have at the moment two xserver-nodm-init, one in meta-oe and one
>> in oe-core
>> 2) this is intrinsecaly bad and moreover the two recipes are totally
>> different with regards to runtime dependencies
>
> I'm aware of that and said that many times, just to busy with daywork
> (in last couple of months) to fix it myself ;/.
>
>> 3) as it is now, oe-core expects to use x11-common while in meta-oe
>> there is xserver-common
>
> I've already explained to you to use VIRTUAL_RUNTIME vars.

Sorry but this is not enough in order to obtain a core-image-sato with
working xserver on first run.
The meta-oe layer is 'toxic' in that regard.

>
>> 4) xserver-common is an old recipe coming from the oe-classic times,
>> designed to work with gpe environments and targeting mostly kdrive.
>> Thius recipe contains alot of BSP code.
>
> Yes and those patches you've removed are not making it worse, upstream
> script contains a lot of BSP code already and those patches are just
> making it more complete (think about it as patch which should be applied
> upstream not in BSP layer).
>

Those patches ought to be sent upstream long agoi...
I'm sure Florian will apply almost immediately once aware.


>> 5) today, if one builds core-image-sato distroless for zaurus qvga
>> using meta-oe the xserver won't start because of the bad settings
>> provided by the recipe.
>
> see A3).
>
>> So, I already sent a msg in that regard before (
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035=
564.html
>> ) and now I'm trying to help cleaning both sides.
>> The patch for x11-common was taken in oe-core but this one for meta-oe
>> is unexpectedly under discussion.
>> BE sure my intentions are not to increase maintenance burden, on the
>> opposite I'd like neutral/sane defaults and patches to override those
>> in the BSP layers.
>
> burden is to force people to fix recipe which should be removed instead.
>

This is my last reply to this thread.
Again I'm sorry to force maintainers of external layers to react and
make hanges but there is anything wrong with this.
We did agree the policy of meta-oe is the same of oe-core, thus no BSP
code is allowed. Stop.
I'd expect the maintainer agrees.

Cheers

Andrea


> Regards,
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


