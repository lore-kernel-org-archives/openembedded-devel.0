Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A40610A62ED
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:25:42 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49548.1774535139423840448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I2MVRgb6;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so885303d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:25:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774535138; cv=none;
        d=google.com; s=arc-20240605;
        b=YdxdGGIfbuySs7uZQBZf97jx55Kepg3IlPhznb+1G/lsQV8CnhSQl1bidmd2r9M6Xx
         oAKrW8oW/AAmVfmNUXy0Yh2/LyGREotUVoHZ8RFkZjonn2xfczJRngUvUQpJQsspF2lJ
         94ylXjgxGdso4kYXGXikKPkf7IYzrCqgOyCjByNU9c21Mqn4Ztrb8/eACpi/x7BKjGVD
         8ooM56yzx4vfc/KLVHK5ePqkihQwZ40x53rhel/xjWufgMw2iGD3hhq8Lon4whBoLj+T
         0uDOdk07TqV5xvBXf+q+iHob8bR6cZlfv2idEKr8DmJdFhD9LTAvpw4nj4gA+ilZ612w
         jKWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NF/BZ3BNQhMovvaavq8wO78UYkWlTDNeAQLnjYMo+0U=;
        fh=rx506KxCJdDGfE7dHWl6aqNa5uIQSDMWCKyO0MaKZvU=;
        b=a5Gp2qn8RQe/1zymCwTT8IwRBxfyCZyaJbzVuBGUfoKgn/rpU9+aE3/zNu2WxICMLB
         dLasfSWaoej8CR8W0hhXe7t+kdiXUe0+sBl7IhKUZKfXJ9L0OkF8B+VOcyqjKbGuOlgg
         okSrZ3NYCzuP5eULMrGndtpHT0SNXYy/2Un2mD6nzNaCGRRIw+pqhdl2HR6B8trNaMJf
         SPdZERSJL5BPHrAnZICWDkp1CgCjZoPDMCiK5QG7I3WHR0zoqh/BQdvxh8E8xWRTTYlz
         6BaOsPMB4vyXoSXdnIZkSML1sLrFRKTORhZSVEQFkPzUP0d2KABwA2r40rznDaSuCkDL
         MahQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535138; x=1775139938; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NF/BZ3BNQhMovvaavq8wO78UYkWlTDNeAQLnjYMo+0U=;
        b=I2MVRgb64GSJ2lnOsrtlcG2iWzkusjn999E/HTQ6GMIT8pAZX1SjaZHKLq6mfbaMlZ
         n42gEzQIGBU6FWhMWRAB2H0Ew+yaMAqr/4xfGLTwDLxDPTklfNL1iv18QfH7aRVrrAf3
         fUF37hMJpdnMh+FFCKgyG3vqMBf3uSF/sYNGbGO4SFr8EKRaJAL0J0Lw5zUd7QJNlgdZ
         tklCfgetaArR16ulmvQFeog/PwKM5teWgRrosla7KDFTXE58g79DacAaraZuh1/krvZI
         Puq7b4zsWutzUWJzQevBKp02ARrZL3vH+GD/tlEbH7ibZE7q8mBjqJk6onxQmz2WIlhV
         ha4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535138; x=1775139938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF/BZ3BNQhMovvaavq8wO78UYkWlTDNeAQLnjYMo+0U=;
        b=G2RHca+xjobYxdPzUiDAH/J2wKxf1bV/+FzTvJgh32RYX9WdMLw44/Ix0PSZ1ZW2pF
         peqXvyfZRFxCK5omkpzUGbo/VjoEvK2UiegYmdH/2gOkd6jwyDYvqxv2+xeEZFs83I7y
         iLwh4VG2o5QkbfvQf0FQiqhrdW7216eHQd+lJM19xRMzNtO7q343eeiJOnkXGMLdVw7e
         1NzzLZQ+ln3wNCRxWBgbzlumOJVdp4bd9r9MI/4DBQhsVtKCU/zGYcwO4SbtTrnqSTVn
         oTbQrhpKnSbpDftZoYP/hksqAd4OMQm1P8bURPzFodKm9cCvnuYxBU7nJ27B3XG70/oo
         eG6g==
X-Gm-Message-State: AOJu0YxCM1DbB3DAIudcUJMvBeLPsa0lzHeHvbj+ekW8EFOwFpl5v0w3
	KEuBU+eiwDsQ1RrgOFgOkKQ6nBkntOr8humogL5q/HJ/zxB5WnHWrsMB1AfaQA5XPcl7JU4WAsZ
	F/L4o4q/aJnK/rgr/0cUgsCtRSYVsVJM=
X-Gm-Gg: ATEYQzz8MK3z9J9ReR2Bvx8Z3XedDP3UG5XoZ9hw/vjrPMDdz+eySNGKoR+rWLDm27s
	yyUd4RnT5gO0pVNG4yNazbx8ao7kQcioW+VwXwV69+HVy8/jyvorTjdNqRmZmx+xdyKbeoMeR5M
	5CDj+4dnStjuDipjPaf8X8EYpq6DgihZw1keu6S1J/fRi3FMQVR8HzDRem/YVm4kNRUT0bE4TY6
	Q88HpLWKIXA95Xi3l8y+54flwntkCZ+b5Lja4QZ4u30j7U6FncQrkURhDYixCN3xe6IsrCNvQb7
	FPubGgYJBxD7HLgTdxKlUvUzjHt3j24fCH1oG8dXw6IV/0rAq81YT82o3/PQWFXfvAc36x+iLOl
	xYjMsJGxXrcHCXOtG1gVm2qhzH7DJ7Ql4+u0=
