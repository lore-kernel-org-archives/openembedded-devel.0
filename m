Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5B7E78482
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:22:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.64994.1696184566147590377
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WG5/iGJi;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3226b8de467so13759842f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696184564; x=1696789364; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e0Iq7uhE9xVIG4e6dw1Ijf1T3JAEeKHX08q/KE1JEFw=;
        b=WG5/iGJieyxOYl3/3mR6yiJq7/XE5aHk6f12VdU7IGYyGu7kv2xGZFuDDD2egB5j51
         7+3yySjwr8GFWYmdLZqWAOrzyHSSF+eCmUzTI0YxIRvE+EbpKxY9SD3BmLiTvrHDoYzD
         ExirXcMfx2i9s8hnLVnFnFZmXrGmv1B4mN8cje26JSy5vWdi6nBCJdmblhHok0i3b60R
         vF++fY6CHQD5z/4G3kT6gqjE3S0Sd0dEk3SkFSJ2VFdqLepZzt4Xk4Z1yVQPNlOxAGWk
         WCgdBshVSNSA5imsm287zPCswZT+EGreXEXXqvlLbXzxiaJpCTuyy7OWQ1mle4zONcu+
         Va4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696184564; x=1696789364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0Iq7uhE9xVIG4e6dw1Ijf1T3JAEeKHX08q/KE1JEFw=;
        b=dz05TETCS76tOOK25Ap+FvynO6HZk+nHi4TpBos2E6jGF5tDcNL/+N8Lhzik7I/jA5
         qNqaFm/SoB2Plh1TZ8/BfO7RpNDxUQm4IaXlLeLArbGo7Nfkdb/sr4Wps/hm5fNu4vgZ
         nf/5uurYu0PADXtPyg1LZbt6Qd1Vwlet25xZysW41WseBKDy2sr1B+AiXllDP3EJ1vEC
         ycxaOgQ5U4+3zudh3qNljYdTbM57R4BqwSTGE5bTsx9B8unMCVctfiNDeGX7B1g6eW9Y
         mGFG79+BmxjD/nrNol/mt3sdHXBjGGYtrOAd64R5pWj65oq9znlljLDTTdOTsf8Wzzb3
         OUGA==
X-Gm-Message-State: AOJu0YzPrnKuUxhF/yt6MExVxNJhMfXdSTwqf8FACuTkT9lXNSy409Tj
	FFwskGnuQfjvnSUY5cNT45ObmWNmFRK4MLuHYYA=
X-Google-Smtp-Source: AGHT+IEcQnad78RU7NEfdscOY5i2cIz+7Yv1SbiGYe2VG33wdutDDK594Aeyy6OeRMGG5JRVQvR/NzduNgvk4ukn+2M=
X-Received: by 2002:a5d:64c6:0:b0:324:884a:5cd0 with SMTP id
 f6-20020a5d64c6000000b00324884a5cd0mr9743247wri.47.1696184564291; Sun, 01 Oct
 2023 11:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230930173003.3210-1-peron.clem@gmail.com> <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com> <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
In-Reply-To: <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 1 Oct 2023 20:22:33 +0200
Message-ID: <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Samuli Piippo <samuli.piippo@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d9c070606abbe38"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Oct 2023 18:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105297

--0000000000006d9c070606abbe38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 1, 2023 at 12:31=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:

> Hi Martin,
>
> On Sun, 1 Oct 2023 at 12:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > well, target bindir isn't in default PATH so it wont get executed by
> default
>
> Is it a reason to allow mixing executable arch/tune?
>

What is getting mixed? target sysroot is still for target and native
sysroot for native.

How do you handle it when you want to install protoc/grpc-cpp-plugin for
> the target too?
>

SYSROOT_DIRS variable doesn't affect how it's packaged for target, does it?
It just allows the binary from bindir to be available in RSS next to
binaries from libdir, both still separate from native RSS as it should.

> I have used this work around in some meta-ros recipes where the .cmake
> file was checking the binary existence even when this .cmake was used onl=
y
> to get right list of libraries to link with (and the binary was not calle=
d
> at all - which imho can happen with protobuf as well)
>
> As you say it's a workaround, and it's an issue with the CMake recipe.
>

Issue with .cmake file from protobuf, right?


> If we can properly fix it at the recipe level, then why should we keep
> this workaround/hack?
>
> Also if you really need it, you can have a .bbappend for protoc/grpc in
> the downstream layer. But I would be in favor to avoid this by default no=
?
>

