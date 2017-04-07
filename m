Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB5B77D7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:08:10 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id c55so22111187wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Apr 2017 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QDNxefD51gnJMfKdwZbqMXLRDTdvGdU5fNAOGAIVZug=;
	b=byTnIwQYwqNysjGmb/Y3J2FC29eI2swOTN0UFyVw8Z5nIeTqMWZozkfyDXCtlyX+fG
	kL28Lz3fFYekzzZjekznjdDZ6tRAzy1gOthkJxF4GkoGVz9QWJBy6fY6iZ65/McVx8ww
	TJv1ulZYyyiOMjDtdETUEysTpFxVGRXGIsdFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QDNxefD51gnJMfKdwZbqMXLRDTdvGdU5fNAOGAIVZug=;
	b=gIqxuZjj/G5mqRkFqHcJnSQX5YW3MpC8cBYA++Ol3qedX0sY09Bax15nZzbotDEyV2
	HTA0JvAcmobc+9SqxaLwQQRJu+z7MCFmfLwju4c68neYWR3wQfkiERVoT2EbOt0cGBg5
	KOpl7s27nf5fVHImBO+h4YRVQOalKfLl/GJPp2xrlSke5VJP35MT4aoeVRcYpWc+zy3q
	MSeRGSPrWoIa7Hmrfkcb2Jn1Ds8gdUeDS6x3/CGGuL09C255gH4DwC1vzQipHwjVTM0v
	OuqFrTzdT4DLiYOc4MG5BrfpdMYM+rp+r0D7TMQV7ucDSOE+Ls/7rZ+akbQCsON77fIW
	podA==
X-Gm-Message-State: AFeK/H29GphytuecCKWgvmaJGkSedMMdVN8GfXrWlm1A25OntZf6UBJhpf211EdzYtcOzHFZC9LAUthanMVthmI6
X-Received: by 10.28.38.133 with SMTP id m127mr27117203wmm.41.1491552491804;
	Fri, 07 Apr 2017 01:08:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.13.1 with HTTP; Fri, 7 Apr 2017 01:08:11 -0700 (PDT)
In-Reply-To: <CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
References: <20170403183815.2997-1-twoerner@gmail.com>
	<CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
	<CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 7 Apr 2017 11:08:11 +0300
Message-ID: <CAGNsrLCHkTi903CpRKq5CaWYwMWm1RmkZ9F2v9BMmLLb2UUypg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: 52.0.2743.76 -> 54.0.2810.2
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
X-List-Received-Date: Fri, 07 Apr 2017 08:08:11 -0000
Content-Type: text/plain; charset=UTF-8

Hi Trevor,

On 6 April 2017 at 23:37, Trevor Woerner <twoerner@gmail.com> wrote:
> On Thu, Apr 6, 2017 at 3:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> In my world build it (surprisingly) didn't fail, good job Trevor!
>
> Sadly, it does fail with one specific PACKAGECONFIG: ignore-lost-context
>
> I have a fix which I've build-tested both for x11 and wayland with a
> bunch of different targets, which is just waiting for run-testing:
> https://github.com/twoerner/meta-browser/tree/contrib/twoerner/chromium_54_pkgconfig_fix
>
>> Are you willing to check 2 QA issues which might be there in older version
>> as well?
>>
>> chromium-54.0.2810.2: ELF binary
>> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
>> has relocations in .text [textrel]
>> chromium-wayland-53.0.2785.143: ELF binary
>> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
>> has relocations in .text [textrel]
>
> Yes, I'll have a look.
>
> Currently I'm trying to figure out how to move past this version.
> After 53.0.2810.2 the current method OE uses to build chromium starts
> to fail because (as is my understanding) it was around this point that
> the chromium build switched from gyp+ninja (what we're using in OE) to
> gn+ninja (ninja is like "make" and gyp/gn are like the autotools)
> Therefore the gyp support starts to break down due to lack of upstream
> maintainership. I'm starting to be able to do successful chromium
> builds from tarballs on the cmdline (outside of OE) up to
> 57.0.2987.133 but I need to figure out how to translate that into a
> recipe.

I think Zoltan looked into it at some point but I can't remember what
was the outcome...

> Oh, and it'd be nice to have an aarch64 build too.

Andrey in CC is looking at submitting the changes needed to get Aarch64 added.

Cheers,
Fathi

