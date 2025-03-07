Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16FDC28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 11:34:28 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.8960.1741347261944560110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 03:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7AZFUke;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so2513626a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 03:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741347260; x=1741952060; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPDy4SRBRYiH0yznS1ybUMi21m4taY7kpMv9rAXA6I8=;
        b=e7AZFUkePRKf6kh2D517i3872Kho0w2hTE2lxTxco0sReak5uZt+013AObSIV5CVKT
         HJDXxDyfbTi1XzdbFK++M6VYfLlG0dXTSxZJzbwAI8jTQHshgOGfAcdtLdhLQenrcZM0
         55Cdni+L+DSsjOzu2qX8kfsqaGhLGDM1VEH0lOj6jPdKb2UVKuBRhNHqBbgCdne+D3V4
         +o4Kwyh6G9rpnHMY1EinH70OWuTpzboJ91edcVhM/HN/VFCFlyhGTyuTQZAXn1Se/l9c
         yrwUQLMXnVZrkS7MUomoqLKt7j2NGY2is0qkacpvxbK0fPhINH5Q1S4H4VG6Sp3hQC2R
         Z85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347260; x=1741952060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPDy4SRBRYiH0yznS1ybUMi21m4taY7kpMv9rAXA6I8=;
        b=vbJVAmRWd92evABF0aAjvSZPt7vCT0qIAKtoAWHGLDog9X2PZoVOSL8thoVeo6Qlah
         q+ok+YMA2hikv3SCk/l/H6iuvGnzi2WNZAfh0JiLZWAD2qpfxaRRtLXuX7CMUpQTVvqQ
         I1PAccj73pxvBDnNDwpNtiN+ffr9HbkFmmqfYa8IAau5Lvs9+S/ougqLo895NIJ7JuLk
         xXda6izBWB9Jb8dlXNNLJ3QUICYQAqkq5iKNnKFX40AEBfGZVwbIvL6PVrBxYiXtl0ZT
         o+9hxwpoB7a3HWI7htvizLoWQvZap2fqcX0TB+D6R/GsG9V4Sfw6Cl05+B/nFaEXbW50
         yrKA==
X-Forwarded-Encrypted: i=1; AJvYcCWzMZ2muOUySKzlIk41J0zr0WcwOLZz557GFZx8t84TOh2BAWzWlYu3HR/41a89ibsUttFg+65MDA5zuv3v9f/KIz8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkJuV0TGHlydeQ8klMyvV5k1+0UZyoLdP0ij8nyhJNwNgCV8pV
	QBWz1oauQatTBntHiOMzB+M9XWMf/sPrQwxl9eL6+8bHgPdxE9rZ
X-Gm-Gg: ASbGncu/txxfAvp1C0HRFIKglBoUXbymEsUB5cP7H6AaBEu/53W6HIHiSrqb30WKR8h
	ukyWOJAm1l7M/eWFbH4/fo1r953bxR9zsqZBpQUjiBU5Bkg50RNuSNWwCzPjA9zjwEXk0jundhZ
	toMYYfuCIUtoFj4gWW5zfZBKc0SqesbAXDqDSNJIPei4fgS99z6s4eUJ1u+UoTkbMBPdnZ6ul/r
	97PbF9LFLH5VezMAiCKEzqKxuMCXldxfP+2+aGQ/bQdiPCQ1nAs1mkJzgLdEH6Lq7XJcxfBm+nd
	79pY9dDabWJsROq8T1tUj/2knsvzRNDdUN5zb9JCCVf0L1TT8CBV
X-Google-Smtp-Source: AGHT+IGzLGqZwq81mCT1et4dLnALpH2QjjicF/78NFuc9wLNGJZINsXfkMV3uMZcaiRHGM/SB+BbeQ==
X-Received: by 2002:a17:906:f59c:b0:ac2:47f7:4ad7 with SMTP id a640c23a62f3a-ac252f5c8f6mr359396166b.36.1741347259860;
        Fri, 07 Mar 2025 03:34:19 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239488c9csm261609666b.73.2025.03.07.03.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 03:34:19 -0800 (PST)
Message-ID: <6c190120-3f03-40f1-817a-a2864ceb4880@gmail.com>
Date: Fri, 7 Mar 2025 12:34:18 +0100
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
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAHUKmYb1qqEcXJzbssSgoZCD40shmDaCigrkDecz26G4p0jJWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 11:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115785

Risking that I'm asking the dumbest question ever: so the cross-compiled
binary includes the bytecode of the host-compiled libstdbuf, and it
works somehow? Isn't libstdbuf compiled incorrectly? If it is, than my
patch just hides the issue, but doesn't fix anything (to my regret). Or
is it some rust magic, and I'm out of context?

