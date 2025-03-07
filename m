Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585B1C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:47:58 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.8415.1741344468497194870
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Rgwnzqqs;
 spf=pass (domain: snapchat.com, ip: 209.85.218.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf5f4e82caso331724366b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741344467; x=1741949267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WKWRtwoCC8je+fNOOHurm06VdOfXkD/SYXp+R74RoZs=;
        b=Rgwnzqqsq8Ig/W4mNYs99rOQKhbFWQ5cJoTINJLox1b66a0vYnhmw39bqavN+aoy9a
         TPzhIDynuJd+QLFpDZAyuxEmqDhqkj3PebyJACSM9va5ZQeKxAzQ+K395Ux7xl+CdkYz
         36tXZfSAjtlaaTLzq5lpi7L5z92AUnMiIZZwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344467; x=1741949267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKWRtwoCC8je+fNOOHurm06VdOfXkD/SYXp+R74RoZs=;
        b=rCOc4nxtWbI3PNxCAKzh27GNx6sUnuIs7maaDGdoKzXvnbS2g7ypj3L/V20j6VQ5c6
         7qbOeLf2dFGdNQcT4SXPFFEiT73Vzgl3rJQH72ncQ8F5ZaM8ZKKAFO8u5wAVmbeAcbXE
         +HyTvTzSxN6qNLecy3sfh7pNh7Ngfw6RtrXVwJGZ+vtE01bhQh7iLJTq/AppoyzCnB1k
         ssk0B/iLZaFyLTpGfgbNqKBTpuv9NWWjmMgm72+3fcEGbQbpFEyrfS7BE++fa/8sPa/q
         yl1Oe+GXtSpMD9xZIUBe0A88zIDbxYrqvgH1mP5zrocxghpbJTBgBfvTvPz0rD58hxrT
         k2pA==
X-Forwarded-Encrypted: i=1; AJvYcCWtJVLZGH+jXfpgAoElIVMej/fwEYa/HkWBWRx6l3NTRXbwBj4TWoFUPH/V1bExbShGCorD21pYLtrE9UFXh9+8Ky0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTc5i1YFEeCJqvZzvPDbKf4BUz4rWslgU9yu2Kfoe4kS46CrFC
	P9w0vIeZaeTDspNuM0kmOcRAOs10kQ92HZUoji8T098N68Z7q4+AnvSMIjFceiCzJ4esjAocYH2
	dbWDaFwLQeWaTHjDNCkKi1Eg4O9xhB0wBIOJFHQ==
X-Gm-Gg: ASbGncvzve6PaPBve0BodqCIuTQdiXAkzZLbhjscUjhHg6uxTPhqCPZG2nU6hGK/Vg5
	Oe8+UxvnMtDCpPv18Q40EX/vV+bXEKiCjqDfreZxknK/MZ42HwAWi8ikfaM/8fH8BB1mlcBo1Gu
	wiV8ImaBUOquwhyqsTcciDmXaDMA==
X-Google-Smtp-Source: AGHT+IH2P++ghrThkdDurgZz6CdeyNs9WypJgEBLoIbWcxTFO2qr+eY5WJY2km0ZhWsbHa5R5IeRMx2L8FmmyRQHO/o=
X-Received: by 2002:a17:907:9703:b0:abf:76fd:29b9 with SMTP id
 a640c23a62f3a-ac252a87a16mr208024266b.17.1741344466715; Fri, 07 Mar 2025
 02:47:46 -0800 (PST)
MIME-Version: 1.0
References: <181E3AF09E1F8B4D.4788@lists.openembedded.org> <9081184e-c6be-4151-a658-2613ce0d2eb6@gmail.com>
 <CAHUKmYb001Y2tzbOd2Ew+Yy5q--Vhwv_Mt41afoQZboE+o6kYw@mail.gmail.com>
 <b0a50e60-3f5b-4b64-b6cd-0f8cf958ce0e@gmail.com> <CAHUKmYaikWGctirhH2MGi8CQMjekZvXnRShXXhjU8AHpOQEMsw@mail.gmail.com>
 <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
In-Reply-To: <CA+chaQcqHCeqGRpVKKP8KJv2qen+MvnJzw4oown9CXcE+5R_iw@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Fri, 7 Mar 2025 11:47:34 +0100
X-Gm-Features: AQ5f1JrOWyHVAs2w_efG2ZWacQjKPeCdDek8ZsGSL7UGjdnOVN93UgoXlYzne20
Message-ID: <CAHUKmYb1qqEcXJzbssSgoZCD40shmDaCigrkDecz26G4p0jJWw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uutils-coreutils: remove TMPDIR from build output
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005f0f30062fbe5ae0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 10:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115784

--0000000000005f0f30062fbe5ae0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not sure how generic this issue is.
In the case of uutils-coreutils the RPATH is set on libstdbuf.so, and then
libstdbuf.so is injected into the rust code (see
https://github.com/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L=
34
: const STDBUF_INJECT: &[u8] =3D include_bytes!(concat!(env!("OUT_DIR"),
"/libstdbuf.so")); )
Thus the value of the RPATH ends up in the coreutils binary, even though
the RPATH is not set on the binary itself (by this I mean that objdump -x
coreutils |grep 'R.*PATH' does not give any result).

Of course ideally this gets fixed in rust-common.bbclass, but short-term
fixing it in uutils-coreutils would be a nice improvement, assuming it is
not that generic.

On Fri, Mar 7, 2025 at 11:18=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Shouldn't it be fixed in do_rust_create_wrappers() rust-common.bbclass
> ? Or why is this specific only for uutils? The buildpaths issue is
> triggered from more recipes built with rust (I haven't checked if they
> all are caused by this BUILD_LDFLAGS), but we shouldn't change all
> these recipes to remove what rust-common.bbclass added.
>
> +Deepesh who did last rust upgrade and few more people who might be
> interested in this
>
> On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > I vote for merging this patch. Maybe with a comment pointing to
> build-rust-ccld.
> >
> > =C3=89tienne
> >
> > On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmai=
l.com>
> wrote:
> >>
> >> I haven't heard back anything, but based on my understanding the reaso=
n
> >> seems to be the wrapper script, created by cargo_common class, which
> >> includes config for both host and target.
> >>
> >> $UNPACKDIR/cargo_home/config.toml has the following:
> >> [target.x86_64-unknown-linux-gnu]
> >> linker =3D "${WORKDIR}/wrapper/build-rust-ccld"
> >>
> >> And in turn build-rust-ccld script passes all the the BUILD_LDFLAGS,
> >> including the rpath ones to gcc, and it invokes it directly a few line=
s
> >> later.
> >>
> >> I think you would see the same issue on Ubuntu if you would pass simil=
ar
> >> rpath arguments via RUSTFLAGS. E.g. if I do
> >>
> >> export RUSTFLAGS=3D"-C link-args=3D-Wl,-rpath,EASY_GREP"
> >>
> >> (which is kinda comparable in a very simplified way to what's going on
> >> in the script, in my understanding), then build coreutils on my machin=
e
> >> (without Yocto, just my OS), I see the following:
> >>
> >> [meeee@desktop release]$ strings coreutils | grep EASY
> >> EASY_GREP
> >>
> >>
> >> On 06.03.25 16:59, Etienne Cordonnier wrote:
> >> > Hi Gyorgy,
> >> > it is nice that you found the root-cause. I had debugged this as par=
t
> >> > of https://github.com/uutils/coreutils/issues/6833 , but had not
> found
> >> > why the yocto build had this issue and not the normal ubuntu build o=
f
> >> > uutils-coreutils.
> >> > Have you received some feedback regarding this patch?
> >> >
> >> > =C3=89tienne
> >> >
> >> > On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via
> >> > lists.openembedded.org <
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.=
org&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1o=
LPSQzp02bVYipc0uH-2PY8vQ3v3Ju&s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7N=
GQ&e=3D
> >
> >> > <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >> >
> >> >     > -ERROR_QA:remove =3D "buildpaths"
> >> >     > -WARN_QA:append =3D " buildpaths"
> >> >     > +BUILD_LDFLAGS:remove:class-target =3D "
> >> >     -Wl,-rpath,${STAGING_LIBDIR_NATIVE}  \
> >> >     > +
> >> >     -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} "
> >> >     >
> >> >     If this patch isn't shot down and you are trying to build this,
> >> >     there is a
> >> >     chance that it will fail: that's because BUILD_LDFLAGS is exclud=
ed
> >> >     from
> >> >     base config checksum, so your sscache might conflict with the
> actual
> >> >     recipe state.
> >> >
> >> >     If you want, can send a v2, including a PR-bump, or something
> >> >     along the
> >> >     lines.
> >> >
> >> >
> >> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115782):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115782&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3Dp9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=3Dmv=
9-JoFG8rCJwz-zydMCBkgwQK24kuO8Jc5VR2QtK9o&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_110820444_3617156&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dp9JNvdr8YfvJr=
H9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=3DyVIEBlNAg7gptJo6-Hl=
UmQRo2UhHiEQCHS9U7SXZNmg&e=3D
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Dp9JNv=
dr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&s=3DY78_vGNHT-8=
1F0m1bZ8UtjZIGr8OA6Orx60Wfp5pPO8&e=3D
> [martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005f0f30062fbe5ae0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure how generic this issue is.<br>In the case=
 of uutils-coreutils the RPATH is set on libstdbuf.so, and then libstdbuf.s=
o is injected into the rust code (see=C2=A0<a href=3D"https://github.com/uu=
tils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L34">https://github.co=
m/uutils/coreutils/blob/main/src/uu/stdbuf/src/stdbuf.rs#L34</a> : const ST=
DBUF_INJECT: &amp;[u8] =3D include_bytes!(concat!(env!(&quot;OUT_DIR&quot;)=
, &quot;/libstdbuf.so&quot;)); )<br>Thus the value of the RPATH ends up in =
the coreutils binary, even though the RPATH is not set on the binary itself=
 (by this I mean that=C2=A0objdump -x coreutils |grep &#39;R.*PATH&#39; doe=
s not give any result).<br><br>Of course ideally this gets fixed in rust-co=
mmon.bbclass, but short-term fixing it in uutils-coreutils would be a nice =
improvement, assuming it is not that generic.</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Mar 7, 2025 at 11:18=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Shouldn&#39;t it be fixed in do_rust_=
create_wrappers() rust-common.bbclass<br>
? Or why is this specific only for uutils? The buildpaths issue is<br>
triggered from more recipes built with rust (I haven&#39;t checked if they<=
br>
all are caused by this BUILD_LDFLAGS), but we shouldn&#39;t change all<br>
these recipes to remove what rust-common.bbclass added.<br>
<br>
+Deepesh who did last rust upgrade and few more people who might be<br>
interested in this<br>
<br>
On Fri, Mar 7, 2025 at 11:06=E2=80=AFAM Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com=
@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; I vote for merging this patch. Maybe with a comment pointing to build-=
rust-ccld.<br>
&gt;<br>
&gt; =C3=89tienne<br>
&gt;<br>
&gt; On Thu, Mar 6, 2025 at 5:40=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"m=
ailto:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I haven&#39;t heard back anything, but based on my understanding t=
he reason<br>
&gt;&gt; seems to be the wrapper script, created by cargo_common class, whi=
ch<br>
&gt;&gt; includes config for both host and target.<br>
&gt;&gt;<br>
&gt;&gt; $UNPACKDIR/cargo_home/config.toml has the following:<br>
&gt;&gt; [target.x86_64-unknown-linux-gnu]<br>
&gt;&gt; linker =3D &quot;${WORKDIR}/wrapper/build-rust-ccld&quot;<br>
&gt;&gt;<br>
&gt;&gt; And in turn build-rust-ccld script passes all the the BUILD_LDFLAG=
S,<br>
&gt;&gt; including the rpath ones to gcc, and it invokes it directly a few =
lines<br>
&gt;&gt; later.<br>
&gt;&gt;<br>
&gt;&gt; I think you would see the same issue on Ubuntu if you would pass s=
imilar<br>
&gt;&gt; rpath arguments via RUSTFLAGS. E.g. if I do<br>
&gt;&gt;<br>
&gt;&gt; export RUSTFLAGS=3D&quot;-C link-args=3D-Wl,-rpath,EASY_GREP&quot;=
<br>
&gt;&gt;<br>
&gt;&gt; (which is kinda comparable in a very simplified way to what&#39;s =
going on<br>
&gt;&gt; in the script, in my understanding), then build coreutils on my ma=
chine<br>
&gt;&gt; (without Yocto, just my OS), I see the following:<br>
&gt;&gt;<br>
&gt;&gt; [meeee@desktop release]$ strings coreutils | grep EASY<br>
&gt;&gt; EASY_GREP<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 06.03.25 16:59, Etienne Cordonnier wrote:<br>
&gt;&gt; &gt; Hi Gyorgy,<br>
&gt;&gt; &gt; it is nice that you found the root-cause. I had debugged this=
 as part<br>
&gt;&gt; &gt; of <a href=3D"https://github.com/uutils/coreutils/issues/6833=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/uutils/coreutils/=
issues/6833</a> , but had not found<br>
&gt;&gt; &gt; why the yocto build had this issue and not the normal ubuntu =
build of<br>
&gt;&gt; &gt; uutils-coreutils.<br>
&gt;&gt; &gt; Have you received some feedback regarding this patch?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =C3=89tienne<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sun, Jan 26, 2025 at 12:37=E2=80=AFPM Gyorgy Sarvari via<b=
r>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" =
target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDa=
Q&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oL=
PSQzp02bVYipc0uH-2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_na=
f7NGQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwIDaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3Dr_TOp8nVaCCSw19cijpXVbcjRvFVX1AYu1oLPSQzp02=
bVYipc0uH-2PY8vQ3v3Ju&amp;s=3DOYWpHglwHPZhxYQ4FI7np0IioiBch7cCs5Q_naf7NGQ&a=
mp;e=3D</a> &gt;<br>
&gt;&gt; &gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -ERROR_QA:remove =3D &quot;buildpaths=
&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -WARN_QA:append =3D &quot; buildpaths=
&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +BUILD_LDFLAGS:remove:class-target =
=3D &quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${STAGING_LIBDIR_NATIVE}=C2=A0 =
\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE} &=
quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0If this patch isn&#39;t shot down and you =
are trying to build this,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0there is a<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0chance that it will fail: that&#39;s becau=
se BUILD_LDFLAGS is excluded<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0from<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0base config checksum, so your sscache migh=
t conflict with the actual<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0recipe state.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0If you want, can send a v2, including a PR=
-bump, or something<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0along the<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0lines.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#115782): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_mess=
age_115782&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dp9JNvdr8YfvJ=
rH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&amp;s=3Dmv9-JoFG8rCJwz=
-zydMCBkgwQK24kuO8Jc5VR2QtK9o&amp;e=3D" rel=3D"noreferrer" target=3D"_blank=
">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115782&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTK=
UkSGa66m67E&amp;m=3Dp9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jG=
DZlveYWrz&amp;s=3Dmv9-JoFG8rCJwz-zydMCBkgwQK24kuO8Jc5VR2QtK9o&amp;e=3D</a> =
<br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_110820444_3617156&amp;d=3DDwIFaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3Dp9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6UmwRz0=
e8b3KLrXuzp1jGDZlveYWrz&amp;s=3DyVIEBlNAg7gptJo6-HlUmQRo2UhHiEQCHS9U7SXZNmg=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_110820444_3617156&amp=
;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dp9JNvdr8YfvJrH9ctNjzqtiQtl=
_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&amp;s=3DyVIEBlNAg7gptJo6-HlUmQRo2UhH=
iEQCHS9U7SXZNmg&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dp9JNvdr8YfvJrH9ctNjzqtiQtl_PyZ9uYv6Um=
wRz0e8b3KLrXuzp1jGDZlveYWrz&amp;s=3DY78_vGNHT-81F0m1bZ8UtjZIGr8OA6Orx60Wfp5=
pPO8&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddev=
el_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dp9JNvdr8YfvJrH=
9ctNjzqtiQtl_PyZ9uYv6UmwRz0e8b3KLrXuzp1jGDZlveYWrz&amp;s=3DY78_vGNHT-81F0m1=
bZ8UtjZIGr8OA6Orx60Wfp5pPO8&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000005f0f30062fbe5ae0--

