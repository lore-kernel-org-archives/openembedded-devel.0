Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433CAE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:11:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.19786.1736255516944466466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UZnxgssX;
 spf=pass (domain: mvista.com, ip: 209.85.208.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso8902328a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 05:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736255515; x=1736860315; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjkzsaRRqK4kvOGCYLsosDhwuX35/xj6uHbUGvlhY6k=;
        b=UZnxgssXH+bubcz9SFhqwMb6V4ut1rVpsMVsNkRVDmEYvn7a7x7WvdiA8uRRX1t+y8
         6lcoZLmGAq+xX9OKj+VqwKVSKBBvxA84bA3Q/C45CccGmK1wmUKm8oqKhHxHpTCPJP9h
         HYGkn2yJJi35/9u3iMbxks694zW+xmvLIgmrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255515; x=1736860315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjkzsaRRqK4kvOGCYLsosDhwuX35/xj6uHbUGvlhY6k=;
        b=Z7CJR4z3/mb2wAkqLYNnUqbfGde9kCKmMjDMVj1yKPJ36anHzPo+cXOsu/IxMr2AOV
         B83DDLuY4XtGRnJTb5Bs4meQhsx1ERPXrckSHiG9s4xquYxVmok6Ujjt/PjC0GG/M5o/
         e6g48pd7fYGE5zp64UPF26vls5FJrulY8LK31heJH7SIJ4OdQ0rLfPK2klI2MYF1ykh+
         q26ur7b21WUrhJubB2zb6cxqWvv7EOsQNwLTDRxQUrv8yyq9TW4XAPQZ9sKCuyHEpqCi
         SHmo7P0AHV3Q67a6ted0qSOAwAQ5kmVqSDDTXVpbr87+IipAfWuf3pRvQfVYp4eyozMh
         f+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqOJ04C7sbNaixNNQkbajY6VWp5yfYFafsoAmO6+qHWXbhGUn/VGVdBrYo1uL2Ig6r42Vk3JB+mfm38Z07wfp27IY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzTNTQNDqmaQ7Qu6bE2ypNeGHdGyuJPuqPj5B6vFkKQpALinlx
	ROWzNSApqzPo5AJknBfEnSjencqXA9P95OhlJzvtupVtMVisIJRdytpR3gOym61QqtmDxNWNW/t
	LU2s6X56iXR03XgVHEmQ2IKDnILotNfnfx8Fwrg==
X-Gm-Gg: ASbGncvCkMoTFm+skOx4t04M1dBPKae454fOtBjwSdWrDmdUMNoyLUf5Pl1W9KV/3KI
	uZXCbnMZfI9YnqCqMYZvDd07rNrmnLwOdNhr6FdPiKXzxWzmH4Ckc/il0jY4t6QYIuV9bovvA
X-Google-Smtp-Source: AGHT+IH/rFHitVY8vt0TtwdZAQfP0DOIWs9JsTFkXO+F4tg1PzsWGc5ZEXHfH/RMN4uS40mtf5xUs6meY91URMLQmk4=
X-Received: by 2002:a05:6402:3228:b0:5d0:d330:c965 with SMTP id
 4fb4d7f45d1cf-5d81dc6575bmr57748338a12.0.1736255515262; Tue, 07 Jan 2025
 05:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20241220112053.1866849-1-vanusuri@mvista.com> <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB56975711B8DD243A5224B155FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1816BE46D4FBD9B0.1259@lists.openembedded.org> <CANQUz19DKHDFVYPH-nK0oBnopaLom2ymKBK1=9LsTrAr3hbG8A@mail.gmail.com>
 <AS1PR10MB56978E03EB6EF1375FF22EE7FD112@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978E03EB6EF1375FF22EE7FD112@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 7 Jan 2025 18:41:42 +0530
X-Gm-Features: AbW1kvYXJ0MjO4r7XbrUjbSZ__yaXgiA7gKJKp8XDOqvcP-ohIr3lA3uTNDqvNA
Message-ID: <CANQUz1-WA7moBhCRfRQx1ViO4nKX5WtC-TLxFGidfnV0nfAuVw@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000003a26a5062b1d7d62"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 13:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114699

--0000000000003a26a5062b1d7d62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok Thanks Peter.
I will do that.

Thanks & Regards,
Vijay

On Tue, Jan 7, 2025 at 6:35=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

> I suggest to send a [RESEND] and wait another 4 weeks for next scarthgap
> timeslot.
>
> Pushing anything to oe lts branches is a pain nowadays.
>
>
>
> Peter
>
>
>
> *From:* Vijay Anusuri <vanusuri@mvista.com>
> *Sent:* Tuesday, January 7, 2025 14:00
> *To:* vanusuri@mvista.com
> *Cc:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Armin
> Kuster <akuster808@gmail.com>; openembedded-devel@lists.openembedded.org;
> Khem Raj <raj.khem@gmail.com>
> *Subject:* Re: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 ->
> 8.2.26
>
>
>
> Hi Team,
>
>
>
> Any update on this?
>
> Thanks & Regards,
>
> Vijay
>
>
>
>
>
> On Thu, Jan 2, 2025 at 7:42=E2=80=AFAM Vijay Anusuri via lists.openembedd=
ed.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>
> Hi Armin/Team,
>
> Any update on this?
>
> Thanks & Regards,
>
> Vijay
>
>
>
> On Fri, Dec 20, 2024 at 9:11=E2=80=AFPM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
> Please ignore my comment, I have sent for master, not scrathgap.
> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Friday, December 20, 2024 16:40
> > To: vanusuri@mvista.com; openembedded-devel@lists.openembedded.org
> > Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 ->
> 8.2.26
> >
> > This patch is missing rebase of patches.
> > I have sent this same upgrade including patch rebase in my larger patch
> series.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > devel@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> > > lists.openembedded.org
> > > Sent: Friday, December 20, 2024 12:21
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Vijay Anusuri <vanusuri@mvista.com>
> > > Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.2=
6
> > >
> > > From: Vijay Anusuri <vanusuri@mvista.com>
> > >
> > > Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CV=
E-
> > > 2024-11233
> > >
> > > Changelog:
> > > https://www.php.net/ChangeLog-8.php#8.2.26
> > >
> > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > ---
> > >  meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.b=
b}
> > (99%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> b/meta-oe/recipes-
> > > devtools/php/php_8.2.26.bb
> > > similarity index 99%
> > > rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
> > > rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
> > > index 034f3bef1..10ef2c36e 100644
> > > --- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> > > +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
> > > @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D " \
> > >            "
> > >
> > >  S =3D "${WORKDIR}/php-${PV}"
> > > -SRC_URI[sha256sum] =3D
> > > "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
> > > +SRC_URI[sha256sum] =3D
> > >
> > "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
> > >
> > >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
> > >  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product =
is
> exactly
> > > the same as github.com/emlog/emlog. CVE can be safely ignored."
> > > --
> > > 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114614):
> https://lists.openembedded.org/g/openembedded-devel/message/114614
> Mute This Topic: https://lists.openembedded.org/mt/110212662/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003a26a5062b1d7d62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Ok Thanks Peter.<br></div>I will do that.<br><br=
></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Jan 7, 2025 at 6:35=E2=80=AFPM Marko, Peter &lt;<a href=3D"ma=
ilto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg15310=
32069530262811">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1531032069530262811WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">I suggest to send a [=
RESEND] and wait another 4 weeks for next scarthgap timeslot.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Pushing anything to o=
e lts branches is a pain nowadays.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Peter<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><u></u>=C2=A0<u></u><=
/span></p>
<div style=3D"border-width:medium medium medium 1.5pt;border-style:none non=
e none solid;border-color:currentcolor currentcolor currentcolor blue;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-width:1pt medium medium;border-style:solid none none;b=
order-color:rgb(225,225,225) currentcolor currentcolor;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11pt;font=
-family:&quot;Calibri&quot;,sans-serif"> Vijay Anusuri &lt;<a href=3D"mailt=
o:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, January 7, 2025 14:00<br>
<b>To:</b> <a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusur=
i@mvista.com</a><br>
<b>Cc:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;; Armin Kust=
er &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;; <a href=3D"mailto:openembedded-devel@lists.openembedded=
.org" target=3D"_blank">openembedded-devel@lists.openembedded.org</a>; Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -&g=
t; 8.2.26<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Team,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Any update on this?<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks &amp; Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Vijay<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><u></u>=C2=A0<u></u></p=
>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Jan 2, 2025 at 7:42<span style=3D"font-famil=
y:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>AM Vijay Anusuri via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.=
org" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<u><=
/u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Hi Armin/Team,<u></u><u=
></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Any update on this?<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks &amp; Regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Vijay<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Dec 20, 2024 at 9:11<span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>PM Marko, Peter &lt;<a hre=
f=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Please ignore my commen=
t, I have sent for master, not scrathgap.<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1)<br>
&gt; Sent: Friday, December 20, 2024 16:40<br>
&gt; To: <a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@=
mvista.com</a>;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bla=
nk">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -&gt;=
 8.2.26<br>
