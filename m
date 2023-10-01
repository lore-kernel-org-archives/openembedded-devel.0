Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FD4E748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 10:31:42 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.57100.1696156292357027514
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 03:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yv1ckxWc;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so23462070e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696156290; x=1696761090; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4u7MIemJtIbHU72Y2UK526qryapTvYH84FvZv5ZawXs=;
        b=Yv1ckxWcsEVe45WaE4ib/ORrGbI9V2mlX7fElNOYrL5fZCju6VFLc/xt+r7ny/jKzH
         DXXGs06WFh2T2d1vOZZvFGCdcYB/lRy4W7snIsqTOAHhWK7px2MiMQeYnfoqawX1G93k
         wnK0oRYlprk8uLWDv8WSL3nMSFoI2pMzmSiP2aS6dfA4Rv56CluoxfNy5LP2yL7oz14R
         BsgZLkyd9RzSmmjtpmfTY2zYkq1EX3oDax/G3pXT9bJDWE41kd0Ks+QP2grgdcId/43d
         GU3dJBebg8fr+2MhbI36WFOaqOtFiq36gRLOaXJRvwh6a67FRmHHWEEHVlwEIcbHEUZ+
         aiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696156290; x=1696761090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4u7MIemJtIbHU72Y2UK526qryapTvYH84FvZv5ZawXs=;
        b=vi/E8EkZn2Qq6Z2nMnTz5x0iYzTrSj7FMYXw8AKPmAkFoiK8GGTclh991ShQaU0i06
         eTNnIirzF6zl1oyR4qO6CNnEaQTvaiFtRHHMIeLj2UupALQjTU4RdS6nwsr/j6RvKxfE
         0d8zdKNHP80i+2ej4aQ40o/+gHL/RUHzdXAYD/BzNdqmj8XVSqUWsEgdenAmBo3tAbF4
         8CkR9/tUubH0MwxMnx0z6BlIlI8tdbtaiowRE8fvI54p/KQnZ0mE+LAQ4k/9dUWvHnrh
         KYwHqYsDNF2cgCCru0gwahvyn/z5OGcPlHYI5TRwYnufDuQ6tB7SLRkGBPdDa7Q5d2og
         MirA==
X-Gm-Message-State: AOJu0Yz7Tlh98WPRkmysY3FU+3RSJsR00osW1v47v7RH8RFzV9fsFq/u
	IBKGfKZgZfMtRL4B31NpzszAFZIh/CWs8wxzIAE=
X-Google-Smtp-Source: AGHT+IEWOrTML3XfI+rGBb3fZJcZ7AvMzX5fr0jh4KkT7MsSAI9tlaa0JoAFl/2K//nIQAr7Qm4/geZwntKzVq+DW5w=
X-Received: by 2002:a05:6512:2ed:b0:503:72c:50cb with SMTP id
 m13-20020a05651202ed00b00503072c50cbmr6164565lfq.6.1696156290004; Sun, 01 Oct
 2023 03:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com> <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
In-Reply-To: <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 1 Oct 2023 12:31:17 +0200
Message-ID: <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000263f0f0606a529fa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 10:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105295

--000000000000263f0f0606a529fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Sun, 1 Oct 2023 at 12:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> well, target bindir isn't in default PATH so it wont get executed by
default

Is it a reason to allow mixing executable arch/tune?

How do you handle it when you want to install protoc/grpc-cpp-plugin for
the target too?

>
> I have used this work around in some meta-ros recipes where the .cmake
file was checking the binary existence even when this .cmake was used only
to get right list of libraries to link with (and the binary was not called
at all - which imho can happen with protobuf as well)

As you say it's a workaround, and it's an issue with the CMake recipe.

If we can properly fix it at the recipe level, then why should we keep this
workaround/hack?

Also if you really need it, you can have a .bbappend for protoc/grpc in the
downstream layer. But I would be in favor to avoid this by default no?

Clement

