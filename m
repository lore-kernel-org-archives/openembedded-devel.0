Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A555AC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 16:12:20 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.14897.1741363930694068384
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 08:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Q5q/eljJ;
 spf=pass (domain: snapchat.com, ip: 209.85.218.42, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abf538f7be0so376075666b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 08:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741363929; x=1741968729; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Imnerk5PvWFzK2pAYTx6mNe480RZqbTo2rHOquQepEI=;
        b=Q5q/eljJJGqS8CrYf+0If/XSNin3H6b6TOe+doIy4Y8Yr5sVqpbMA+ZlSw1QbO609U
         aZ8DOTtVgNhr/Mi77lzXDUCTcR8Ll7GLJDmuEbcZVQsAz4hmIpOfjIz2lS01kf6rx5Hq
         pXXA5zz6pwXB6tP2/vaf1Ahe1uRKfcKn9ArsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363929; x=1741968729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Imnerk5PvWFzK2pAYTx6mNe480RZqbTo2rHOquQepEI=;
        b=UkMLxSBXp4nJuBfvetBPrmOtPrfoSs1+ocrU76QsNsTWWeyIo6/KNusii3gxRdsCay
         NW0tsql0gsLknUCJIR3nM0A9yadm7xR+Ohb4tW6xX7BZSKLe+6AWCYBH4VVhKDjk+qaX
         Pun2avMV/m4FjPMR7UgIoCElpageBehWjqgIDhByx1uEbun+p3hf0F4Swr5LoEkNuqLh
         hv+1pXz3DDZSBrBZQWk5FBJfJpCJ2oOrznghPRbwvw2KJq0kf1+45zblHKKZJD8MUwH3
         O08zJEifMOb5UMeIWJSfR18ik9Qt9GT9hoh7LsxHBVSCT4vga0GWHeULIRYWafMHIVjY
         hy9w==
X-Forwarded-Encrypted: i=1; AJvYcCXWBv8GO2F4SDpn0PW/OZvTQ2ShmIBZvMl7LO2tbo0lStoUJEN51rvQMIUaA28Lf6NiEF+beyDXRCVOVbVv5pFbuE4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/0Plz50KDwBLIqpZsU2EReC4axUQ5OucX5uzxTJRkWKXD501m
	BDPGWERkxv8V+54nXR+6l2m06mTv4qDpKS+LIPNmaoNyfrUpmKmqsnEicS8uPfnPVsqspuTXmpP
	7Z7gn6BZCExT/y/aR2WDMIhMq7LnxQkEhpidhhA==
X-Gm-Gg: ASbGncsrQJBpuJEUATSBq/lMQ8sI4v/BKS/9YFaydMRgbWYyJKHiRZWGEvJ1Hfd3/Ha
	2DLZfudt3mDPJJdfx9A3elZM96Yv9jFBypmIPqXkS5RcB997L+8yqPbQQOzv+K1dHyx+iOmbo3s
	QZL/UAdVQXSKP7TzqK4SEt8EC3FA==
X-Google-Smtp-Source: AGHT+IFa2vrPRHb3TyCyNL7mtKR/cVch9TIxomsopdmCEQ7VgB29qT0os5i9VX5okJQCLJKa84ZPvhszQ1YyrGMa+yc=
X-Received: by 2002:a17:906:88a:b0:ac2:6853:b8bd with SMTP id
 a640c23a62f3a-ac26853bbf5mr97434466b.45.1741363928723; Fri, 07 Mar 2025
 08:12:08 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
 <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com> <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
 <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
 <CAHUKmYb1qqEcXJzbssSgoZCD40shmDaCigrkDecz26G4p0jJWw@mail.gmail.com>
 <182A821BEAF2A92A.13616@lists.openembedded.org> <40aa4bf5-4277-4ac3-a2d8-ec100ed32094@gmail.com>
 <182A880E459F446B.13616@lists.openembedded.org>
In-Reply-To: <182A880E459F446B.13616@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 7 Mar 2025 17:11:54 +0100
X-Gm-Features: AQ5f1Jp_x8n3aUW2ZlTlOoYVDHB6lB_AW5y1hbZg8L4aq4S1NK6E8COKETNxBas
Message-ID: <CAHUKmYY6gWh-Xji2EbxNtmqpKDhb-FOyt=86beHbKAsTK+PV3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: ecordonnier@snap.com
Cc: skandigraun@gmail.com, Martin Jansa <martin.jansa@gmail.com>, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com, 
	openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000065a503062fc2e2d0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 16:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115789

--00000000000065a503062fc2e2d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I commented at
https://github.com/uutils/coreutils/issues/6591#issuecomment-2706575853
with reproduction steps since the issue is reproducible without yocto, and
I will try to fix it when I find some time. I've also sent this follow-up
merge-request disabling stdbuf in uutils-coreutils:
https://github.com/openembedded/meta-openembedded/pull/945 and have added
Gyorgy as co-author.

On Fri, Mar 7, 2025 at 2:23=E2=80=AFPM Etienne Cordonnier via lists.openemb=
edded.org
<ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:

> >  so the cross-compiled binary includes the bytecode of the host-compile=
d
> libstdbuf
>
> Good catch. I had not realised that libstdbuf.so was compiled for the
> native architecture. I think what happened is that I've never tested stdb=
uf
> (the recipe uutils-coreutils does not create a symlink for it, because I
> more or less took over "bindir_progs" and "base_bindir_progs" from the
> coreutils bitbake recipe).
> This looks broken:
> :/# coreutils stdbuf -o L ls
> ERROR: ld.so: object '/tmp/.tmpbDjsTc/libstdbuf.so' from LD_PRELOAD canno=
t
> be preloaded (cannot open shared object file): ignored.
>
> On Fri, Mar 7, 2025 at 2:04=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0=
yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2Me=
rtE&e=3D>
> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Responding to my dumb-thread, I think I start to understand (or just
>> digging myself deeper).
>> My patch is wrong.
>>
>> The project uses the bytecode of libstdbuf at build-time only (to inject
>> into itself), and because of this it doesn't need the crate at runtime,
>> so it declares it as build-time dependency[1]. (Which technically it is)
>> Since libstdbuf is a declared as a build-dependency, cargo expects it to
>> be usable at build-time - it makes sense that cargo compiles it for the
>> buildhost.
>>
>> But this of course doesn't work for cross-compiling - the
>> build-dependency is host-compiled, but we need cross-compiled
>> dependency, that we can actually inject in the resulting binary.
>>
>> Two things that I don't know (yet?):
>> 1. How to declare libstdbuf as a dependency only, and compile it into a
>> .so file with the correct target, and make the relevant build.rs
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__build.rs&d=3DDwMF=
aQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dY=
GF3qHw3dVwWZhqs9V&s=3DrWysir67u6WCs8I_hzNX5w01kADmHjjQ-XPSsetY3bs&e=3D>
>> find it
>> also, so it can be injected
>> 2. How does the current cross-compiled binary not segfault all the time?
>>
>> [1]:
>> https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/Cargo.toml#L=
24
>>
>> On 07.03.25 12:34, Gyorgy Sarvari via lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx=
0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2M=
ertE&e=3D>
>> wrote:
>> > Risking that I'm asking the dumbest question ever: so the cross-compil=
ed
>> > binary includes the bytecode of the host-compiled libstdbuf, and it
>> > works somehow? Isn't libstdbuf compiled incorrectly? If it is, than my
>> > patch just hides the issue, but doesn't fix anything (to my regret). O=
r
>> > is it some rust magic, and I'm out of context?
>> >
>> > On 07.03.25 11:47, Etienne Cordonnier wrote:
>> >> I'm not sure how generic this issue is.
>> >> In the case of uutils-coreutils the RPATH is set on libstdbuf.so, and
>> >> then libstdbuf.so is injected into the rust code
>> >> (see
>> https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.r=
s#L34
>> >> : const STDBUF_INJECT: &[u8] =3D include_bytes!(concat!(env!("OUT_DIR=
"),
>> >> "/libstdbuf.so")); )
>> >> Thus the value of the RPATH ends up in the coreutils binary, even
>> >> though the RPATH is not set on the binary itself (by this I mean
>> >> that objdump -x coreutils |grep 'R.*PATH' does not give any result).
>> >>
>> >> Of course ideally this gets fixed in rust-common.bbclass, but
>> >> short-term fixing it in uutils-coreutils would be a nice improvement,
>> >> assuming it is not that generic.
>> >>
>> >> On Fri, Mar 7, 2025 at 11:18=E2=80=AFAM Martin Jansa <martin.jansa@gm=
ail.com>
>> >> wrote:
>> >>
>> >>     Shouldn't it be fixed in do_rust_create_wrappers()
>> rust-common.bbclass
>> >>     ? Or why is this specific only for uutils? The buildpaths issue i=
s
>> >>     triggered from more recipes built with rust (I haven't checked if
>> they
>> >>     all are caused by this BUILD_LDFLAGS), but we shouldn't change al=
l
>> >>     these recipes to remove what rust-common.bbclass added.
>> >>
>> >>     +Deepesh who did last rust upgrade and few more people who might =
be
>> >>     interested in this
>> >>
>> >>     On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne Cordonnier via
>> >>     lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx=
0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2M=
ertE&e=3D>
>> <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Tex=
h_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DCU49qB9Xkj_hRSCAsK1ppwNXX2gw6TUNPvYGFp56=
M6M&e=3D
>> >
>> >>     <ecordonnier=3Dsnap.com@lists.openembedded.org>
>> >>     wrote:
>> >>     >
>> >>     > I vote for merging this patch. Maybe with a comment pointing to
>> >>     build-rust-ccld.
>> >>     >
>> >>     > =C3=89tienne
>> >>     >
>> >>     > On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari
>> >>     <skandigraun@gmail.com> wrote:
>> >>     >>
>> >>     >> I haven't heard back anything, but based on my understanding
>> >>     the reason
>> >>     >> seems to be the wrapper script, created by cargo_common class,
>> >>     which
>> >>     >> includes config for both host and target.
>> >>     >>
>> >>     >> $UNPACKDIR/cargo_home/config.toml has the following:
>> >>     >> [target.x86_64-unknown-linux-gnu]
>> >>     >> linker =3D "${WORKDIR}/wrapper/build-rust-ccld"
>> >>     >>
>> >>     >> And in turn build-rust-ccld script passes all the the
>> >>     BUILD_LDFLAGS,
>> >>     >> including the rpath ones to gcc, and it invokes it directly a
>> >>     few lines
>> >>     >> later.
>> >>     >>
>> >>     >> I think you would see the same issue on Ubuntu if you would
>> >>     pass similar
>> >>     >> rpath arguments via RUSTFLAGS. E.g. if I do
>> >>     >>
>> >>     >> export RUSTFLAGS=3D"-C link-args=3D-Wl,-rpath,EASY_GREP"
>> >>     >>
>> >>     >> (which is kinda comparable in a very simplified way to what's
>> >>     going on
>> >>     >> in the script, in my understanding), then build coreutils on m=
y
>> >>     machine
>> >>     >> (without Yocto, just my OS), I see the following:
>> >>     >>
>> >>     >> [meeee@desktop release]$ strings coreutils | grep EASY
>> >>     >> EASY_GREP
>> >>     >>
>> >>     >>
>> >>     >> On 06.03.25 16:59, Etienne Cordonnier wrote:
>> >>     >> > Hi Gyorgy,
>> >>     >> > it is nice that you found the root-cause. I had debugged thi=
s
>> >>     as part
>> >>     >> > of https://github.com/uutils/coreutils/issues/6833 , but had
>> >>     not found
>> >>     >> > why the yocto build had this issue and not the normal ubuntu
>> >>     build of
>> >>     >> > uutils-coreutils.
>> >>     >> > Have you received some feedback regarding this patch?
>> >>     >> >
>> >>     >> > =C3=89tienne
>> >>     >> >
>> >>     >> > On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via
>> >>     >> > lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx=
0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2M=
ertE&e=3D>
>> <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Tex=
h_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DCU49qB9Xkj_hRSCAsK1ppwNXX2gw6TUNPvYGFp56=
M6M&e=3D
>> >
>> >>     <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1=
oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7=
NGQ&e=3D
>> >>     <
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded=
.org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNon=
VuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1=
oLPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7=
NGQ&e=3D
>> >
>> >>     >
>> >>     >> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>> >>     >> >
>> >>     >> >     > -ERROR_QA:remove =3D "buildpaths"
>> >>     >> >     > -WARN_QA:append =3D " buildpaths"
>> >>     >> >     > +BUILD_LDFLAGS:remove:class-target =3D "
>> >>     >> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
>> >>     >> >     > +
>> >>     >> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
>> >>     >> >     >
>> >>     >> >     If this patch isn't shot down and you are trying to buil=
d
>> >>     this,
>> >>     >> >     there is a
>> >>     >> >     chance that it will fail: that's because BUILD_LDFLAGS i=
s
>> >>     excluded
>> >>     >> >     from
>> >>     >> >     base config checksum, so your sscache might conflict wit=
h
>> >>     the actual
>> >>     >> >     recipe state.
>> >>     >> >
>> >>     >> >     If you want, can send a v2, including a PR-bump, or
>> something
>> >>     >> >     along the
>> >>     >> >     lines.
>> >>     >> >
>> >>     >> >
>> >>     >> >
>> >>     >
>> >>     >
>> >>     >
>> >>     >
>> >>
>> >>
>> >>
>> >>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115787):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115787&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DiK=
yTOKtjcwVxf4C_Dc-VB8UTCb-v94ZocDwMTntG18E&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbpDuOl3Y0i=
gEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DOfiV5AXeXuEPxAYs51Q=
I-5tmvjwiXSv--jSjdy3JDRQ&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DePkbp=
DuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&s=3DHYqLcQ5y1oQ=
oKoxn6k3ExEWY2CCF0BPW83HN-_xi4wc&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000065a503062fc2e2d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I commented at=C2=A0<a href=3D"https://github.com/uutils/c=
oreutils/issues/6591#issuecomment-2706575853">https://github.com/uutils/cor=
eutils/issues/6591#issuecomment-2706575853</a> with reproduction steps sinc=
e the issue is reproducible without yocto, and I will try to fix it when I =
find some time.=C2=A0I&#39;ve also=C2=A0sent this follow-up merge-request d=
isabling stdbuf in uutils-coreutils:<br><a href=3D"https://github.com/opene=
mbedded/meta-openembedded/pull/945">https://github.com/openembedded/meta-op=
enembedded/pull/945</a> and have added Gyorgy as co-author.</div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Mar 7, 2025 at 2:23=E2=80=AFPM Etienne Cordonnier via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonni=
er=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">&gt;=C2=A0=C2=A0so the cross-compiled binary i=
ncludes the bytecode of the host-compiled libstdbuf<br><br><div>Good catch.=
 I had not realised that libstdbuf.so was compiled for the native architect=
ure. I think what happened is that I&#39;ve never tested stdbuf (the recipe=
 uutils-coreutils does not create a symlink for it, because I more or less =
took over &quot;bindir_progs&quot; and &quot;base_bindir_progs&quot; from t=
he coreutils bitbake recipe).<br>This looks broken:<br>:/# coreutils stdbuf=
 -o L ls<br>ERROR: ld.so: object &#39;/tmp/.tmpbDjsTc/libstdbuf.so&#39; fro=
m LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Mar 7, 2025 at 2:04=E2=80=AFPM Gyorgy Sarvari via <a href=3D"=
https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.or=
g&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjk=
QzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&amp;s=3DMYmdoPFBW1jl-2xFYK0wnj=
8X6pVU2_wl9EK-s2MertE&amp;e=3D" target=3D"_blank">lists.openembedded.org</a=
> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Responding to my dumb-thread=
, I think I start to understand (or just<br>
digging myself deeper).<br>
My patch is wrong.<br>
<br>
The project uses the bytecode of libstdbuf at build-time only (to inject<br=
>
into itself), and because of this it doesn&#39;t need the crate at runtime,=
<br>
so it declares it as build-time dependency[1]. (Which technically it is)<br=
>
Since libstdbuf is a declared as a build-dependency, cargo expects it to<br=
>
be usable at build-time - it makes sense that cargo compiles it for the<br>
buildhost.<br>
<br>
But this of course doesn&#39;t work for cross-compiling - the<br>
build-dependency is host-compiled, but we need cross-compiled<br>
dependency, that we can actually inject in the resulting binary.<br>
<br>
Two things that I don&#39;t know (yet?):<br>
1. How to declare libstdbuf as a dependency only, and compile it into a<br>
.so file with the correct target, and make the relevant <a href=3D"https://=
urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__build.rs&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPh=
s7dYGF3qHw3dVwWZhqs9V&amp;s=3DrWysir67u6WCs8I_hzNX5w01kADmHjjQ-XPSsetY3bs&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">build.rs</a> find it<br>
also, so it can be injected<br>
2. How does the current cross-compiled binary not segfault all the time?<br=
>
<br>
[1]:<br>
<a href=3D"https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/Carg=
o.toml#L24" rel=3D"noreferrer" target=3D"_blank">https://github.com/uutils/=
coreutils/blob/main/src/uu/stdbuf/Cargo.toml#L24</a><br>
<br>
On 07.03.25 12:34, Gyorgy Sarvari via <a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dY=
GF3qHw3dVwWZhqs9V&amp;s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2MertE&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; Risking that I&#39;m asking the dumbest question ever: so the cross-co=
mpiled<br>
&gt; binary includes the bytecode of the host-compiled libstdbuf, and it<br=
>
&gt; works somehow? Isn&#39;t libstdbuf compiled incorrectly? If it is, tha=
n my<br>
&gt; patch just hides the issue, but doesn&#39;t fix anything (to my regret=
). Or<br>
&gt; is it some rust magic, and I&#39;m out of context?<br>
&gt;<br>
&gt; On 07.03.25 11:47, Etienne Cordonnier wrote:<br>
&gt;&gt; I&#39;m not sure how generic this issue is.<br>
&gt;&gt; In the case of uutils-coreutils the RPATH is set on libstdbuf.so, =
and<br>
&gt;&gt; then libstdbuf.so is injected into the rust code<br>
&gt;&gt; (see=C2=A0<a href=3D"https://github.com/uutils/coreutils/blob/main=
/src/uu/stdbuf/src/stdbuf.rs#L34" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L34</=
a><br>
&gt;&gt; : const STDBUF_INJECT: &amp;[u8] =3D include_bytes!(concat!(env!(&=
quot;OUT_DIR&quot;),<br>
&gt;&gt; &quot;/libstdbuf.so&quot;)); )<br>
&gt;&gt; Thus the value of the RPATH ends up in the coreutils binary, even<=
br>
&gt;&gt; though the RPATH is not set on the binary itself (by this I mean<b=
r>
&gt;&gt; that=C2=A0objdump -x coreutils |grep &#39;R.*PATH&#39; does not gi=
ve any result).<br>
&gt;&gt;<br>
&gt;&gt; Of course ideally this gets fixed in rust-common.bbclass, but<br>
&gt;&gt; short-term fixing it in uutils-coreutils would be a nice improveme=
nt,<br>
&gt;&gt; assuming it is not that generic.<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Mar 7, 2025 at 11:18=E2=80=AFAM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Shouldn&#39;t it be fixed in do_rust_create_wra=
ppers() rust-common.bbclass<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0? Or why is this specific only for uutils? The =
buildpaths issue is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0triggered from more recipes built with rust (I =
haven&#39;t checked if they<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0all are caused by this BUILD_LDFLAGS), but we s=
houldn&#39;t change all<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0these recipes to remove what rust-common.bbclas=
s added.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0+Deepesh who did last rust upgrade and few more=
 people who might be<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0interested in this<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne=
 Cordonnier via<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.com/v2=
/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUk=
SGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVw=
WZhqs9V&amp;s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2MertE&amp;e=3D" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D=
"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.o=
rg&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpS=
MCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DCU49qB9Xkj_hRSCAsK1ppw=
NXX2gw6TUNPvYGFp56M6M&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;=
d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpSMCByydy=
k1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DCU49qB9Xkj_hRSCAsK1ppwNXX2gw6=
TUNPvYGFp56M6M&amp;e=3D</a> &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;ecordonnier=3D<a href=3D"mailto:snap.com@li=
sts.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org</a>=
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; I vote for merging this patch. Maybe with =
a comment pointing to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0build-rust-ccld.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C3=89tienne<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyo=
rgy Sarvari<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:skandigraun@gmail.com" ta=
rget=3D"_blank">skandigraun@gmail.com</a>&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I haven&#39;t heard back anything, but=
 based on my understanding<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the reason<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; seems to be the wrapper script, create=
d by cargo_common class,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0which<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; includes config for both host and targ=
et.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; $UNPACKDIR/cargo_home/config.toml has =
the following:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; [target.x86_64-unknown-linux-gnu]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; linker =3D &quot;${WORKDIR}/wrapper/bu=
ild-rust-ccld&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; And in turn build-rust-ccld script pas=
ses all the the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0BUILD_LDFLAGS,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; including the rpath ones to gcc, and i=
t invokes it directly a<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0few lines<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; later.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I think you would see the same issue o=
n Ubuntu if you would<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0pass similar<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; rpath arguments via RUSTFLAGS. E.g. if=
 I do<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; export RUSTFLAGS=3D&quot;-C link-args=
=3D-Wl,-rpath,EASY_GREP&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; (which is kinda comparable in a very s=
implified way to what&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0going on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; in the script, in my understanding), t=
hen build coreutils on my<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0machine<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; (without Yocto, just my OS), I see the=
 following:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; [meeee@desktop release]$ strings coreu=
tils | grep EASY<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; EASY_GREP<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On 06.03.25 16:59, Etienne Cordonnier =
wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; Hi Gyorgy,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; it is nice that you found the roo=
t-cause. I had debugged this<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0as part<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; of <a href=3D"https://github.com/=
uutils/coreutils/issues/6833" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/uutils/coreutils/issues/6833</a> , but had<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0not found<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; why the yocto build had this issu=
e and not the normal ubuntu<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0build of<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; uutils-coreutils.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; Have you received some feedback r=
egarding this patch?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; =C3=89tienne<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; On Sun, Jan 26, 2025 at 12:37=E2=
=80=AFPM Gyorgy Sarvari via<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; <a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPh=
s7dYGF3qHw3dVwWZhqs9V&amp;s=3DMYmdoPFBW1jl-2xFYK0wnj8X6pVU2_wl9EK-s2MertE&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &l=
t;<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.op=
enembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2ep=
ckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNud=
xhYaEIXDMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DCU49qB9Xkj=
_hRSCAsK1ppwNXX2gw6TUNPvYGFp56M6M&amp;e=3D" rel=3D"noreferrer" target=3D"_b=
lank">https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembed=
ded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIX=
DMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DCU49qB9Xkj_hRSCAs=
K1ppwNXX2gw6TUNPvYGFp56M6M&amp;e=3D</a> &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-=
2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3=
v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&amp;e=3D</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmph=
kJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJ=
TKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-=
2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02bVYipc0uH-2PY8vQ3=
v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&amp;e=3D</a>&gt;<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; &lt;skandigraun=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.open=
embedded.org</a>&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -ERROR_QA=
:remove =3D &quot;buildpaths&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -WARN_QA:=
append =3D &quot; buildpaths&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +BUILD_LD=
FLAGS:remove:class-target =3D &quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${S=
TAGING_LIBDIR_NATIVE}=C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${S=
TAGING_BASE_LIBDIR_NATIVE} &quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0If this patch =
isn&#39;t shot down and you are trying to build<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0this,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0there is a<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0chance that it=
 will fail: that&#39;s because BUILD_LDFLAGS is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0excluded<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0from<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0base config ch=
ecksum, so your sscache might conflict with<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the actual<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0recipe state.<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0If you want, c=
an send a v2, including a PR-bump, or something<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0along the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0lines.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115787): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
15787&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwF=
zjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&amp;s=3DiKyTOKtjcwVxf4C_Dc-=
VB8UTCb-v94ZocDwMTntG18E&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_115787&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZh=
qs9V&amp;s=3DiKyTOKtjcwVxf4C_Dc-VB8UTCb-v94ZocDwMTntG18E&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKPhs7d=
YGF3qHw3dVwWZhqs9V&amp;s=3DOfiV5AXeXuEPxAYs51QI-5tmvjwiXSv--jSjdy3JDRQ&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4Ud=
Yx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&amp;s=3DOfiV5AXeXuEPxAYs51QI-5tmvjwiXSv--=
jSjdy3JDRQ&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzjkQzZvCX7L4UdYx0yfi5orKP=
hs7dYGF3qHw3dVwWZhqs9V&amp;s=3DHYqLcQ5y1oQoKoxn6k3ExEWY2CCF0BPW83HN-_xi4wc&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DePkbpDuOl3Y0igEwFzj=
kQzZvCX7L4UdYx0yfi5orKPhs7dYGF3qHw3dVwWZhqs9V&amp;s=3DHYqLcQ5y1oQoKoxn6k3Ex=
EWY2CCF0BPW83HN-_xi4wc&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000065a503062fc2e2d0--

