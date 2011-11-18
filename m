Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RROrH-0006v4-AL
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 14:52:00 +0100
Received: by ghy10 with SMTP id 10so538597ghy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gPVc+18dKGtDbb53KM+UL3qqZSWDEM3MbYyRpXbY0ps=;
	b=ek51NMO4ZYsMCfdyswfpr1cx1FcWL6ASCUuTSDJNcE9GtCt2C0uKGSd0L4RpDyYhLi
	SEZqzH1hLGEAEIVZD2JFHmZMBskKNTmYWSYI5Q7DzSfbxOgEwGpHsr6XWaDW4BQ8LGl0
	khVCFoeo+4OydPiNfbuqDxd9AeWxRATruR8jo=
MIME-Version: 1.0
Received: by 10.236.197.9 with SMTP id s9mr4937887yhn.71.1321623932494; Fri,
	18 Nov 2011 05:45:32 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Fri, 18 Nov 2011 05:45:32 -0800 (PST)
In-Reply-To: <20111118131116.GB3549@jama.jama.net>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<c4465784961e18f1e86e94fe2d57b93ea1e6ec58.1321575642.git.andrea.adami@gmail.com>
	<20111118095503.GA3549@jama.jama.net> <15369757.CEiKJYElQt@helios>
	<20111118131116.GB3549@jama.jama.net>
Date: Fri, 18 Nov 2011 14:45:32 +0100
Message-ID: <CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 13:52:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 2:11 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Nov 18, 2011 at 10:18:17AM +0000, Paul Eggleton wrote:
>> On Friday 18 November 2011 10:55:03 Martin Jansa wrote:
>> > On Fri, Nov 18, 2011 at 01:36:07AM +0100, Andrea Adami wrote:
>> > > * for our old beloved handhelds the kernel
>> >
>> > I'm using it.. but if I'm alone then I can keep it in my own branch..
>> > currently upgrading from 3.1.0-rc10 to 3.2.0-rc2
>>
>> If you're still using it Martin I'd rather keep it around than force you=
 to
>> maintain your own branch with it in; it shouldn't get in the way of anyo=
ne
>> else.
>
> Well, it doesn't cost me anything to maintain it and if nobody booted
> 3.1.0-rc* from that recipe except me then I'm fine with dropping it.
>
> But I rememeber a while back when we were trying to boot something like
> 2.6.32-rcX and we had to exchange few patches and defconfigs to find usab=
le
> configuration and meta-handheld looks like good place to share such
> stuff if it at least work for someone (in this case me), but no other
> side I do not send patch with every SRCREV change I have locally unless
> it needs defconfig change or extra patch (expecting that everybody can
> bump SRCREV and rcX locally to test newer version).
>
> like this:
> https://gitorious.org/shr/meta-handheld/commit/5136fd456569a254b3203545af=
3c98d643e8b681?format=3Dpatch
>
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
>

I have no strong opinion too.

My thoughts are that Pavel is always testing bleeding edge way before
we commit it in OE while Dmitry told me repeatedly he prefers to base
his patches on stable, older kernels.

So my point is we can always cherry-pick the interesting patches from
the linux tree and hijack our 'private' kernels because our layer
would not affect other machines.

Regards

Andrea


