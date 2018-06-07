Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1615A748AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:27:39 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id a5-v6so10342600otf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2018 00:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z0myGxmx2d1MpaTUdKGAx7GA466PwTbpCSkkkCIBLoA=;
	b=KW5RLc8F779EkII6WVeKzmcw8Sq9LWqKW5MKUs+g97r3V///L5E3f8gN322+Q/uvYu
	FY5qorGWVbbxSBcksUQjbyg7ylrRF1/3swdklFR0R3S+YM3jfw/ZbErfPljhl9bCV6UT
	C9J74aG96hpUi+6is8a/IWOtZyLBLMUoBl1oh4x7md2/B5z4VIKCSIbjlsa0Tov5P+vf
	JLIbJHRWshCG7yf5JOpPj7cfNdNYK3a5g7xVL5il2AWjE9sqB/1XGcw3pi4eEYKeO8oG
	kNPVutSLuACXWcepIuHoP9ZdSOhfJhUygrvJX42ccJStn+L9La/vjpFsoretGkRpBz+u
	WNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z0myGxmx2d1MpaTUdKGAx7GA466PwTbpCSkkkCIBLoA=;
	b=fwAUrmyCWridOCF/rTTCvD2FWSiM1tz06W7+lE5SeXSJweW+feJU6AU0VTCsqED5vh
	QcSuHScgSdfb+5d9rueEm3m9ch0N6Y5ZyXLKbinA3q6LaANlKXWoJgyu+d6+mqbsMy7A
	P9OJD2DFN/G71kp+suKxh0rYeiMoJJZvwMZWegggA0h2DCaSiOvx5SuJQ+6hyUzK5KmS
	vVQdO6tQNoLMVzBo2A8gP0AY280jZ+LodKBcfp1qv7Cuali9hCFwZ5NnIha9E5SF9ouW
	1D7kDtirZZXgWsF/wTl9Ci6+zcETjFAWV6jG9A2AEohZ7IrawPRJL0ip9vOhQWZ2OXR7
	kobQ==
X-Gm-Message-State: APt69E1zSkMpyqZDDyoHzzyQB1ypyYBE6KQUKNWPwtrxVQ2fEjspnLye
	Bv3ZlgljiyxPSXk79GH+UVqms/4gIVYntGhGVJU=
X-Google-Smtp-Source: ADUXVKJF22Un4lm8xrmHCs0mLRAtrWvKLaCGN77OebPrIN3uCKhWHk6tvAEmktuYwz37AIvVo+3jLcMfA6Ni28mWnuE=
X-Received: by 2002:a9d:1d02:: with SMTP id m2-v6mr407969otm.220.1528356460958;
	Thu, 07 Jun 2018 00:27:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:4916:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 00:27:40 -0700 (PDT)
In-Reply-To: <20180607060808.GB1353@jama>
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
	<CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
	<CA+chaQdCMFngAwgV2+5XY6RWf1qUTHzDpdJgFAjpyFe0RL62Eg@mail.gmail.com>
	<CALbNGRQxWvxbwc0UMwe7D1W9XhmWh3vHgb2exC2y6xNd3SE57Q@mail.gmail.com>
	<20180607060808.GB1353@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 7 Jun 2018 09:27:40 +0200
Message-ID: <CALbNGRSPPsiK=r6MOnZu4W8f5M0ZBKEReuOhut+PfEkqq3s=XA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Thu, 07 Jun 2018 07:27:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 7, 2018 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
Hi Martin,
>
> I've added commit to meta-qt5 master-next with -fpermissive and verified
> that it builds for me again.
Thanks
>
> Now when qtwebkit built ok, I see failure in qtwebkit-examples:
> http://errors.yoctoproject.org/Errors/Build/60754/
>
> This might be a bit more complicated to resolve, are you interested in
> qtwebkit-examples as well or should we remove it as you did with
> qtquick1?
I am not interested in qtwebkit-examples - anybody else?
>
> And for qtquick1 removal, one more change is needed:
> ERROR: Nothing PROVIDES 'qtquick1' (but
> /OE/build/oe-core/meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb DEPENDS
> on or otherwise requires it)
Will take care.
>
> Cheers,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
Andreas

