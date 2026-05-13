Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFFCCD4F25
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:49:57 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5949.1778701796659667031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2026 12:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M9zjiScK;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64e87a81639so8281985d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 12:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778701796; cv=none;
        d=google.com; s=arc-20240605;
        b=PZny4HH3Ti5+KSODYmqf8KMQ+HY930s9Jtu6+A6znn5iNjkOmQDRZ6lrhKlK3+eBua
         UOX6+k7LyGj1M/JtkyMbAGuMIzOLOaz2KGW4hJ24g5AIVoJgqeI+OeC0my6wfR5HVZJV
         Iqch42rO8fz2TvLwHxc50PqVXa2ag6sm74FfDnSTWOqO9vIQhw9oNqf9vgj1rl8l48i+
         EiuH6Ohq1nBCaC0syAfyF794dsQnLHHB0PfeZb2Vw1SSHus2kjkSzvcLdlfaSNIPJZ4f
         GzFMSsgpPwbHWc6HjN6+9eIRsvTOYjkqa6/uETY7hA9H9LhwrAck+RSaqOKBU+T6+xNW
         Dz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/U8l3FQkLVpbH6+WpJO2lRusjzSsQYrICBle+MnKYRQ=;
        fh=mfhklTvqiisq5igNs/jzhZ4mkM6dpxjfjymdemI2h+M=;
        b=KiEwT21y9vzCD70xmgk+l5PRXMHaV2M9UsU1lHa5oI//7CfQkhJeTwNWTpE/uFiV3J
         Ek2kKsIb8HwAptBNvT2MMmA5CrCO8N4Yg/vP+8ahjP5QyOql1COgXvr0M6f04nH9JEAP
         6pE1Z0M4rq1IfvUwXf/CWqJmGNnQEZfOuGy+4gpBA+ZpyXaWnEz1IKNIiWZtp2NuRlo1
         Dq/ZfSm9YakEVkPc1uPMB3OIYqpJs3MWqcDv3TTcI7YezpNUgPMbdUrLLfw+T+IzSDbg
         mTgb7Y1ufEJ4EdvHkVfOBXYohvolYsh/jq9TRu4drFZaCuKWIIL6jotDJxsTvNkmaeTt
         1C5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778701796; x=1779306596; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/U8l3FQkLVpbH6+WpJO2lRusjzSsQYrICBle+MnKYRQ=;
        b=M9zjiScKcckXS48kljTOm9X9rJs46dm+jMNDx3DOW/gsM58BVfTVIsks60QlvOeuYR
         4NR/e/QXPGm+bcArDIGYK8NopFAH14Uu6k9JY36BkRxST3beHs64B0r+pgWmBOumXxwc
         3YzeO9aeCvzI1W75S36fB0x7QG/U5/MNxnvpkbUQvgqXNQk0og39zhwHUxvDT3T9qRKg
         ehPVrxt4sCzZGOdIYG1Isum6HKk9P7ZZzmHlNPT5mrwEQXNE67DWucD0bEnFKDONDF6a
         3nQTga5ubxQhQApx3yKgRUc1qG4DYZgV/u4Ot4H+MOBHcAFuvcTY2D0q8OIM32l4fqXv
         leog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701796; x=1779306596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/U8l3FQkLVpbH6+WpJO2lRusjzSsQYrICBle+MnKYRQ=;
        b=cHep1LUeN6gssE0SGKHQ8c1i1kWY5T2L/IwbE+eB74P5PCW2SEJY2IgUJZZez+BUGD
         JBMjBCC8hnvg/FhGxZ2LAPtxtxVAjsAPC9eDQ5CTKTJlsI8fvfewk8l6b2hZgBnwh4JM
         E3/TtYMNTJeJPhpV8g5HFih98NVyz2ySrK/eQCNoeO2B6N1tAPwGv9aIlD0PPUJ9++G/
         fUsQ3w04zs1NHt4KztYTU1kuQ9SvD58EYPtryID8PiZW4R4OAwurKr4tG/u+MmDhXfLu
         2zJZqy+epFroCNYGFNbR+v0Hs/OBKHJ9ypNA12L9e2/o9llVvre9KlhN3rPbNpAnNXDN
         9wrw==
