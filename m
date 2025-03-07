Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06FBC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:23:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.10808.1741353800240956970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=YhYd5z48;
 spf=pass (domain: snapchat.com, ip: 209.85.218.53, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec111762bso343250666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741353799; x=1741958599; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUyjfARExZtgSYMNvUwpHvF4RfkTztzlCL7qJ1u6Dz4=;
        b=YhYd5z48Z9kir3G00swkOa8kExSEDhCR6RSoiYq6d0I+0Mck+cXeRvd6a5JapOF6gK
         J07KCrujpK8LEt+TPiBRAALCQITAwAynIGfU/pUd6d9HJY6E3Rrh420gBpVjhTG2nq9T
         y3sJ3/qPY08Ym09RvmeocBp9N87pHjkTp6qU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353799; x=1741958599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUyjfARExZtgSYMNvUwpHvF4RfkTztzlCL7qJ1u6Dz4=;
        b=mv1kLH9CXE72BbmC7GBcllG3lCMHcCDn67Sak3Wd55sgS5jOmvdZoGnQA+lrwSxd//
         nwTIBB+/ifS2IzHvoCf9Q3ix3CJQScBuPdCQxm4C5TAmOrAm54egMmyudCC6T6VcrdgZ
         95x3I7xb6nz7oL3s9FopKPyCiBQ55nEETVjSCBnl+vPScEceSO4LRvRf3MnfPL7n5BWw
         CRG8Ug2VMfxCkHc4AFDRfb2i6Z7EDr1pHZk20X6cZg7InGQpijbUtY1NgpEBIhQNmQ/w
         tH7VBL7xYa9dMYDE0dRopNeHpgWczD7BiyyUcDxDVTGJQChPGcmelX86H5PEPGe9YIng
         fSvg==
X-Forwarded-Encrypted: i=1; AJvYcCUscAUUDRkySEc3RnYYiYfWHhjXzKoiZOLmJtbyRb6MvQBJIUvpxlQtYq//LC5gWrkLxGj3i2xQqp8OdOyg9fwlyYg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHNnx3IZf0DeMU0WKYfcNs3QdU8AYhskrr8N5f3hpfWtoTZ0T1
	J2je7MecP5WL+2wXWX9JKh46xQQSis2bZ0U1ZiisZ28lAmNaE7XMUlBo4Xgs/3MkAwySLWJfQ5r
	2LjH3q/b5OY1rpuHpl7egCrV9rl7Jnlc5/5EIug==
X-Gm-Gg: ASbGncuG1osjMhzbbpxMlGv4gNHt+X1l70tI3zHg2+VukDE4+yQ/nAqyRUbYhYwCa0t
	EoDEIWWjtFvmBBQLJQ6l3Vcj6gRsGwFc3j8w1SLm2cxnT7MEsRaFmtDIcpQ+DYfuqzjC0U/T5G/
	ttuBIbKnyt5p+YQhlRMQg4U2YGzA==
X-Google-Smtp-Source: AGHT+IGw6+/Q2CoVFNHhHMFPFDWcLsiMamlemLqO00OsELf40WHn6VCum0V1gnCRH5MZV+YmqxilnUUJS8pTXIIXS9k=
X-Received: by 2002:a17:907:9383:b0:ac2:47e5:a1e7 with SMTP id
 a640c23a62f3a-ac253035a48mr275349666b.47.1741353798483; Fri, 07 Mar 2025
 05:23:18 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
 <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com> <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
 <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
 <CAHUKmYb1qqEcXJzbssSgoZCD40shmDaCigrkDecz26G4p0jJWw@mail.gmail.com>
 <182A821BEAF2A92A.13616@lists.openembedded.org> <40aa4bf5-4277-4ac3-a2d8-ec100ed32094@gmail.com>
In-Reply-To: <40aa4bf5-4277-4ac3-a2d8-ec100ed32094@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 7 Mar 2025 14:23:07 +0100
X-Gm-Features: AQ5f1Jpt98OVXNX4XKVnLUEg6iT26pld1p_ChERNxSA7vgD033aW1wQqqA0Ml0I
Message-ID: <CAHUKmYZJ_48GUy5bKWPtm=9jhuy28=2UmTuiD5ipp6P7Kc3GvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: skandigraun@gmail.com
Cc: Martin Jansa <martin.jansa@gmail.com>, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com, openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000096759b062fc08642"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 13:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115787

--00000000000096759b062fc08642
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>  so the cross-compiled binary includes the bytecode of the host-compiled
libstdbuf

Good catch. I had not realised that libstdbuf.so was compiled for the
native architecture. I think what happened is that I've never tested stdbuf
(the recipe uutils-coreutils does not create a symlink for it, because I
more or less took over "bindir_progs" and "base_bindir_progs" from the
coreutils bitbake recipe).
This looks broken:
:/# coreutils stdbuf -o L ls
ERROR: ld.so: object '/tmp/.tmpbDjsTc/libstdbuf.so' from LD_PRELOAD cannot
be preloaded (cannot open shared object file): ignored.

On Fri, Mar 7, 2025 at 2:04=E2=80=AFPM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Responding to my dumb-thread, I think I start to understand (or just
> digging myself deeper).
> My patch is wrong.
>
> The project uses the bytecode of libstdbuf at build-time only (to inject
> into itself), and because of this it doesn't need the crate at runtime,
> so it declares it as build-time dependency[1]. (Which technically it is)
> Since libstdbuf is a declared as a build-dependency, cargo expects it to
> be usable at build-time - it makes sense that cargo compiles it for the
> buildhost.
>
> But this of course doesn't work for cross-compiling - the
> build-dependency is host-compiled, but we need cross-compiled
> dependency, that we can actually inject in the resulting binary.
>
> Two things that I don't know (yet?):
> 1. How to declare libstdbuf as a dependency only, and compile it into a
> .so file with the correct target, and make the relevant build.rs find it
> also, so it can be injected
> 2. How does the current cross-compiled binary not segfault all the time?
>
> [1]:
> https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/Cargo.toml#L2=
4
>
> On 07.03.25 12:34, Gyorgy Sarvari via lists.openembedded.org wrote:
> > Risking that I'm asking the dumbest question ever: so the cross-compile=
d
> > binary includes the bytecode of the host-compiled libstdbuf, and it
> > works somehow? Isn't libstdbuf compiled incorrectly? If it is, than my
> > patch just hides the issue, but doesn't fix anything (to my regret). Or
> > is it some rust magic, and I'm out of context?
> >
> > On 07.03.25 11:47, Etienne Cordonnier wrote:
> >> I'm not sure how generic this issue is.
> >> In the case of uutils-coreutils the RPATH is set on libstdbuf.so, and
> >> then libstdbuf.so is injected into the rust code
> >> (see
> https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs=
#L34
> >> : const STDBUF_INJECT: &[u8] =3D include_bytes!(concat!(env!("OUT_DIR"=
),
> >> "/libstdbuf.so")); )
> >> Thus the value of the RPATH ends up in the coreutils binary, even
> >> though the RPATH is not set on the binary itself (by this I mean
> >> that objdump -x coreutils |grep 'R.*PATH' does not give any result).
> >>
> >> Of course ideally this gets fixed in rust-common.bbclass, but
> >> short-term fixing it in uutils-coreutils would be a nice improvement,
> >> assuming it is not that generic.
> >>
> >> On Fri, Mar 7, 2025 at 11:18=E2=80=AFAM Martin Jansa <martin.jansa@gma=
il.com>
> >> wrote:
> >>
> >>     Shouldn't it be fixed in do_rust_create_wrappers()
> rust-common.bbclass
> >>     ? Or why is this specific only for uutils? The buildpaths issue is
> >>     triggered from more recipes built with rust (I haven't checked if
> they
> >>     all are caused by this BUILD_LDFLAGS), but we shouldn't change all
> >>     these recipes to remove what rust-common.bbclass added.
> >>
> >>     +Deepesh who did last rust upgrade and few more people who might b=
e
> >>     interested in this
> >>
> >>     On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne Cordonnier via
> >>     lists.openembedded.org <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh=
_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DCU49qB9Xkj_hRSCAsK1ppwNXX2gw6TUNPvYGFp56M=
6M&e=3D
> >
> >>     <ecordonnier=3Dsnap.com@lists.openembedded.org>
> >>     wrote:
> >>     >
> >>     > I vote for merging this patch. Maybe with a comment pointing to
> >>     build-rust-ccld.
> >>     >
> >>     > =C3=89tienne
> >>     >
> >>     > On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari
> >>     <skandigraun@gmail.com> wrote:
> >>     >>
> >>     >> I haven't heard back anything, but based on my understanding
> >>     the reason
> >>     >> seems to be the wrapper script, created by cargo_common class,
> >>     which
> >>     >> includes config for both host and target.
> >>     >>
> >>     >> $UNPACKDIR/cargo_home/config.toml has the following:
> >>     >> [target.x86_64-unknown-linux-gnu]
> >>     >> linker =3D "${WORKDIR}/wrapper/build-rust-ccld"
> >>     >>
> >>     >> And in turn build-rust-ccld script passes all the the
> >>     BUILD_LDFLAGS,
> >>     >> including the rpath ones to gcc, and it invokes it directly a
> >>     few lines
> >>     >> later.
> >>     >>
> >>     >> I think you would see the same issue on Ubuntu if you would
> >>     pass similar
> >>     >> rpath arguments via RUSTFLAGS. E.g. if I do
> >>     >>
> >>     >> export RUSTFLAGS=3D"-C link-args=3D-Wl,-rpath,EASY_GREP"
> >>     >>
> >>     >> (which is kinda comparable in a very simplified way to what's
> >>     going on
> >>     >> in the script, in my understanding), then build coreutils on my
> >>     machine
> >>     >> (without Yocto, just my OS), I see the following:
> >>     >>
> >>     >> [meeee@desktop release]$ strings coreutils | grep EASY
> >>     >> EASY_GREP
> >>     >>
> >>     >>
> >>     >> On 06.03.25 16:59, Etienne Cordonnier wrote:
> >>     >> > Hi Gyorgy,
> >>     >> > it is nice that you found the root-cause. I had debugged this
> >>     as part
> >>     >> > of https://github.com/uutils/coreutils/issues/6833 , but had
> >>     not found
> >>     >> > why the yocto build had this issue and not the normal ubuntu
> >>     build of
> >>     >> > uutils-coreutils.
> >>     >> > Have you received some feedback regarding this patch?
> >>     >> >
> >>     >> > =C3=89tienne
> >>     >> >
> >>     >> > On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via
> >>     >> > lists.openembedded.org <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh=
_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DCU49qB9Xkj_hRSCAsK1ppwNXX2gw6TUNPvYGFp56M=
6M&e=3D
> >
> >>     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1o=
LPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7N=
GQ&e=3D
> >>     <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1o=
LPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7N=
GQ&e=3D
> >
> >>     >
> >>     >> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >>     >> >
> >>     >> >     > -ERROR_QA:remove =3D "buildpaths"
> >>     >> >     > -WARN_QA:append =3D " buildpaths"
> >>     >> >     > +BUILD_LDFLAGS:remove:class-target =3D "
> >>     >> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
> >>     >> >     > +
> >>     >> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
> >>     >> >     >
> >>     >> >     If this patch isn't shot down and you are trying to build
> >>     this,
> >>     >> >     there is a
> >>     >> >     chance that it will fail: that's because BUILD_LDFLAGS is
> >>     excluded
> >>     >> >     from
> >>     >> >     base config checksum, so your sscache might conflict with
> >>     the actual
> >>     >> >     recipe state.
> >>     >> >
> >>     >> >     If you want, can send a v2, including a PR-bump, or
> something
> >>     >> >     along the
> >>     >> >     lines.
> >>     >> >
> >>     >> >
> >>     >> >
> >>     >
> >>     >
> >>     >
> >>     >
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115786):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115786&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DbO=
9oJnOs2PJ7w6E-4SvtcGLMy_cNgtqI2e4TphS7sFw&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZNudxhYaE=
IXDMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3DugNqY_Q5ET-JmW-D9tW=
vyKnE7aQ4uiGCRUqmBU7JG00&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqpnwZ=
NudxhYaEIXDMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&s=3D8zPAiOspSY0=
N1j2XasxTV-FgoTUb-qeSrJwACiO18N4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000096759b062fc08642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0=C2=A0so the cross-compiled binary includes the =
bytecode of the host-compiled libstdbuf<br><br><div>Good catch. I had not r=
ealised that libstdbuf.so was compiled for the native architecture. I think=
 what happened is that I&#39;ve never tested stdbuf (the recipe uutils-core=
