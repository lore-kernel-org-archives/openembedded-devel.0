Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC57C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:04:39 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.10380.1741352670157172653
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcvWLAyd;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf518748cbso332704466b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 05:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741352668; x=1741957468; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M78VOLUcXiXr14yJuNKsHHzV+oWAV0u/O1vBO0GQJ48=;
        b=jcvWLAydCmM2+++AA4pkyeb+meS1sZTmh/2n3jqB2TS/BiOgEVOgguqnNVxKUHtwC/
         dF+2G27vZ5oYNvl5CoOAZue6maXDjPS6zicRNXj0AGH5VyMojrtAJWB5zH5WNvuIy7cr
         FYFUZykIXFSxuHpr37S/B8hurQECh5Ugq59Ag46GQWZ8CGu1/y9vzP2ebW43tIPsGoNF
         o7JxcRWt5SGiyp3M1Qi3LSGunkQsAcsc/rcc0vY0l6xuNTdb3kCobu+KN1O3x3EjzNJD
         2eU5kii9SorPbm8GcD7Ppy26DR0BB5ASI9il8j8FgbqvDCM1Opx59FnwUrkY42k+kxjL
         KbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741352668; x=1741957468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M78VOLUcXiXr14yJuNKsHHzV+oWAV0u/O1vBO0GQJ48=;
        b=N94LJWfFwMDoByvryCOdRBqkC+I9t9bsh5t3Nevjn+22wFMwXSF0U8BvNLtL1pBDii
         woXwkfrWBaB8gWg2xC6bT/MA+6FfeKIvoLPV48J+qMpb2rwPsBtqHvmCxNwM8SKGUnTC
         vC3Es3p71bJZTx5Ojy2BArkL/DM0ErLXGqQKatnfmPUXtNjvTHqbAvB3QtFNnymW9/Zj
         YyCX2keB2f+gUO0lnZ6m6AGItgwgYYDLoCmej2T0WEs+xBDRCgFbG27Q5xQKU0d0sbKx
         L44HcLFSCqwJaiPZLuznVmMBzkwd+7blyVhyY2hgS2zCs0TwjHzT2DGWWjYkyotjt99+
         uxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp4bqtRuQBsnq3/G0cPiAYo+GLaN4ZMq1UOhGyAB9Kpm3yAl54YYzF1ZA6FG8defD1eSESrmc/UJ+ZlOKz8ADp7oE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/JmNKRgH9cmdnMkKue5rNpl2ubn4sJzygKyTpi3KJVBhlu9sL
	XSFds54r2/KDNCaS/S9BEp0PKs++6eq1+Fln86+XUjLVuWpLhyX1
X-Gm-Gg: ASbGncuLrAldoULwh8xJTiIFS2weJAm3WSm47/bZP2CKPY/v/PY+7jkMpgrSxzrBrms
	8to1b7h/S1c9Zhkx5gLTCc0AivrLpPUE5ePmAyVnpjN5AGbBQWFAjwumSEZdcT+Hrr225Uz2bMx
	xiReh5M/zhKo4DJOxRv/D7h8K+RoYjHo64nQdtvcCxLMlyupz7UhzvmTUydE7iVlGJuB9ypfx7h
	ZA5n0tJqsH138XskINpCY/r0kGm2upDv0kG+OcYrt+Ckb1q9NVz7n8TURJ6zOeHxMIjzUU2UZy0
	dn9xhdF8sdZIFRL1yJA3F7YcJRUuD3Hb33Vyf8mjcMi/TBvEWJfz
X-Google-Smtp-Source: AGHT+IGtnQ47iLHeDRk8k2/duRyzz3pGEE7B59n9Oh177EXco/jl2KWZrJ2nCb5xRjadr8SSygCUaw==
X-Received: by 2002:a17:907:8326:b0:abf:663b:22c2 with SMTP id a640c23a62f3a-ac252ed60bdmr317878466b.51.1741352668041;
        Fri, 07 Mar 2025 05:04:28 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988aed3sm271063866b.128.2025.03.07.05.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 05:04:27 -0800 (PST)
Message-ID: <40aa4bf5-4277-4ac3-a2d8-ec100ed32094@gmail.com>
Date: Fri, 7 Mar 2025 14:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build
 output
To: Etienne Cordonnier <ecordonnier@snap.com>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
 openembedded-devel@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org>
 <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
 <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com>
 <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
 <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
 <CAHUKmYb1qqEcXJzbssSgoZCD40shmDaCigrkDecz26G4p0jJWw@mail.gmail.com>
 <182A821BEAF2A92A.13616@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <182A821BEAF2A92A.13616@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 13:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115786

Responding to my dumb-thread, I think I start to understand (or just
digging myself deeper).
My patch is wrong.

The project uses the bytecode of libstdbuf at build-time only (to inject
into itself), and because of this it doesn't need the crate at runtime,
so it declares it as build-time dependency[1]. (Which technically it is)
Since libstdbuf is a declared as a build-dependency, cargo expects it to
be usable at build-time - it makes sense that cargo compiles it for the
buildhost.

But this of course doesn't work for cross-compiling - the
build-dependency is host-compiled, but we need cross-compiled
dependency, that we can actually inject in the resulting binary.

Two things that I don't know (yet?):
1. How to declare libstdbuf as a dependency only, and compile it into a
.so file with the correct target, and make the relevant build.rs find it
also, so it can be injected
2. How does the current cross-compiled binary not segfault all the time?

[1]:
https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/Cargo.toml#L24