X-Forwarded-Encrypted: i=1; AFNElJ9Q7+R15B+5Sg6y+PbuFDG1iZVXPjc41gaEeNXdBgeqkJlJTTdDTQggpdKnf7yXJs+HlRkaXrxzc3d8g7XZ2UhDI5k=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzK0sT6ypfU7i10ZWvUWBw7oKCpPEQ8U+l7lJ7GQnXb1VkNKvXo
	z/a4rU94UBiqntA1HwLMm3tcOceO3UKU0507S7DxHAAhGBWa5k0e0XjUuRCd5nnU6f6G4N/4hKO
	SjeeH09i4ywp/PtVnzgt/92IKrkp1s2Y=
X-Gm-Gg: Acq92OGGF5P522Lc+Vr/baURQ0cAdtK5Rw8Reg4wI20xEn59BDw+FJcWrJuTGV/GCpN
	AH0TWSP7EeJ6O8qCNV5wvX7hSFWfVtQB8ACoSDJnr7NFQpZqX6oKPoRm4cP1JhmXX2DAwn56SJh
	HifbBBrC+GZYmBaYMC0CTs+J+2VorJf4qXX5jt2mxld2JapnN8+K9ijVV4NTX/qN0Gzpm+q/xZD
	L8az2PXRpNO0QXSGEb/GYQLFxlT2YlQWgPBJKtON85NpjNMkQqf+vxhvYykdysIBeFqO43tiuA2
	cevTadleaW8svV6CSWj/9Kqb2LvYnN09gpXgJ1uTC9fNqzb736LByECs+o7VhbtQ18eUVdkMWhR
	tJTiyLX8D516RHP/hafdz6kQ4irpyjV1A+cz3baU4DYYHKDpCHPg180AmUkqypCBgTaRuDV8XFN
	uibE6d
X-Received: by 2002:a53:c047:0:10b0:651:c734:ed4b with SMTP id
 956f58d0204a3-65df80fffaamr3524580d50.2.1778701795708; Wed, 13 May 2026
 12:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
 <2022222.1778130561122567168@lists.openembedded.org> <2115555.1778654861364723634@lists.openembedded.org>
 <6a719287-ab7f-486b-a9c4-ec5801e9e8af@gmail.com> <CAMKF1sp=Ae3MHJYK7fbAXokwEhayigWkOPjpzw+H4Mp3W3Bjow@mail.gmail.com>
 <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN0P287MB0358EC7112FFB28C9B6157C089062@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 May 2026 12:49:44 -0700
X-Gm-Features: AVHnY4JCVOr0JaMveOS20AZ1-6Fc_FpozixMSCDXt0tYIMa_gF4w_LZcxtJkg78
Message-ID: <CAMKF1spvQfLjaAWu4_QJwU+_QPivKEw7SjTvxMzcc4+dieAmqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and cleanup
To: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b1d3020651b84806"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 19:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126976

--000000000000b1d3020651b84806
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ashish,

You can continue using this thread to discuss these errors.

Best regards,

Khem Raj


On Wed, May 13, 2026, 1:21=E2=80=AFAM AshishKumar Mishra <
AshishKumar.Mishra@bmwtechworks.in> wrote:

> This seems to be adbd.mk reported error  , will try locally reproducing
> it
> Is there any specific channel to discuss such error or I can continue
> using the same thread ?
> Or any specific person / team to address such communication ?
>
>
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 13 May 2026 12:56
> *To:* skandigraun@gmail.com <skandigraun@gmail.com>
> *Cc:* AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>;
> openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration and
> cleanup
>
> You don't often get email from raj.khem@gmail.com. Learn why this is
> important <https://aka.ms/LearnAboutSenderIdentification>
> *Caution: "External email, be cautious especially with link(s),
> attachment(s) or QR code(s)".*
> there are some build issues I am seeing
>
> https://errors.yoctoproject.org/Errors/Details/938668/
>
> On Tue, May 12, 2026 at 11:57=E2=80=AFPM Gyorgy Sarvari via lists.openemb=
edded.org
> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>
>
> On 5/13/26 08:47, AshishKumar Mishra via lists.openembedded.org wrote:
> > Hi Team,
> > Can team please take this to be merged in master branch
> >
>
> It's currently undergoing tests in the master-next branch:
> https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-next
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126953):
> https://lists.openembedded.org/g/openembedded-devel/message/126953
> Mute This Topic: https://lists.openembedded.org/mt/119162735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b1d3020651b84806
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Ashish,<br><br>You can continue using this thread to d=
iscuss these errors.<br><br>Best regards,<br><br>Khem Raj<div><br></div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, May 13, 2026, 1:21=E2=80=AFAM AshishKumar Mishra=
 &lt;<a href=3D"mailto:AshishKumar.Mishra@bmwtechworks.in">AshishKumar.Mish=