utils does not create a symlink for it, because I more or less took over &q=
uot;bindir_progs&quot; and &quot;base_bindir_progs&quot; from the coreutils=
 bitbake recipe).<br>This looks broken:<br>:/# coreutils stdbuf -o L ls<br>=
ERROR: ld.so: object &#39;/tmp/.tmpbDjsTc/libstdbuf.so&#39; from LD_PRELOAD=
 cannot be preloaded (cannot open shared object file): ignored.</div></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Mar 7, 2025 at 2:04=E2=80=AFPM Gyorgy Sarvari via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ska=
ndigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@li=
sts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Responding to my dumb-thread, I think I start to unders=
tand (or just<br>
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
.so file with the correct target, and make the relevant <a href=3D"http://b=
uild.rs" rel=3D"noreferrer" target=3D"_blank">build.rs</a> find it<br>
also, so it can be injected<br>
2. How does the current cross-compiled binary not segfault all the time?<br=
>
<br>
[1]:<br>
<a href=3D"https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/Carg=
o.toml#L24" rel=3D"noreferrer" target=3D"_blank">https://github.com/uutils/=
coreutils/blob/main/src/uu/stdbuf/Cargo.toml#L24</a><br>
<br>
On 07.03.25 12:34, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
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
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org" rel=
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
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &l=
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115786): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
15786&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDM=
BpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DbO9oJnOs2PJ7w6E-4Sv=
tcGLMy_cNgtqI2e4TphS7sFw&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_115786&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79a=
YxsH&amp;s=3DbO9oJnOs2PJ7w6E-4SvtcGLMy_cNgtqI2e4TphS7sFw&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh_l85xPOClbw=
LyyI_Vhi9KP79aYxsH&amp;s=3DugNqY_Q5ET-JmW-D9tWvyKnE7aQ4uiGCRUqmBU7JG00&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6=
Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3DugNqY_Q5ET-JmW-D9tWvyKnE7aQ4uiGCR=
UqmBU7JG00&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBpSMCByydyk1f6Texh_l85xPO=
ClbwLyyI_Vhi9KP79aYxsH&amp;s=3D8zPAiOspSY0N1j2XasxTV-FgoTUb-qeSrJwACiO18N4&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqpnwZNudxhYaEIXDMBp=
SMCByydyk1f6Texh_l85xPOClbwLyyI_Vhi9KP79aYxsH&amp;s=3D8zPAiOspSY0N1j2XasxTV=
-FgoTUb-qeSrJwACiO18N4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000096759b062fc08642--