On 07.03.25 12:34, Gyorgy Sarvari via lists.openembedded.org wrote:
> Risking that I'm asking the dumbest question ever: so the cross-compiled
> binary includes the bytecode of the host-compiled libstdbuf, and it
> works somehow? Isn't libstdbuf compiled incorrectly? If it is, than my
> patch just hides the issue, but doesn't fix anything (to my regret). Or
> is it some rust magic, and I'm out of context?
>
> On 07.03.25 11:47, Etienne Cordonnier wrote:
>> I'm not sure how generic this issue is.
>> In the case of uutils-coreutils the RPATH is set on libstdbuf.so, and
>> then libstdbuf.so is injected into the rust code
>> (see https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L34
>> : const STDBUF_INJECT: &[u8] = include_bytes!(concat!(env!("OUT_DIR"),
>> "/libstdbuf.so")); )
>> Thus the value of the RPATH ends up in the coreutils binary, even
>> though the RPATH is not set on the binary itself (by this I mean
>> that objdump -x coreutils |grep 'R.*PATH' does not give any result).
>>
>> Of course ideally this gets fixed in rust-common.bbclass, but
>> short-term fixing it in uutils-coreutils would be a nice improvement,
>> assuming it is not that generic.
>>
>> On Fri, Mar 7, 2025 at 11:18 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>     Shouldn't it be fixed in do_rust_create_wrappers() rust-common.bbclass
>>     ? Or why is this specific only for uutils? The buildpaths issue is
>>     triggered from more recipes built with rust (I haven't checked if they
>>     all are caused by this BUILD_LDFLAGS), but we shouldn't change all
>>     these recipes to remove what rust-common.bbclass added.
>>
>>     +Deepesh who did last rust upgrade and few more people who might be
>>     interested in this
>>
>>     On Fri, Mar 7, 2025 at 11:06 AM Etienne Cordonnier via
>>     lists.openembedded.org <http://lists.openembedded.org>
>>     <ecordonnier=snap.com@lists.openembedded.org>
>>     wrote:
>>     >
>>     > I vote for merging this patch. Maybe with a comment pointing to
>>     build-rust-ccld.
>>     >
>>     > Étienne
>>     >
>>     > On Thu, Mar 6, 2025 at 5:40 PM Gyorgy Sarvari
>>     <skandigraun@gmail.com> wrote:
>>     >>
>>     >> I haven't heard back anything, but based on my understanding
>>     the reason
>>     >> seems to be the wrapper script, created by cargo_common class,
>>     which
>>     >> includes config for both host and target.
>>     >>
>>     >> $UNPACKDIR/cargo_home/config.toml has the following:
>>     >> [target.x86_64-unknown-linux-gnu]
>>     >> linker = "${WORKDIR}/wrapper/build-rust-ccld"
>>     >>
>>     >> And in turn build-rust-ccld script passes all the the
>>     BUILD_LDFLAGS,
>>     >> including the rpath ones to gcc, and it invokes it directly a
>>     few lines
>>     >> later.
>>     >>
>>     >> I think you would see the same issue on Ubuntu if you would
>>     pass similar
>>     >> rpath arguments via RUSTFLAGS. E.g. if I do
>>     >>
>>     >> export RUSTFLAGS="-C link-args=-Wl,-rpath,EASY_GREP"
>>     >>
>>     >> (which is kinda comparable in a very simplified way to what's
>>     going on
>>     >> in the script, in my understanding), then build coreutils on my
>>     machine
>>     >> (without Yocto, just my OS), I see the following:
>>     >>
>>     >> [meeee@desktop release]$ strings coreutils | grep EASY
>>     >> EASY_GREP
>>     >>
>>     >>
>>     >> On 06.03.25 16:59, Etienne Cordonnier wrote:
>>     >> > Hi Gyorgy,
>>     >> > it is nice that you found the root-cause. I had debugged this
>>     as part
>>     >> > of https://github.com/uutils/coreutils/issues/6833 , but had
>>     not found
>>     >> > why the yocto build had this issue and not the normal ubuntu
>>     build of
>>     >> > uutils-coreutils.
>>     >> > Have you received some feedback regarding this patch?
>>     >> >
>>     >> > Étienne
>>     >> >
>>     >> > On Sun, Jan 26, 2025 at 12:37 PM Gyorgy Sarvari via
>>     >> > lists.openembedded.org <http://lists.openembedded.org>
>>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org&d=DwIDaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=r_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=OYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&e=
>>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org&d=DwIDaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=r_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=OYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&e=>
>>     >
>>     >> > <skandigraun=gmail.com@lists.openembedded.org> wrote:
>>     >> >
>>     >> >     > -ERROR_QA:remove = "buildpaths"
>>     >> >     > -WARN_QA:append = " buildpaths"
>>     >> >     > +BUILD_LDFLAGS:remove:class-target = "
>>     >> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
>>     >> >     > +
>>     >> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>>     >> >     >
>>     >> >     If this patch isn't shot down and you are trying to build
>>     this,
>>     >> >     there is a
>>     >> >     chance that it will fail: that's because BUILD_LDFLAGS is
>>     excluded
>>     >> >     from
>>     >> >     base config checksum, so your sscache might conflict with
>>     the actual
>>     >> >     recipe state.
>>     >> >
>>     >> >     If you want, can send a v2, including a PR-bump, or something
>>     >> >     along the
>>     >> >     lines.
>>     >> >
>>     >> >
>>     >> >
>>     >
>>     >
>>     > 
>>     >
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#115785): https://lists.openembedded.org/g/openembedded-devel/message/115785
>> Mute This Topic: https://lists.openembedded.org/mt/110820444/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