>
> On Sun, 1 Oct 2023, 05:03 Khem Raj, <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Sat, Sep 30, 2023 at 5:48 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
wrote:
>>>
>>> I agree, protoc should _not_ be in sysroot, because target binary can't
>>> run on host system.
>>
>>
>> Yeah this seems correct approach to me
>>>
>>>
>>> Vyacheslav
>>>
>>> On 30.09.2023 19:30, Cl=C3=A9ment P=C3=A9ron wrote:
>>> > This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.
>>> >
>>> > As said by Ross[=C3=98]:
>>> > "Putting the _target_ protoc into the sysroot for executation at
_build_
>>> > time isn't useful because even if it has the right architecture, the
>>> > tune might be incompatible.  Recipes which want protoc should just
depend
>>> > on protobuf-native."
>>> >
>>> > This has been reverted recently by Samuli[1]:
>>> > "If protoc is enabled for the build, recipes using protobuf will
>>> > fail when protoc is not available in the recipe sysroot"
>>> >
>>> > Be the revert is incorret as This is an issue coming from qtgrpc
>>> > other recipes that use protobuf or gRPC compiler, proplery looks for
>>> > the binary in the correct sysroot folder.
>>> >
>>> > Qtgrpc recipe should fix this issue at the recipe level, for example
this
>>> > is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need
this
>>> > patch to properly compile.
>>> >
>>> > So keeping this hack doesn't seems to be a correct fix.
>>> >
>>> > Note that qtgrpc recipe isn't available on meta-oe nor any other
public
>>> > layers.
>>> >
>>> > 0:
https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-1=
-ross.burton@arm.com/
>>> > 1:
https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.3088498-=
1-samuli.piippo@qt.io/
>>> > 2:
https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c8=
01a0ecf7312d1049ece3e
>>> >
>>> > CC: Samuli Piippo <samuli.piippo@gmail.com>
>>> > CC: Ross Burton <ross.burton@arm.com>
>>> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>>> > ---
>>> >   meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 ---
>>> >   1 file changed, 3 deletions(-)
>>> >
>>> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>>> > index 06d73d648..1edc21cdf 100644
>>> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>>> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>>> > @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
>>> >   FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
>>> >   FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
>>> >
>>> > -# CMake requires binaries to exist in sysroot, even if they have
wrong architecture.
>>> > -SYSROOT_DIRS +=3D "${bindir}"
>>> > -
>>> >   RDEPENDS:${PN}-compiler =3D "${PN}"
>>> >   RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>>> >   RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG'=
,
'python', 'python3-protobuf', '', d)}"
>>> >
>>> >
>>> >
>>>
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105291):
https://lists.openembedded.org/g/openembedded-devel/message/105291
>> Mute This Topic: https://lists.openembedded.org/mt/101679410/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--000000000000263f0f0606a529fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<br><br>On Sun, 1 Oct 2023 at 12:11, Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br>&gt;<br>&gt; well, target bindir isn&#39;t in default PATH so=
 it wont get executed by default<br><br>Is it a reason to allow mixing exec=
utable arch/tune?<br><br>How do you handle it when you want to install prot=
oc/grpc-cpp-plugin for the target too?<br><br>&gt;<br>&gt; I have used this=
 work around in some meta-ros recipes where the .cmake file was checking th=
