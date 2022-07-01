Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4433CCCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:21:08 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.37994.1656681658423322960
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XnQHmtOY;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id b125so1763782qkg.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUOKEJoy+0LuIqpMwclPPiB1PEqud4LHTz7Ixgf/imw=;
        b=XnQHmtOY9xcNG8PMFTvUWItP1mQjS8q3OPcNJj7nvZoWInL3TZ07UM7w+KGfqAiRXl
         UTkQ8Yoh1AP1QbSsa4QfktUOO7N2GS6TC56ocw2l/VZyVxXZ8Wo4j5lNEQsWQsdftGB9
         0zKotlHHkJ0PH69fFJbPnCWaCfeQy++Z3ojX1NKoEgTbFw9PjZCw75LRZ8+ZMsFzbfHo
         Ej9ef0omGm7Ni2rXzqQY2JgAkMsI4sgvfuAqy4IONcAtwdiwus78v0XkZ+lTAqx2G+YI
         GAPdVLjyk3NvbxJO0LcjkUSQSQzGbfXgeKe7KK0aAnaNa4dhq3InaBxVKrcflDyEF+iz
         7fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUOKEJoy+0LuIqpMwclPPiB1PEqud4LHTz7Ixgf/imw=;
        b=yp4uox3Ape5iw9x4vlLlKdfF9+jczh0KYgr8p7Q+PQrqRMd9rSM3QW9yh+u0VIUQOQ
         lFEUx3I0j2TvI00C0iu2h4K6MZOg060/9ut3N1lZK3vUTn6xapkvy4xkMrD0zZFujP0J
         LKd19FHmHDBCSTUKvk2sjdKCd8q5490oezk+IZSlfTJ/Of1AwPb0cvUELdoK9BscyqH0
         qUiz5dBMjTf0anvLbCE5bfxGhsY7c9Zu5JCf+fCsFU5kkbeLShNYRH9wM9tozz1f4Zbo
         jXlNklBIsuTwpnsC4H1n212KEjm+S1I8qmY3t8U/raNksogMQy9j2ThpIuSVFGmQ+d/c
         FmFA==
X-Gm-Message-State: AJIora/B1un/qPHjC+zizv+1sUFWsPEtKU1YoISOshtBnTtTtVwitpqh
	CrZAiqelH7hTlv8kD3PZUnAiRNjtX2wavHcpm84=
X-Google-Smtp-Source: 
 AGRyM1tGwSvT9InGt80lHE/3tgGL4sr67cbuyiYM7JowdBiN+yADEHlgBzhwrcdjrwHhxVHe3q1vG1iFffOH8wJmQvk=
X-Received: by 2002:a37:68c8:0:b0:6ae:ffb1:8495 with SMTP id
 d191-20020a3768c8000000b006aeffb18495mr10722648qkc.463.1656681656395; Fri, 01
 Jul 2022 06:20:56 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1sr=LtPvBaH-Tj5QQ8ZB641cLgrOB4sK47DdJ1Xnug3wSA@mail.gmail.com>
 <PA4PR08MB741180CDD9E465DCE2209916E8BD9@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB741180CDD9E465DCE2209916E8BD9@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:20:45 -0400
Message-ID: 
 <CAMKF1srqgy4R0s5AYF3FCH3SFJgROpyLuBoOcutebqUgNQYDGw@mail.gmail.com>
Subject: Re: [oe] maximum shebang size exceeded,
 the maximum size is 128. [shebang-size]
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a2ac5b05e2be4136"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97666

--000000000000a2ac5b05e2be4136
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 1, 2022 at 9:04 AM Ross Burton <Ross.Burton@arm.com> wrote:

> Is that with oe-core master-next?  There=E2=80=99s a sanity test patch th=
ere which
> is very relative.  The recipe is buggy =F0=9F=98=8A
>
>
Yes master-next. I see so we have few recipes to fix then, I hope someone
can send fixes

>
>
> *From: *openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org>
> *Date: *Thursday, 30 June 2022 at 12:18
> *To: *openembeded-devel <openembedded-devel@lists.openembedded.org>
> *Subject: *[oe] maximum shebang size exceeded, the maximum size is 128.
> [shebang-size]
>
> Hi All
>
> I am seeing few build QA errors during do_populate_sysroot on native
> packages predominantly perl packages failing with
>
> maximum shebang size exceeded, the maximum size is 128. [shebang-size]
>
> This is the list from meta-oe world builds
>
> https://errors.yoctoproject.org/Errors/Build/147810/
>
> This was working fine few weeks ago
>
> Any ideas ?
>
> Thanks
> Khem
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy th=
e
> information in any medium. Thank you.
>

--000000000000a2ac5b05e2be4136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 1, 2022 at 9:04 AM Ross Burton &lt;<a href=3D"m=
ailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">





<div lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break=
-word">
<div class=3D"m_4814996250617061957WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Is that with oe-cor=
e master-next?=C2=A0 There=E2=80=99s a sanity test patch there which is ver=
y relative.=C2=A0 The recipe is buggy
</span><span style=3D"font-size:11.0pt;font-family:&quot;Apple Color Emoji&=
quot;">=F0=9F=98=8A</span><span style=3D"font-size:11.0pt"><u></u><u></u></=
span></p></div></div><div lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" sty=
le=3D"word-wrap:break-word"><div class=3D"m_4814996250617061957WordSection1=
">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u></span></p><=
/div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes m=
aster-next. I see so we have few recipes to fix then, I hope someone can se=
nd fixes=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div lang=3D"EN-GB" link=
=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-word"><div class=3D"m_4=
814996250617061957WordSection1"><p class=3D"MsoNormal" dir=3D"auto"><span s=
tyle=3D"font-size:11.0pt">=C2=A0<u></u></span></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black"><a href=3D"mailto:o=
penembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-de=
vel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedde=
d.org</a>&gt; on behalf of Khem Raj via <a href=3D"http://lists.openembedde=
d.org" target=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.com@li=
sts.openembedded.org</a>&gt;<br>
<b>Date: </b>Thursday, 30 June 2022 at 12:18<br>
<b>To: </b>openembeded-devel &lt;<a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a>&gt;<br>
<b>Subject: </b>[oe] maximum shebang size exceeded, the maximum size is 128=
. [shebang-size]<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi All<br>
<br>
I am seeing few build QA errors during do_populate_sysroot on native<br>
packages predominantly perl packages failing with<br>
<br>
maximum shebang size exceeded, the maximum size is 128. [shebang-size]<br>
<br>
This is the list from meta-oe world builds<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/147810/" target=3D"=
_blank">https://errors.yoctoproject.org/Errors/Build/147810/</a><br>
<br>
This was working fine few weeks ago<br>
<br>
Any ideas ?<br>
<br>
Thanks<br>
Khem<u></u><u></u></span></p>
</div>
</div></div><div lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"wor=
d-wrap:break-word"><div class=3D"m_4814996250617061957WordSection1"></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</div>

</blockquote></div></div>

--000000000000a2ac5b05e2be4136--

