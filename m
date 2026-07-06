Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43FFC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:50:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145974.1783327832712001758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Uu7dOtvj;
 spf=pass (domain: snapchat.com, ip: 209.85.221.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1361893f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 01:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783327831; cv=none;
        d=google.com; s=arc-20260327;
        b=rbxp0k/U4NXeJQiAbTfQ9dkxGe5i2p70YG+oe7R42K6f2B+gkTJRXG71kdNczZEX/7
         9T0GJNRMLpsXKTNEUMMjkVtAOEZjwtovGbRPp+OFw5KwQnABSAFO2avMH9Mc3UN4kj/p
         sJyIKmlkthhUaFqqDWsM8A6qgl0vd3qf943ZsXRjAra0G+jNqGI65o/fn4zP5aSCjlRb
         J4OVs+VhJmwEhvtmBlLOE2unxMvusodW/0MK95LHXea7SKoI3/1iDQk9Az4U8jaPxTVB
         JiQbZiKErdKFn0NRStkgty3A72xz44tinl8uievT/xIfBRKhcitCUuWDBtPCnSClEdgl
         8rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ecs6LxUpoOs9HYeXpxgX4HjEWtFUaeac+vN8DL/B+g=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=DHYR4ymtYA48FOVcNOymaKvF4f6trUGh3qg6rRaJob9D3Wt511NhfyiQh0qkA3zfQQ
         ckfm4HTKjyiPKVKr9sqbl2pysqeKoLkhIvf19TUkPsx0DNUHGLIZ6Blbyu7XT+1SDUHY
         95212JH2BodZ0AkgesapFzAlnR+DQsppfqp1VRP+JFjBruxgkikJpc7qB7FYELcAVFp+
         hMaCa8KKtXCpWY2wZxwP0Kj282GKB0jZM9i6t7J/0ykSIRgJcOXmYuHgBLIiHhZEjHHG
         9ZlVYV3q8v2duftWGsTUCVYTPNCmYD/cvnGmOPxqPQX1EaqTM8iky/tVSZWNeCA7EJ2V
         TiCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1783327831; x=1783932631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ecs6LxUpoOs9HYeXpxgX4HjEWtFUaeac+vN8DL/B+g=;
        b=Uu7dOtvjkHfcULvGiftmO6B0HxmCJ1YoTEfub8mRUUCsCfBbqfpwqzXhujM28RECSs
         Pd21DC/ajmFi3J7H2qlXFaanJK4H26eyvYvh+JgkF36aeH8gySGjituL8tPWjcyO85ZR
         po5edR+5hIhpmL8dsaZdHYLl/4VJI76zETd9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327831; x=1783932631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ecs6LxUpoOs9HYeXpxgX4HjEWtFUaeac+vN8DL/B+g=;
        b=lRlZYUschHKkSuOEKLV7svSOhtqzPdkzEI/viFdX/5+icD688tF2nkK5Zl47+iKpNn
         DzatkxgbzrUkJ/5KSY3TK2c0fUlJzMHapZfukIuq6UE0iMrJAdUGLt9esbLQBciBL6vD
         sIR7bc/A/pF/Cg/n54nc1W95hGLG0Ts6SuWDkO1yB+uePdHX/4UdcCXqSY1GvnRuej4S
         H7H3qy1Ib6P9rflJ2LfzuLz1v9WrV25MAwfSAjIJcrmnp6UYnwn5AHpqO8kA11Etnn+U
         TD0yWvfqRkRquSLKEgv4jIJC1ttD6mPodaepxZ8q27nGp10vOYsGH3nBhq/TcZ7J/0Ab
         qIqw==
X-Gm-Message-State: AOJu0Yzb8g4w8D1kCG5b7EruR9EVefxBbd4Wqa6BopHzhUqni12WU/Tw
	aGIKrRYupcK0Jx6ltKt9R/lOJFVteR7tiPUNLzk7sS1fG6f0JOv6EN0ue0K7KjP54U9z/eIetst
	G3K77RuWNj5W0aoNLfD66n6aqQkiPQh2kojkp4qxuXw==
X-Gm-Gg: AfdE7ck45U3kt4+d4yO5neUSVwawslKlEm/qnXvGsNovczINjqCinhjCkrBGMky6sWM
	t8wEfGex0DQ628ZcZnOa9B5fnAXgXI8Pyc2ituIL1tgjRUnLIq9hGrR+/Lp8rXMJdXUSU4TH8Bs
	mQovCun+u8BdguW+ZhA1FpkcBLvBgnvSfN+m92F+K1S0KkGchfYejJYX2Rs3mSqbfRZDULrTilV
	2bLENys26pSqtwTuxJBOxE1IdOE3aTsLQ9tL1+IzRDLa7HL7wqJBO9TzpFLU3nHXfvFKkwrZhRQ
	+WzqXqI+MY4c2fe4v09qIts6JkquGA==
X-Received: by 2002:a05:6000:716:b0:461:9950:da50 with SMTP id
 ffacd0b85a97d-47aa92c05fbmr11402802f8f.11.1783327830714; Mon, 06 Jul 2026
 01:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260706083445.2842309-1-ross.burton@arm.com> <20260706083445.2842309-2-ross.burton@arm.com>
In-Reply-To: <20260706083445.2842309-2-ross.burton@arm.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 6 Jul 2026 10:50:19 +0200
X-Gm-Features: AVVi8Cctqd2p5eLxyRnvEFE3z2dbc4eEMrcQPzj_mUXH7iXACLdJOe4xfWyjSHs
Message-ID: <CAHUKmYa5UeP58KtKS8KgM3aF0ejnKMiUHTRaGSP7CeHb-P7mdg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] uutils-coreutils: delete .cargo/config.toml
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de59a40655ed5d24"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128031

