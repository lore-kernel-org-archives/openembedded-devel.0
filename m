Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 542217D5F7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 19:25:36 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id y10so14991058itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8erlphr1hzCmnofGlSOFhIHWj08TjbOzgjKtgDp6CQI=;
	b=PlLJUvpeFWIycMN55aNHCK6fwGL3bZaTl18UeZqHyv0whAxbiSHEWRw8MFpLGrLjeF
	6E8w3gC5P79g670Rtu0Z+cSl83bdAk8XtiBrX8bl3CsWc+lLXDWfEyMV0eYlktUvyUWf
	dgY0ZXh+xlj8t3ZLwpiukZEB7r44vPRGUesAK68fMYJptsJLLFjUWswaQnJBVd0pes4F
	z9LWw5DBmVFQcj5SSRNTvymNxbq0ussE8xHznMVbuv1W8/muUaJj7lqFRTtcZVxR1Y5+
	gMugTq7qspXMgSDD6zqufpUw20yFugNdMQ8yQbV3YmnHbw4kACbgIzvc4WnEgFbw83xK
	C0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8erlphr1hzCmnofGlSOFhIHWj08TjbOzgjKtgDp6CQI=;
	b=ivhVJAycYmliIm9pmUfkoareRUvjsmgoFrTqdlHoBmpeIl5AqAqfnRozBpkSj4dLGA
	pZZk9KyXPfXcJfngz0s8wy+CU5LrRk1KEJ+7Auny3nQwttgn8iED6mXlJcRmEo/Eos14
	ao+UNbUg8NSUS2uuTIE88wT0FrAz9YAodZbMwy7+ZROSZWkyiZSrae2ZnWZDgL12b+01
	5EmaHqZPJ79WeiOdFxUXf9v0bSCLM57zRQsFg80zHDCAAuI32jZ4wAmjP0mbfygN1jjB
	3v8ziFHfF8bmFph7sSx+5KOwSwrr9AmSrcLqBIxrDX2rKmov6UB9Edol8PmoKjVX1Pgf
	qHVw==
X-Gm-Message-State: APjAAAW1YYqdEZjP8StfHPSJhIXYWMNZVZRT1v7/BRy0lrnmQWwzveoL
	wXd82BixrrNBqFuwgD03sNpUd8lbsiUpqRxu6JQ=
X-Google-Smtp-Source: APXvYqzEBusCKJ9rJcQ9mUqdfhdrGO20T/TfdghFxtwpBP5xCN12OBSpI+I3F+K7lqh7gmvg1ZbYBbjErSTA88p1q/8=
X-Received: by 2002:a24:f802:: with SMTP id a2mr12830945ith.24.1554578737420; 
	Sat, 06 Apr 2019 12:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190406184223.28699-1-raj.khem@gmail.com>
	<CALbNGRSp_1Aji=iiFKkRGAiH+XKdMCLasA8FUwmc8B7HYtpz1Q@mail.gmail.com>
	<CAMKF1soxcOryupYNJ0Pu=5dJGg8ZcCZM+wMj5PyXtK8C9nNAxA@mail.gmail.com>
In-Reply-To: <CAMKF1soxcOryupYNJ0Pu=5dJGg8ZcCZM+wMj5PyXtK8C9nNAxA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 6 Apr 2019 21:25:25 +0200
Message-ID: <CALbNGRQxPpOQ3conq8gJAbhn3TT6qj+JHJdaJUQhWG30kp6KgQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Fix build with clang
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
X-List-Received-Date: Sat, 06 Apr 2019 19:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 6, 2019 at 9:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Apr 6, 2019 at 11:53 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Sat, Apr 6, 2019 at 8:42 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Detecting libdl for dlopen when failed returns
> > > "none required", which then gets added to linker commandline
> > > and inturn fails to link with errors obviously because "-lnone requir=
ed"
> > > is no such library.
> > >
> > > This patch is not musl dependent, earlier patches clubbed it into mus=
l
> > > patch however this is needed with clang too regardless of the C libra=
ry
> > > the reason is clang automatically brings in libdl in OE and hence thi=
s
> > > test is failing.
> > >
> > Seems I was a bit over enthusiastic - thanks
> >
> > Out of curiosity: If I remember correct similar is in musl patch.
> > Doesn't this cause conflict with musl patch?
> >
>
> I have deleted that portion from cumulative musl patch
>
Ahh OK missed that

Andreas

