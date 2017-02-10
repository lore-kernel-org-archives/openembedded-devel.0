Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5925773A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 23:15:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so9389231wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=7AUEoRWVKfqJc1Uy1rxqL4Z05XeUXC85sgN30ue3tu8=;
	b=eMiWS3t46orgoCGmCJKzQuD5iHfE+3w31CHxPiyqZZ1bKx5RC7p1dB6lwe28bHhEeq
	G7/uGjRWXR56XzXevJgYbTETgtxhmenfbaGSErBMj5148JB13rGIRBXz/C3qYBDgws3G
	NO26PTdmSLcyGdsbvffIGIF5E4gzvc17mYt5NDeuz92xsDXPoEsRKvLQ/QdkUlBrvmZw
	A0A+jRH6cKjixvzkayG/DNnsdbGwzq5XNsPb0Nq7PyUIKpO0L3yXjGFn7OEcJVWFgziv
	OnkrDbR5ziIdR1+4kbhiy6soFyOn9GLUEdW+SppCam42ZrRHqrk0oF3Al6W4U9gZHuOc
	G8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=7AUEoRWVKfqJc1Uy1rxqL4Z05XeUXC85sgN30ue3tu8=;
	b=WHVeMAwhcJTQt6xaU2P7/jrY04FSsGvoYDWCznSlDXmDjjOOnTTBOrohXwQ8azoUpJ
	y5hrIX6jpWVAxAyD10txTz5CeCW8UdEc820gMukMyRbGoBwKaJwAgBDtLsNoihgWbxWz
	BZ72h8+32KIbbZ4EAjcrrzxegqQFKCIMCz3dwpXxZE/NqNYnqXaOHgncRFfMWkTfKvuy
	AWmKtOaFB/N9orbsohCl6z1p5DNC9ilCwTw0thb6j6LB0Z9X2z7uTJWCkc7gpOWJ3rDV
	SvZ9wyUKL0XVbWiLEhDAszEWf8bpz7XRnkrUiA+GjAUYNL0d7zvrC5y5Pzy/rTbdO79q
	QUGA==
X-Gm-Message-State: AMke39kx0jXapBx49h7f1M8MoPdB3VZnbHKDsQ/DY5w9cgzKIMjEHcURXBMePmv7JP4TAeu7kNHbavbTgYOXIQ==
X-Received: by 10.28.6.78 with SMTP id 75mr10100008wmg.81.1486768545736; Fri,
	10 Feb 2017 15:15:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 10 Feb 2017 15:15:45 -0800 (PST)
In-Reply-To: <CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
	<CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
	<1486660318.13854.105.camel@intel.com>
	<CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Feb 2017 00:15:45 +0100
Message-ID: <CA+chaQdusR+PaaJNB8gp0nqrmV+rRUos+SCiXN1Z3aCUiKHGFw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Fri, 10 Feb 2017 23:15:53 -0000
Content-Type: text/plain; charset=UTF-8

It seems to be buildable when you add:

EXTRA_OECONF += "--disable-selinux \
                 --with-cluster=none \
                "
at least that's what one of my .bbappends does.

On Thu, Feb 9, 2017 at 6:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Feb 9, 2017 at 9:11 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
> > On Wed, 2017-02-08 at 20:21 +0000, Khem Raj wrote:
> >> Can you check if this is the last gpl2 version
> >
> > According to the recipe, both 2.02.138 and 2.02.166 are under LICENSE =
> > "GPLv2 & LGPLv2", and that also seems to be what the current code is
> > licensed under: https://git.fedorahosted.org/cgit/lvm2.git/tree/
> >
> > So GPLv2 vs. GPLv3 wasn't the reason for keeping the old version.
> >
>
> Thanks for confirming.
>
> > BTW, do all mails from openembedded-devel have Reply-To:
> > <openembedded-devel@lists.openembedded.org> set? openembedded-core
> > doesn't seem to have that.
>
> yeah I guess reply-all will send to all but I never tried that
> >
> > I have a mail filter in place which will bring personal replies to my
> > attention sooner, but Reply-To to the list defeats that.
> >
> > --
> > Best Regards, Patrick Ohly
> >
> > The content of this message is my personal opinion only and although
> > I am an employee of Intel, the statements I make here in no way
> > represent Intel's position on the issue, nor am I authorized to speak
> > on behalf of Intel on this matter.
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