ra@bmwtechworks.in</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
This seems to be <a href=3D"http://adbd.mk" target=3D"_blank" rel=3D"norefe=
rrer">adbd.mk</a> reported error=C2=A0 , will try locally reproducing it=C2=
=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Is there any specific channel to discuss such error or I can continue using=
 the same thread ?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Or any specific person / team to address such communication ?</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_-5165992933086938950appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-5165992933086938950divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
<b>Sent:</b> 13 May 2026 12:56<br>
<b>To:</b> <a href=3D"mailto:skandigraun@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">skandigraun@gmail.com</a> &lt;<a href=3D"mailto:skandigraun=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">skandigraun@gmail.com</a>&=
gt;<br>
<b>Cc:</b> AshishKumar Mishra &lt;<a href=3D"mailto:AshishKumar.Mishra@bmwt=
echworks.in" target=3D"_blank" rel=3D"noreferrer">AshishKumar.Mishra@bmwtec=
hworks.in</a>&gt;; <a href=3D"mailto:openembedded-devel@lists.openembedded.=
org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembe=
dded.org</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.or=
g" target=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedd=
ed.org</a>&gt;<br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH v3 0/3] android-tools: migration a=
nd cleanup</font>
<div>=C2=A0</div>
</div>
<div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" alig=
n=3D"left" style=3D"background:revert;color:revert;direction:revert;font-si=
ze:revert;height:revert;letter-spacing:revert;line-height:revert;margin:rev=
ert;opacity:revert;outline:revert;overflow:revert;padding:revert;text-align=
:revert;text-indent:revert;text-orientation:revert;text-overflow:revert;tex=
t-transform:revert;vertical-align:revert;white-space:revert;word-break:reve=
rt;word-spacing:revert;writing-mode:revert;zoom:revert;border:0px;display:t=
able;width:100%;table-layout:fixed;float:none;border-spacing:0px">
<tbody style=3D"background:revert;border:revert;color:revert;direction:reve=
rt;font-size:revert;height:revert;letter-spacing:revert;line-height:revert;=
margin:revert;opacity:revert;outline:revert;overflow:revert;padding:revert;=
table-layout:revert;text-align:revert;text-indent:revert;text-orientation:r=
evert;text-overflow:revert;text-transform:revert;vertical-align:revert;whit=
e-space:revert;width:revert;word-break:revert;word-spacing:revert;writing-m=
ode:revert;zoom:revert;display:block">
<tr style=3D"background:revert;border:revert;color:revert;direction:revert;=
display:revert;font-size:revert;height:revert;letter-spacing:revert;line-he=
ight:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;pad=
ding:revert;table-layout:revert;text-align:revert;text-indent:revert;text-o=
rientation:revert;text-overflow:revert;text-transform:revert;vertical-align=
:revert;white-space:revert;width:revert;word-break:revert;word-spacing:reve=
rt;writing-mode:revert;zoom:revert">
<td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpadding=3D"7px =
2px 7px 2px" style=3D"background-image:revert;background-position:revert;ba=
ckground-size:revert;background-repeat:revert;background-origin:revert;back=
ground-clip:revert;border:revert;color:revert;direction:revert;display:reve=
rt;font-size:revert;height:revert;letter-spacing:revert;line-height:revert;=
margin:revert;opacity:revert;outline:revert;overflow:revert;table-layout:re=
vert;text-align:revert;text-indent:revert;text-orientation:revert;text-over=
flow:revert;text-transform:revert;vertical-align:revert;white-space:revert;=
word-break:revert;word-spacing:revert;writing-mode:revert;zoom:revert;paddi=
ng:7px 2px;background-color:rgb(166,166,166);width:0px">
</td>
<td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpadding=3D"7px=
 5px 7px 15px" color=3D"#212121" style=3D"background-image:revert;backgroun=
