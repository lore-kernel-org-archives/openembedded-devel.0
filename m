Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12381.1793281766128066068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 06:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FdbstraA;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ad98c3fb15so19475917b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 06:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793281765; cv=none;
        d=google.com; s=arc-20260327;
        b=dix+T3V5yPsOIyFIGm5+nU+68dTNYo37ipql9KytujQoiZ/rXnBwcbznEezAuVlnSD
         RjZN9LfG9/Ss0sw4qC7aEpfV5qDOA13lYqFVz+Al0evZY5/YqlF2DJ7rb+WpuUGfUz/W
         6LVgNJkVZT5X/GBGufuiuq6Uykn97Qxn/ZdOqwCyhLb1SufUS34KYn1RTjPDnQpD4HGn
         DBZLHVUawzLygHHjQKQGaClb3pX1fEqBKqnPxpmRw0Et+lK48/RIKeUGLVb/ievTxjcT
         l40FC06iQ3NjmLQIklj4O7DowVFyoc00N3ACphrvqqU6JUE855qtj/XgREKjvpv37Yf8
         VK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w3yLmdf5vJVnBKzW1BYp4HxKKRvetpliXJyI/0ivsGU=;
        fh=JiZqOrqViVxenUfk/J442rr9K5T3QmSsd5CEzSlxwmo=;
        b=sA/ygKTwd5ZUxUIqQ7kmIAP4a54P8U3kU11Tz+1T2Ez3QtXbYHWtwFdSJ+kav5wAds
         tBpCFIcOJNG9N4683ebQG4txzCB0x21T6+MHeI5VjqDd5qvmGLuOhXPVVshmQkkceDL2
         akPBKsVW9L0XIrvxZpzSyc8v+UcqiB7Xyt3SdO5iYNU4vD34NC4Su00qJh15Cn5m0Jdi
         WKMJ1tudtPYeqlKnWOaRTUciCcikuXL/7x1kfdAWJxXulyTUoViq4eFyd4VVPsfhIUtX
         SYCUZWTRPpBvV5a+j3QgqEMKmlmtNZYa0/eadawIEzfDOJUjj5GVe84leX726YJFqJuB
         a09Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281765; x=1793886565; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3yLmdf5vJVnBKzW1BYp4HxKKRvetpliXJyI/0ivsGU=;
        b=FdbstraAuKdJRYAmhHW7ZK0+VX/i4lfMLZJAERTxMPHSqqO5pyw+jnFt9fOUPKNxiA
         3nxWptzTqBessyKM9IapGF8W1zltqveSWUhgtgc+6r+QXirrw+ICK0zjzhFk+HktkQyA
         QSGZu7eXcIA3XXqdII8b1UywI0ms+lOfhqqus5vXVcDjUxL9RQ5eQwW4ZkJxMiTTa48m
         LTseVNDcyORnWWS7elHh98LUvfGMQkDE3zFMWVRGhDM5BuZ5y1Dq3B6VxxpT03tAsudj
         eUdTdVMLst+pkpAy0E/vf8emRvWLMp9daEhpD7mYCYP4Lg3ccnz2oQn7ci2v2XDqbhN2
         2+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281765; x=1793886565;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w3yLmdf5vJVnBKzW1BYp4HxKKRvetpliXJyI/0ivsGU=;
        b=12MVYN6h/VWGalnQGTmiQvk6yoyGvZBcWlSSpqT5JhtMrW0/iAKgqyag6ukuPi2cvi
         keSwzwevzhZpu1z1hSPIjZgUo/QrAlB5Xk0QFx60yixS+JurYtIhx7GecBBcUmZLdA2Z
         kYuPb4hJJXofyBPQf/XShwZdfUnzkS0yYMElWo1JfBt0RTi+gHyZmaBbIN6Lhj/ZeAXt
         si8wtIlV0rKdHZ02bDt47z+GN/KwGmV/oTJBoYBKJEn355d4s4AwAT45zM32QzafAG03
         WoqZLO+h/hpZ8eGrpZIOg4vWx6u8/jm+3jp+fkzYHFSMiqk0UwUKVLENDufAAZiBaHYh
         giZA==
X-Gm-Message-State: AFq9FYLwWUiPmzBMAxpbhoIBNowM5WfhtwjKcN/tHWtWzGdTtt6gnntz
	bTt5R6MzGHnSNv54JLZa4PkpiUoe3VNBBs8t3yf3mEV0O2NgpOicLeQh8xe59lgt76ChBy/wI4I
	tY79FlY7HnM1X5ue9BALBmr2tQqeSxJE=
X-Gm-Gg: AYBFou2KmkdzbLe7yQTLM28wNNG50/k+8/LPGBuSuNW77PMuNRN0aVwd3gWoFJeeR7s
	u5WK4tIwMgmJn8+H266RQH336E/j6mKBIHbEn9LWgeTPZX1toSBDVjzoLrF882fMh31sOjHvU7d
	1JlH/I22wYYbnAh87QuhEd8baE4wSdcE4ENGo4N3jUsD115F4Y48eUouX5Os+II1/5dG6432HPO
	bSmN2q7Xfeli/iCgNnnQ720RtZooQ+BPQZUYBCgw9sQ6+q0BVdLb87GBvdPrLdoNgQCQ7VWFXuF
	IrOO+z2YX9bowoQ6RcXO9o6RgfDSDuQUyAMF12/CL0jvoF9ZOZ0jvyhed1mx/rdb0UOQSOsFbzw
	HhgzroWXG+9C6O5xQQmyzbkey6e8D2G3n9BAfT8LL83zu6zJoYb54gJcVFKWpnEpoD+N4iPe6hQ
	9M7bohdvsAfmLPIZdXUQCqRTc1T/6FxVWcwGIgBVTS1eq50mMHAOFWCKYeLaN44PHujOM4ocToL
	ObusacXrrBdE48PlLhnseimP7kNm+N+7aO/zbrXyxHZfHXMv8VStTxGAtwz/rMdu0FGhovi6zXx
	6BSORY4KqXuURSMcJENgbgHXUykCmE81HD5kmlfrJm2KwLYcXwbH8Ea+GekEz+6Q86DZm9HJHnu
	5MgOFcHp2pQs16y+NxAjcXQ==