e binary existence even when this .cmake was used only to get right list of=
 libraries to link with (and the binary was not called at all - which imho =
can happen with protobuf as well)<br><br>As you say it&#39;s a workaround, =
and<span class=3D"gmail_default" style=3D""> it&#39;s an issue with the CMa=
ke recipe.=C2=A0</span><div><br></div><div><span class=3D"gmail_default" st=
yle=3D"font-family:monospace">If w</span><span class=3D"gmail_default" styl=
e=3D"">e can properly fix it at the recipe level, then why should we keep t=
his workaround/hack?</span></div><div><span class=3D"gmail_default" style=
=3D""><br></span></div><div><span class=3D"gmail_default" style=3D"">Also i=
f you really need it, you can=C2=A0have a .bbappend for protoc/grpc in the =
downstream layer. But I would be in favor to avoid this by default no?</spa=
n></div><div><span class=3D"gmail_default" style=3D""><br></span></div><div=
><span class=3D"gmail_default" style=3D"">Clement</span></div><div><span st=
yle=3D"font-family:Arial,Helvetica,sans-serif"><span class=3D"gmail_default=
" style=3D"font-family:monospace"><br></span></span></div><div><div><div>&g=
t;<br>&gt; On Sun, 1 Oct 2023, 05:03 Khem Raj, &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt;<br>=
&gt;&gt;<br>&gt;&gt; On Sat, Sep 30, 2023 at 5:48 PM Vyacheslav Yurkov &lt;=
<a href=3D"mailto:uvv.mail@gmail.com">uvv.mail@gmail.com</a>&gt; wrote:<br>=
&gt;&gt;&gt;<br>&gt;&gt;&gt; I agree, protoc should _not_ be in sysroot, be=
cause target binary can&#39;t<br>&gt;&gt;&gt; run on host system.<br>&gt;&g=
t;<br>&gt;&gt;<br>&gt;&gt; Yeah this seems correct approach to me<br>&gt;&g=
t;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; Vyacheslav<br>&gt;&gt;&gt;<br>&gt;&g=
t;&gt; On 30.09.2023 19:30, Cl=C3=A9ment P=C3=A9ron wrote:<br>&gt;&gt;&gt; =
&gt; This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.<br>&gt;&=
gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; As said by Ross[=C3=98]:<br>&gt;&gt;&gt; =
&gt; &quot;Putting the _target_ protoc into the sysroot for executation at =
_build_<br>&gt;&gt;&gt; &gt; time isn&#39;t useful because even if it has t=
he right architecture, the<br>&gt;&gt;&gt; &gt; tune might be incompatible.=
=C2=A0 Recipes which want protoc should just depend<br>&gt;&gt;&gt; &gt; on=
 protobuf-native.&quot;<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; This has =
been reverted recently by Samuli[1]:<br>&gt;&gt;&gt; &gt; &quot;If protoc i=
s enabled for the build, recipes using protobuf will<br>&gt;&gt;&gt; &gt; f=
ail when protoc is not available in the recipe sysroot&quot;<br>&gt;&gt;&gt=
; &gt;<br>&gt;&gt;&gt; &gt; Be the revert is incorret as This is an issue c=
oming from qtgrpc<br>&gt;&gt;&gt; &gt; other recipes that use protobuf or g=
RPC compiler, proplery looks for<br>&gt;&gt;&gt; &gt; the binary in the cor=
rect sysroot folder.<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; Qtgrpc recip=
e should fix this issue at the recipe level, for example this<br>&gt;&gt;&g=
t; &gt; is what I&#39;ve done for &quot;etcd-cpp-apiv3&quot; recipe[2] that=
 doesn&#39;t need this<br>&gt;&gt;&gt; &gt; patch to properly compile.<br>&=
