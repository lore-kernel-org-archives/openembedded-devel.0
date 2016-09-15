Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 11AC2770A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:03:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b184so5894802wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Q4ulJPrHdAthC/PI1k2XbBSToJbi8Dw73VTuKG/RYw0=;
	b=A/FtyqRNsa0i6eyrhp1+cbkLmtooDkiaMUnZfUsTIp/vLpbes3JAGURJgCxU0xg1yz
	psiTqO1X5izNWJLQyCFuSr2DzSEj4upQP1kP188DocLkcen9oHMKXcDL8x3R5rQDKtG+
	P1RzGkUVtiiXz08aY5txdCP8CY1sGNLz2sEzfsGKtYh+Z6bP0AQi+Ix94iPX6mk03gur
	6TlwBePdbPuIiijkug8/5efOHdpHZovLeeV2Z4iiUqZ+M15p7BZbh70eYl/4ZJ6smvOw
	pffiUK8xqL0OFgmM22Gxc6uMnWR97l7D7/3/Wwhaj0I0ybtRKDMGMIYLJ6fC8kQAAekc
	u6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Q4ulJPrHdAthC/PI1k2XbBSToJbi8Dw73VTuKG/RYw0=;
	b=JTzshY//kw/KXwDUhu3JnxK5NYDN46E4KIwhDwmCAdBmFTcVAh39dYY/8qjEQ3R+rp
	YMoOeFMMJwawaYzAM7k9FPWTaXdKYESOX5Caq5tr2cb2pdJJr1nCfdxHNhSuo1cAQkJp
	LlCytzlBJ1Q7HF+XWoqPKYc+8qaVKNMm4CiiJeG57O8xKWIi7upAWZ/PaH+DcRIyoe4Z
	aEvdwtp7aTdDqVieKZ/lks5agklgqnLFkxGaxlJmnVhIOAeliOjDNeOHELcN8ONQgxwq
	YtXdHNZAdx7d/aEdPDCjLZ40rmApcuZuA7D1pW33duaqsgqSgnXEqLOa7WKmrZY1vNG2
	m49w==
X-Gm-Message-State: AE9vXwPoBq9C1QTnnCXfXYwEc55cR8PJvdPTAPaZ4R39oHpAOXAkznrGx+kXkVSSLJN/PSLXpLPRZNEsLwfRiA==
X-Received: by 10.28.86.8 with SMTP id k8mr1708232wmb.33.1473926639863; Thu,
	15 Sep 2016 01:03:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.137.202 with HTTP; Thu, 15 Sep 2016 01:03:59 -0700 (PDT)
In-Reply-To: <CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Sep 2016 10:03:59 +0200
Message-ID: <CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Thu, 15 Sep 2016 08:04:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

WARN: samba: samba rdepends on libpam, but it isn't a build dependency?

is reported in every report (where samba was successfully built)
http://www.openembedded.org/wiki/Bitbake_World_Status for more than a year
- pam isn't in typical 'crowded' sysroot unless you have pam in
DISTRO_FEATURES and it might be always detected when you have pam in
DISTRO_FEATURES.

There is also at least one report where it failed with ld.gold also for
qemux86, e.g.:
http://errors.yoctoproject.org/Errors/Details/75447/

I'll of course include these changes in next jenkins build to report which
failures it will re-introduce.

On Thu, Sep 15, 2016 at 12:20 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Sep 14, 2016 at 11:21 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > What about the other 2 issues mentioned in the comment?
> >
> I am sure I am missing something. I did
>
> * pull meta-oe
> * built samba with this patch attached in a 'crowded' sysroot (good
> for floating dependencies) for arm (raspi2)
>
> -> No warnings/errors
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

