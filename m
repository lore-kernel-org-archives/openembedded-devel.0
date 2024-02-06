Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2484C4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:21:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.18452.1707214869533969156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q7/x0dFV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fdb18ffc7so17743185e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 02:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707214868; x=1707819668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rrnFyt8F+inIQ/iIvpM5yyFSojZ1Jb/ec1+dGFSBhuw=;
        b=Q7/x0dFVLgojxha0MNHX8u9ec2zrT8uCejuO8/MR4GJ7MnXGHBymMXChMaO71l7WhD
         pWy7TKHFRJBgDAVCNExowPh5aKxibSQuEqYzvy38ghk6hhZp/LpBIH5JpR+BpEQoAgNG
         pu2p+YQ20s0bxp0zMXm4vq+72wErsI6r3Gw2iofagTnxnEvqYrC2FBm02TrsbXtAc7NO
         5RjiaZ18ejmqtDoKx6hZvRRSWANp4FnZkbAt1knQerD0XR4gO+Z6vEPHkcL655dztJL+
         l+SXycKu9lu/Rf+CxSzFkKjctkSjd1szvXkKfdrRC4pbu/1od5IM1qNypTq2opgWluRj
         6Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214868; x=1707819668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrnFyt8F+inIQ/iIvpM5yyFSojZ1Jb/ec1+dGFSBhuw=;
        b=jfQMoFVU5nafVVhePffDGRhkStbbx4ruJXwSm2aCngEicygrnw6MTsw2Bi1G+k9a/G
         uQ8i8p6QJU7pzfjYTizQJfManFRoHX6vZAFjngOu46X0ls2yAGy1n/oSraiSqHuC9bQn
         kAAEEvqh/c7PoQeODU+G91HuWzvrKjGLzt9ZNupeSE+tkkcGak9avyrFQCDDa1WvnMGp
         zxoZvfBbNMnKtpboV0V+mYjJIlDUirYoV3tttmj5JIrwSzWEEB/4oOVep9F+tGSs6U+R
         6XxsdGP7q928AhzR5ojN83itjOjZFhPblT1LA9tHAkqQL4KLV9WZcBN8hBj7/mVVkbyP
         EGQA==
X-Gm-Message-State: AOJu0YxNi9u06JNtngdA4ICRACYHLanFwQLIoVD7sPzZFF4XtkfAbsEr
	9SJVNoRawHPUJk5ioAL4AQSQ9aVhGaL4LAyACEtwVWvPynD+M9oeU8GSlI4Mbwo2T/HsszYy5z4
	LlizpFgnBhd6OPOoK4wJnWxdyMvk=
X-Google-Smtp-Source: AGHT+IFCVJhQNlOrcMbEUIbU54tW3a3eFXvDkX6DKo5yLRTJMsmF2evvJoAaDHOvrkdmZG7aj8IaLyIo64Z56IywnBE=
X-Received: by 2002:adf:ce90:0:b0:33b:44b4:da60 with SMTP id
 r16-20020adfce90000000b0033b44b4da60mr976616wrn.41.1707214867823; Tue, 06 Feb
 2024 02:21:07 -0800 (PST)
MIME-Version: 1.0
References: <CDDBBEEB-62E5-49E5-9C40-067A75A2B31E@arm.com> <17448.1707209202552061251@lists.openembedded.org>
In-Reply-To: <17448.1707209202552061251@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2024 11:20:56 +0100
Message-ID: <CA+chaQdS9sgYwEXW7KFWh_mx2BuUK5fcKe842S=jAYfsnKq0og@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
To: ranjitsinh.rathod@kpit.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c080720610b3ef9c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 10:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108622

--000000000000c080720610b3ef9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Aha, it's in completely unused "meta" directory inside meta-openembedded
repository not in meta-oe layer. So yes, it should be reverted to avoid
confusion.

On Tue, Feb 6, 2024 at 9:46=E2=80=AFAM Ranjitsinh Rathod via lists.openembe=
dded.org
<ranjitsinh.rathod=3Dkpit.com@lists.openembedded.org> wrote:

> Hi Ross,
>
> Actually this recipe is from poky.
> The actual recipe is present in poky.
>
> https://git.yoctoproject.org/poky/tree/meta/recipes-support/libcroco/libc=
roco_0.6.13.bb?h=3Dkirkstone
>
> This is I assume added in meta-openembeded by mistake as part of this
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next=
&id=3D522603beb6d88ad6ea443806bb986096d5b766e6 and
> so we want to delete this duplicate recipe.
>
> We already have enough information in the commit message.
>
> Thanks,
> Ranjitsinh Rathod
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108617):
> https://lists.openembedded.org/g/openembedded-devel/message/108617
> Mute This Topic: https://lists.openembedded.org/mt/102058937/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c080720610b3ef9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Aha, it&#39;s in completely unused &quot;meta&quot; direct=
ory inside meta-openembedded repository not in meta-oe layer. So yes, it sh=
ould be reverted to avoid confusion.</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 6, 2024 at 9:46=E2=80=AFAM =
Ranjitsinh Rathod via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;ranjitsinh.rathod=3D<a href=3D"mailto:kpit.com@lists.op=
enembedded.org">kpit.com@lists.openembedded.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Ross,<br><br>Actually thi=
s recipe is from poky.<br><span style=3D"color:rgb(23,43,77);font-family:-a=
pple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&q=
uot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-=
serif">The actual recipe is present in poky.</span><br style=3D"color:rgb(2=
3,43,77);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,=
Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Hel=
vetica Neue&quot;,sans-serif"><a style=3D"color:rgb(0,82,204);font-family:-=
apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&=
quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans=
-serif;background-color:rgb(255,255,255)" href=3D"https://git.yoctoproject.=
org/poky/tree/meta/recipes-support/libcroco/libcroco_0.6.13.bb?h=3Dkirkston=
e" rel=3D"nofollow" target=3D"_blank">https://git.yoctoproject.org/poky/tre=
e/meta/recipes-support/libcroco/libcroco_0.6.13.bb?h=3Dkirkstone</a><br><br=
>This is I assume added in meta-openembeded by mistake as part of this <a h=
ref=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone=
-next&amp;id=3D522603beb6d88ad6ea443806bb986096d5b766e6" rel=3D"noopener" t=
arget=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?h=
=3Dkirkstone-next&amp;id=3D522603beb6d88ad6ea443806bb986096d5b766e6</a>=C2=
=A0and so we want to delete this duplicate recipe.<br><br>We already have e=
nough information in the commit message.<br><br>Thanks,<br>Ranjitsinh Ratho=
d
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108617): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108617" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108617</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102058937/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102058937/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c080720610b3ef9c--

