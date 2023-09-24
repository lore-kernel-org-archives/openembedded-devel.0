Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1B9CE7A8B
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 22:11:15 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.49631.1695593473489581125
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 15:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tvc3vQO9;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6bf04263dc8so3384598a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695593473; x=1696198273; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/unZXDcCkE8isxffkf/2II/n5VhGXa4jknDpgHmVjk=;
        b=Tvc3vQO9gyI5lPJYgwe99SDcCqP3SlMUPEU0enGSelqS8eavM1w0PpA4CUg9YGFX46
         aYeDN4vlxpFIls7fg0LVdb7Tqwrbn5D5RSH5byuQyzNfmo2dmlGN+7xd7+PczGJdCeTQ
         nGPqiJR/OFZGsYh1S8UI6XGDz/KPVVgjStvzpSvwGFEiZV0TD/ciopD9YbhaB46IpZmW
         y15njqU7gtZNlRZ54OrjCIuL6+1BH8jDgrtHT7YoWhOYvfaWpT5PRh4giDm5f15G0eb/
         hX3ToRD1JUfkocacrLy2G2dlC5frJGc+sR/8GYeFSDvtojX1OPwnaFaTuK5EEy6/7ruB
         8uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695593473; x=1696198273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/unZXDcCkE8isxffkf/2II/n5VhGXa4jknDpgHmVjk=;
        b=pCIWe9/mrwu4sBtC/qK/iouWnrqw352ARJrwYCy83HVb6WH6YXCYinztwBXQey8H5J
         F+6ilzfteABZwl9N8Sds8pdSl86A3LY5gRo+MCI3UJ31g+R/J5NQFvadEiitXcdpXHQA
         ri49x0VdBHGctAkx0B3dPmObThKxQkqRAvp5xmq1IaiePnapH1XfF5e4wZZp2ieu/O81
         yjH/l2YdL7PzdypUeuAXdz4OC9PcDOvzMYXBAnFQItMtTI2CGZQkb9mm216FASZNtZA3
         oyEw+WaX4mUNCZxOJqPRagocODb/1fRw/yU3v8d1D9ynXOryr9QmZtvlxGZp6DY00J4+
         WjJw==
X-Gm-Message-State: AOJu0YxDPc0P4dBttYtkGEfX0VY+uXMpU2UQWiQGCSgVdi2h3WSJWi5i
	fklQSq9uFKsk6SFMitJc68ULoCyi7Y62V+Qmwh3ZvZSl
X-Google-Smtp-Source: AGHT+IHej2b9FScF7/7SICvrjyHT14tRiUTDSpFScXSd/IgTKKndk0yqFi/sR5/IPsYZQuZEkN+Lk2cIMaT1EgBpNoc=
X-Received: by 2002:a05:6870:a990:b0:1c4:ee87:d3ea with SMTP id
 ep16-20020a056870a99000b001c4ee87d3eamr6780869oab.36.1695593472476; Sun, 24
 Sep 2023 15:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230924204711.3073-1-f_l_k@t-online.de> <20230924204711.3073-2-f_l_k@t-online.de>
 <CAMKF1speG8B1=YdbzUvfu_cN83XDLH1kYEkJRc0vb-bLRXQrgQ@mail.gmail.com>
 <4DEI1S.RGXZVSAXE3I31@t-online.de> <CAMKF1spaytbE+v1ufsosqbr8FNy=aTsSzL=3JVDCSeWY7xsG-A@mail.gmail.com>
 <ZCFI1S.B983R3SRJX6X1@t-online.de>
In-Reply-To: <ZCFI1S.B983R3SRJX6X1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Sep 2023 15:11:01 -0700
Message-ID: <CAMKF1srNXF8z_p3e1JuqnxbXjd7aJKAgTDggUU7OXkp0f-Qzvw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] udisks2: Upgrade 2.9.4 -> 2.10.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009c4ba90606221ef7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 22:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105116