I haven't seen any proper fix for this exact issue. Yes you can patch
.cmake generation not to include bindir when building for target (while it
needs it for native build), but then that change will break possible use of
protobuf on target, so the SYSROOT_DIRS still seems like lesser evil here.

Here are some examples from meta-ros:
https://github.com/ros/meta-ros/commit/875ceed4b1c693c2eb0f2b7ea85385be576a=
62cc
https://github.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969=
a16c
https://github.com/ros/meta-ros/commit/5e61eb0520d2841c0da7e14eecc833b3c410=
4533
https://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db5=
0cdf

I don't care about protobuf, but the explanation from Samuli looks like the
same issue as what I remember from above and I don't see how SYSROOT_DIRS
causes mixing executables or any issues for installing them for target.

Cheers,

>

--0000000000006d9c070606abbe38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 1, 2023 at 12:31=E2=80=AFPM C=
l=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.cl=
em@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Martin,<br><br>O=
n Sun, 1 Oct 2023 at 12:11, Martin Jansa &lt;<a href=3D"mailto:martin.jansa=
@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>&gt;=
<br>&gt; well, target bindir isn&#39;t in default PATH so it wont get execu=
ted by default<br><br>Is it a reason to allow mixing executable arch/tune?<=
br></div></blockquote><div><br></div><div>What is getting mixed? target sys=
root is still for target and native sysroot for native.</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">How do =
you handle it when you want to install protoc/grpc-cpp-plugin for the targe=
t too?<br></div></blockquote><div><br></div><div>SYSROOT_DIRS variable does=
n&#39;t affect how it&#39;s packaged for target, does it? It just allows th=
e binary from bindir to be available in RSS next to binaries from libdir, b=
oth still separate from native RSS as it should.</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">&gt; I have us=
ed this work around in some meta-ros recipes where the .cmake file was chec=
king the binary existence even when this .cmake was used only to get right =
list of libraries to link with (and the binary was not called at all - whic=
h imho can happen with protobuf as well)<br><br>As you say it&#39;s a worka=
round, and<span class=3D"gmail_default"> it&#39;s an issue with the CMake r=
ecipe.</span></div></blockquote><div><br></div><div>Issue with .cmake file =
from protobuf, right?</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div><span class=3D"gmail_default" styl=
e=3D"font-family:monospace">If w</span><span class=3D"gmail_default">e can =
properly fix it at the recipe level, then why should we keep this workaroun=
d/hack?</span></div><div><span class=3D"gmail_default"><br></span></div><di=
v><span class=3D"gmail_default">Also if you really need it, you can=C2=A0ha=
ve a .bbappend for protoc/grpc in the downstream layer. But I would be in f=
avor to avoid this by default no?</span></div></div></blockquote><div><br><=
/div><div>I haven&#39;t seen any proper fix for this exact issue. Yes you c=
an patch .cmake generation not to include bindir when building for target (=
while it needs it for native build), but then that change will break possib=
le use of protobuf on target, so the SYSROOT_DIRS still seems like lesser e=
vil here.</div><div><br></div><div>Here are some examples from meta-ros:</d=
iv><div><a href=3D"https://github.com/ros/meta-ros/commit/875ceed4b1c693c2e=
b0f2b7ea85385be576a62cc">https://github.com/ros/meta-ros/commit/875ceed4b1c=
693c2eb0f2b7ea85385be576a62cc</a><br></div><div><a href=3D"https://github.c=
om/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c">https://gi=
thub.com/ros/meta-ros/commit/67c03755543655ad0634e078bc30d8ab9969a16c</a><b=
r></div><div><a href=3D"https://github.com/ros/meta-ros/commit/5e61eb0520d2=
841c0da7e14eecc833b3c4104533">https://github.com/ros/meta-ros/commit/5e61eb=
0520d2841c0da7e14eecc833b3c4104533</a><br></div><div><a href=3D"https://git=
hub.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf">https=
://github.com/ros/meta-ros/commit/a53bb7cc8b45a72b704e75311d68b37a6db50cdf<=
/a><br></div><div><br></div><div>I don&#39;t care about protobuf, but the e=
xplanation from Samuli looks like the same issue as what I remember from ab=
ove and I don&#39;t see how SYSROOT_DIRS causes mixing executables or any i=
ssues for installing them for target.</div><div><br></div><div>Cheers,</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div>

--0000000000006d9c070606abbe38--

