Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB6187D80C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 19:27:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r6so5893876wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 12:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ouMFKeAbHGYsX7GtG48nMqOnmOCIXLSAWzS1ecW8Ag8=;
	b=j8rrz4xPs/n/KRickoBxjXtGFe2pOsL8yFwCFB/+dwfOP8Jy4N38QMC60SaAmZoxsD
	yiey7uFcq5zoWNY2u3hp79wxlSNih2piWr9DDtTS5W0/t082Vue9+UW9COmDV8+cWlGf
	GPQuuBOAUmucOtyhxebDj2o4tPa7MBTwUxoqiaEPsnC2ia7yv8a+Sb1RCwvKsWC3cFPj
	fW08/p5CgKdk41U1ICtBtC4usRPb1knunHSvkxHGyN/qXpAZ+MOCNskNQTo4Ljkm1xZS
	tFUj0K+8VAze8261tP4r5VLuWQFFuqK2nocoU/IE2MYqQB/Wo5G037z5pN5BW2YB4ClD
	3UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ouMFKeAbHGYsX7GtG48nMqOnmOCIXLSAWzS1ecW8Ag8=;
	b=m7EB15ljrFKw0l9WRvkZY+kmHKi7Sfli6i01gjeuYy2be8kWfrlItl4iUWSravNxk8
	jHSBNXewKM8MgFeNgdRVXg72uSPqrqZUkBjz++cEi08cdvHfKjxpUlCdwhBPwDNC9KCX
	ncigWJGyBDR9hxAPLAFVG0P+P8zdC6qmw9aZLgjGgIoaGU7iQiOy1FiES0RaiCwqNPU8
	A9lH+VOSBzODETL4JxB4klFi3vAyklzbIKk3RUpF5nQUeK2eQCHCZMpBcpSgNZxVn9Ux
	sCXi5JkfPlk7hI5hDxvepcVWaEC4sqX621Yh3Po1/3Sf5kxZ2Zihow+kUqetGU3i92wt
	czEQ==
X-Gm-Message-State: APjAAAX3SJ2vuQfvmSX2J0LmQUErjWBw+pjhUr/jMwZ0r4+gY0siqhc8
	U9UVQtPUx/MkYuRX4ZelCzg3A7Q+MMhTCd1dEGM=
X-Google-Smtp-Source: APXvYqwrV9oOClr8SfM5jDgpuBPj9dx1bLzvb0iu06hyMFK6EwfJO0vTgNhmlGpHxxPK2XEjr33J1Q8fUg3MLNvpegw=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr6702205wrr.129.1556306857188; 
	Fri, 26 Apr 2019 12:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
	<20190426052056.GB26023@localhost>
	<CAMKF1sq3J1pjWp-sBijwi4VzGVAZWQCk8uznx0VbtODixTFY4A@mail.gmail.com>
In-Reply-To: <CAMKF1sq3J1pjWp-sBijwi4VzGVAZWQCk8uznx0VbtODixTFY4A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Apr 2019 21:27:25 +0200
Message-ID: <CA+chaQfZE7kZHown5xfxZQf+yQoB_iqtuH=LFKJhhoqJ7tVF0w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Fri, 26 Apr 2019 19:27:36 -0000
Content-Type: text/plain; charset="UTF-8"

I'm not using ne10 or libopus anywhere, it was just breaking
sstate-diff-machines.sh script by adding that unjustifiable dependency
based on TUNE_FEATURES.

I was going to send v2 with the armv7ve entries as requested by Andreas (I
forgot that armv7ve tunes no longer include armv7a in overrides), but if
someone wants to rework it to test for neon in TUNE_FEATURES feel free to
do so.

It didn't check for neon before, so at least this change didn't make it
worse.

On Fri, Apr 26, 2019 at 7:35 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Apr 25, 2019 at 10:21 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Wed, Apr 24, 2019 at 07:00:38PM +0000, Martin Jansa wrote:
> > > * set COMPATIBLE_MACHINE to (^$) to prevent building it for any other
> > >   architectures than armv7a and aarch64
> > > * with new arm tune files it's easy to have armv7a in OVERRIDES even
> > >   when there isn't armv7a in TUNE_FEATURES:
> > >   meta/conf/machine/include/tune-cortexa9.inc:7
> > >      "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:',
> '',d)}"
> > >   in cases like this COMPATIBLE_MACHINE was satisfied thanks to the
> > >   armv7a OVERRIDE, but then the anonymous python was failing with:
> > >   ne10 was skipped: Incompatible with archs other than armv7 and
> aarch64
> > >...
> >
> > How does this handle Cortex A9 SoCs without NEON support?
>
> this is a valid concern although rare but this combination is out
> there ( tegra2 )
> and ne10 needs neon, so probably its better to check for neon in tune
> features
>  than anything else first.
>

