Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 663AC613DF;
	Sat, 15 Feb 2020 16:38:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j17so15140957edp.3;
	Sat, 15 Feb 2020 08:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ijrd6Xd+HgPMCTcPIYbFMQFr6nnnfoyxsVj67JJOJNQ=;
	b=RhEh98xvp/Vr5IVBXaHFqa0Z4kqUn6nj0ov37to4AglFJl/GGJFZvzgxOx//6e7JhP
	/9ef+0jXbzaPaNzk1EwHfpIQfNyxdCv38qroPjXdqtgw7BjUK0FjM753h3wVf0uEBkAi
	89wMMms3kefIDuaUodITbMerCSjElctNo3Zn5MV2yFQ31Z1y1FF6gkNN3+FM5aOJ2TE9
	dzZn7TpTLlEzLq0SWJ3B102r+Cp9Q5m52PeAJVI4H1ZPAB4nkfkQIhAeW2tpiMc+hTbw
	RdoqjJXPL+69sz4LN9idMCgOvjn+V/M5F4Nmy2HL0p6AD0S1Nk4Vk6e2STBHpj5iK7tn
	F+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ijrd6Xd+HgPMCTcPIYbFMQFr6nnnfoyxsVj67JJOJNQ=;
	b=bna36AjBG6dqld8+oQT+gwuN5K4kFsesTaeofZjHj6S130zRwo0Ts1ncyjlMpCxoL9
	/cGFLDK53rX9rRCu/ap220HnvrMX2k6zhKrzrLhWBAgznWDK99RF9RbKIvMSbMq1jvPK
	hG4oBlChfE9Ea11DTG8M2U8XQ0HBPYXuBfbRSFVuuawYjUIc9SsPhuSecJdjdV47Dob/
	KK7NWZzUJ+1UtTtRDzvTb8agcWSaFhR3Rts0qfHMMFoVnOYucn9gFDqcxGtGyHOpKcAe
	YbV66fPOX4fzMekX6TaJTV1RGKEiQ3zlJU9UD8xPnajoTc5grk/3j/ecQLkiZ8v89WOr
	WAyg==
X-Gm-Message-State: APjAAAXp6HOnYXBUMCo99h/5CcZvSYqaCFxA30aMSTY+SFKzzNfhSZA4
	wSIk7WNl6070OZAQOvuQJazkD0Ggm5bRJNReedpOMg==
X-Google-Smtp-Source: APXvYqwEp0xXU88aSllyzfaIFHflkfIzOBmG4SoJw/sHrp9ehORUrsOydcG2q87MewDbDxb/iWPQ2zl1tNlDh0Rbzyo=
X-Received: by 2002:a17:906:9413:: with SMTP id
	q19mr7858549ejx.172.1581784702707; 
	Sat, 15 Feb 2020 08:38:22 -0800 (PST)
MIME-Version: 1.0
References: <158176248670.31260.7654152103178704127@git.openembedded.org>
	<20200215102807.938B8232818@git.openembedded.org>
	<65fcf6fa-6f55-b082-52fb-6d8a8ce2ef3c@koncepto.io>
In-Reply-To: <65fcf6fa-6f55-b082-52fb-6d8a8ce2ef3c@koncepto.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 15 Feb 2020 17:38:11 +0100
Message-ID: <CA+chaQduoaTu7+dX13w2PbC_uf_CuSChyfRbF+DnhE23dkoTdA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Pierre-Jean Texier <pjtexier@koncepto.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 11/18: busybox: Backport patches to support removal of __NR_clock_gettime
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
X-List-Received-Date: Sat, 15 Feb 2020 16:38:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Isn't it caused by some other layer prepending some busybox patch causing
this? Can you check with bitbake -e?

I'm not seeing this one in my builds (and I was just refreshing some of our
webOS OSE patches to apply cleanly on 1.31.1)

Regards,

On Sat, Feb 15, 2020 at 5:30 PM Pierre-Jean Texier via Openembedded-commits
<openembedded-commits@lists.openembedded.org> wrote:

> Hello All,
>
> Le 15/02/2020 =C3=A0 11:28, git@git.openembedded.org a =C3=A9crit :
> >      busybox: Backport patches to support removal of __NR_clock_gettime
> >
> >      This helps compiling with musl on 32bit arches now that musl has
> >      switched to 64bit time_t
> >
> >      Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >      Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> > ---
> >   ...all-wrappers-around-clock_gettime-closes-.patch | 120
> +++++++++++++++++++++
> >   ...-date-Use-64-prefix-syscall-if-we-have-to.patch |  53 +++++++++
> >   ...-time-Use-64-prefix-syscall-if-we-have-to.patch |  43 ++++++++
> >   ...runsv-Use-64-prefix-syscall-if-we-have-to.patch |  46 ++++++++
> >   meta/recipes-core/busybox/busybox_1.31.1.bb        |   4 +
> >   5 files changed, 266 insertions(+)
>
> this commit causes the following build issue :
>
>   ERROR: busybox-1.31.1-r0 do_patch: Command Error: 'quilt --quiltrc
> /home/runner/work/kas-files/kas-files/build/tmp/work/cortexa7t2hf-neon-vf=
pv4-poky-linux-gnueabi/busybox/1.31.1-r0/recipe-sysroot-native/etc/quiltrc
>
> push' exited with 0  Output:
> Applying patch
> 0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
> patching file Makefile.flags
> patching file coreutils/date.c
> Hunk #2 FAILED at 270.
> 1 out of 2 hunks FAILED -- rejects in file coreutils/date.c
> patching file libbb/time.c
> patching file runit/runsv.c
> Patch 0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
> does not apply (enforce with -f)
> ERROR: Logfile of failure stored in:
>
> /home/runner/work/kas-files/kas-files/build/tmp/work/cortexa7t2hf-neon-vf=
pv4-poky-linux-gnueabi/busybox/1.31.1-r0/temp/log.do_patch.62122
> ERROR: Task
>
> (/home/runner/work/kas-files/kas-files/poky/meta/recipes-core/busybox/bus=
ybox_1.31.1.bb:do_patch)
>
> failed with exit code '1'
>
> Tested on top of poky master (commit
> 7f2af8bd795ace46828952a7812f0bbdf26529a [1])
>
> [1] - https://github.com/texierp/kas-files/runs/447729194
>
> Thanks !
>
> Regards
> --
> Pierre-Jean Texier
> Embedded Linux Engineer
> https://koncepto.io
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

