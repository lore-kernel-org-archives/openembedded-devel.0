Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id C1F7378411
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 18:23:53 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id t204so4374732ywe.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 10:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7tTN4CwcIGU6qCmve2WcxBGIJOPHTOw+c6mefSxLLJs=;
	b=Wo9HYdw/sgPMKm6yHANK3Z/knhuBHzcEdlBIasGwDFi0Mcipl2YTc/poHqNncD8CvG
	XUyXCEGfRHvq5hKhObWDZYQTW+vYu8AHlV+wSPk8xNxYNYD5Ro2nxPq2RpLueIbAZyB2
	PoHhTXvU4pC+Cggv4Ejtl9AQkZPgiPnJ6zLO2csNfNckaXIwRy0ZOaHwlPG0vyCHYXXm
	Im7heNDRgNziExfvkI+pOSfuP9caLHeO6uFEiFUAP7pO72MDGrZ1JQlb0BzldTVM24kA
	oczx1KKdvrk7fFKlcjH4vBlkou6/li6GaXl3L968qmJc84BBei3lUpxZAxPsiyaiJOd2
	g3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7tTN4CwcIGU6qCmve2WcxBGIJOPHTOw+c6mefSxLLJs=;
	b=VKH3EYOIwvPiRZSK+wIFcIGkSWWw5IWtImoq98LDjy74USUNXmyUl8ZDL7yi1nK5UI
	aVZFSRTsR1uPpbpxBe7UmYGgWqIhhGSaTl7dbwlANHXdgke9m/wCkO7llHHaEKBPUCeW
	1ahSWdaLbRrKGaMbpjdkxtoCzRCn9OtTb3t8Bk1MtsUPCyGngeGCcsG0gUEKL8XHf5X+
	tKNMmV/SiLC43dFc0qKoeJy9VKG+k1p+Maagt7LdQOEme9ALMQ5S7EayBz6hziV8Er6P
	Rk3+/zBHGhFpSjVgAH1To0WW1NDJflM7pOkt6b2rdPzNly6tte9SVUWasFCgz/SSGNgv
	9vfA==
X-Gm-Message-State: AJaThX4HEooGG+Ia2JRQwqQljkb0EeL8PHXd88Vdcs2eZLOBqvPc4giK
	nOKLsyHDlzDz3SCQQ+33R4fBk3PUYIzssHBwEm0=
X-Google-Smtp-Source: AGs4zMaERSIOxk9SzYYulxkhf+qKWV3QHinGUkalHG1Tq/HmxxnV2g36g9+EsjDU/+Z2cmLyJfrlb9a7RFC0KACRq6U=
X-Received: by 10.129.58.3 with SMTP id h3mr4624848ywa.236.1512152634526; Fri,
	01 Dec 2017 10:23:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.98.21 with HTTP; Fri, 1 Dec 2017 10:23:53 -0800 (PST)
In-Reply-To: <CAMKF1sqnSJnwFr9fsruGkW2btnS7hDuUKGpSg0tYwx9mJ2UwiQ@mail.gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
	<20171201110816.13519-5-schnitzeltony@gmail.com>
	<CAMKF1spQVcCKkpfBng=BdfvTyGyESKtMABy7gn_qqBK-2Fv5aA@mail.gmail.com>
	<CALbNGRQXaw9wwhv_-uBJbRfUhSJScrmRJ9JSEWGazbX4zdQtHQ@mail.gmail.com>
	<CAMKF1sqnSJnwFr9fsruGkW2btnS7hDuUKGpSg0tYwx9mJ2UwiQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Dec 2017 19:23:53 +0100
Message-ID: <CALbNGRTaPxAxJrMWW1b0A7pPyFwymLo0-nAMaN+63UTgVk8M0A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 04/10] fluidsynth: performance improvements
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
X-List-Received-Date: Fri, 01 Dec 2017 18:23:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 6:52 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> >>
> >> > I wonder if gcc could be initiated to see if it can vectorize the
> code,
> >> > here
> >> > have you tried setting cmdline options or may be pragma hints
> >>
> >
> > I've sent patches like these to some projects. If I remember correctly
> first
> > one was jack2 [1]. For that I wrote some performance tests [2] and tested
> > vectorizing either but with disappointing results. This is ~ a year ago
> and
> > I think intrinsics are still the option performing better.
> >
> > [1]
> > https://github.com/jackaudio/jack2/commit/77bb8be12e0d856fbc004cf57185ab
> 36a2df04c2
> > [2]
> > https://github.com/jackaudio/jack2/commit/c32b823860bc8e887774ab10bc3e9b
> d76e85e3f3
>
> interesting. does it mean that vectorization sucks in gcc form arm ?
> and works ok on other architectures
>
I am not using other arches than ARM so I cannot help you here.

What I can say is that this patch together with setting fluidsynth to multi
threaded operation [1] helped me to play MIDI arrangements with >20 tracks
on Raspi3 without audible issues. Before it was a nightmare: Output was
distorted totally and XRUNS reached numbers > 1000 very soon.

A bit off-topic (but only a bit :) At the moment I am writing an extension
to qjackctl: Some chart for so called DSP performance and XRUN frequency to
gather reproducible numbers. So I can see exactly what change is an
enhancement and how much it increases performance. Once this is done I plan
to send this patch (and maybe others) upstream. I could try vectorizing
once again then.

Ahh - maybe I should mention: The patch causes effect only for fluidsynth
in multi threaded mode.

[1]
https://github.com/schnitzeltony/fluidsynth-dssi/commit/bad09c6f5c5508c5f5330aa5188510f975e50c50

Cheers

Andreas

