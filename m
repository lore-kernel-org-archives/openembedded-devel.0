Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7193C433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 13:52:12 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.9569.1642945931880764588
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V/VCKRY/;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id b16so25996816uaq.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Li4+y0gqQ842eRDrbo99DwCuAaGOdOq5U7Lt7nzDt44=;
        b=V/VCKRY/VwJgdRUKM0ofEkM687TpSAlqCdAv6uX2JW+O4A1MY/gunY3Jm7Rh6a0egg
         UdeBzJ1mdc/LOTFd/pxeKwZFRg5hnnz828kMt3DxU0YIELCzBoP5oQlYCoGi5DIgTGwv
         wBTJI9Kva2woLzDGFzHw9T02GYf153jfPwqgzpr6RSM4cnDKial10IT9ANijFnbWblgt
         vjqXBrTxqnf5ODx4POTh3jsCQ+IGc8aLo3uW2FrkEekmx0IjHsegZejb648YcfbYInR5
         VS+840oCGZN4tQPixL01cado4dt5xWO75EsyVDcNAlL9yAu98arAlE9w1ycvzwi+TW9b
         L/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Li4+y0gqQ842eRDrbo99DwCuAaGOdOq5U7Lt7nzDt44=;
        b=5JZP49lTfAR5AGfkWC6X2MASVvGcEb/awVDoT10EMP5v57/QoRWFK6hf8tHdOxHQHM
         rxyrqxVuT6Y94axKoHGKEgFhH1m4NLChYAJSSIsakLlQ2d8vYBoQrBQwQuhI6wsQpowK
         CQVdu33m0JHHrGQ8sChKY3+i1qZnHCeeRvutE1MlT0CVDxeoZpCHaltzM3FBUWpOdqjQ
         wUtIwZR6j2Noll05Y4YuoP9n0ErGZ5KOajcW68L/VbEhTUbOdmECJptgcRH0g66Zo4Ff
         2jnQOfDxmqq5MigFCOiS1bzB9FfOTiT8/mV8rFbK91QMSCApCtiMppDZfXg8KfrQsVg3
         mnNA==
X-Gm-Message-State: AOAM532SiUFeVFrCZ0DdjHdktwfDHo/l5eJsANPtX0z+xvnytlj2SVXX
	D6Pt5jEa3d8HWHd1GjWQh8mlgzTsAPaNWBvmbDA=
X-Google-Smtp-Source: 
 ABdhPJyA0ROEwPq2IAO2R9TQ/UNBtaCet2S1HFAbdBvySHnBnxFJFUdqyJ+2mtemWKja/r6YdiZOAk2iO4J0eU6g3gI=
X-Received: by 2002:a05:6102:c4f:: with SMTP id
 y15mr4156488vss.45.1642945931022;
 Sun, 23 Jan 2022 05:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20220120203602.3833757-1-f_l_k@t-online.de>
 <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
 <CANNYZj9V_6q9S-vovMMw7i3GdJjog==9EXDCJ_+SMnknCNxHuQ@mail.gmail.com>
 <baeb1c77-f334-2282-3a40-19916962332d@t-online.de>
 <CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=PAKkXVpNOw@mail.gmail.com>
 <6c490468-aadb-e91d-28ce-551f21e3605a@t-online.de>
 <CANNYZj-NYuqo4ftRvwgntDuBBky=V=SxELTC1BXdJEL9qBeHYw@mail.gmail.com>
 <58bd9ebd-583f-e7e9-6c3b-af14772c4f7e@t-online.de>
In-Reply-To: <58bd9ebd-583f-e7e9-6c3b-af14772c4f7e@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Jan 2022 14:51:58 +0100
Message-ID: 
 <CANNYZj_Zi+WA56H2q-woXGJkG+NJU2xUsBERSq7jua09W0dHkg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] folks: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009a9ce905d64028cd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 13:52:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95022

--0000000000009a9ce905d64028cd
Content-Type: text/plain; charset="UTF-8"

I added a comment there, for what it's worth.

Alex

On Sun, 23 Jan 2022 at 14:35, Markus Volk <f_l_k@t-online.de> wrote:

> What brought me to thinking this really is a design decision was this
> conversation some time back
>
> https://gitlab.gnome.org/GNOME/gimp/-/issues/7208
>
> Am 23.01.22 um 14:28 schrieb Alexander Kanavin:
> > nd see what they have to say
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95021):
> https://lists.openembedded.org/g/openembedded-devel/message/95021
> Mute This Topic: https://lists.openembedded.org/mt/88611345/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009a9ce905d64028cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I added a comment there, for what it&#39;s worth.</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sun, 23 Jan 2022 at 14:35, Markus Vo=
lk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">What brought m=
e to thinking this really is a design decision was this <br>
conversation some time back<br>
<br>
<a href=3D"https://gitlab.gnome.org/GNOME/gimp/-/issues/7208" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gimp/-/issues/7208</=
a><br>
<br>
Am 23.01.22 um 14:28 schrieb Alexander Kanavin:<br>
&gt; nd see what they have to say<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95021): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95021" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95021</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88611345/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88611345/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009a9ce905d64028cd--

