Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjWLG-0007AE-MB
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 14:29:51 +0100
Received: by pbcc11 with SMTP id c11so1216739pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hR3jUDF9Aa9069LMoowUXDxoHlIMe03QFnEtsvg4Q7A=;
	b=odPAxJ9Kvpv1xti4Up46C8VVTfpxfNkz5yEn5vQ3yoBakjBQCuOdxo8Djt+j7PE0RW
	z8oe1d5LjI5qjcBK+3Bv8PWTo4DgHlniphbIj6dIL5ngjSDQ21Bi4gR+Hsjh8XazOX9G
	jjS1wmip1Ov9ZIKMDfPWU8HQ1Ud6O2P4JcHHM=
MIME-Version: 1.0
Received: by 10.68.201.136 with SMTP id ka8mr24005794pbc.1.1325942544388; Sat,
	07 Jan 2012 05:22:24 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Sat, 7 Jan 2012 05:22:24 -0800 (PST)
In-Reply-To: <20120107104945.GB3938@jama.jama.net>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
	<20120107104945.GB3938@jama.jama.net>
Date: Sat, 7 Jan 2012 14:22:24 +0100
Message-ID: <CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
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
X-List-Received-Date: Sat, 07 Jan 2012 13:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 7, 2012 at 11:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Jan 07, 2012 at 08:41:51AM -0200, Otavio Salvador wrote:
>> On Sat, Jan 7, 2012 at 06:05, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>> > -----BEGIN PGP SIGNED MESSAGE-----
>> > Hash: SHA1
>> >
>> > Op 07-01-12 00:55, Andrea Adami schreef:
>> > > * delete patches meant for BSP layers * bump PR
>> >
>> > With a recipe like xserver-common I don't see a point in going all out BSP
>> > on it. This patch just moves things to layers just for the sake of moving
>> > it
>> > to layers. I strongly suspect that applying this patch will be a net burden
>> > on device maintainers instead of a gain.
>> >
>>
>> I agree this is going to be bad at first but those kind of improvements
>> always cause some problems for a later gain. Dropping things that ought to
>> be in BSP layers is a good thing but only after the "fix other layers" time
>> window.
>>
>> I think this is worth it however it might be better to instead port the
>> needed changes to OE-Core and ask other layers to adopt x11-common allowing
>> us to remove this later on. This makes the change easier and avoid some
>> problems for users IMO.
>
> This whole recipe has machine specific bits and removing those bits
> only of some machines (in this case all from meta-smartphone BSPs)
> doesn't improve that recipe.
>
> So if you want to improve it, merge extra functionality (like
> xinput-pointercal) to oe-core and drop this completely, but breaking
> some machines doesn't make thinks better.
>
> Instead of "fixing" it in meta-smartphone BSPs I would just copy whole
> xserver-common back to meta-shr, because I don't have time now to fix it
> properly and spending time on .bbappends is not worth it in this case.
>
> Cheers,
>
> JaMa, from daywork..ffs
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I try to explain again my intent:

1) we have at the moment two xserver-nodm-init, one in meta-oe and one
in oe-core
2) this is intrinsecaly bad and moreover the two recipes are totally
different with regards to runtime dependencies
3) as it is now, oe-core expects to use x11-common while in meta-oe
there is xserver-common
4) xserver-common is an old recipe coming from the oe-classic times,
designed to work with gpe environments and targeting mostly kdrive.
Thius recipe contains alot of BSP code.
5) today, if one builds core-image-sato distroless for zaurus qvga
using meta-oe the xserver won't start because of the bad settings
provided by the recipe.

So, I already sent a msg in that regard before (
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035564.html
) and now I'm trying to help cleaning both sides.
The patch for x11-common was taken in oe-core but this one for meta-oe
is unexpectedly under discussion.
BE sure my intentions are not to increase maintenance burden, on the
opposite I'd like neutral/sane defaults and patches to override those
in the BSP layers.

Regards

Andrea