X-Received: by 2002:a05:690e:144a:b0:64e:e90c:5692 with SMTP id
 956f58d0204a3-64ee90c6e71mr6358856d50.60.1774535138296; Thu, 26 Mar 2026
 07:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <18A059078217E40E.57592@lists.openembedded.org> <TYCPR01MB712255E96E3585DA6FFF8AE18B56A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB712255E96E3585DA6FFF8AE18B56A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 07:25:25 -0700
X-Gm-Features: AQROBzCJjqGOn_hyH_8oXpDKjOmytpSTMQdG3RBB4zSVg3ihPSGldUElpMhTxY8
Message-ID: <CAMKF1spxZr1sGq538z5ntWm2+ecV6UwcOWRjpYTcVGcmrFmfVw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] openct: Fix openct.service waring
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f4b3f064dee288b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125736

--0000000000008f4b3f064dee288b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this unmaintained upstream as well? I am generally in favor

On Thu, Mar 26, 2026, 2:11=E2=80=AFAM zhengruoqin via lists.openembedded.or=
g
<zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:

> Hi All
>
>    There is no maintainer for openct for a long time.
>    Maybe we could drop it from meta-oe?
>
> Zheng
>
> --
>
>
>
> ------------------------------
> *From:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> on behalf of zhengruoqin via
> lists.openembedded.org <zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org=
>
> *Sent:* Thursday, March 26, 2026 17:08
> *To:* openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> *Subject:* [oe][meta-oe][PATCH] openct: Fix openct.service waring
>
> [You don't often get email from zhengrq.fnst=3D
> fujitsu.com@lists.openembedded.org. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>
> Fix following system unsafe waring
>
> /usr/lib/systemd/system/openct.service:10: Unit uses KillMode=3Dnone. Thi=
s
> is unsafe, as it disables systemd's process lifecycle management for the
> service. Please update the service to use a safer KillMode=3D, such as
> 'mixed' or 'control-group'. Support for KillMode=3Dnone is deprecated and
> will eventually be removed.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  meta-oe/recipes-support/openct/openct/openct.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/openct/openct/openct.service
> b/meta-oe/recipes-support/openct/openct/openct.service
> index c9ec497fa5..57de8c0a88 100644
> --- a/meta-oe/recipes-support/openct/openct/openct.service
> +++ b/meta-oe/recipes-support/openct/openct/openct.service
> @@ -7,7 +7,7 @@ EnvironmentFile=3D-/etc/sysconfig/openct
>  ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init
>  ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
>  RemainAfterExit=3Dyes
> -KillMode=3Dnone
> +KillMode=3Dmixed
>
>  [Install]
>  WantedBy=3Dmulti-user.target
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125640):
> https://lists.openembedded.org/g/openembedded-devel/message/125640
> Mute This Topic: https://lists.openembedded.org/mt/118515239/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f4b3f064dee288b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is this unmaintained upstream as well? I am generally in =
favor=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026, 2:11=E2=80=AFAM zhen=
gruoqin via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.o=
rg">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi All</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0There is no maintainer for openct for a long time.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0Maybe we could drop it from meta-oe?</div>
<div id=3D"m_-7285241667693457072Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Zheng</div>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:10.5pt">
--</p>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:10.5pt">
<span style=3D"font-family:=E7=AD=89=E7=BA=BF"><br>
</span></p>
<p style=3D"margin:0cm;font-family:=E7=AD=89=E7=BA=BF;font-size:11pt">
=C2=A0</p>
</div>
<div id=3D"m_-7285241667693457072appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-7285241667693457072divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_bl=
ank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</a> &lt;<=
a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</a>&gt; on =
behalf of zhengruoqin via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</a>
 &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">fujitsu.com@lists.openembedded.org</a>&=
gt;<br>
<b>Sent:</b> Thursday, March 26, 2026 17:08<br>
<b>To:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org=
</a> &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank" rel=3D"noreferrer">openembedded-devel@lists.openembedded.org</=
a>&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH] openct: Fix openct.service waring</fon=
t>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>[You don&#39;t often get email from zhengrq.fnst=3D<a href=3D"mailto:f=
ujitsu.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">fuj=
itsu.com@lists.openembedded.org</a>. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" target=3D"_blank"=
 rel=3D"noreferrer">https://aka.ms/LearnAboutSenderIdentification</a> ]<br>
<br>
Fix following system unsafe waring<br>
<br>
/usr/lib/systemd/system/openct.service:10: Unit uses KillMode=3Dnone. This =
is unsafe, as it disables systemd&#39;s process lifecycle management for th=
e service. Please update the service to use a safer KillMode=3D, such as &#=
39;mixed&#39; or &#39;control-group&#39;. Support for KillMode=3Dnone
 is deprecated and will eventually be removed.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank" rel=3D"noreferrer">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/openct/openct/openct.service | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe=
/recipes-support/openct/openct/openct.service<br>
index c9ec497fa5..57de8c0a88 100644<br>
--- a/meta-oe/recipes-support/openct/openct/openct.service<br>
+++ b/meta-oe/recipes-support/openct/openct/openct.service<br>
@@ -7,7 +7,7 @@ EnvironmentFile=3D-/etc/sysconfig/openct<br>
=C2=A0ExecStart=3D/usr/sbin/openct-control $OPENCT_OPTIONS init<br>
=C2=A0ExecStop=3D/usr/sbin/openct-control $OPENCT_OPTIONS shutdown<br>
=C2=A0RemainAfterExit=3Dyes<br>
-KillMode=3Dnone<br>
+KillMode=3Dmixed<br>
<br>
=C2=A0[Install]<br>
=C2=A0WantedBy=3Dmulti-user.target<br>
--<br>
2.43.0<br>
<br>
</div>
</span></font></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125640): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125640" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/125640</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118515239/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/118515239/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000008f4b3f064dee288b--

