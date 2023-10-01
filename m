Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DAEE748F2
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 03:03:39 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.53640.1696129416528138593
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 20:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RnL1LDAr;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e12f41e496so1281928fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 20:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696129416; x=1696734216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4SNR/9psycoUFYdbqjHyqqsvRk3Sih6wqYykuWTWFN8=;
        b=RnL1LDArnQwgtfS4hrpWE01jj78048+Ji5eDc/yFbHm0VLfUY412m4IW1w7Fy3ERww
         JyxvFOY46sRnzDnwK0N3E66VAc2kIHrJl+ZEi62Q72xCgzwbNzS04M9E6ki995UBPHub
         TJWel1NLxykjsXEsM/lXZy+3YoWkKkLLkJxCnqz5oSLdYwOQ6DOXBOw9+M3ixgLLKW3j
         moTZ/z1ZRKiBS9rLMJx+SFyuw/9wcxx8DKDV3eULvvy53MWq+qapCdRf7GWQlMXwU50O
         WN/e6iIjpsNHrwc/ADfPLRl6Ywp+N+769vVsVujzq7SEEhge8xOsZUrhl/WtUu1ACoC3
         JO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696129416; x=1696734216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SNR/9psycoUFYdbqjHyqqsvRk3Sih6wqYykuWTWFN8=;
        b=QJho0Ckuwfuf3LpTrCWpnVEYiTQ7vj1G6JyTHvaB2whMEcrC6iSBUAcMxzkY5yFGEN
         VMRWi9C7yt3MUec7KDaTc4EMWGwXgppaPh1++vZPJm/p2a8ot/fo1mpw9WV8wNakQO1/
         NDjRo39/bMKSMTsNH+4av9iqjTCSvU0vvM/dGFzNvwFlhWU3iP6LP8uL3pIDX6b/hdxL
         40rwdzc/uoo8GluUin5JdeIi6dtB4R8QMzUku2dKVZG4gJnSpVDYlt4QDZsaifUK7xMi
         j2TO3ryviYB0zPQdEZ4ZXpLl00JVHSwd7ogk3etLAhbmw74gOptmNZmBPQ/B2XmgXPtp
         C32g==
X-Gm-Message-State: AOJu0YzKKwQOs8Qj4s1az2kdrU+UO1VRnGcLdpkiA/JN9PND1D7yl6DA
	p1OCQedDrgoUSIN8M714X28jkYrxdtU+f2cZ6iU=
X-Google-Smtp-Source: AGHT+IHPYKDJZV8/aixBNUayihFSeesOayMuDS72IhKy7zbaqLdbg1nFnQk4pkG5Tlj7paeA8lM2Afh0rstccuzZ8WI=
X-Received: by 2002:a05:6870:d1c3:b0:1d6:5892:d27f with SMTP id
 b3-20020a056870d1c300b001d65892d27fmr9414154oac.4.1696129415617; Sat, 30 Sep
 2023 20:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
In-Reply-To: <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Sep 2023 20:03:24 -0700
Message-ID: <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004fa3bf06069ee715"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 03:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105291

--0000000000004fa3bf06069ee715
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 30, 2023 at 5:48 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
wrote:

> I agree, protoc should _not_ be in sysroot, because target binary can't
> run on host system.
>

Yeah this seems correct approach to me

