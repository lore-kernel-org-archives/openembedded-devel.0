Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 90CEE612E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:41:04 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e185so61650287vkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=KhBPQh+2p/py5r/8dWM2x3BQ3eMBWXHJmmeJ+AoG90I=;
	b=cB2de7UKaKa4gGQgOUp8qN8KK2ap1ZUjuK2F2iFj5IqnSapqmnAQPrxbn5UTj2lTFW
	l//2lUDRnubhCVTEHKPg/s2SHGbhuviYiXQPpabcdSnh5kZVUAAXdR+1K+29oP0SyYvI
	OkHXhudAGIOHi4EK0RsvoCMtgzs7836xvsaKIqNWOPzRReh2DNmNygtZ5FEiqM7+sUoT
	lPMRiEiLjMpG+ZGSqeJr/bRwd4vmJIFJrBoQ957WGFW5nTSJAoTwE9Jfg8pmCGotOK6o
	cUkdb5s+zI6f+XSV/cuNWsGSIgfWgxLhjEvnb5seFF18qx0OVaWaCikcRXVPKYSX9LPQ
	ZjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=KhBPQh+2p/py5r/8dWM2x3BQ3eMBWXHJmmeJ+AoG90I=;
	b=KzQ3p68AfDmUHG1P9nyQ3DQOISasHu8JrkC2Kx/DudAp8CT5rky1LwUPIDXShhl/Ra
	ac0BOmwvszvopQqGdYb2XHLKMvYs2+cARHRzt0rlp/XIYnqb0zFUWVA4q0nTBxEsF+Gc
	lxIlMPPkrmWvCoYWGmAH/TkzfquYbdkhPd5oZBjwhtfG5Z4qoU1mWa1xKBGWSATN/HlH
	k6NAj61FvNN4eL+xrJi182tRJ3ZFj029phGnD5KBPbwaEOMPqhAgww8RsoArMTxf9Ciz
	FIwQE/uy2TqHrTtaN4HlGTwh+95cPff52Lg9NJJyDd/or8eQDDRioVg9dUtcRAorT/LS
	jQNw==
X-Gm-Message-State: AOPr4FVYJX27OXXUmnLJ+s5McmTwPhUNDpLcWwOLF0hLYZftoh79CHBBZrgT9DHtXdFRMRGKxwXJjDAaA9XIEA==
MIME-Version: 1.0
X-Received: by 10.31.60.134 with SMTP id j128mr4194534vka.43.1460540465211;
	Wed, 13 Apr 2016 02:41:05 -0700 (PDT)
Received: by 10.103.102.6 with HTTP; Wed, 13 Apr 2016 02:41:05 -0700 (PDT)
Date: Wed, 13 Apr 2016 11:41:05 +0200
Message-ID: <CAFkk2KTGfZ9RDNTdTQmfAB+G3KnNGBqDivM2NVgrG4idV-KgHA@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Build failures due to libtdb racing with libbsd
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
X-List-Received-Date: Wed, 13 Apr 2016 09:41:08 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I get libtdb build failures like the following. The failing file
varies between runs.

ERROR: oe_runmake failed
ERROR: Function failed: do_compile
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -e MAKEFLAGS=
| WAF_MAKE=1 PATH=buildtools/bin:../../buildtools/bin:$PATH waf build
| Checking project rules ...
| Project rules pass
| [  1/100] Generating tdb.vscript
| [  2/100] Compiling lib/replace/replace.c
| [  3/100] Compiling lib/replace/cwrap.c
| [  4/100] Generating PKGCONFIG_tdb.pc
| [  5/100] Compiling lib/replace/replace.c
| [  6/100] Compiling lib/replace/test/testsuite.c
| [  7/100] Compiling lib/replace/test/strptime.c
| [  8/100] Compiling lib/replace/test/os2_delete.c
| [  9/100] Compiling lib/replace/test/getifaddrs.c
| [ 10/100] Compiling common/check.c
| [ 11/100] Compiling common/error.c
| [ 12/100] Compiling common/tdb.c
| [ 13/100] Compiling common/traverse.c
| [ 14/100] Compiling common/freelistcheck.c
| [ 15/100] Compiling common/lock.c
| [ 16/100] Compiling common/dump.c
| [ 17/100] Compiling common/freelist.c
| [ 18/100] Compiling common/io.c
| [ 19/100] Compiling common/open.c
| [ 20/100] Compiling common/transaction.c
| [ 21/100] Compiling common/hash.c
| [ 22/100] Compiling common/summary.c
| [ 23/100] Compiling common/rescue.c
| [ 24/100] Compiling common/mutex.c
| [ 25/100] Compiling tools/tdbtorture.c
| In file included from ../tools/tdbtorture.c:5:0:
| ../lib/replace/replace.h:151:24: fatal error: bsd/string.h: No such
file or directory
|  #include <bsd/string.h>
|                         ^
| compilation terminated.
| Build failed:  -> task failed (err #1):
|     {task: cc tdbtorture.c -> tdbtorture_5.o}
| make: *** [all] Error 1
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile
NOTE: recipe libtdb-1.3.0-r0: task do_compile: Failed

The problem seems to be a race with building libbsd (and unlucky
timing in my build). Adding libbsd to DEPENDS fixes the problem.

For some added context, libtdb uses a nonstandard ./configure from the
Samba project based on a configuration utility called Waf that I'm a
complete noob on. Perhaps there is some way to disable libbsd support
instead.

Cheers,
Ulf

