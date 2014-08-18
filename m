Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 068C2610F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:29:53 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so4644085lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=aTuFUhNSiPG/bbh3DJ5SF/gTPlDrLums0QuEuF5+kYc=;
	b=EKOPQ7NavX+DwGVQt5H73nj9t+ICl26GcNR59LjEBylLteuopeHZ1rVPS5Y60FM8rk
	TRkN+qJLbcciCIabw0yQ+NPbr9dT+jNgSbT71so49v2oRywTet5OeA2u2h2R4DGRyoke
	4qJfHRU1mXI5UjW/vwjFr1JAWqhScHq0oNGZjzndCuxcMeP5o7CI3neuCdmvE8SYy2cG
	PGPKXu9EiUDmSRf9lYW09wx5kKk9RPG/vmndP1wBVt5YpmvHJbLLafrzBgnCNnbKk4ng
	oOeYIS9wOejTBXXGFkczhbuBtcRGoM9fA99bauhn5rlmWQICqP1wGJ8uP8Ua7vQl/Abx
	me9A==
X-Received: by 10.112.209.36 with SMTP id mj4mr28816035lbc.26.1408372193794;
	Mon, 18 Aug 2014 07:29:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 18 Aug 2014 07:29:33 -0700 (PDT)
In-Reply-To: <20140818134453.GE12992@gmail.com>
References: <20140818134453.GE12992@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 Aug 2014 07:29:33 -0700
X-Google-Sender-Auth: TBiFgPIhN0H5B2xWspn7_AjfFDM
Message-ID: <CABcZANmKtKEC=VX2La83gpvQVA84yf6VdUvNXv412Nwjk_2zDA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE Devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] toybox in OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 14:29:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 18, 2014 at 6:44 AM, Paul Barker <paul@paulbarker.me.uk> wrote:

> I've been wanting to try out toybox within OpenEmbedded for quite a while
> and
> have finally found time to put a recipe together. Toybox is a BSD-licensed
> alternative to Busybox which may be of interest to a few people. It's
> still a
> work in progress but it already covers a large number of the basic
> commands a
> system needs. It should tie in well with the recent work Khem has done to
> enable
> the use of musl in OpenEmbedded as toybox and musl are often used together
> (e.g.
> Aboriginal Linux distro).
>
> My patches are currently against openembedded-core for convenience but this
> probably belongs in meta-oe for now. I've done some basic testing on
> qemuarm but
> nothing significant. toybox builds and installs correctly though and I've
> set
> ALTERNATIVE_PRIORITY = 60 so that it takes precedence over busybox tools.
>
> Removing toybox after it has been installed currently bricks the system
> though
> as the postrm script runs after '/bin/toybox' has been removed (so things
> like
> '/bin/ln' become broken links and the update-alternatives script can't
> run).
>

One option for that might be to try the C implementation of alternatives
that's provided in chkconfig, rather than cworth's shell version. I haven't
tested it in that context, but I doubt it runs so many external tools.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

