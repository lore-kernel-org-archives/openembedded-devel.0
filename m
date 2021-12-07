Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52814C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:24:07 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web12.66843.1638883446198165111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fsefp5BR;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id 30so7883473uag.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lRbAzqtyhx0hcHjrWaLE6ajx7ym1qOBFL2pCvAFP2E8=;
        b=fsefp5BRnH0DyduIHzXNPLuHQVKWB2EyNBLsImAlhdEKDP0Izu1vWtzdXBbKGklS/q
         PVDcFXQX16FcOt857xOj/YnU2DkN/M6KE0dCkLatQCoCEKlpj3Nyf8eSGOPgBOM0uChd
         Lg8f76WQP+fxogybSJ5Ic7wf+AOE6gYnr5DTDQNuAjWXblL68FFePuRkdHS1eOWKth/8
         1Fb78LlUafsQ4+uLCYJ/HaqwpN8iIi7AYyKFAemEC/Il1lR7IwSUGEQmlfkRUk6uMGl0
         ud7fi1mEe76okX1+9BO4BqAbosSOgQDGGjo/wtfKrCs5Ig3/sku/CRVdON06HewyDxQp
         pPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lRbAzqtyhx0hcHjrWaLE6ajx7ym1qOBFL2pCvAFP2E8=;
        b=3+uZyAq2grDBFSzImNBeWXDtY5VuWD/uBmj0qsz3yvOW1Uy+NX5gV1dT6EA+rJJein
         M4XqVBXRFFLmkaLFVXGYMvdTyYMX9IC2NlKKMoq+2RTmhQXXtesn3IPfWOHLXu+xgW1/
         nio5XL5omiwcyrT70DKkA3kzSQmXT1m+3upTe5pxICuG7mVNAWwKiiBJ12CrgfUipfMM
         OTsYNsZ1rnXpa51NaA93nwT/NfRcIn40rNTXghTAgHiWNeMvNu4APBYOmybIPh9OWDrE
         v2/8rkSFxO2DJ2kWuAMYyXdbahh/K27Fyf3qK1LB6ha2U9D46dYz5zf5vh9MelhsP2t4
         SqqQ==
X-Gm-Message-State: AOAM5304V1yriHBpcFeak5+2D/50spXzwDr/VE/VxSJqwyt0cU2vbbR5
	LDNhfGIWEexlyZWohtfaQeHxUQKlr397yYhqdXs=
X-Google-Smtp-Source: 
 ABdhPJxaC7aCdQ2F16ah2BxQxlcR5k2HBwG0/wEkPRx8IdMZJIsNsK9W6Qkkd2uOcs2wXaYIAbSVes1sQsRWM5Hi5OY=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr49835123uai.89.1638883444634;
 Tue, 07 Dec 2021 05:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
In-Reply-To: <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 14:23:53 +0100
Message-ID: 
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>, Konrad Weihmann <kweihmann@outlook.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008bc4ab05d28e49e6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:24:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94232

--0000000000008bc4ab05d28e49e6
Content-Type: text/plain; charset="UTF-8"

Perhaps this issue should be addressed to Konrad first before rushing to
write a patch?

Alex

On Tue, 7 Dec 2021 at 14:22, Marek Vasut <marex@denx.de> wrote:

> On 12/7/21 13:35, Martin Jansa wrote:
> >> The build system might have put something into DEPENDS already
> >
> > There is only copyright notice before this chunk, so this doesn't make
> much
> > sense to me (and no other recipe does this).
>
> At least oelint-adv warns about it here:
>
> https://github.com/priv-kweihmann/oelint-adv/blob/master/oelint_adv/rule_base/rule_var_depends_append.py
>
> And as far as I can tell, bitbake can stick something into DEPENDS
> before it parses this recipe, so the :append is valid.
>
> Furthermore, git grep through oe-core already indicates a few recipes
> which use DEPENDS:append.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94231):
> https://lists.openembedded.org/g/openembedded-devel/message/94231
> Mute This Topic: https://lists.openembedded.org/mt/87562882/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008bc4ab05d28e49e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps this issue should be addressed to Konrad firs=
t before rushing to write a patch?</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, 7 Dec 2021 at 14:22, Marek Vasut &lt;<a href=3D"mailto:marex@denx.de=
">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On 12/7/21 13:35, Martin Jansa wrote:<br>
&gt;&gt; The build system might have put something into DEPENDS already<br>
&gt; <br>
&gt; There is only copyright notice before this chunk, so this doesn&#39;t =
make much<br>
&gt; sense to me (and no other recipe does this).<br>
<br>
At least oelint-adv warns about it here:<br>
<a href=3D"https://github.com/priv-kweihmann/oelint-adv/blob/master/oelint_=
adv/rule_base/rule_var_depends_append.py" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/priv-kweihmann/oelint-adv/blob/master/oelint_adv/rul=
e_base/rule_var_depends_append.py</a><br>
<br>
And as far as I can tell, bitbake can stick something into DEPENDS <br>
before it parses this recipe, so the :append is valid.<br>
<br>
Furthermore, git grep through oe-core already indicates a few recipes <br>
which use DEPENDS:append.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94231): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94231" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94231</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87562882/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87562882/1686489</a><br>
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

--0000000000008bc4ab05d28e49e6--

