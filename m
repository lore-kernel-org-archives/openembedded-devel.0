Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id B7E8571CA5
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:22:05 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j53so68598083uaa.2
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 00:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uJEXbKoTNh96sqCRwm399zLFbGyCg6arQHE+i04rF4g=;
	b=Nj1QwMEgSuIKgdTdd8jCO++IHyWJS/cRuLj1aFQIIjhh9sv97WnFHNQf5i47cGWOB1
	qU+yau3kRo9fLp71ffAOEatoxGxQVDnOYaqAL2GmBqBE+NhvDU4DgkKRPePetUg3j0nr
	NYMxpDsMoqkaZPk7oP6bGR6ouYnnDFyuLoomsWS/bs1O+0xF7APQP7Rd/FjbYgDTOAU9
	HdxHCKXXbSCSp2NQqj0NIJMgi4efDuhi9RCb1t2NVFS4F/4VCxK600UU7GnfJJ1zGnMA
	Ceh2HF5qqNLvPi7J4HkxY+RnHhwR3iYjO03UIeiCQtdO3Kkww/vWFdU6lT2eMom4Z7mn
	ECGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uJEXbKoTNh96sqCRwm399zLFbGyCg6arQHE+i04rF4g=;
	b=CjVAT9WWL18S5QYOqTSe7Gq3c7MNOoviB/kydKg59/9+BldCQwzHE1TM1CJeNFwaQK
	dhwz9HRW39GEuBBRMkaR5+AV+ConoMr4+fnMLblQaxke6jDlJMVKl7gXYQZqpccn5pd+
	4U2zwtiD4JVb69a2niqFOOQpcJGk8OxsSZcjDqz/SK2OwIoaXFLf8puqKZJHi0AVDwj0
	BRn/lZfhdbFT+RCeQw+GmYR69kjpP9HiVpUtT5rAwlJiaUrkxsUL1a9E18P8Nl52L25m
	qxA4zPUy2bLSOs/38ffCbx84Eu6vC0CTTWnE40CchbCtpKYFRBrlxGKALMtZKD1aqneK
	Zkrw==
X-Gm-Message-State: AIVw113rfNCMfFICS3dBB5Wd5lVbHxL0x+P4+HYtyYD2Phgk44TUaeUC
	VbuHaN5ic14o0MJM9Ve3dIeyyuyJZw==
X-Received: by 10.176.26.5 with SMTP id a5mr11169755uai.96.1499757726692; Tue,
	11 Jul 2017 00:22:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Tue, 11 Jul 2017 00:22:06 -0700 (PDT)
In-Reply-To: <CAMKF1squ2QyqpKvUKbz7QP5YsBvd94B6jFaju0hL+qWy6cA7tA@mail.gmail.com>
References: <CAMKF1squ2QyqpKvUKbz7QP5YsBvd94B6jFaju0hL+qWy6cA7tA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 11 Jul 2017 09:22:06 +0200
Message-ID: <CALbNGRQi_rdechQn35Dv+R9-42cvVahNt=K8MPYkaqhUhF90_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qdbuscpp2xml native Crash
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
X-List-Received-Date: Tue, 11 Jul 2017 07:22:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 8:42 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Andreas
>
> This patch was added by you.
>
> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-qt/qt5/qtbase/0012-qdbuscpp2xml.pro-do-not-build-with-bootstrapped-depe.patch
>
> This is actually causing qdbuscpp2xml  tool to segfault just on invocation
> when I build using on arch linux host.
Have you tried qdbuscpp2xml without this patch? Although it does not
solve your problem: I have Fedora 25 on my machines and qdbuscpp2xml
does not crash.
>
> I tried to debug it, it seems it gets lost in translations.
Maybe some dependency is missing on your machine?
>
> What is status of this patch ? has this been accepted upstream ?
This patch would not have a chance to be applied upstream.
>
> I also tried to apply two patches that were suggested on qt mailing list.
>
> See, https://github.com/kraj/meta-qt5/commit/df4ca3897b3929f380623629bdfd935c335e49b1
If I remember correct - I had tested at least the first patch during
discussion [1]
>
> while it gets me away with segfault, it ends up with more errors.
>
> Ideas ?
> -Khem
Hi Khem,

Will get into this further today evening.

[1] http://lists.qt-project.org/pipermail/development/2017-February/028756.html