--0000000000009c4ba90606221ef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 2:50 PM Markus Volk <f_l_k@t-online.de> wrote:

> It looks like BUILD_DIR is only passed for that reason
>
> https://github.com/search?q=3Drepo%3Astoraged-project%2Fudisks%20build_di=
r&type=3Dcode
>

Ok then maybe it should be a environment variable or something that can
even help in cross testing if we plan to do ptests for it otherwise maybe
remap it to /usr/src like we do for debug info paths

>
> On Sun, Sep 24 2023 at 02:34:47 PM -07:00:00, Khem Raj <raj.khem@gmail.co=
m>
> wrote:
>
>
>
> On Sun, Sep 24, 2023 at 2:29 PM Markus Volk <f_l_k@t-online.de> wrote:
>
>> On Sun, Sep 24 2023 at 02:25:50 PM -07:00:00, Khem Raj <
>> raj.khem@gmail.com> wrote:
>>
>> How does this end up in shared object perhaps that needs to be looked at
>> as such specifying build dir in a makefile should be fine I guess
>>
>>
>>
>> https://github.com/storaged-project/udisks/blob/c7027d888c00381851d918f3=
3a13102e7b86e188/src/udisksmodulemanager.c#L192
>>
>> i guess its this place
>>
>
> Right so it=E2=80=99s seems it=E2=80=99s trying to load stuff from build =
area when it=E2=80=99s
> not installed. May be for developer testing or something
>
> So maybe we can remove that unless we need these parts during ptest then
> encode a path accordingly
>
>>

--0000000000009c4ba90606221ef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 24, 2023 at 2:50 PM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D"m_7936078658838860930geary-body" dir=3D"=
auto"><div>It looks like BUILD_DIR is only passed for that reason</div><div=
><a href=3D"https://github.com/search?q=3Drepo%3Astoraged-project%2Fudisks%=
20build_dir&amp;type=3Dcode" target=3D"_blank">https://github.com/search?q=
=3Drepo%3Astoraged-project%2Fudisks%20build_dir&amp;type=3Dcode</a></div></=
div><div id=3D"m_7936078658838860930geary-quote" dir=3D"auto"></div></block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok then maybe it should=
 be a environment variable or something that can even help in cross testing=
 if we plan to do ptests for it otherwise maybe remap it to /usr/src like w=
e do for debug info paths=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_7936078658838860930geary-quote" dir=3D"auto"><br>On Sun, Sep 24 2023 =
at 02:34:47 PM -07:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br><blockquote type=
=3D"cite"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Sep 24, 2023 at 2:29 PM Markus Volk &lt;<a =
href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_793607865883=
8860930m_-8971041486460837286geary-body" dir=3D"auto">On Sun, Sep 24 2023 a=
t 02:25:50 PM -07:00:00, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br><blockquote type=3D=
"cite">How does this end up in shared object perhaps that needs to be looke=
d at as such specifying build dir in a makefile should be fine I guess=C2=
=A0</blockquote><div><br></div><div><a href=3D"https://github.com/storaged-=
project/udisks/blob/c7027d888c00381851d918f33a13102e7b86e188/src/udisksmodu=
lemanager.c#L192" target=3D"_blank">https://github.com/storaged-project/udi=
sks/blob/c7027d888c00381851d918f33a13102e7b86e188/src/udisksmodulemanager.c=
#L192</a></div><div><br></div><div>i guess its this place</div></div></bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right so it=E2=80=99s =
seems it=E2=80=99s trying to load stuff from build area when it=E2=80=99s n=
ot installed. May be for developer testing or something=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">So maybe we can remove that unless we=
 need these parts during ptest then encode a path accordingly=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div id=3D"m_7936078658838860930m_-89710414864=
60837286geary-body" dir=3D"auto"><div dir=3D"auto"></div></div></blockquote=
></div></div>
</blockquote></div></blockquote></div></div>

--0000000000009c4ba90606221ef7--

