Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id A302260116
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 14:31:53 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h126so12719961qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2019 07:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a6Mh87+M3D7rrfF2AXyWdGpHD3iGgUB4HGU0ToUPwHg=;
	b=SkcRwQ+Bkqufi7fpY/5B6U0Drym6kt8OqUrYF+mHxg8QehO04qr9DSPv6C5FVQijam
	FuKrt5H+3BRa/yZnloREB03XE9wcaJ/w2untGo+KCoeLecpaqKF5lkxqKq270AV3fng0
	bjubsSm7j/IG7iJMTSy+/MZh+UOFEhO4Rffp+GbO8jizXSwokLkBbFzFsxjZjHsGiAVN
	u/z+l7FF+/4UE/EbgkaHgjvQ+SBNjHqsogLbxGaslAGQOw2wQkRLsFoiUpcUMzG2t/bL
	CcpxdN/YwPI9tYIt+ksrocoQGdDEDyv/ZQv2GqUHgFGiWz6NoTW4j6FbEuUIazVGQ/ax
	st1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a6Mh87+M3D7rrfF2AXyWdGpHD3iGgUB4HGU0ToUPwHg=;
	b=gja6W1UGyzSUEoaP8nJ8ArnW1BKmUnf1btxNIp25quLYNJXntjMjmmfKPsD6Y/V0kF
	cXTEAeGyMwpELPUUrWsHBEkBI7W4TWzPLk0wCLBoNwbBDGE2RaugcLxGlMg/XhDKqjM1
	wOsLnqY6MvQymD7skwv7K6T7rPnb8y+Lc55WbxzCKzCH7FpUS3RZG1MKMpJEq925yIHA
	0EGaBCEaHhDjemhNU9B07ns3oZ9bGrMNcuZEoDG4fkWMOS1xBwNWHw7XkmrtaipBUUU3
	RylyFxii35PYsWG7HCs7R7o/LYFSNdv6ZVuS1R0MY5bSBA9CaKmMhoGVLv/n7B4LOC1O
	0zTA==
X-Gm-Message-State: APjAAAWgubbiIooXPcDrPK9CkWtUR5s2l2Qb8z6VFreO+z9CRn7/+egD
	P8bIF1zoM/rWT2WHGrfpl1FeX/nWAGODCUaTHKOuXLXD
X-Google-Smtp-Source: APXvYqz9NtITJXxDYFXCQp5JVLESsPktnFErWdLsALt+1G55FvWzpgm2KbGpyh77aHqGNyNkv1y0FVmGX3jSi2+pQUo=
X-Received: by 2002:a37:6651:: with SMTP id a78mr24014899qkc.474.1570458714154;
	Mon, 07 Oct 2019 07:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191007052019.1127879-1-raj.khem@gmail.com>
	<20191007084244.GA18024@localhost>
In-Reply-To: <20191007084244.GA18024@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Oct 2019 07:31:28 -0700
Message-ID: <CAMKF1sokw2kMcS-iCr4znAmZUPq=iQ-5kYZM5Xsp=hGaV-TF4w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] README: Document need for 32bit compiler
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
X-List-Received-Date: Mon, 07 Oct 2019 14:31:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 7, 2019 at 1:42 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sun, Oct 06, 2019 at 10:20:19PM -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/README | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-oe/README b/meta-oe/README
> > index 0e9f8423bd..347816b0d1 100644
> > --- a/meta-oe/README
> > +++ b/meta-oe/README
> > @@ -7,6 +7,13 @@ URI: git://github.com/openembedded/openembedded-core.git
> >  branch: master
> >  revision: HEAD
> >
> > +luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
> > +e.g. arm, so ensure that $CC -m32 is functional on build host,
> >...
>
> This would imply "cannot be built on arm64 hosts for 32bit targets".
>

Mostly yes, but I have not tried an aarch64 host for this, maybe worth
trying to build
for qemux86 on aarch build machine.

> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

