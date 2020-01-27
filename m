Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3747FCC0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:15:01 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id s24so8834216iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HJQQygqOPzRMQBn1C7+roVUeLcpEt5Blk5Z2biYWzhI=;
	b=rbxAd/Gcw2i7CX+kUSLZqavHqOfr/cTYKyQbTxeM2gqOoxWSDo/1NXBdvm1MiQyc0w
	+XgOWvnFfKoCxa2jddIhJX64lqFDzhptUk4DANXVJplT5xX7hycMMbEAdON7atwoz4FJ
	AI13KtX0onvkzA423R44feEYwx482yYosRRH7a6CgnRxSr/6eAFmasEYHG8mVkoUHFk0
	phEAPuYR7Fcu5my0SLMr8Mm4B0AFZ0jvU5I5oqe+91ShzuR8QX52FXBNxOxyF7X8ZLTp
	LL8LfhVzRzTK/9fs7fw7dHuRRP4ADxMKhQ0IlxBoxDcQsoVxAS4uJnAghsCF/Hpul+cM
	2PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HJQQygqOPzRMQBn1C7+roVUeLcpEt5Blk5Z2biYWzhI=;
	b=nA3K3qzCMaHKt0DCqB5Ajhc89SWBA7JUKi6cNtkoho+pE5KRpMqVYseqyjm3bXNojs
	n7cvB8xsv+aXt5WV3UwhBR2abV0WRAz7ImUzkIQNLCI1HVTsgle+zWPxUSoNb/jqzWix
	lq1+WCdvxDpWoMr59zWp+u+gZ8YaRfhR/I6ZbRF7eqVNQGqwFxp79wRwY56ZDccuP7Eq
	mCqSJrY8RJGylejQ2sEfRio7ra51ADRI/ObLs7HG4vxVgPNW96hGKUvxHtaFWvbrD5Dr
	3XXEymSEQodFg32xB/TLH7kLF4ac8kCY2IYRq1xFQgsfxfW/5trWVNq8xBK0i6ro3vba
	CktA==
X-Gm-Message-State: APjAAAVPpxOqWtrkep/6ERALaMfHLHjAJngWuqrWs5dB240CPpUAwxKC
	bL9JqUtWPeqkvdkk97vA42yiY1YLlaYlIotRLiY=
X-Google-Smtp-Source: APXvYqxZGNY9ywABQZaHck2wPfiKc9Smo9vYOkDyM8u7cNJaNr3eWi706upLOJbut3f0KnpzwXkSd5mMV/VshOxXd2w=
X-Received: by 2002:a02:c988:: with SMTP id b8mr13760073jap.122.1580138102990; 
	Mon, 27 Jan 2020 07:15:02 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
	<CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
	<92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
In-Reply-To: <92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 27 Jan 2020 15:14:52 +0000
Message-ID: <CAO5Uq5SQeNGN8FmQjPfv_CWpbrT_rMQCjETvvN7ZukkzPd=BLg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: systemd failing in master with Assertion clock_gettime(map_clock_id(clock_id), &ts) failed
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
X-List-Received-Date: Mon, 27 Jan 2020 15:15:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 12:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/23/20 4:13 PM, Alex Kiernan wrote:
> > On Thu, Jan 23, 2020 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> >>
> >> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.com>=
 wrote:
> >>>
> >>> On the offchance someone's tripped over this already/has pointers:
> >>>
> >>> Around the time python2 dropped out, I'm now seeing boot failures wit=
h:
> >>>
> >>> [  612.151548] systemd-journald[543]: Assertion
> >>> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> >>> src/basic/time-util.c:55, function now(). Aborting.
> >>>
> >>> I suspect it's unrelated to py2, but that's delayed me getting to the=
 problem.
> >>>
> >>> The board I'm targetting is AM335x based, but without an RTC (which I
> >>> suspect may be relevant).
> >>>
> >>> Anyone seen anything similar?
> >>>
> >>> --
> >>> Alex Kiernan
> >> Hi Alex,
> >>
> >> Have not seen that one yet. Will look for it once I can build images
> >> in current environment (python2/Qt5.14 broke loads for me). What I
> >> have seen were problems with timedatectl <-> ntp. Changing from local
> >> time to ntp-sync did not work: Time remained un-synced on recent
> >> images. Machine was Raspi so no RTC either.
> >>
> >> Don't know if this is related to your finding...
> >>
> >
> > Looks like it's related to the glibc bump - reverting that changeset
> > gets it booting again. I struggle to figure out which of the myriad
> > wrappers are actually being used from inspecting the glibc source, but
> > if it's the one I think it is, there's clearly
> > clock_gettime/clock_gettime64 changes there which I doubt my kernel
> > has (we're currently using the TI 4.19.y kernel).
>
> Is it possible for you to try 5.x for tests ?

That's where I went first, though I need to bring up the newer TI 5.4
branch first (which has its own problems as there's some patch which
was in the 4.9.y hsmmc driver which isn't in the latest which causes
random timeouts on some of our board samples).

> I know there were 64bit
> time_t related errors I saw with 4.19/rpi3-32bit but it was with musl,
> since musl enabled 64bit time_t by default, that might be different
> issue too
>
> Try applying [1] to glibc as well, currrently, its only applied to musl
> case, perhaps that might help.
>
> [1]
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/sys=
temd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patc=
h
>

It looks like it's something that's now in the call path which is
tripping the seccomp filter on systemd-journald - if I comment
SystemCallFilter=3D@system-service then I can boot.

Just trying to figure out what syscall it is we're tripping over. What
I don't understand is why booting linux-yocto 4.19 inside qemu w/
systemd doesn't see this problem.


--
Alex Kiernan

