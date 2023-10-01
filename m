Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBA6E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 10:11:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.56915.1696155076708942027
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 03:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T0kcY3WB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4054496bde3so138266955e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696155075; x=1696759875; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z0ts1gBkHd27BLRV6L/xwuhX5MTepYMnyrUifW0cyvY=;
        b=T0kcY3WBoQVLNaxsvqbXKIuxH62ydjAuwGzWYKJRtbOE2UMwvXOENBdz1LjsYI56IM
         +8xrRw+awFqJp7sef4pmWpGtxmsYIw+k/rkAZqJQ8AFyaJAi8H4mOMZqkgcDmLcxAauS
         GtmgqP367nUZ/7Qh8hliSUbX2DUNlCvl2q5Kh3+j4z29TrRkVDsWMH8TrJZsOCE9KvKW
         E4U43Bi3EDL3sP4fdSpDUR0kIgOCu4OKnZvhIZ6wqP60wTyKSH7LlK+pXYd7Dif04u4L
         jFVS1g+Kk50Pk9LKNkPp+XJT0zQyfsMzndR0GUlohhyhaWDHbuqiLB3eIulOjQjr8XpK
         49oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696155075; x=1696759875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0ts1gBkHd27BLRV6L/xwuhX5MTepYMnyrUifW0cyvY=;
        b=Gy0k/75uAJSe9b7LChXMG2FO4i002hZrnSN+XSxDiszIt4/Py0t/xNXKxWpP5ph27o
         OrIdFJUyOcYfAbCARo9mfY3vretxI6qzTqwSki1HTQQJWFAoU9QoKgVdyW3Hm87ohXLq
         2NofB2Bttm8Z5chmZ3vSLr7msKPEVZYfYLtz2XBAUE0hkqrFfh6YHM55kDv/+no1c3XL
         kw5/tIZ90lt3J2oaFpnVIi8U8kZv8WOKT2iEFNE6KZGlKTK2a9XRU52XPyZkj9Mb7z29
         BI3V6PCRWOmjIEswra7jMWI9HmjuYKfrVCdUrGjYivG15Fuy4N87sMrYTsiUxqXFzmdR
         2l5A==
X-Gm-Message-State: AOJu0Yyk1Lsyq9IcN6YYdVXpJ15jkj5qk6+LDaDj7nuXp3IHzcoufPeQ
	kr6g6rZqEwrBNcOaRN0LX7NBpmICjK7dwthpWyw=
X-Google-Smtp-Source: AGHT+IEGuQK565iGQQUOu2e2VeO+bY5ukWOEXmS+dciTXylCdE0kfTMjQTtvuF5CLgqKjDyTHV2CEVgJuyZEXqwh6uM=
X-Received: by 2002:adf:ea84:0:b0:321:6f5f:78ab with SMTP id
 s4-20020adfea84000000b003216f5f78abmr7081228wrm.56.1696155074361; Sun, 01 Oct
 2023 03:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
In-Reply-To: <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 1 Oct 2023 12:11:02 +0200
Message-ID: <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: Khem Raj <raj.khem@gmail.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b0fc960606a4e01f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 10:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105294

--000000000000b0fc960606a4e01f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

well, target bindir isn't in default PATH so it wont get executed by defaul=
t

I have used this work around in some meta-ros recipes where the .cmake file
was checking the binary existence even when this .cmake was used only to
get right list of libraries to link with (and the binary was not called at
all - which imho can happen with protobuf as well)

On Sun, 1 Oct 2023, 05:03 Khem Raj, <raj.khem@gmail.com> wrote:

