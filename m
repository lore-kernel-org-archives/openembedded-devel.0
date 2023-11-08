Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B790C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:50:48 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.19665.1699462240792376949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 08:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amg7j6iW;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1ef370c2e12so4205120fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699462240; x=1700067040; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nI0F9LAk5TZlBnzYcU8mbhrI7NqqT3VYir272z++HhU=;
        b=amg7j6iWgjYOb8luW0HCyenvG34BnyE7qb9NnDCIIu+EdJ6IMVsrUp4N27hm7v8FG9
         qcI9yonvU86L/5db62FrzDQDv30/7beEMv+IeZJTd8AwXxFdcQEwOkF/1KpHoS/hz6Cf
         tMnwiDIhqN5KscEeFgzTP/1eR1ura+Us6IXIWTGFsreH53mK1x78kSgQB/UT/YO/8NHB
         kuAorOTTlRYi7+bqZWI3H65QXEcKQOb/FO25ldO+YfJf7g9EBSa/QxbvHzfHPRTZQ7kA
         vrtCw0po1wmTJbD081avH+IP0iryUQ7gaZzo7pZj+LnKBtpu9Oq9zwczPMHT4x+VPmmE
         ENpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699462240; x=1700067040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nI0F9LAk5TZlBnzYcU8mbhrI7NqqT3VYir272z++HhU=;
        b=Q+Zb9USBkPB5JgKVVAAQP9gj+JMnbvm78/XddRU0OvXvFk95aXDSPJ1cg0BB2LtxB1
         8Yem0SBxQvQhNRyTbcQgaXrwNBjE/1ScnucPhUbyl7J1rpmtki2uObKfN5kj0CU9t60e
         U7f1zshCF67t4S2/uVO7CQkY6aX2+jgLCpwEwor37evpbve0lin2q1cJlpNM9CLXsMUR
         2STgiSjMloN8sdnKzNG/j7OfuOdUBZYuqUbcMa5B2h4Tf045lKYBIVz9mtOuEg6+hXkA
         KQKowwaSnmAL5NsSlbpIgfm6s4p4US5cT9XINI4BtlUH36hkp4v24gMhYna1j5KusGQe
         Rltg==
X-Gm-Message-State: AOJu0YzK0ixoXC1hA6zMAYaDVvinmH/85dBvDIHpuGpybkL8azlJffJ3
	cljjqlRnbP29Qll2NXU/KzsqTR9IqwXne61BYxc=
X-Google-Smtp-Source: AGHT+IHKTSjKJ0ULo+AqkYuI3TSwuQLGDrDktAOaM9S37IhQV9D0GgwwBg8QQ6sFEmqkDdobtqxST08sbiVaAqLEsYQ=
X-Received: by 2002:a05:6870:f10a:b0:1f0:b2a:768a with SMTP id
 k10-20020a056870f10a00b001f00b2a768amr2529607oac.8.1699462239898; Wed, 08 Nov
 2023 08:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20231030222448.1474551-1-raj.khem@gmail.com> <CA+chaQdAsO8fJQp0V5jo+DN2sV9p2RCPUoC4UWzQpSE3m=cO4A@mail.gmail.com>
In-Reply-To: <CA+chaQdAsO8fJQp0V5jo+DN2sV9p2RCPUoC4UWzQpSE3m=cO4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Nov 2023 08:50:29 -0800
Message-ID: <CAMKF1sqW=ek2AN=1Fn2A5Q=pNxrVHfZsJKS6hONG0qU+Jz_SGw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] emlog: Add PV
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e516b0609a6e3be"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 16:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106482

--0000000000001e516b0609a6e3be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good question.

On Wed, Nov 8, 2023 at 12:19=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> Why with explicit +git{SRCPV} for nanbield and master? I thought we don't
> use that since:
> https://lists.openembedded.org/g/openembedded-core/message/185842
>
> On Mon, Oct 30, 2023 at 11:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>
>> This is 0.70 release with few more commits on top.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/recipes-core/emlog/emlog.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-core/emlog/emlog.inc
>> b/meta-oe/recipes-core/emlog/emlog.inc
>> index 0972aff32c..160a5a9f87 100644
>> --- a/meta-oe/recipes-core/emlog/emlog.inc
>> +++ b/meta-oe/recipes-core/emlog/emlog.inc
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>>
>>  SRC_URI =3D "git://
>> github.com/nicupavel/emlog.git;protocol=3Dhttps;branch=3Dmaster"
>>  SRCREV =3D "a9bbf324fde131ff4cf064e32674086c4ced4dca"
>> -
>> +PV =3D "0.70+git${SRCPV}"
>>  S =3D "${WORKDIR}/git"
>>
>>  EXTRA_OEMAKE +=3D " \
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#105799):
>> https://lists.openembedded.org/g/openembedded-devel/message/105799
>> Mute This Topic: https://lists.openembedded.org/mt/102286619/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000001e516b0609a6e3be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Good question.</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Nov 8, 2023 at 12:19=E2=80=AFAM Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Why wit=
h explicit=C2=A0+git{SRCPV} for nanbield and master? I thought we don&#39;t=
 use that since:<div><a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/message/185842" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-core/message/185842</a><br></div></div><br><div class=3D"gmail=
_quote"></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Oct 30, 2023 at 11:24=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"></blockquote></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">This is 0.70 release with few more comm=
its on top.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-core/emlog/emlog.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/em=
log/emlog.inc<br>
index 0972aff32c..160a5a9f87 100644<br>
--- a/meta-oe/recipes-core/emlog/emlog.inc<br>
+++ b/meta-oe/recipes-core/emlog/emlog.inc<br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9=
ba36caa9b7df079bae19f&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/nicupavel/emlog.=
git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/nicupavel/emlog.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<b=
r>
=C2=A0SRCREV =3D &quot;a9bbf324fde131ff4cf064e32674086c4ced4dca&quot;<br>
-<br>
+PV =3D &quot;0.70+git${SRCPV}&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot; \<br>
-- <br>
2.42.0<br>
<br>
<br></blockquote></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105799): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105799" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105799</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102286619/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102286619/3617156</a><br>
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
</blockquote></div></div>

--0000000000001e516b0609a6e3be--