gt;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; So keeping this hack doesn&#39;t seem=
s to be a correct fix.<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; Note that =
qtgrpc recipe isn&#39;t available on meta-oe nor any other public<br>&gt;&g=
t;&gt; &gt; layers.<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; 0: <a href=3D=
"https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.377450-=
1-ross.burton@arm.com/">https://patchwork.yoctoproject.org/project/oe/patch=
/20230904161230.377450-1-ross.burton@arm.com/</a><br>&gt;&gt;&gt; &gt; 1: <=
a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2023092705110=
1.3088498-1-samuli.piippo@qt.io/">https://patchwork.yoctoproject.org/projec=
t/oe/patch/20230927051101.3088498-1-samuli.piippo@qt.io/</a><br>&gt;&gt;&gt=
; &gt; 2: <a href=3D"https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commi=
t/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e">https://github.com/etcd-cpp-api=
v3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc31c801a0ecf7312d1049ece3e</a><br>&g=
t;&gt;&gt; &gt;<br>&gt;&gt;&gt; &gt; CC: Samuli Piippo &lt;<a href=3D"mailt=
o:samuli.piippo@gmail.com">samuli.piippo@gmail.com</a>&gt;<br>&gt;&gt;&gt; =
&gt; CC: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton=
@arm.com</a>&gt;<br>&gt;&gt;&gt; &gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ro=
n &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt;<=
br>&gt;&gt;&gt; &gt; ---<br>&gt;&gt;&gt; &gt; =C2=A0 meta-oe/recipes-devtoo=
ls/protobuf/<a href=3D"http://protobuf_4.23.4.bb">protobuf_4.23.4.bb</a> | =
3 ---<br>&gt;&gt;&gt; &gt; =C2=A0 1 file changed, 3 deletions(-)<br>&gt;&gt=
;&gt; &gt;<br>&gt;&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/proto=
buf/<a href=3D"http://protobuf_4.23.4.bb">protobuf_4.23.4.bb</a> b/meta-oe/=
recipes-devtools/protobuf/<a href=3D"http://protobuf_4.23.4.bb">protobuf_4.=
23.4.bb</a><br>&gt;&gt;&gt; &gt; index 06d73d648..1edc21cdf 100644<br>&gt;&=
gt;&gt; &gt; --- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://prot=
obuf_4.23.4.bb">protobuf_4.23.4.bb</a><br>&gt;&gt;&gt; &gt; +++ b/meta-oe/r=
ecipes-devtools/protobuf/<a href=3D"http://protobuf_4.23.4.bb">protobuf_4.2=
3.4.bb</a><br>&gt;&gt;&gt; &gt; @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN =3D &=
quot;${PN}-compiler ${PN}-lite&quot;<br>&gt;&gt;&gt; &gt; =C2=A0 FILES:${PN=
}-compiler =3D &quot;${bindir} ${libdir}/libprotoc${SOLIBS}&quot;<br>&gt;&g=
t;&gt; &gt; =C2=A0 FILES:${PN}-lite =3D &quot;${libdir}/libprotobuf-lite${S=
OLIBS}&quot;<br>&gt;&gt;&gt; &gt; =C2=A0<br>&gt;&gt;&gt; &gt; -# CMake requ=
ires binaries to exist in sysroot, even if they have wrong architecture.<br=
>&gt;&gt;&gt; &gt; -SYSROOT_DIRS +=3D &quot;${bindir}&quot;<br>&gt;&gt;&gt;=
 &gt; -<br>&gt;&gt;&gt; &gt; =C2=A0 RDEPENDS:${PN}-compiler =3D &quot;${PN}=
&quot;<br>&gt;&gt;&gt; &gt; =C2=A0 RDEPENDS:${PN}-dev +=3D &quot;${PN}-comp=
iler&quot;<br>&gt;&gt;&gt; &gt; =C2=A0 RDEPENDS:${PN}-ptest =3D &quot;bash =
${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;python&#39;, &#39;python=
3-protobuf&#39;, &#39;&#39;, d)}&quot;<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt;=
 &gt;<br>&gt;&gt;&gt; &gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt;<=
br>&gt;&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-<br>&gt;&gt; Links: You receive all messages sent to this group=
.<br>&gt;&gt; View/Reply Online (#105291): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/message/105291">https://lists.openembedded.o=
rg/g/openembedded-devel/message/105291</a><br>&gt;&gt; Mute This Topic: <a =
href=3D"https://lists.openembedded.org/mt/101679410/3617156">https://lists.=
openembedded.org/mt/101679410/3617156</a><br>&gt;&gt; Group Owner: <a href=
=3D"mailto:openembedded-devel%2Bowner@lists.openembedded.org">openembedded-=
devel+owner@lists.openembedded.org</a><br>&gt;&gt; Unsubscribe: <a href=3D"=
https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.op=
enembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jan=
sa@gmail.com">martin.jansa@gmail.com</a>]<br>&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt;&gt;</div></div></div></div>

--000000000000263f0f0606a529fa--