d-position:revert;background-size:revert;background-repeat:revert;backgroun=
d-origin:revert;background-clip:revert;border:revert;direction:revert;displ=
ay:revert;height:revert;letter-spacing:revert;line-height:revert;margin:rev=
ert;opacity:revert;outline:revert;overflow:revert;table-layout:revert;text-=
indent:revert;text-orientation:revert;text-overflow:revert;text-transform:r=
evert;vertical-align:revert;white-space:revert;word-break:revert;word-spaci=
ng:revert;writing-mode:revert;zoom:revert;width:100%;background-color:rgb(2=
34,234,234);padding:7px 5px 7px 15px;font-family:wf_segoe-ui_normal,&quot;S=
egoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;font-size:12px;f=
ont-weight:normal;color:rgb(33,33,33);text-align:left">
<div style=3D"background:revert;border:revert;color:revert;direction:revert=
;display:revert;font-size:revert;height:revert;letter-spacing:revert;line-h=
eight:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;pa=
dding:revert;table-layout:revert;text-align:revert;text-indent:revert;text-=
orientation:revert;text-overflow:revert;text-transform:revert;vertical-alig=
n:revert;white-space:revert;width:revert;word-break:revert;word-spacing:rev=
ert;writing-mode:revert;zoom:revert">
You don&#39;t often get email from <a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>. <a href=3D"https=
://aka.ms/LearnAboutSenderIdentification" style=3D"background:revert;color:=
revert;direction:revert;display:revert;font-size:revert;opacity:revert" tar=
get=3D"_blank" rel=3D"noreferrer">
Learn why this is important</a> </div>
</td>
<td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"#EAEAEA" cel=
lpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D"background-image:re=
vert;background-position:revert;background-size:revert;background-repeat:re=
vert;background-origin:revert;background-clip:revert;border:revert;directio=
n:revert;display:revert;height:revert;letter-spacing:revert;line-height:rev=
ert;margin:revert;opacity:revert;outline:revert;overflow:revert;table-layou=
t:revert;text-indent:revert;text-orientation:revert;text-overflow:revert;te=
xt-transform:revert;vertical-align:revert;white-space:revert;word-break:rev=
ert;word-spacing:revert;writing-mode:revert;zoom:revert;width:75px;backgrou=
nd-color:rgb(234,234,234);padding:7px 5px;font-family:wf_segoe-ui_normal,&q=
uot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif;font-size:1=
2px;font-weight:normal;color:rgb(33,33,33);text-align:left">
</td>
</tr>
</tbody>
</table>
<div><span style=3D"color:red"><i>Caution: &quot;External email, be cautiou=
s especially with link(s), attachment(s) or QR code(s)&quot;.</i></span>
<div>
<div dir=3D"ltr">there are some build issues I am seeing
<div><br>
</div>
<div><a href=3D"https://errors.yoctoproject.org/Errors/Details/938668/" tar=
get=3D"_blank" rel=3D"noreferrer">https://errors.yoctoproject.org/Errors/De=
tails/938668/</a></div>
</div>
<br>
<div>
<div dir=3D"ltr">On Tue, May 12, 2026 at 11:57=E2=80=AFPM Gyorgy Sarvari vi=
a
<a href=3D"http://lists.openembedded.org/" target=3D"_blank" rel=3D"norefer=
rer">
lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
On 5/13/26 08:47, AshishKumar Mishra via <a href=3D"http://lists.openembedd=
ed.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">
lists.openembedded.org</a> wrote:<br>
&gt; Hi Team,=C2=A0<br>
&gt; Can team please take this to be merged in master branch=C2=A0<br>
&gt; =C2=A0<br>
<br>
It&#39;s currently undergoing tests in the master-next branch:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-n=
ext" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git.openembedd=
ed.org/meta-openembedded/log/?h=3Dmaster-next</a><br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126953): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126953" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">
https://lists.openembedded.org/g/openembedded-devel/message/126953</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119162735/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/119162735/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gma=
il.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000b1d3020651b84806--