&gt; <br>
&gt; This patch is missing rebase of patches.<br>
&gt; I have sent this same upgrade including patch rebase in my larger patc=
h series.<br>
&gt; <br>
&gt; Peter<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">
openembedded-devel@lists.openembedded.org</a> &lt;openembedded-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank"=
>devel@lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a><br>
&gt; &gt; Sent: Friday, December 20, 2024 12:21<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" =
target=3D"_blank">
openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" targ=
et=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -&gt=
; 8.2.26<br>
&gt; &gt;<br>
&gt; &gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 an=
d CVE-<br>
&gt; &gt; 2024-11233<br>
&gt; &gt;<br>
&gt; &gt; Changelog:<br>
&gt; &gt; <a href=3D"https://www.php.net/ChangeLog-8.php#8.2.26" target=3D"=
_blank">https://www.php.net/ChangeLog-8.php#8.2.26</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.24.=
bb" target=3D"_blank">php_8.2.24.bb</a> =3D&gt;
<a href=3D"http://php_8.2.26.bb" target=3D"_blank">php_8.2.26.bb</a>} | 2 +=
-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_=
8.2.24.bb" target=3D"_blank">php_8.2.24.bb</a> =3D&gt;
<a href=3D"http://php_8.2.26.bb" target=3D"_blank">php_8.2.26.bb</a>}<br>
&gt; (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8=
.2.24.bb" target=3D"_blank">php_8.2.24.bb</a> b/meta-oe/recipes-<br>
&gt; &gt; devtools/php/<a href=3D"http://php_8.2.26.bb" target=3D"_blank">p=
hp_8.2.26.bb</a><br>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta-oe/recipes-devtools/php/<a href=3D"http://php_8.=
2.24.bb" target=3D"_blank">php_8.2.24.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.=
26.bb" target=3D"_blank">php_8.2.26.bb</a><br>
&gt; &gt; index 034f3bef1..10ef2c36e 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.24.b=
b" target=3D"_blank">php_8.2.24.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.26.b=
b" target=3D"_blank">php_8.2.26.bb</a><br>
&gt; &gt; @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/php-${PV}&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0d=
c432f&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt;<br>
&gt; &quot;be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b=
&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_PHP&quot;<br>
&gt; &gt;=C2=A0 CVE_STATUS_PHP[status] =3D &quot;fixed-version: The name of=
 this product is exactly<br>
&gt; &gt; the same as <a href=3D"http://github.com/emlog/emlog" target=3D"_=
blank">github.com/emlog/emlog</a>. CVE can be safely ignored.&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#114614): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114614" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/114614</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110212662/730=
1997" target=3D"_blank">
https://lists.openembedded.org/mt/110212662/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000003a26a5062b1d7d62--