--000000000000de59a40655ed5d24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

what is the use-case of the patch? config.toml file is ignored in
out-of-tree builds ( https://github.com/rust-lang/cargo/issues/2930 ), so
AFAIU removing it shouldn't make any difference for a bitbake build. Is it
for devtool builds?

=C3=89tienne


On Mon, Jul 6, 2026 at 10:34=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> This file hardcodes a specific compiler for aarch64-linux builds, which
> is not the compiler that we provide.  As it's otherwise useless, we can
> just delete the file.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb   | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.9.0.bb b/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.9.0.bb
> index d294736395..2c7d3a3200 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> @@ -65,6 +65,10 @@ python __anonymous() {
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> +do_configure:prepend() {
> +    rm -f ${S}/.cargo/config.toml
> +}
> +
>  do_compile:prepend() {
>      export LIBSTDBUF_DIR=3D"${libdir}/coreutils"
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128027):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_128027&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DSOdQBYUxH7BLXzTcxj9ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&s=3DO9=
-vKBRH9FlzsZfYlxmATl9wU4N_eiIW6nyWGWtYbVY&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_120136596_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DSOdQBYUxH7BLX=
zTcxj9ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&s=3D2yFkpP2kDn3joVADoPe=
FPZ0Zi9frtMNUKCeXShwvgr8&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DSOdQB=
YUxH7BLXzTcxj9ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&s=3DIkfzKX-TOIl=
7nmyig50STkBSa2ay6flcERE0_reNnh0&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000de59a40655ed5d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<br><br>what is the use-case of the patch? config.=
toml file is ignored in out-of-tree builds ( <a href=3D"https://github.com/=
rust-lang/cargo/issues/2930">https://github.com/rust-lang/cargo/issues/2930=
</a> ), so AFAIU removing it shouldn&#39;t make any difference for a bitbak=
e build. Is it for devtool builds?<br><br>=C3=89tienne<br><br></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Jul 6, 2026 at 10:34=E2=80=AFAM Ross Burton via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ross.burton=
=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">This file hardcodes a specific compiler for aarch64-linux builds, w=
hich<br>
is not the compiler that we provide.=C2=A0 As it&#39;s otherwise useless, w=
e can<br>
just delete the file.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_=
0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.9.0.bb</a=
>=C2=A0 =C2=A0| 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils=
-coreutils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_=
0.9.0.bb</a> b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uuti=
ls-coreutils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutil=
s_0.9.0.bb</a><br>
index d294736395..2c7d3a3200 100644<br>
--- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.9.0.b=
b</a><br>
+++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.9.0.b=
b</a><br>
@@ -65,6 +65,10 @@ python __anonymous() {<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 rm -f ${S}/.cargo/config.toml<br>
+}<br>
+<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0export LIBSTDBUF_DIR=3D&quot;${libdir}/coreutils&quot;<=
br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128027): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
28027&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DSOdQBYUxH7BLXzTcx=
j9ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&amp;s=3DO9-vKBRH9FlzsZfYlxm=
ATl9wU4N_eiIW6nyWGWtYbVY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_128027&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3DSOdQBYUxH7BLXzTcxj9ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7n=
h8E0&amp;s=3DO9-vKBRH9FlzsZfYlxmATl9wU4N_eiIW6nyWGWtYbVY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_120136596_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DSOdQBYUxH7BLXzTcxj9ZvaK6NGp2-7IVaqDjBLLiqzTSJV=
fVV9rx4ihsNf7nh8E0&amp;s=3D2yFkpP2kDn3joVADoPeFPZ0Zi9frtMNUKCeXShwvgr8&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_120136596_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DSOdQBYUxH7BLXzTcxj9ZvaK6NGp2-7I=
VaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&amp;s=3D2yFkpP2kDn3joVADoPeFPZ0Zi9frtMNUK=
CeXShwvgr8&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3DSOdQBYUxH7BLXzTcxj9ZvaK6NGp2-7IVaqDjBLLiqz=
TSJVfVV9rx4ihsNf7nh8E0&amp;s=3DIkfzKX-TOIl7nmyig50STkBSa2ay6flcERE0_reNnh0&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DSOdQBYUxH7BLXzTcxj9=
ZvaK6NGp2-7IVaqDjBLLiqzTSJVfVV9rx4ihsNf7nh8E0&amp;s=3DIkfzKX-TOIl7nmyig50ST=
kBSa2ay6flcERE0_reNnh0&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000de59a40655ed5d24--

