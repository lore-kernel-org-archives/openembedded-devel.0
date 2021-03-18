Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.141.1616097131302753667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=fiEgiebl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.51, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f51.google.com with SMTP id o19so8180299edc.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFUJU27fu4lMA/UYJ8QXN1wl92wIOyhn8sJ3slt0qMQ=;
        b=fiEgieblS6RXntuS+TwDZ3izcDTYTHrOaiNiBC4LqM+uyfTU5/Qfouf0kgaFBSBz4m
         2CGy+VRwI3HIE9nOxYMU3XnFUBFmhJC2GRC6UzC77hC/VK8KzBKsfpARdYHwsRIZuFB9
         T9Lq11KIKwAECEeQnTJ9FvrkkvrXVNKwfKTWfzJQ8zw22GfuTRI0awYnagtlV4iba0sR
         hocEapH0qmhydbl1r6vBaDCeiQs/SZWgAdhnpsij9f3+f2cZnpjipD/blUpzN8acthFt
         GjWNZI4D0iRtgUt7X68yNiLN18m6kxpXWaM31OtzwMlaHJllSBwCGb8YyHSEk7BhXfQe
         fyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFUJU27fu4lMA/UYJ8QXN1wl92wIOyhn8sJ3slt0qMQ=;
        b=VkHNSPW3J+6wKhA7BHK7IXwbMQ2hAxK38z7OVvNWHqqKsAVQrlt1n1XUPirGtOIHsI
         /a/toOSxA0RrTDmoi/bU8nc6pxRfIT9LsAsbiIjBABfoSkasNlPsYjy8mcvjAUPx1Bfe
         ntGIbXIctbHrp5lpQp34X9mMj6U/qc2SqYFwqUgzcH+sm9Ch7thL1WNqqZhhH/gc7wNz
         kMG+JkALSjxVEnRCB6a2zuqRk6eH4VvQeTdAQMIIJJXR2V/2z0YrEF0P/0f2M5+Gp/ZE
         TiIiljxFxBy7L+pKPwSLktimLktG61QczbQZ4CPwUmtFgh7rys03QGkGHQGxcEpZ5krL
         JxAw==
X-Gm-Message-State: AOAM531BcpQJOqcVAYLPcnOqYnSBscTi9TXdsjVRY2KbeztBbSnX/gv4
	8OxEw3nKsLQWVRLVQNzDNQVZXrh1goNoe3gkxv2vKg==
X-Google-Smtp-Source: ABdhPJx0lyvII+Vga33TCvvc3vQC3RJfRMtuXG1UWnzB7SphEf9mc+BQjGDck7dB6o9d96Yzf6CzkxTD/4zrgrnB1TM=
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr5804327edu.124.1616097129766;
 Thu, 18 Mar 2021 12:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
 <20210318174457.gm2no6omtd6qgzma@apollo.localdomain>
In-Reply-To: <20210318174457.gm2no6omtd6qgzma@apollo.localdomain>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 18 Mar 2021 20:51:59 +0100
Message-ID: <CAMRc=Mc8WCeCobNeS6=qyHQH43UO3mf-hG1YHUAFCyrTeANn4g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] mpv can't find x11 components
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 18, 2021 at 11:47:30AM +0100, Bartosz Golaszewski wrote:
> > I'm trying to add mpv to an image using the minimal-x-session. The
> > build fails with the following error at do_configure():
> >
> > | Checking for X11
> >      : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >=
> > 1.0.0 xrandr >= 1.2.0' not found)
> > | You manually enabled the feature 'x11', but the autodetection check failed.
> >
> > If I build the core-image-x11 image, mpv builds just fine so I assume
> > I'm missing something in my custom image (or rather some dependency
> > isn't pulled in by the recipe).
> >
> > Any idea on what could be missing?
> >
>
> do you have x11 in DISTRO_FEATURES looking at config.log file might
> reveal more on missing dependencies.
>

Yes I do. It looks like the build is looking for
/recipe-sysroot/usr/lib/pkgconfig/xrandr.pc (provided by
libxrandr-dev) and it finds it on current master but not on dunfell
that I'm using.

It doesn't look right, does it? Shouldn't it look in
recipe-sysroot-native for any such development files?

Bart
