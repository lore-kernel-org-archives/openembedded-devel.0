Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id C114971B40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 03:02:33 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id b11so3377179pgn.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9cXRcy2/DPXOQiF3IzIY1J1yn0uD5E2vjp0AnbXAuyc=;
	b=eaBGGZHFNzHf3U3BCBMBsKWQ4HqyEzMEfBy1xBz8DMmJZGcWvo+5KSB1El6dwdUVAw
	JX56CrI7wxBahoDrJI7lgh37ixO4F3QBzLhyEzKmf6OoMkBXR9rv8Fc4Fi0wAo+fF5K/
	28r3n4N3MQF1BbD+Ax78j86YRLnglKG8AZmozulKGLskhv3mUcvYdCj2FqGafB9NZDyq
	o2eJX/SW6WPZMPboai8vxweIEUgmGVIsbMBvsdYkdq7cjQXBv4OvKOkQTsq4mgyfLZEe
	ciu78SYCEldi1mlHouNM+ekG+DGaO5df80EHWQZb4elxju6W/vL+rRPEnJd2Jbtubper
	s7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9cXRcy2/DPXOQiF3IzIY1J1yn0uD5E2vjp0AnbXAuyc=;
	b=DtG6aJJlT56LfW4Nmz422TzXthVTViQW0IgeVFfLiNNvHzYcQRCdVCMJcHmB+cscKm
	/ZvkZjZ9I0LJ5hG/1jrTMxTQWwoD7K3X5PWLREwL66PJ9OaGLrvgh1C14tOifIgpKDw1
	Zv1GFPvlox6nsL39mDNv3181Lf/3uqk84z4YY3yECoDTFkei+QzuDVf2dA7NQsjqzLwF
	xXeVrTam/MCbUkELvN1yQhCji2sSZQfq//iwYx4j+6gis0NcIOl48kzFpXaykxwOOkdM
	LD2quoJua1Kh+8cAu+SBlo6i9w+cgLA7Gv8/4910U0SWvXO29kkO/Gd+b+Rh02akMpmk
	+jYA==
X-Gm-Message-State: AHPjjUgX70dLUIr/PWWII/sfvUky4OBayWFjxwnQeo2gBY1BQC9Cru1C
	zdst5Za5gEKF0FCU5YvYY2jpevbP857RkP8wFU0=
X-Google-Smtp-Source: ADKCNb6EIduH4RWbsqLg18erFYF3OSZiTJ40idkhSTnLo6ZSfY/jl0FOz3LUhOGIzPmEKZlSWpQ0zFrZ6J6f363nWdM=
X-Received: by 10.98.202.138 with SMTP id y10mr28475816pfk.151.1505617354763; 
	Sat, 16 Sep 2017 20:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Sat, 16 Sep 2017 20:02:04 -0700 (PDT)
In-Reply-To: <f91877ff-3324-a484-3164-7f6441cabe25@landley.net>
References: <f91877ff-3324-a484-3164-7f6441cabe25@landley.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Sep 2017 20:02:04 -0700
Message-ID: <CAMKF1sqppL68hDoGdeLmRpEG-m0cyTyTOo5Mw9rB+6so25b88Q@mail.gmail.com>
To: Rob Landley <rob@landley.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Openembedded toybox build hiccup in config2help.c?
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
X-List-Received-Date: Sun, 17 Sep 2017 03:02:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 16, 2017 at 7:52 PM, Rob Landley <rob@landley.net> wrote:
> A couple days ago you brought up a toybox build issue on IRC, and
> pointed me at antergos-live-iso as a quick way to get an arch linux
> build environment to try to reproduce the issue.
>
> I downloded that and booted it under qemu with:
>
>   qemu-system-x86_64 -m 2048 -cdrom antergos-live-iso
>
> When the desktop came up I told it not to install and pulled up a shell
> with a word search for "shell", then did:
>
>   git clone https://github.com/landley/toybox
>   cd toybox
>   make defconfig
>   make
>   ./toybox ls --help
>   ./toybox ls -l
>
> But the result worked fine for me.

Hmm, it use to work fine for archlinux too. It started to fail few weeks ago.
So you might have to apply all the updates to distro

sudo pacman -Syyuu

will do it.

>
> How do I reproduce your build issue? (You said you were having
> openembedded build it against musl-libc...?)
>
> Rob