X-Received: by 2002:a05:690e:b8d:b0:679:c86f:cf6e with SMTP id
 956f58d0204a3-67a7be8a65bmr4554437d50.74.1793281765033; Thu, 29 Oct 2026
 06:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20261029070720.2882299-1-vaibjind@qti.qualcomm.com>
In-Reply-To: <20261029070720.2882299-1-vaibjind@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2026 06:48:57 -0700
X-Gm-Features: AclHuK-C4S1PXKNgtNy1KMdadZ3aWa_RTZ3KOfoKkge-yjgi4YJV-a_SY7O2lzY
Message-ID: <CAMKF1so2GEPYnN5jnGfzbT2g9hh_Zg7eOtngna8Pb=0m_5GbJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wrk: fix parallel build failure due to
 missing obj directory
To: vaibjind@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000964a04065efaf237"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 13:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131665

--000000000000964a04065efaf237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:07=E2=80=AFAM Vaibhav Jindal via lists.openembed=
ded.org
<vaibjind=3Dqti.qualcomm.com@lists.openembedded.org> wrote:

> The obj/bytecode.c rule in the wrk Makefile has no dependency on the
> obj/ directory, so with parallel make luajit can run before obj/ has
> been created and fails:
>
>   LUAJIT src/wrk.lua
>   luajit: .../obj/bytecode.c: No such file or directory
>   make: *** [Makefile:64: obj/bytecode.c] Error 1
>
> Create ${S}/obj up front in do_compile.
>
> Signed-off-by: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
> ---
>  meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
> b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
> index 47ca9ada01..d06d86825b 100644
> --- a/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
> +++ b/meta-oe/recipes-benchmark/wrk/wrk_4.2.0.bb
> @@ -25,6 +25,9 @@ EXTRA_OEMAKE =3D "\
>
>  do_compile() {
>      export
> LUA_PATH=3D"${RECIPE_SYSROOT_NATIVE}/usr/share/luajit-2.1/?.lua;;"
> +    # The obj/bytecode.c rule has no dependency on obj/, so with paralle=
l
> make
> +    # luajit can run before the directory exists. Create it up front.
> +    mkdir -p ${S}/obj
>

I wonder why its looking for a obj dir inside source dir. Usually we build
outside sourcedir. Please look into it secondly,
use do_compile[dirs] =3D "${S}/obj" if its needed


>      oe_runmake
>  }
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131641):
> https://lists.openembedded.org/g/openembedded-devel/message/131641
> Mute This Topic: https://lists.openembedded.org/mt/121990495/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000964a04065efaf237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29,=
 2026 at 12:07=E2=80=AFAM Vaibhav Jindal via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;vaibjind=3D<a href=3D"mailto:qti=
.qualcomm.com@lists.openembedded.org">qti.qualcomm.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The obj/bytecode.c rule in the wrk Makefile has no dependency on the<br>
obj/ directory, so with parallel make luajit can run before obj/ has<br>
been created and fails:<br>
<br>
=C2=A0 LUAJIT src/wrk.lua<br>
=C2=A0 luajit: .../obj/bytecode.c: No such file or directory<br>
=C2=A0 make: *** [Makefile:64: obj/bytecode.c] Error 1<br>
<br>
Create ${S}/obj up front in do_compile.<br>
<br>
Signed-off-by: Vaibhav Jindal &lt;<a href=3D"mailto:vaibjind@qti.qualcomm.c=
om" target=3D"_blank">vaibjind@qti.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-benchmark/wrk/<a href=3D"http://wrk_4.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">wrk_4.2.0.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-benchmark/wrk/<a href=3D"http://wrk_4.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">wrk_4.2.0.bb</a> b/meta-oe/recipes-ben=
chmark/wrk/<a href=3D"http://wrk_4.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">wrk_4.2.0.bb</a><br>
index 47ca9ada01..d06d86825b 100644<br>
--- a/meta-oe/recipes-benchmark/wrk/<a href=3D"http://wrk_4.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">wrk_4.2.0.bb</a><br>
+++ b/meta-oe/recipes-benchmark/wrk/<a href=3D"http://wrk_4.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">wrk_4.2.0.bb</a><br>
@@ -25,6 +25,9 @@ EXTRA_OEMAKE =3D &quot;\<br>
<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0export LUA_PATH=3D&quot;${RECIPE_SYSROOT_NATIVE}/usr/sh=
are/luajit-2.1/?.lua;;&quot;<br>
+=C2=A0 =C2=A0 # The obj/bytecode.c rule has no dependency on obj/, so with=
 parallel make<br>
+=C2=A0 =C2=A0 # luajit can run before the directory exists. Create it up f=
ront.<br>
+=C2=A0 =C2=A0 mkdir -p ${S}/obj<br></blockquote><div><br></div><div>I wond=
er why its looking for a obj dir inside source dir. Usually we build outsid=
e sourcedir. Please look into it secondly,=C2=A0</div><div>use=C2=A0do_comp=
ile[dirs] =3D &quot;<span style=3D"background-color:transparent">${S}/obj&q=
uot; if its=C2=A0needed=C2=A0</span></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0oe_runmake<br>
=C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131641): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131641" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131641</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121990495/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121990495/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000964a04065efaf237--