>
> Vyacheslav
>
> On 30.09.2023 19:30, Cl=C3=A9ment P=C3=A9ron wrote:
> > This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.
> >
> > As said by Ross[=C3=98]:
> > "Putting the _target_ protoc into the sysroot for executation at _build=
_
> > time isn't useful because even if it has the right architecture, the
> > tune might be incompatible.  Recipes which want protoc should just depe=
nd
> > on protobuf-native."
> >
> > This has been reverted recently by Samuli[1]:
> > "If protoc is enabled for the build, recipes using protobuf will
> > fail when protoc is not available in the recipe sysroot"
> >
> > Be the revert is incorret as This is an issue coming from qtgrpc
> > other recipes that use protobuf or gRPC compiler, proplery looks for
> > the binary in the correct sysroot folder.
> >
> > Qtgrpc recipe should fix this issue at the recipe level, for example th=
is
> > is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need this
> > patch to properly compile.
> >
> > So keeping this hack doesn't seems to be a correct fix.
> >
> > Note that qtgrpc recipe isn't available on meta-oe nor any other public
> > layers.
> >
> > 0:
> https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450=
-1-ross.burton@arm.com/
> > 1:
> https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.308849=
8-1-samuli.piippo@qt.io/
> > 2:
> https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31=
c801a0ecf7312d1049ece3e
> >
> > CC: Samuli Piippo <samuli.piippo@gmail.com>
> > CC: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >   meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 ---
> >   1 file changed, 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> > index 06d73d648..1edc21cdf 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
> > @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
> >   FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
> >   FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
> >
> > -# CMake requires binaries to exist in sysroot, even if they have wrong
> architecture.
> > -SYSROOT_DIRS +=3D "${bindir}"
> > -
> >   RDEPENDS:${PN}-compiler =3D "${PN}"
> >   RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> >   RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'python3-protobuf', '', d)}"
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105290):
> https://lists.openembedded.org/g/openembedded-devel/message/105290
> Mute This Topic: https://lists.openembedded.org/mt/101679410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004fa3bf06069ee715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Sep 30, 2023 at 5:48 PM Vyacheslav Yurkov &lt;<a hr=
ef=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">I agree, protoc should _not_ be in sysroot, because targe=
t binary can&#39;t <br>
run on host system.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah this seems =
correct approach to me=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Vyacheslav<br>
<br>
On 30.09.2023 19:30, Cl=C3=A9ment P=C3=A9ron wrote:<br>
&gt; This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.<br>
&gt;<br>
&gt; As said by Ross[=C3=98]:<br>
&gt; &quot;Putting the _target_ protoc into the sysroot for executation at =
_build_<br>
&gt; time isn&#39;t useful because even if it has the right architecture, t=
he<br>
&gt; tune might be incompatible.=C2=A0 Recipes which want protoc should jus=
t depend<br>
&gt; on protobuf-native.&quot;<br>
&gt;<br>
&gt; This has been reverted recently by Samuli[1]:<br>
&gt; &quot;If protoc is enabled for the build, recipes using protobuf will<=
br>
&gt; fail when protoc is not available in the recipe sysroot&quot;<br>
&gt;<br>
&gt; Be the revert is incorret as This is an issue coming from qtgrpc<br>
&gt; other recipes that use protobuf or gRPC compiler, proplery looks for<b=
r>
&gt; the binary in the correct sysroot folder.<br>
&gt;<br>
&gt; Qtgrpc recipe should fix this issue at the recipe level, for example t=
his<br>
&gt; is what I&#39;ve done for &quot;etcd-cpp-apiv3&quot; recipe[2] that do=
esn&#39;t need this<br>
&gt; patch to properly compile.<br>
&gt;<br>
&gt; So keeping this hack doesn&#39;t seems to be a correct fix.<br>
&gt;<br>
&gt; Note that qtgrpc recipe isn&#39;t available on meta-oe nor any other p=
ublic<br>
&gt; layers.<br>
&gt;<br>
&gt; 0: <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2023=
0904161230.377450-1-ross.burton@arm.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.3774=
50-1-ross.burton@arm.com/</a><br>
&gt; 1: <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2023=
0927051101.3088498-1-samuli.piippo@qt.io/" rel=3D"noreferrer" target=3D"_bl=
ank">https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.308=
8498-1-samuli.piippo@qt.io/</a><br>
&gt; 2: <a href=3D"https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/=
47f0d9e0326f3cc31c801a0ecf7312d1049ece3e" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc=
31c801a0ecf7312d1049ece3e</a><br>
&gt;<br>
&gt; CC: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com" targe=
t=3D"_blank">samuli.piippo@gmail.com</a>&gt;<br>
&gt; CC: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_=
blank">ross.burton@arm.com</a>&gt;<br>
&gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cle=
m@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://protob=
uf_4.23.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.23.4.bb</a> |=
 3 ---<br>
&gt;=C2=A0 =C2=A01 file changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://proto=
buf_4.23.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.23.4.bb</a> =
b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.23.4.bb" r=
el=3D"noreferrer" target=3D"_blank">protobuf_4.23.4.bb</a><br>
&gt; index 06d73d648..1edc21cdf 100644<br>
&gt; --- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
3.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.23.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
3.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.23.4.bb</a><br>
&gt; @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN =3D &quot;${PN}-compiler ${PN}-l=
ite&quot;<br>
&gt;=C2=A0 =C2=A0FILES:${PN}-compiler =3D &quot;${bindir} ${libdir}/libprot=
oc${SOLIBS}&quot;<br>
&gt;=C2=A0 =C2=A0FILES:${PN}-lite =3D &quot;${libdir}/libprotobuf-lite${SOL=
IBS}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# CMake requires binaries to exist in sysroot, even if they have wron=
g architecture.<br>
&gt; -SYSROOT_DIRS +=3D &quot;${bindir}&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN}-compiler =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<br>
&gt;=C2=A0 =C2=A0RDEPENDS:${PN}-ptest =3D &quot;bash ${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;python&#39;, &#39;python3-protobuf&#39;, &#39;=
&#39;, d)}&quot;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105290): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105290" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105290</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101679410/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101679410/1997914</a><br>
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

--0000000000004fa3bf06069ee715--

