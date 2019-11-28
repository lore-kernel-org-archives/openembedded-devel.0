Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A087B7F700
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 01:14:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m125so21301100qkd.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 17:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b+32V4QhBsxbII+0nsWDEYtIN9nx93VBjHq9VMGiCyk=;
	b=LM0RM+9amGluihvt4Lbl1gOaHR9K4SidtT03+UhsH3jNG9hc5n24rvLea8fjEa9DDO
	8HSLot4KqCO7UJ280jIISUJe9o4qWVN9kz17kBOZkZS1Qz1A0L33kVy1xrpKoO5bdvPf
	lR6Ox2hRIfUviHnUybwcmGdcPd0SWqlFlB1d319qlVq/qUpIc1uO30bj1vWZR50/ZSCZ
	oH31bjUHq2AT+p0Nz7Rj7ShYhXAjrcTUDhluFKGOjCT7SM7fJk9746Tg5zMgXVOgD3Gx
	ViGAmwxyNM+0W0uyajfLsMWRQ6aqnYYqo5kyto552JrAq3JRxMGIXXXn6GUC0smjvaRF
	jHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b+32V4QhBsxbII+0nsWDEYtIN9nx93VBjHq9VMGiCyk=;
	b=XCDZTuqoYLzL0hctj7HboZBIMp6BqIzVa6RLa6JMZxuzoJcHe5btur6gZEYAfdrRvw
	j5WabC4YWwf/o1C1sO3Lu9ozUVAflRzfBhzgJlcepGdPLax9tADC1YRqXdpfgm6y0VxV
	s2VAkksLCz8/vih7JJ/ZqlmUxBSLslq/Gzcx8Q+xesVj6+GCNX4WgnfynPZMzS8xBsU8
	igjILr5kkg34Qm+baGc0vas9pfg3DkBKKsS0Mmn7FzTn2mYCH1i3K4B+ibGIdroycoxN
	CwJhJmpjsXoHorPY4b0yU1zZ75dUa2g+zoRC3oMgubvb5YMONaZtuYD6azYTPFJzrr++
	A8BQ==
X-Gm-Message-State: APjAAAW03yQVLvzo+2rgjAxZ7ei9N/u2APxGiAHz+ef4dUiYi8Odow+z
	e5P/E7vKuJvIKX9h9jsKfoNk/mSU31tXj5kMg0jio+K2kgw=
X-Google-Smtp-Source: APXvYqxPl4ELCu3p3MX4XEiG9IXGU74+CcEO6/UcZ4S9s9sAnecayDG7tj5mTTrVb8ksmnWrtVXjddUAtIZVaTm4veU=
X-Received: by 2002:a37:a348:: with SMTP id m69mr5099283qke.474.1574903684832; 
	Wed, 27 Nov 2019 17:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20191127080028.823495-1-raj.khem@gmail.com>
	<20191127091048.GB31353@localhost>
In-Reply-To: <20191127091048.GB31353@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2019 17:14:18 -0800
Message-ID: <CAMKF1soC4NN9tradMXDnLYr0qgQyEqz3t7cENiHeU7Mbqefd4Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pidgin: Use python3 during build
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
X-List-Received-Date: Thu, 28 Nov 2019 01:14:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 27, 2019 at 1:10 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Nov 27, 2019 at 12:00:28AM -0800, Khem Raj wrote:
> >...
> > +@@ -1568,7 +1568,7 @@ dnl Check for Python headers (currently
> > + dnl (Thanks to XChat)
> > + if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
> > +         AC_MSG_CHECKING(for Python compile flags)
> > +-        PKG_CHECK_MODULES(PY, python, [
> > ++        PKG_CHECK_MODULES(PY, python3, [
> > +                 AC_SUBST(PY_CFLAGS)
> > +                 AC_SUBST(PY_LIBS)
> > +         ], [
> >...
>
> This one also wants
> https://bitbucket.org/pidgin/main/pull-requests/357/gnt-fix-use-after-free-memory-violation/diff
>
> Not sure whether there are more fixes that need backporting for Python3.
>

Good question. So I checked the plugins which generate .c files using
these python scripts for dbus bindings
dbus-bindings.c  dbus-signals.c  dbus-types.c  purple-client-bindings.c

and I regenerated manually using py2 and compared with py3 generated
ones. They are identical.

> cu
> Adrian

