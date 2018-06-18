Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 790D875259
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:22:46 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id w13-v6so19994334ote.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ztErQ0pe2qNGpLTm77RU+CQxx4AVSuZJrTIJORWKM9Q=;
	b=l99YAUj6muSnTCHBdocWOqvUSdOSXg+3pb14xMEQqLHIup+1J4/yqahnWrCCdCU6Y9
	Iw5D559IyB1QxVO2o77SIfB1H4iYzeI2fqvkmDAsxxWR1m63UerFIqDxQSVSMzgc1YmS
	CIn3Vp+qkYG/gDC6Ad2fExOI/x6mYanfc02CNCesrJTwxQoZVUJEDx8jeQdLqqOeyxaZ
	lNv45o0hDQJFjNO8Lv3oNS/k4Dp2/ljpp9EzXb8luvjXEK+HtWomoXBWjHoFea/CtxHo
	XoJIZbgozY2wLKvPjhVnvRhDFiXziKcwiCiR5oS12itrpm4Ss8yc7udErFbGO5NhnJUx
	mzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ztErQ0pe2qNGpLTm77RU+CQxx4AVSuZJrTIJORWKM9Q=;
	b=U1QQVOhdx3vHOkak4xy7rNp0XTNzb+WH/NJXOymnB++GpgTyhwJTd5KoeKH3F58bOF
	Hw3FQXxfEKYIL844nxk0IL7+JgA+UFDU90NPN8UrPffY9gl5smQgGFhMUEKgsH41VLPg
	zLUgvWIvc/G10eocpbYAP0Kp15jvpr+ZZ79q7TNCZgm5brjVSkYp2dX7/Lhm+0zTeW7f
	0lehWg/sovCF3SMYth4+BzzyuiJ4MgfByoMPKW+Q6ato7D3Y1UiSmriTWisWjv5cS/hH
	H0zIoLUlcfzZlcNJpY+awCPC3rQT4plYyCj6KxE9D0PFcUtd3X5NCwe+YCackHv5JZCt
	A9rg==
X-Gm-Message-State: APt69E3aLDxZ1Tz5LbiBmmMyzdNp9/ryLK0q4XxDeNCEnilgTugu2u1f
	cmd5NRYxBCUPwedzkm6/DkG9hpWZup0RIz3NgbQ=
X-Google-Smtp-Source: ADUXVKK7ehYqYUL+XhikiO8FSyjB2zSCMv1Cfxyuf7Gn0dSBt8e2FsHWaI0JauTMd8WKKv1ctS+Am6gbMYbbZjiDkuY=
X-Received: by 2002:a9d:1d02:: with SMTP id
	m2-v6mr9191192otm.220.1529353367580; 
	Mon, 18 Jun 2018 13:22:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 13:22:46
	-0700 (PDT)
In-Reply-To: <1897778.l7aI5iDS63@yow-masselst-lx1>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
	<CALbNGRQR6OPvXyoTmfXm9Yh5PmADNb=CNamyo7T-PebQ4-nrXA@mail.gmail.com>
	<1897778.l7aI5iDS63@yow-masselst-lx1>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 22:22:46 +0200
Message-ID: <CALbNGRSoL3AaGYRLD1vwPzAd4U-zAtZbu1rL73kdDb7kX4gq9g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:22:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 18, 2018 at 10:14 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Monday, June 18, 2018 4:10:12 PM EDT Andreas M=C3=BCller wrote:
>> On Mon, Jun 18, 2018 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>> > On 6/18/18 1:47 PM, Khem Raj wrote:
>> >> On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
>> >>
>> >> <mark.asselstine@windriver.com> wrote:
>> >>> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote=
:
>> >>>> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.c=
om>
> wrote:
>> >>>>> On 6/18/18 12:50 PM, Khem Raj wrote:
>> >>>>>> Hi Mark
>> >>>>>>
>> >>>>>> It seems your distro is not inheriting it globally. Here I have
>> >>>>>> INHERIT_DISTRO ?=3D  "debian devshell sstate license remove-libto=
ol"
>> >>>>>
>> >>>>> So is remove-libtool a recipe or a distro option?
>> >>>>>
>> >>>>> I'm asking because doing this half-way is causing a lot of confusi=
on.
>> >>>>>
>> >>>>> If it's a distro option, then the recipes should work without it b=
eing
>> >>>>> set.  If it's a recipe option, then the recipes that need it shoul=
d
>> >>>>> use it.
>> >>>>>
>> >>>>> Right now it doesn't seem to be working with these recipes because
>> >>>>> they don't package the .la files UNLESS it's enabled.  So the fix =
is
>> >>>>> either to package them (by default) or inherit the remove-libtool.
>> >>>>
>> >>>> since we make it as part of meta/conf/distro/defaultsetup.conf
>> >>>> its a default policy,  its perfectly fine for a distro to disregard
>> >>>> that
>> >>>> however, then you fall into a non-default case. I am willing to acc=
ept
>> >>>> per recipe patches but I would recommend to consider it as a distro
>> >>>> feature for your distro.
>> >>>
>> >>> Andreas,
>> >>>
>> >>> Can you revert your "various classes recipes: Remove FILES entries f=
or
>> >>> dbg/dev packages" then? If this is a distro feature then these recip=
es
>> >>> need to build without the QA issue and without the remove-libtool
>> >>> distro feature being set.
>>
>> I prefer not to apply the patch (Or Khem shall I send a revert?). It
>> is not a good idea to break builds for distros not following a
>> recommendation. Anyway the mentioned patch was a cleanup: It is not
>> worth to break things by a minor cleanup.
>
> The patch doesn't just cleanup .la but also some .debug files, so I suppo=
se it
> doesn't have to be a full revert. I can put together something which just=
 gets
> things going with a return to including .la files in FILES if people woul=
d
> prefer that approach.
>
> MarkA
>
Would be great if you could do that - thanks in advance

Andreas

