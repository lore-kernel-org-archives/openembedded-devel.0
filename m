Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id AE133779F5
	for <Openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 10:18:50 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q11so7154805ioe.10
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 03:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QgZDJmfw15J6ze0u0f8+3vY42+FMSosuAxqwJkD4Ouw=;
	b=nKAAzq7aKrPZdBOWiy61EiBShf4yPBpSpMQzEw5I1ocZtNiaIiXDBrUKzHLJTOOYno
	m15gUGhz5SQTOxYl2Zw+xkK9ApESnsy2ie8gthyOccR3Ap/F++2o/V2wYs5x2NIRarM4
	Y3J97jUehX8MW+L/itGguGssJD77PagmbBLAepbVQBn8M8O91vAN2gGPVbnZKR4Zm5O3
	IMBhWDPto4XpZ1r5aeJ3/PlETlBr5r5n2hMCn34lKreEItcS2wq6jorkeG9YIUWthxYr
	mFct+o3diMHCt+oQhrGrMdsoBRk4iq0uyVW0ufGRfMxcOQiRlxeCxUNeYk0qy5Bhvgn0
	IhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QgZDJmfw15J6ze0u0f8+3vY42+FMSosuAxqwJkD4Ouw=;
	b=VWPtCbTBAbVPEFSQ5N/cnlUvEp8ToBKAQP9Gt+NURSFFWVDpFfwZDtklvjmObdMWjq
	Sg1JkuAEUI3Uk4WIaxU8Y1SOkXUunyzg7P2k/wMYVhiczpRW71vhL+9N4fW5fEp3xIjc
	ACp55wf21GYciZtPyvdewD/s4QiZaz3ak7Zl8NecS0E52ViclR/uYiLVA6NUsYIOuUuu
	/VP5YvLms1BILlcc0qaHVxsUJILhNHnILmELyrdaf+umZFJ1QFL5oaeudKuvBAZaUDLG
	C02J1+xBpnFxMNi7q33YN1qrxoZe8KvKxx6yvhMiSWyKrVMWZLo1Ib+wr6MrpxD9lqnX
	lsmw==
X-Gm-Message-State: AMCzsaWVtHa85lwbEETVjBazMeD8Juj4QHkUNc1pVzYEpc6RzzQdHiBr
	Rj3dEKVngmYe/f1nFfB8/jyF/NDKAsUCQ+mCkrgB/w==
X-Google-Smtp-Source: AOwi7QAbI9eukDLthj0pMMroBj3zFke57TvbFwTKPym5rRwS9mFvQEeV6rvx9HEMdirqNeXiIiXT0ZHQNqGFpw8jVnk=
X-Received: by 10.107.164.28 with SMTP id n28mr26737125ioe.175.1507025931627; 
	Tue, 03 Oct 2017 03:18:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Tue, 3 Oct 2017 03:18:31 -0700 (PDT)
In-Reply-To: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
References: <20171003094039.30186-1-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Oct 2017 11:18:31 +0100
Message-ID: <CAJTo0LbH5C+36B2osvedCtF90-Mxr0RPMvUiqbFi4N0Pn1ukMA@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <Openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS
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
X-List-Received-Date: Tue, 03 Oct 2017 10:18:50 -0000
Content-Type: text/plain; charset="UTF-8"

On 3 October 2017 at 10:40, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Without this patch bitbake cannot find sdl-config
>
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
> Either fix the cause of this error or at your own risk disable the checker
> (see sanity.conf).
> Following is the list of potential problems / advisories:
>
> libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be found
> in PATH. Please either install it, or configure qemu not to require sdl.
>

First, wrong list, this should go to openembedded-core@ instead of -devel@.

qemu's configure prefers pkg-config instead of sdl-config, so why doesn't
that work for you?

Also note that we don't recommend using host libsdl via ASSUME_PROVIDED
because it's a nightmare to link when we've a sysroot full of
ABI-incompatible libraries.  For example if I try to build on Debian 9
qemu-native with the host SDL it fails at configure time:

| ERROR: User requested feature sdl
|        configure was not able to find it.
|        Install SDL devel

That's a lie, it found it but it wouldn't link:

//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`resize_term@NCURSESW_5.3.20021019'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`COLORS@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`raw@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`ESCDELAY@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`nodelay@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`initscr@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`nonl@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`wrefresh@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`wmove@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`getmouse@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`curs_set@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`newterm@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`waddnstr@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`mouseinterval@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`wgetch@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`LINES@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`curscr@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`init_pair@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`start_color@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`stdscr@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`noraw@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`wattr_on@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`COLS@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`noecho@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`keypad@NCURSES_TINFO_5.0.19991023'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`ungetch@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`mousemask@NCURSESW_5.1.20000708'
//usr/lib/x86_64-linux-gnu/libcaca.so.0: undefined reference to
`endwin@NCURSESW_5.1.20000708'

The host libcaca is linking to the sysroot libncurses, and they're not
compatible.  This is why we moved away from using
ASSUME_PROVIDED=libsdl-native in December 2015.

Ross

