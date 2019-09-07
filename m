Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 946C87F477
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 14:36:16 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d26so8661596qkk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ed+gMjomjGwM/SLzFaTXXEH1n/GRL80a6NoLK0qdu7g=;
	b=evYwwMTKLKgjWJQSVis7owofn2x7t16JPbpKUAUzzgo37zcEKvMws0/ZcVOUM10eZT
	d+QeNV2pv61HpHLjucB21mnP5jG+25REwtUJQi7RT5cPd41dx1M9dBR7Maefe1mOQwmq
	1N9tULia3F24Nh1/FE2LFFD1qHZ2X7BBfauDIUrH2USsgaJ97K/M2qRMkHk0ukr9fu2w
	KSTT1YBu5i0bovS+ho4BXIfPL7jr1Q9hF+YgKPMgtOtECi1efTWaAw9gRjcTRkXzcp/b
	DvBq/T1/IEgRePtyUPoieF/tNKgkuyH4HoSUskx3F5hCoaMQne46DsFkjUNI0evU3Mag
	XhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ed+gMjomjGwM/SLzFaTXXEH1n/GRL80a6NoLK0qdu7g=;
	b=pZGsaCYJ6ztdiSYgfTjxWg0SDzNGR6+3slmH1JHRbTPCl2QdulquY+gbm3LpTRmsJS
	BwOIiwGajSvV9XDu07cq2EIl0MRkcON4oLj7TYf7HEwo31PLx+wv4wP3Oe7FHI2fXyTf
	xjVSsKzQO0ehRanIoVCLiChNs5+rMPSo0WeG6Q5k0NEzo3nr72l+3B03N+zP3odQcd4K
	97+usXwfqiCUfFJUrht8ZU69kvfZYc4Pxa6Z/7YutPkgK31bs4MbNxMJfK/FUhb/uK8z
	ok+3LibfnGK+FF2k0N58VY9TS1fUh5u52IRawZnu7acK+L9wGgt95O6+tsFmmtamvliy
	ZXwg==
X-Gm-Message-State: APjAAAXAif0DvE3d8XQa34HgpkSdzd/RvSHzaHHKrFo4np85n5+UGq2z
	12FS/jjz1y4XueO3/+HXxm53BK5nKqYfUXpICZA=
X-Google-Smtp-Source: APXvYqxwa2MX+M4LU/wHmzg4a7Psz8rRyLioha95KfRAKqSwcLQw32/xHcrOq0s/crGDIqZeUYOhd/ecjc2n129CE0o=
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr8109997qkg.337.1567866977011;
	Sat, 07 Sep 2019 07:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190906212513.16415-1-raj.khem@gmail.com>
	<c74a44cc-b085-e526-eabb-bb56441a5362@gmail.com>
	<20190907102106.GA26201@localhost>
In-Reply-To: <20190907102106.GA26201@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2019 07:36:04 -0700
Message-ID: <CAMKF1soYXXaF6GacgUJn0HQyYDgiY_QShxbN3RB6z0OWS2xgTg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Sat, 07 Sep 2019 14:36:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 7, 2019 at 3:21 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Sep 06, 2019 at 05:12:24PM -0700, akuster808 wrote:
> > On 9/6/19 2:25 PM, Khem Raj wrote:
> > > Newer kernel UAPI headers for mips have moved these needed defines
> > > around
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > warrior too?
> >...
>
> No, this is not a problem with the UAPI headers in warrior.

anything that's using kernel 5.0+ UAPI headers has this problem and
warrior is using 5.0
for linux-libc headers. see [1]

[1] https://github.com/torvalds/linux/commit/9bcbf97c62931f27ab2c52f0848dec0cd48aee78

