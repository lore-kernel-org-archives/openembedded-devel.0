Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0738C4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:25:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.18517.1707215144688497793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJCikh6k;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fc6578423so35895475e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 02:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707215143; x=1707819943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hbVk1ekKb91sRu30uiqxo/9ytE2gqwVItfwbVkHpdU=;
        b=SJCikh6k6y9hcvD1+NbGw4StK9WSsfr2kxtXe44UngDOywOt9qZm9Gb7NvI6ZHwSdZ
         NIq1qZOjg1sDqU4EHtDeeR6wV75Q3hoV6BEmvnaqUmuwRrnmnVbmPE3LveXpBitOoNhb
         hN+2EyIOojAd0jfXnZYHSXF35EnmxNtBh4L1Es8/akLUsy5FZwGl6DI5h7a+byhVsvMk
         GrM6mW4/stlbuuZSP6PvnuesNU5ZYSvRvqp/Ho3c++cZvR7NU+xODmSeirKuln1Rec5z
         R07zTBuj/ELzlx2yMDfwD7LiRbmAZV14Pa9HopsLfMMwpWpuk65eqF4PjCCRUc7ebPG5
         Y28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707215143; x=1707819943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hbVk1ekKb91sRu30uiqxo/9ytE2gqwVItfwbVkHpdU=;
        b=HZybPIe1ESrz98ajBKAT+Y9g8bPJy3BUiIsjIl6IzoqIy4GaNUAYc2atFuMDjUuqV8
         29NJxOkbkW6e3ZAiBDCUi+5Ol9BxSvvnB86XMfe3O1MPu3y4lMj/vAu9Ucr9cdFEchVM
         LNaCd7TKo+JufgrM75FRdlGJoSBeZ3JHDdKK2ucFomsWiJzjPKQEoFJMgR3e4rQ5tOiR
         ouG3QA1GCpAuZ5AY7+JzmypcmiArxvbjT6doqsuNHzjN1JY0pLPhdX0XBWxtaLSIvFGI
         aLFJRM+1MXDqdopXEZ+U/PVEY1P3rKkUhn9vZcTeosGMOhSho71KhBWx4vpnBxEmJgRT
         STcQ==
X-Gm-Message-State: AOJu0Yx6CD9YWzHddJBj/cLUPIH1ULUm8xjmxAdvTCLQvbMGH2VwLgLQ
	jpfpLL5VTK8ksXMCiRMWanGIvKmHWI3e5PW5kdHLQE4wbI2i39PuN0609T3zl5ulIWnwTDfDQJk
	6/AH+NMDXa1fYba/NQoUUdQur0zI=
X-Google-Smtp-Source: AGHT+IHV7qG6b6JETOpkNFLNFVJxzJAc1bvyszZF78Frguy7nds8HnCydlZRAwj1lPHS9zCE8uMh24cloaCCQ2YQk94=
X-Received: by 2002:a05:6000:184a:b0:33b:3559:2815 with SMTP id
 c10-20020a056000184a00b0033b35592815mr1025938wri.0.1707215142881; Tue, 06 Feb
 2024 02:25:42 -0800 (PST)
MIME-Version: 1.0
References: <CDDBBEEB-62E5-49E5-9C40-067A75A2B31E@arm.com> <17448.1707209202552061251@lists.openembedded.org>
 <17B13EE102A25933.6127@lists.openembedded.org>
In-Reply-To: <17B13EE102A25933.6127@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2024 11:25:32 +0100
Message-ID: <CA+chaQetE39pUkefSSObLULpB0xY3wwH5iPG9Keu76xwdSv_Ag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
To: martin.jansa@gmail.com
Cc: ranjitsinh.rathod@kpit.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000258f060610b400af"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 10:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108624

--000000000000258f060610b400af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've sent revert with I think a bit better commit message.

On Tue, Feb 6, 2024 at 11:21=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Aha, it's in completely unused "meta" directory inside meta-openembedded
> repository not in meta-oe layer. So yes, it should be reverted to avoid
> confusion.
>
> On Tue, Feb 6, 2024 at 9:46=E2=80=AFAM Ranjitsinh Rathod via
> lists.openembedded.org <ranjitsinh.rathod=3Dkpit.com@lists.openembedded.o=
rg>
> wrote:
>
>> Hi Ross,
>>
>> Actually this recipe is from poky.
>> The actual recipe is present in poky.
>>
>> https://git.yoctoproject.org/poky/tree/meta/recipes-support/libcroco/lib=
croco_0.6.13.bb?h=3Dkirkstone
>>
>> This is I assume added in meta-openembeded by mistake as part of this
>> https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-nex=
t&id=3D522603beb6d88ad6ea443806bb986096d5b766e6 and
>> so we want to delete this duplicate recipe.
>>
>> We already have enough information in the commit message.
>>
>> Thanks,
>> Ranjitsinh Rathod
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108622):
> https://lists.openembedded.org/g/openembedded-devel/message/108622
> Mute This Topic: https://lists.openembedded.org/mt/102058937/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000258f060610b400af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent revert with I think a bit better commit mess=
age.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Feb 6, 2024 at 11:21=E2=80=AFAM Martin Jansa via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.jansa=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Aha, it&#39;s in completely unused &quot;meta&quot=
; directory inside meta-openembedded repository not in meta-oe layer. So ye=
s, it should be reverted to avoid confusion.</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 6, 2024 at 9:46=E2=
=80=AFAM Ranjitsinh Rathod via <a href=3D"http://lists.openembedded.org" ta=
rget=3D"_blank">lists.openembedded.org</a> &lt;ranjitsinh.rathod=3D<a href=
=3D"mailto:kpit.com@lists.openembedded.org" target=3D"_blank">kpit.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi Ross,<br><br>Actually this recipe is from poky.<br><sp=
an style=3D"color:rgb(23,43,77);font-family:-apple-system,BlinkMacSystemFon=
t,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Dro=
id Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif">The actual recipe is p=
resent in poky.</span><br style=3D"color:rgb(23,43,77);font-family:-apple-s=
ystem,BlinkMacSystemFont,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fi=
ra Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif"=
><a style=3D"color:rgb(0,82,204);font-family:-apple-system,BlinkMacSystemFo=
nt,&quot;Segoe UI&quot;,Roboto,Oxygen,Ubuntu,&quot;Fira Sans&quot;,&quot;Dr=
oid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;background-color:rgb(2=
55,255,255)" href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-su=
pport/libcroco/libcroco_0.6.13.bb?h=3Dkirkstone" rel=3D"nofollow" target=3D=
"_blank">https://git.yoctoproject.org/poky/tree/meta/recipes-support/libcro=
co/libcroco_0.6.13.bb?h=3Dkirkstone</a><br><br>This is I assume added in me=
ta-openembeded by mistake as part of this <a href=3D"https://git.openembedd=
ed.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D522603beb6d88a=
d6ea443806bb986096d5b766e6" rel=3D"noopener" target=3D"_blank">https://git.=
openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D5226=
03beb6d88ad6ea443806bb986096d5b766e6</a>=C2=A0and so we want to delete this=
 duplicate recipe.<br><br>We already have enough information in the commit =
message.<br><br>Thanks,<br>Ranjitsinh Rathod
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108622): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108622" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108622</a><br>
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

--000000000000258f060610b400af--

