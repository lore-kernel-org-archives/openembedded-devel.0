Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9601CCD1299
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:56:42 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.108860.1712588196332966268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 07:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VLDGTlUj;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7e3c4736d6dso806369241.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712588195; x=1713192995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HLqCnyav7frSa5Bcb12gXkYkIHEmOPq6ZrmTg96qYHM=;
        b=VLDGTlUjZaxyIB9/J7qfx3bpDYVXeYxJ9jDPxLzGVWWCE3RO+vczUYRfrytkJSBCcX
         abb3w/6FnJ+Oc0zBrwb5QiduPAdc5totFkVTz5Qaf0Ghb0Rw6VWrqiY+sz3EZa7+ZPzp
         +eZjTrbxXbDCIqZ1ao+ehgGNN3rjW/0uuOGeniMpPHCiBsWuUK+ByE9BxVCGixLfcB8o
         4SdWdvOGgD/MhL1RPNLfjJhzo6WO8IUjk1u5gu3fKmDE7KFTr10ywHh24Ha+FPQDq0MG
         OA4DfOBrH7sLyB5etaHtCpHj87XQPMovVMiCv8urKOaxCRepIB5s8sLXt9gBUS9+oc1Y
         DcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712588195; x=1713192995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLqCnyav7frSa5Bcb12gXkYkIHEmOPq6ZrmTg96qYHM=;
        b=VsEiDSOq9mMDH/SpAGLrm4Vz+QnTcdrTqsopFs3mc54NIdiT3tz5PS5JsfP+DVTqJU
         hUKEj31sVBYh3ipxbuBWSMpALFuHBfzba2pOZYCPPW26O0XmroLyhUjXcMIkaOZ7DQdy
         +Foj8FgCBUerOCaHslapIeYlwj/nVcMLMYqBmHpZ3AyGrihvEdIYBDZI8jXvNOP9MwPs
         /d2NX4qVXnuTZhCF8wjysQ9bzUw8wrek7AUphWqLdXThceKobPV+nebmHUCSUZEgz58L
         m9y5x1vGrRiw1wXClM1KjU1Ylw0WSm+S0UrzksMP7dT8VrLyqI4zdNM7Z35s1y/Q9n0y
         Y7yw==
X-Forwarded-Encrypted: i=1; AJvYcCUjUsAx6qFi0UJRa3/XuTcEUbgqwwC13HWZ46IbVCVyBwDLrRFbLP9mK31+ydd4kqfL3iNB9xwNQ5Rii1STNMTSgALIznWwUyRbhmwrJDhP/D1nrcDpoyx5RQ==
X-Gm-Message-State: AOJu0YxY6idrXMIdOTVIFPIXKiXnB6zLqzUdVoZxNYOL8SZeBNZ4Aptl
	L1N1suubncBhK6z6KJkTAKFZWV/0odAiD36P5RtOifa3z1rLP3cPwSl8A1SVdGv/qzk0k0nJ8PG
	bAcmKQaRI11dNUfKBOGkFsMv+xwo=
X-Google-Smtp-Source: AGHT+IGv7kH+vBKQeJtv6I/aOuswOmBjius764BPfdyUvTk7LhjNpdLUNMxlpjoe0DrltopZCSc+rLIQs2Ub4WoK7pE=
X-Received: by 2002:a05:6102:3592:b0:47a:3a9:c123 with SMTP id
 h18-20020a056102359200b0047a03a9c123mr1940598vsu.28.1712588195259; Mon, 08
 Apr 2024 07:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
 <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
 <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com>
 <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com> <CA+chaQfhknEQc+A9+BU7an1ywv-_F3Qd+jnX9ppvv0m3YYqg0g@mail.gmail.com>
In-Reply-To: <CA+chaQfhknEQc+A9+BU7an1ywv-_F3Qd+jnX9ppvv0m3YYqg0g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 8 Apr 2024 15:56:24 +0100
Message-ID: <CANPvuR=+3kp7AiyxQ8w=065eK4y0ULZcoo_zS0sTTVy_3XM_og@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Fathi Boudra <fathi.boudra@linaro.org>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000066d6e061597032a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 14:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109868

--000000000000066d6e061597032a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fathi,

To reproduce the musl issue maybe you need to use the yoe/mut branch.

https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut

Jose


Martin Jansa <martin.jansa@gmail.com> escreveu (segunda, 8/04/2024 =C3=A0(s=
)
15:40):

> > > >
> > > > I couldn't reproduce the build failure. What am I missing?
> > >
> > > removing meta-filesystems from your bblayers.conf
> >
> > no, I'm asking about the musl basename() related build failure.
> >
> > The build failure about fuse3 dependency is quite obvious.
> > In my local build, I moved the recipe to
> > meta-filesystems/recipes-support/composefs/
> > I'll submit a v2 for the latter but if I can reproduce the musl issue
> > and get it fixed for v2 that would be great.
>
> Hi Fathi,
>
> I'm sorry, I've realized it just after sending the reply, gmail was
> showing your mail as a reply to the one about meta-filesystem and I
> didn't notice the musl issue before sending the reply, will fix that
> with another (6th) coffee :).
>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109867):
> https://lists.openembedded.org/g/openembedded-devel/message/109867
> Mute This Topic: https://lists.openembedded.org/mt/105351850/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000066d6e061597032a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Fathi,<br><br>To reproduce the musl issue maybe yo=
u need to use the yoe/mut branch.</div><div><br></div><div><a href=3D"https=
://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut">https://git.yoctopro=
ject.org/poky-contrib/log/?h=3Dyoe/mut</a><br><br></div><div>Jose</div><div=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jans=
a@gmail.com</a>&gt; escreveu (segunda, 8/04/2024 =C3=A0(s) 15:40):<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; &gt; &gt;<br>
&gt; &gt; &gt; I couldn&#39;t reproduce the build failure. What am I missin=
g?<br>
&gt; &gt;<br>
&gt; &gt; removing meta-filesystems from your bblayers.conf<br>
&gt;<br>
&gt; no, I&#39;m asking about the musl basename() related build failure.<br=
>
&gt;<br>
&gt; The build failure about fuse3 dependency is quite obvious.<br>
&gt; In my local build, I moved the recipe to<br>
&gt; meta-filesystems/recipes-support/composefs/<br>
&gt; I&#39;ll submit a v2 for the latter but if I can reproduce the musl is=
sue<br>
&gt; and get it fixed for v2 that would be great.<br>
<br>
Hi Fathi,<br>
<br>
I&#39;m sorry, I&#39;ve realized it just after sending the reply, gmail was=
<br>
showing your mail as a reply to the one about meta-filesystem and I<br>
didn&#39;t notice the musl issue before sending the reply, will fix that<br=
>
with another (6th) coffee :).<br>
<br>
Cheers,<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109867): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109867" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109867</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105351850/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105351850/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000066d6e061597032a--

