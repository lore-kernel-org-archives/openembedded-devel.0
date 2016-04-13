Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id AF0C56FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:43:05 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id k1so61801831vkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=qLvciVsuFzs/KRUkQHX9xQEqY80vRmVb4T3wdNcLzfg=;
	b=oCQAvQcqm/BT27HYwn4x/tK/u2nmiPwP+UhSguVZyHpeIVMUgqMsG84TitLfal43Nb
	ZqrAQESSQ2/hA2MN5PFxA1xmXx8I6R4FVHTZ4L+Jwuer5IDJc2bk3Jji5enECvenKBGI
	IJn0OaETqiIHVbF1HTq7tVQTg9/7qBCVVF0KHHA+ICS/PDIbMNI3mkD4MobHNYuES9T6
	y4rWfMZijrd+2n+TwdAGrvrOvPvuxKArkzL24SYfdM4QXHQ5obpWYZqBaYvD5k1hSJb7
	gEFaHFo7sVPVL1B1qSQ34fNwrMJIJAAt9mO0ASqw+mplE57J8kXYkq1yLfHjc3L+j2XK
	dUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=qLvciVsuFzs/KRUkQHX9xQEqY80vRmVb4T3wdNcLzfg=;
	b=gYrzKQ5mJalXx4Vw4858xZdTkjgrGcL1fvAAFiB6WlpTtD8AgHB1WdrLujA06NIXi0
	zRW0TreDyhcr+6IRUSM0BxbS7FwzMzrqIO+vHCSNV4ZRQwpr4iGshh1pJrUPC6lZo+BK
	/FJ+wVDnswTHQwL67XETlirry+PGLClaWfJvmpMeGsJ6N4QmThmz3IMl5WGNL7lYtxy5
	LzHWOU2l8oXXzMztYLNFuyVAKteVgR3qcE2ajUP7yfypsaGELIekvUwaT/2F/Csatw9M
	fSS/a0A/GscuV/qO181xdndW4FElSw5Jpn//QMznlZrjfIPZS8Et3xuVNffQHU5KFPFO
	JDBw==
X-Gm-Message-State: AOPr4FVoe8/H1+rHetbjDfs715aYtJSzJiwyNE66HhPzutosv0z9a3k05oech8quZEMU+AhCxkORdDIOUjliWw==
MIME-Version: 1.0
X-Received: by 10.31.165.148 with SMTP id o142mr4196967vke.62.1460540586077;
	Wed, 13 Apr 2016 02:43:06 -0700 (PDT)
Received: by 10.103.102.6 with HTTP; Wed, 13 Apr 2016 02:43:06 -0700 (PDT)
In-Reply-To: <CAFkk2KTGfZ9RDNTdTQmfAB+G3KnNGBqDivM2NVgrG4idV-KgHA@mail.gmail.com>
References: <CAFkk2KTGfZ9RDNTdTQmfAB+G3KnNGBqDivM2NVgrG4idV-KgHA@mail.gmail.com>
Date: Wed, 13 Apr 2016 11:43:06 +0200
Message-ID: <CAFkk2KTiTPgnquWAgTwePs=BKEqJj0maGxxk4zJDXt6ouKaQdA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:43:05 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 11:41 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Hello,
>
> I get libtdb build failures like the following. The failing file
> varies between runs.
>
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 -e MAKEFLAGS=
> | WAF_MAKE=1 PATH=buildtools/bin:../../buildtools/bin:$PATH waf build
> | Checking project rules ...
> | Project rules pass
> | [  1/100] Generating tdb.vscript
> | [  2/100] Compiling lib/replace/replace.c
> | [  3/100] Compiling lib/replace/cwrap.c
> | [  4/100] Generating PKGCONFIG_tdb.pc
> | [  5/100] Compiling lib/replace/replace.c
> | [  6/100] Compiling lib/replace/test/testsuite.c
> | [  7/100] Compiling lib/replace/test/strptime.c
> | [  8/100] Compiling lib/replace/test/os2_delete.c
> | [  9/100] Compiling lib/replace/test/getifaddrs.c
> | [ 10/100] Compiling common/check.c
> | [ 11/100] Compiling common/error.c
> | [ 12/100] Compiling common/tdb.c
> | [ 13/100] Compiling common/traverse.c
> | [ 14/100] Compiling common/freelistcheck.c
> | [ 15/100] Compiling common/lock.c
> | [ 16/100] Compiling common/dump.c
> | [ 17/100] Compiling common/freelist.c
> | [ 18/100] Compiling common/io.c
> | [ 19/100] Compiling common/open.c
> | [ 20/100] Compiling common/transaction.c
> | [ 21/100] Compiling common/hash.c
> | [ 22/100] Compiling common/summary.c
> | [ 23/100] Compiling common/rescue.c
> | [ 24/100] Compiling common/mutex.c
> | [ 25/100] Compiling tools/tdbtorture.c
> | In file included from ../tools/tdbtorture.c:5:0:
> | ../lib/replace/replace.h:151:24: fatal error: bsd/string.h: No such
> file or directory
> |  #include <bsd/string.h>
> |                         ^
> | compilation terminated.
> | Build failed:  -> task failed (err #1):
> |     {task: cc tdbtorture.c -> tdbtorture_5.o}
> | make: *** [all] Error 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile
> NOTE: recipe libtdb-1.3.0-r0: task do_compile: Failed
>
> The problem seems to be a race with building libbsd (and unlucky
> timing in my build). Adding libbsd to DEPENDS fixes the problem.
>
> For some added context, libtdb uses a nonstandard ./configure from the
> Samba project based on a configuration utility called Waf that I'm a
> complete noob on. Perhaps there is some way to disable libbsd support
> instead.
>
> Cheers,
> Ulf

I also found this fix which doesn't seem to have been merged - seems to
be a similar issue, though for a different dependency:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/104623.html

Cheers,
Ulf

