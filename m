Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 992CC77BB4;
	Wed, 29 Mar 2017 10:14:50 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id w11so8041571wrc.3;
	Wed, 29 Mar 2017 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6EoZVvHF7jNeutcqk8wXSQkMNkbTbhhSAKxOyLzjy0s=;
	b=Uze8FzZJ7FbvP75cjOpm1mL6DoO6BiShFxlvj/5K7P9AVXbtOwF6nLIgHAVpDw4TqZ
	PECkt9a0zVUTIV0VucfCDGoKOHpE2sFMgyzwjE0usyWaLI9JJ7K4E/KtgR8Ei4Cootga
	HU4gLMv2Baa4u5kmewj/e4BQWCLO5LuzVV141pwV/PEXLq+1tFZhmYv3qn/qwO9B2BsK
	ZbjoUfc+GDFmhEzvJmYVxlJg3Oim2GXXhk+tkarh9BgaFHOLPYXgsawZpG8zXc08WeW9
	0bn8KkK5xQIyTSKifMDgGIbJDbcD6ppE3BFQnLuMCOTJPLcQtH8hmF0Wb3RIUrrR8LGZ
	8Low==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6EoZVvHF7jNeutcqk8wXSQkMNkbTbhhSAKxOyLzjy0s=;
	b=tZyJi7jl4XTJozsy1ocmKXqttlCgQE2B8xuJqM/UERtrd5L//kuig+YgfbPUh4c8OH
	V6kHO0fC9KNqAG2G+BnXQAd9DoL1VI/U5U+FuAFDIM6ttpAIuREI8/2GFZ6oydXxquzc
	Aodkul+hMZT7BbVY+Q7IEEkwMv7Y/QUb3wUhMSSIVJBneB5dqr6BTWI2sNpnbL6Vmqk5
	bKAGUKsl4KRfZROL2PnOTY89/bnSfpgN42y4EKiTozqMRrrDvBEL8j93EtMALT9pp3av
	lwWEJqP1Wtwb1Qm8wEgRNYXovl4fsC0YpzHmnJMfM1NcV6H3orDqHacjUvsxEnEo1YKV
	No+A==
X-Gm-Message-State: AFeK/H00559dPG+A6iLrAwgxqugYfd7GmQTLJLYjRptEfQoOq1vzjkUdgfizKlRhv3LcMIk4QZUzJCAH4ZNMIQ==
X-Received: by 10.28.19.207 with SMTP id 198mr545726wmt.49.1490782490873; Wed,
	29 Mar 2017 03:14:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Wed, 29 Mar 2017 03:14:50 -0700 (PDT)
In-Reply-To: <1490780318.6396.410.camel@intel.com>
References: <20170329072316.GA3298@jama> <1490776523.6396.407.camel@intel.com>
	<20170329091444.GB3298@jama> <1490780318.6396.410.camel@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Mar 2017 12:14:50 +0200
Message-ID: <CA+chaQcd7Pa-w7zWLLbck1Xu+r0t3udzLf0tJQqrkgSzCu+HZA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 10:14:51 -0000
Content-Type: text/plain; charset=UTF-8

> Can individual recipes choose to be built using the normal ld?

yes, see example in:
meta/recipes-bsp/u-boot/u-boot.inc
meta/recipes-support/libunwind/libunwind_git.bb

but it was working with older binutils, so maybe worth tracking down where
it got borken.

On Wed, Mar 29, 2017 at 11:38 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Wed, 2017-03-29 at 11:14 +0200, Martin Jansa wrote:
> > On Wed, Mar 29, 2017 at 10:35:23AM +0200, Patrick Ohly wrote:
> > > On Wed, 2017-03-29 at 09:23 +0200, Martin Jansa wrote:
> > > > INFO: jenkins-job.sh-1.8.19 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170328_014155.log
> > >
> > > That used OE-core 552bd78, if I read this right:
> > >
> > >         == Tested changes (not included in master yet) -
> openembedded-core ==
> > >         latest upstream commit:
> > >         552bd78 wic: use kernel_dir to find systemd-efi bootloader
> > >
> > > >     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:
> do_compile
> > >
> > > http://errors.yoctoproject.org/Errors/Details/135202/
> > >
> > > "gcc-ar: not found" - that should have been fixed by OE-core 23a12d87a6
> > > "fix toolchain selection", which is included in OE-core 552bd78 and
> thus
> > > should have been included in the build.
> > >
> > > However, the error above was "Submitted on: 11/03/17 10:13", which was
> a
> > > while ago and in particular before that fix.
> > >
> > > Did ovmf really fail in the latest world build?
> >
> > The report shows:
> > http://errors.yoctoproject.org/Errors/Build/34933/
> > which leads to:
> >
> > http://errors.yoctoproject.org/Errors/Details/138261/
> > Submitted on: 27/03/17 05:31
>
> Got it. I followed the wrong link at some point.
>
> > So yes it failed again, but this time with different error:
> > TOPDIR/tmp-glibc/work/i586-oe-linux/ovmf/git-r0/recipe-
> sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-
> oe-linux/gcc/i586-oe-linux/6.3.0/ld:
> > internal error in do_layout, at ../../gold/object.cc:1821
>
> Hmm, internal error in gold. Not sure what to do about that :-/
>
> Can individual recipes choose to be built using the normal ld?
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>