On 07.03.25 11:47, Etienne Cordonnier wrote:
> I'm not sure how generic this issue is.
> In the case of uutils-coreutils the RPATH is set on libstdbuf.so, and
> then libstdbuf.so is injected into the rust code
> (see https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L34
> : const STDBUF_INJECT: &[u8] = include_bytes!(concat!(env!("OUT_DIR"),
> "/libstdbuf.so")); )
> Thus the value of the RPATH ends up in the coreutils binary, even
> though the RPATH is not set on the binary itself (by this I mean
> that objdump -x coreutils |grep 'R.*PATH' does not give any result).
>
> Of course ideally this gets fixed in rust-common.bbclass, but
> short-term fixing it in uutils-coreutils would be a nice improvement,
> assuming it is not that generic.
>
> On Fri, Mar 7, 2025 at 11:18 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>     Shouldn't it be fixed in do_rust_create_wrappers() rust-common.bbclass
>     ? Or why is this specific only for uutils? The buildpaths issue is
>     triggered from more recipes built with rust (I haven't checked if they
>     all are caused by this BUILD_LDFLAGS), but we shouldn't change all
>     these recipes to remove what rust-common.bbclass added.
>
>     +Deepesh who did last rust upgrade and few more people who might be
>     interested in this
>
>     On Fri, Mar 7, 2025 at 11:06 AM Etienne Cordonnier via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <ecordonnier=snap.com@lists.openembedded.org>
>     wrote:
>     >
>     > I vote for merging this patch. Maybe with a comment pointing to
>     build-rust-ccld.
>     >
>     > Étienne
>     >
>     > On Thu, Mar 6, 2025 at 5:40 PM Gyorgy Sarvari
>     <skandigraun@gmail.com> wrote:
>     >>
>     >> I haven't heard back anything, but based on my understanding
>     the reason
>     >> seems to be the wrapper script, created by cargo_common class,
>     which
>     >> includes config for both host and target.
>     >>
>     >> $UNPACKDIR/cargo_home/config.toml has the following:
>     >> [target.x86_64-unknown-linux-gnu]
>     >> linker = "${WORKDIR}/wrapper/build-rust-ccld"
>     >>
>     >> And in turn build-rust-ccld script passes all the the
>     BUILD_LDFLAGS,
>     >> including the rpath ones to gcc, and it invokes it directly a
>     few lines
>     >> later.
>     >>
>     >> I think you would see the same issue on Ubuntu if you would
>     pass similar
>     >> rpath arguments via RUSTFLAGS. E.g. if I do
>     >>
>     >> export RUSTFLAGS="-C link-args=-Wl,-rpath,EASY_GREP"
>     >>
>     >> (which is kinda comparable in a very simplified way to what's
>     going on
>     >> in the script, in my understanding), then build coreutils on my
>     machine
>     >> (without Yocto, just my OS), I see the following:
>     >>
>     >> [meeee@desktop release]$ strings coreutils | grep EASY
>     >> EASY_GREP
>     >>
>     >>
>     >> On 06.03.25 16:59, Etienne Cordonnier wrote:
>     >> > Hi Gyorgy,
>     >> > it is nice that you found the root-cause. I had debugged this
>     as part
>     >> > of https://github.com/uutils/coreutils/issues/6833 , but had
>     not found
>     >> > why the yocto build had this issue and not the normal ubuntu
>     build of
>     >> > uutils-coreutils.
>     >> > Have you received some feedback regarding this patch?
>     >> >
>     >> > Étienne
>     >> >
>     >> > On Sun, Jan 26, 2025 at 12:37 PM Gyorgy Sarvari via
>     >> > lists.openembedded.org <http://lists.openembedded.org>
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org&d=DwIDaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=r_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=OYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&e=
>     <https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org&d=DwIDaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=r_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=OYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&e=>
>     >
>     >> > <skandigraun=gmail.com@lists.openembedded.org> wrote:
>     >> >
>     >> >     > -ERROR_QA:remove = "buildpaths"
>     >> >     > -WARN_QA:append = " buildpaths"
>     >> >     > +BUILD_LDFLAGS:remove:class-target = "
>     >> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
>     >> >     > +
>     >> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>     >> >     >
>     >> >     If this patch isn't shot down and you are trying to build
>     this,
>     >> >     there is a
>     >> >     chance that it will fail: that's because BUILD_LDFLAGS is
>     excluded
>     >> >     from
>     >> >     base config checksum, so your sscache might conflict with
>     the actual
>     >> >     recipe state.
>     >> >
>     >> >     If you want, can send a v2, including a PR-bump, or something
>     >> >     along the
>     >> >     lines.
>     >> >
>     >> >
>     >> >
>     >
>     >
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#115782):
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_115782&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=mv9-JoFG8rCJwz-zydMCBkgwQK24kuO8Jc5VR2QtK9o&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_115782&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=mv9-JoFG8rCJwz-zydMCBkgwQK24kuO8Jc5VR2QtK9o&e=>
>
>     > Mute This Topic:
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_110820444_3617156&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=yVIEBlNAg7gptJo6-HlUmQRo2UhHiEQCHS9U7SXZNmg&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_110820444_3617156&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=yVIEBlNAg7gptJo6-HlUmQRo2UhHiEQCHS9U7SXZNmg&e=>
>
>     > Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     > Unsubscribe:
>     https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=Y78_vGNHT-81F0m1bZ8UtjZIGr8OA6Orx60Wfp5pPO8&e=
>     <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&d=DwIFaQ&c=ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=p9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=Y78_vGNHT-81F0m1bZ8UtjZIGr8OA6Orx60Wfp5pPO8&e=> 
>     [martin.jansa@gmail.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>

