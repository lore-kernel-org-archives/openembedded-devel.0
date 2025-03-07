Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304FCC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:18:18 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.7991.1741342693728900567
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1H1tCJf;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5498c156f1dso1742148e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741342692; x=1741947492; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcX10yCwsTRb1O2dAishdqltvrQWFmKRsiD1BQG82Hk=;
        b=P1H1tCJfkmaByUQ1sC6yQm9NzoZaaFfNtVi/VT8iaO5PEUDpBHY6VzpuW2dXn9SFZy
         IVUbpqVsdgvGnwVe2AnlDy5G4ZtsgFSXMQ8nk/OnB0aCDkDc0vv12p6MnkOMdwwDf087
         nkeFXqkMptO+LpYMrk747B6nd3Mzaxrrx9eXQJBNRONdTZU2mk1lbSnD+Q9OO9SJfnpN
         l6JuMyaBeX0FOoV0DjKlkKd6XCTxevVSF8FyeLNw2v/qt14zJLmelSP1NyUiW7C6hx79
         TXNGs3/Ezp+d5594sHEtIQEHzxvUb7bkJufO0tc5zcxFNukJUs0odFXWgi2rqEjdEAoH
         gs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741342692; x=1741947492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcX10yCwsTRb1O2dAishdqltvrQWFmKRsiD1BQG82Hk=;
        b=O3PYNd0OQeImub5n0O80Lfwy1dEnDxl9XRPgCLtcyjxotXBPvsWlhXrXgUQ2H5spN/
         hw9GjurbRxtCXneaX8PHT4Cq0le4PzEiLBqciH/7xabuSFjzToz03ZT5KbZHfNcEQqoV
         j1cVhMA1dBQboTarW6agN22c87eS5g/tnwBzwHOTQ0me7xGiJCuiABZZUE+Nh4hmQx11
         8yLI/XjkNyXS77vrZr8uw4uJqDQJKvYrU9Bq09IN9K0t1kqpk37Q3ZUCJmEmfc+N5AaN
         IlNKBJBKPl6fuY1rWvqFM/gv7PxzN7m/XdocOlszGx2ogzpV7LYpkqHTe0g5bI8pp4Hi
         JHKg==
X-Forwarded-Encrypted: i=1; AJvYcCVnoFV/uzIIwUbhks/pthAaJYZfEg0V2fNoX4ChWKVakDcriQ6XP6MBx08A9PYojNHFBsRP3ZLnoz7HWV2pnBXj4B4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrpYRsyuzpg7go2p/KsgX74dGbqDw43G+1DUPO6FIm0zLyJCGf
	N2/0P3AcPTDELvufcanQf0JAJ5ArEAqbL+cBm2pdf/Ttwel4XJwtnoQ6+DW9ZVX13cBmXIvS83g
	D3n4VqBBqFV7d3zNrFqgHOTKidyQ=
X-Gm-Gg: ASbGncuybmhxyv9WOWkgoOqRnDkckluQPTuZ0RBI40lSRR/ygQtF951NbTK7eZcGm9D
	uydxMwe0Fi+3WE2pbkd3p00WfF/sHlcqxKbT3gEYGlUwfyzxKEzk0Rg5Mi3y51GV0TmgQSTa10m
	pbWbisVscX5bnEVDqzzJrGzU1EK+1h
X-Google-Smtp-Source: AGHT+IH4uG8sck4DIvr19dJMk1xx8SFHAIoADlar9fxSuRCdaZTlIA75Zh2DTZau8x2PgjolHvc0c1iEElvcvOZ3DUY=
X-Received: by 2002:a05:6512:224f:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54990e673e4mr1124037e87.30.1741342691551; Fri, 07 Mar 2025
 02:18:11 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
 <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com> <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
In-Reply-To: <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 7 Mar 2025 11:18:00 +0100
X-Gm-Features: AQ5f1JrMcBR4KNRudiS4sptF6Ep1qWKDhKGlAm4bMnlqZa_JgZc5lZVbqJmBnVE
Message-ID: <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: ecordonnier@snap.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 10:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115783

Shouldn't it be fixed in do_rust_create_wrappers() rust-common.bbclass
? Or why is this specific only for uutils? The buildpaths issue is
triggered from more recipes built with rust (I haven't checked if they
all are caused by this BUILD_LDFLAGS), but we shouldn't change all
these recipes to remove what rust-common.bbclass added.

+Deepesh who did last rust upgrade and few more people who might be
interested in this

On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> I vote for merging this patch. Maybe with a comment pointing to build-rus=
t-ccld.
>
> =C3=89tienne
>
> On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>>
>> I haven't heard back anything, but based on my understanding the reason
>> seems to be the wrapper script, created by cargo_common class, which
>> includes config for both host and target.
>>
>> $UNPACKDIR/cargo_home/config.toml has the following:
>> [target.x86_64-unknown-linux-gnu]
>> linker =3D "${WORKDIR}/wrapper/build-rust-ccld"
>>
>> And in turn build-rust-ccld script passes all the the BUILD_LDFLAGS,
>> including the rpath ones to gcc, and it invokes it directly a few lines
>> later.
>>
>> I think you would see the same issue on Ubuntu if you would pass similar
>> rpath arguments via RUSTFLAGS. E.g. if I do
>>
>> export RUSTFLAGS=3D"-C link-args=3D-Wl,-rpath,EASY_GREP"
>>
>> (which is kinda comparable in a very simplified way to what's going on
>> in the script, in my understanding), then build coreutils on my machine
>> (without Yocto, just my OS), I see the following:
>>
>> [meeee@desktop release]$ strings coreutils | grep EASY
>> EASY_GREP
>>
>>
>> On 06.03.25 16:59, Etienne Cordonnier wrote:
>> > Hi Gyorgy,
>> > it is nice that you found the root-cause. I had debugged this as part
>> > of https://github.com/uutils/coreutils/issues/6833 , but had not found
>> > why the yocto build had this issue and not the normal ubuntu build of
>> > uutils-coreutils.
>> > Have you received some feedback regarding this patch?
>> >
>> > =C3=89tienne
>> >
>> > On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via
>> > lists.openembedded.org <https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttp-3A__lists.openembedded.org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nV=
aCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxY=
Q4FI7np0IioiBch7cCs5Q_naf7NGQ&e=3D >
>> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> >     > -ERROR_QA:remove =3D "buildpaths"
>> >     > -WARN_QA:append =3D " buildpaths"
>> >     > +BUILD_LDFLAGS:remove:class-target =3D "
>> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
>> >     > +
>> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>> >     >
>> >     If this patch isn't shot down and you are trying to build this,
>> >     there is a
>> >     chance that it will fail: that's because BUILD_LDFLAGS is excluded
>> >     from
>> >     base config checksum, so your sscache might conflict with the actu=
al
>> >     recipe state.
>> >
>> >     If you want, can send a v2, including a PR-bump, or something
>> >     along the
>> >     lines.
>> >
>> >
>> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115782): https://lists.openembedded.org/g/openembedde=
d-devel/message/115782
> Mute This Topic: https://lists.openembedded.org/mt/110820444/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

