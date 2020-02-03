Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF1960273
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:38:01 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id g12so14164457ild.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CV+HMjXqFqV3xKnQ/hjPXrmhHNwn3KgKva8KyC3yU5s=;
	b=uZhwVn9EZf0KsB0u6ZjAgJrQCZ/wGKWZV4U37oGB/z/Ow4f+NJRk2sCmrTZpFzclfQ
	ZTtq5hdliyR/s1n3c+KjBzRIXm0A3cdLB38kVioeiWAML1xLlhkMBk0V4DUMlNXf2k6/
	D6n8qBVl6Ouzg6OpjNbEKDR343H5n55ujfvN5P48QKlLzZ/NDLnGWc6uUYb4lQ+qN1OV
	sEZH7lUl5zrqmwy1WHQZtb0NXOHtXiDdjQTwkUX/t7h8BVzehfd0nwiMfhrWT52ILZdN
	TKw4H7QfNsRlv5mE3Vh1/bp/c8zhvi9FnLrWjsAXGVo/txDp8RdjiCTEoab92zsGke3x
	Iy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CV+HMjXqFqV3xKnQ/hjPXrmhHNwn3KgKva8KyC3yU5s=;
	b=l0T278m+L2zt40/CKs9q2U4Vz2ohqJc0W+eMPfokSLtp1OvAlWFDvCBRWPKhgMSJJR
	jtlW3f07eg5B/dlYFGfRi0oqicqv6XyI3zMhIa36JoxLdJfu3g24rUVffGDFmT4fRfcF
	0hj7V2oiyfF0OSWU7B2N7ygLyDfrbpXaliTdVuTAvFFZbFL6wvIxTOKIXQlVQ4khD3Yb
	voovvzdCqXSqgZ6VG/TZagOGB0As+TGyPPtueqnmv7aJL7WikGA3Vq5hLNgdoNPnnrEB
	X1frVgeuG6gBFYqoaxtoWEEchnSw+hPgP5SyvE9UhAKCEsA6v8T1r9G2tz4uzhEpnYLP
	sQ8g==
X-Gm-Message-State: APjAAAVrjg9F6ctb3lY55iueSg29jdWkudQhfKCQ/gswnyiC22zhEq0W
	vQOTgkLnvkMywCH3j5/4ucr7Wf3i1gTxuIBsNAwe3bC6V5g=
X-Google-Smtp-Source: APXvYqwqi7aNB28+1g6SKwsFax5G5ohUU9YW4ynsE4SuJv26rpXwkWHn4F5ThFVCkYv0Nqcxk2UtgWVdzgn6Bq4R6G8=
X-Received: by 2002:a92:af08:: with SMTP id n8mr16740301ili.217.1580769482247; 
	Mon, 03 Feb 2020 14:38:02 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TV_6f7PXF6Q_TE0ii-W9xG9xgrO8p8OP_vb48HW=DugQ@mail.gmail.com>
	<CALbNGRSAYNsQkWMhNAfxVqnq4bYx2=mcqMxQpxvPampLFyKazA@mail.gmail.com>
	<CAO5Uq5TPW+hePvbEmxgN6cFHx5zcNqM-k9m_zSOOReBrYqU=pA@mail.gmail.com>
	<92e2dcc5-6107-e05f-87f4-161b8132266e@gmail.com>
	<CAO5Uq5SQeNGN8FmQjPfv_CWpbrT_rMQCjETvvN7ZukkzPd=BLg@mail.gmail.com>
	<daa2daafef264dc256af9d315d21a635@agner.ch>
In-Reply-To: <daa2daafef264dc256af9d315d21a635@agner.ch>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2020 22:37:51 +0000
Message-ID: <CAO5Uq5T81etwQkVog0ibiGjmCS6zTHhLVeHRwa-2S+4TP5NWTw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Ming Liu <liu.ming50@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Feb 2020 22:38:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2020 at 10:17 PM Stefan Agner <stefan@agner.ch> wrote:
>
> Hi All,
>
> On 2020-01-27 16:14, Alex Kiernan wrote:
> > On Fri, Jan 24, 2020 at 12:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On 1/23/20 4:13 PM, Alex Kiernan wrote:
> >> > On Thu, Jan 23, 2020 at 10:09 AM Andreas M=C3=BCller <schnitzeltony@=
gmail.com> wrote:
> >> >>
> >> >> On Thu, Jan 23, 2020 at 10:43 AM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
> >> >>>
> >> >>> On the offchance someone's tripped over this already/has pointers:
> >> >>>
> >> >>> Around the time python2 dropped out, I'm now seeing boot failures =
with:
> >> >>>
> >> >>> [  612.151548] systemd-journald[543]: Assertion
> >> >>> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> >> >>> src/basic/time-util.c:55, function now(). Aborting.
> >> >>>
> >> >>> I suspect it's unrelated to py2, but that's delayed me getting to =
the problem.
> >> >>>
> >> >>> The board I'm targetting is AM335x based, but without an RTC (whic=
h I
> >> >>> suspect may be relevant).
> >> >>>
> >> >>> Anyone seen anything similar?
> >> >>>
> >> >>> --
> >> >>> Alex Kiernan
> >> >> Hi Alex,
> >> >>
> >> >> Have not seen that one yet. Will look for it once I can build image=
s
> >> >> in current environment (python2/Qt5.14 broke loads for me). What I
> >> >> have seen were problems with timedatectl <-> ntp. Changing from loc=
al
> >> >> time to ntp-sync did not work: Time remained un-synced on recent
> >> >> images. Machine was Raspi so no RTC either.
> >> >>
> >> >> Don't know if this is related to your finding...
> >> >>
> >> >
> >> > Looks like it's related to the glibc bump - reverting that changeset
> >> > gets it booting again. I struggle to figure out which of the myriad
> >> > wrappers are actually being used from inspecting the glibc source, b=
ut
> >> > if it's the one I think it is, there's clearly
> >> > clock_gettime/clock_gettime64 changes there which I doubt my kernel
> >> > has (we're currently using the TI 4.19.y kernel).
> >>
> >> Is it possible for you to try 5.x for tests ?
> >
> > That's where I went first, though I need to bring up the newer TI 5.4
> > branch first (which has its own problems as there's some patch which
> > was in the 4.9.y hsmmc driver which isn't in the latest which causes
> > random timeouts on some of our board samples).
> >
>
> I am seeing this on master branch too on a Toradex Apalis iMX6 (i.MX
> 6Dual to be specfic) running a mainline kernel 5.4.2.
>
> We do have a RTC and according to dmesg the time has been read from it
> successfully and correctly. We do have a second (the SoC internal) which
> actually might be not correctly set, I haven't checked.
>
> It seems systemd-journald which is tripping, but later also
> systemd-udevd:
> [    5.749612] systemd-journald[510]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
> [    6.433771] systemd-journald[534]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
> [    6.934304] systemd-journald[536]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
> [    7.379449] systemd-journald[538]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
> [    7.763130] systemd-journald[539]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
> ...
> [    8.402258] systemd-udevd[542]: Assertion
> 'clock_gettime(map_clock_id(clock_id), &ts) =3D=3D 0' failed at
> src/basic/time-util.c:55, function now(). Aborting.
>
> We do have +SECCOMP, and also here commenting out
> "SystemCallFilter=3D@system-service" seems to help.
>
> strace seems to point to clock_gettime64:
>

That fits with systemd-243.4 fixing it - there's a commit in there
which adds clock_gettime64 to @system-service.

--=20
Alex Kiernan