>
>
> On Sat, Sep 30, 2023 at 5:48 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
> wrote:
>
>> I agree, protoc should _not_ be in sysroot, because target binary can't
>> run on host system.
>>
>
> Yeah this seems correct approach to me
>
>>
>> Vyacheslav
>>
>> On 30.09.2023 19:30, Cl=C3=A9ment P=C3=A9ron wrote:
>> > This reverts commit a0557fe5433620717eeb00d3b16801711337b1a4.
>> >
>> > As said by Ross[=C3=98]:
>> > "Putting the _target_ protoc into the sysroot for executation at _buil=
d_
>> > time isn't useful because even if it has the right architecture, the
>> > tune might be incompatible.  Recipes which want protoc should just
>> depend
>> > on protobuf-native."
>> >
>> > This has been reverted recently by Samuli[1]:
>> > "If protoc is enabled for the build, recipes using protobuf will
>> > fail when protoc is not available in the recipe sysroot"
>> >
>> > Be the revert is incorret as This is an issue coming from qtgrpc
>> > other recipes that use protobuf or gRPC compiler, proplery looks for
>> > the binary in the correct sysroot folder.
>> >
>> > Qtgrpc recipe should fix this issue at the recipe level, for example
>> this
>> > is what I've done for "etcd-cpp-apiv3" recipe[2] that doesn't need thi=
s
>> > patch to properly compile.
>> >
>> > So keeping this hack doesn't seems to be a correct fix.
>> >
>> > Note that qtgrpc recipe isn't available on meta-oe nor any other publi=
c
>> > layers.
>> >
>> > 0:
>> https://patchwork.yoctoproject.org/project/oe/patch/20230904161230.37745=
0-1-ross.burton@arm.com/
>> > 1:
>> https://patchwork.yoctoproject.org/project/oe/patch/20230927051101.30884=
98-1-samuli.piippo@qt.io/
>> > 2:
>> https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0d9e0326f3cc3=
1c801a0ecf7312d1049ece3e
>> >
>> > CC: Samuli Piippo <samuli.piippo@gmail.com>
>> > CC: Ross Burton <ross.burton@arm.com>
>> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> > ---
>> >   meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 ---
>> >   1 file changed, 3 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>> > index 06d73d648..1edc21cdf 100644
>> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
>> > @@ -101,9 +101,6 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
>> >   FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
>> >   FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
>> >
>> > -# CMake requires binaries to exist in sysroot, even if they have wron=
g
>> architecture.
>> > -SYSROOT_DIRS +=3D "${bindir}"
>> > -
>> >   RDEPENDS:${PN}-compiler =3D "${PN}"
>> >   RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>> >   RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG',
>> 'python', 'python3-protobuf', '', d)}"
>> >
>> >
>> >
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105291):
> https://lists.openembedded.org/g/openembedded-devel/message/105291
> Mute This Topic: https://lists.openembedded.org/mt/101679410/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b0fc960606a4e01f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">well, target bindir isn&#39;t in default PATH so it wont =
get executed by default<div dir=3D"auto"><br></div><div dir=3D"auto">I have=
 used this work around in some meta-ros recipes where the .cmake file was c=
hecking the binary existence even when this .cmake was used only to get rig=
ht list of libraries to link with (and the binary was not called at all - w=
hich imho can happen with protobuf as well)</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 1 Oct 2023, 05:03 =
Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br></div><div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Se=
p 30, 2023 at 5:48 PM Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)">I agree, protoc should _not_ be in sysroot, be=
cause target binary can&#39;t <br>
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
0904161230.377450-1-ross.burton@arm.com/" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://patchwork.yoctoproject.org/project/oe/patch/20230904=
161230.377450-1-ross.burton@arm.com/</a><br>
&gt; 1: <a href=3D"https://patchwork.yoctoproject.org/project/oe/patch/2023=
0927051101.3088498-1-samuli.piippo@qt.io/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://patchwork.yoctoproject.org/project/oe/patch/2023092=
7051101.3088498-1-samuli.piippo@qt.io/</a><br>
&gt; 2: <a href=3D"https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/=
47f0d9e0326f3cc31c801a0ecf7312d1049ece3e" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://github.com/etcd-cpp-apiv3/etcd-cpp-apiv3/commit/47f0=
d9e0326f3cc31c801a0ecf7312d1049ece3e</a><br>
&gt;<br>
&gt; CC: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">samuli.piippo@gmail.com</a>&gt;<br>
&gt; CC: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_=
blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
&gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cle=
m@gmail.com" target=3D"_blank" rel=3D"noreferrer">peron.clem@gmail.com</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://protob=
uf_4.23.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">protobuf_4.23=
.4.bb</a> | 3 ---<br>
&gt;=C2=A0 =C2=A01 file changed, 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://proto=
buf_4.23.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">protobuf_4.2=
3.4.bb</a> b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4=
.23.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">protobuf_4.23.4.b=
b</a><br>
&gt; index 06d73d648..1edc21cdf 100644<br>
&gt; --- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
3.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">protobuf_4.23.4.bb<=
/a><br>
&gt; +++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
3.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">protobuf_4.23.4.bb<=
/a><br>
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
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105291): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105291" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/105291</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101679410/361=
7156" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/101679410/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">martin.jansa@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b0fc960606a4e01f--

