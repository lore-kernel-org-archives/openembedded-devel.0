Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DD8E85365
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 12:49:32 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10751.1775220561988848335
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 05:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bVALnPTt;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-682baaa9f1aso99683eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 05:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775220561; cv=none;
        d=google.com; s=arc-20240605;
        b=JL8Z0CfqmlCqJhhEwr6OZ6OFKS64BFuRn3A4j0fhnNDwtUdXkq/Buk6LFI7Sq3dDbK
         FdSrvFzbLq47ybYD4brcGskSl9pQAwyJgzgGbnNYvsOISvGRABM9+EwmdlvANBd3GQJy
         G6a5d9AsjpL4RVpsCXlUi5m2v0lfJUL6x1iplFJ+dW3SPLPTN+M6pTuyD0Kce2c1d15x
         GVf7h8Ya6hELNTQQPQXybKYtcrxXtRMyFaSFl0PBvKiAvxvDrvqgqJDYmTV7Yp/tCPqr
         4yiZRXwOVP4+ZqcIut+nX45aCcliFaRSDUqmQdfeUgY7veWtfwyLLrXLZx9ZEA8M6DFI
         M7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HomzSy9VCofqasqXt/jOpxL7GVRB3OJHFckWztfsBNk=;
        fh=YkTfMVMSoA3jC1Sn45nehZmHIXeAnwDt+QDopY86TKg=;
        b=KYJd4RiQxz83zE05OIPKXDEDIrkSHbLYse23NCJ1nZad5NQm/JTIeRFcZMOnIYwR2W
         l0PXVxxinzYASS7nzIWO3wCDpP/8t38LeHf375IHie1KfnrmtvQLw/ns9LbCnDJcSuWL
         MSRTDUmzxRGDBe4DjtUZ+JT40/cH/w2ES/3VBJirImpZKibD10s+b95SCIG5a+m8Xxe7
         7gCqkBNb2ThCyTEuk7G1+gQ3GwynE3dh7XiNDPJcbfkp8T6BzzkvAe9bjuFnuhfUSpGq
         5mHDDDPtlah16HrkRG2kKV6u2AOgdiCJujbydynJanw80zrg3BJO7qYuz3SCd7HatyGW
         4e+g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775220561; x=1775825361; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HomzSy9VCofqasqXt/jOpxL7GVRB3OJHFckWztfsBNk=;
        b=bVALnPTtg4x6fQYRxxT1jvLNguQtswKho66/Mj6tKDmRRL5EwkpkSgQEdIM8AXSX98
         Jqb3I2qiCZHlk/jsLeDYct6RDWRG6+hZHoza6zGFWat+6pxTRc4oQ+meC10wFTCPkxtA
         hd1SpeE7JaNlxKjWHsENwTzzIqWcSj2XfWy0WqWMx5BMOtkD8Hb7FyabtNJXvChYf5Lj
         95qiPCjCGI9Tdrcud5xVdj9+rUJk/jpi6ajGgbH0xzlExfWW2lkVRiPvT0ihhmask7J0
         3GWnUS9WEZB5qSqsJarl1NdqTb5AZHYekXIsoWtPmTKNEMPwNtXpqUF1DtuxkPwCZ5i/
         8A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775220561; x=1775825361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HomzSy9VCofqasqXt/jOpxL7GVRB3OJHFckWztfsBNk=;
        b=nKKDoGy9UhYie2M36wY0GaCRL8RZ6ArUrtFnVERcDU38jUE0+D1qqB9I/qXhvrFpP9
         hZqsBx7l5ICVOkAQo0n2Rxzyxp5uaLruPJQnhWU7OtBm1Ur5DYuJTTjrkqLCZ6Z3E1Ka
         dAq9RTkexpuaXwK8PFFHK0z9ldSDFBgglZqv5rCo/hz3XH2g5TkQ9zzf9uy8WjJ2puZu
         daHlCQ5YfFCqteklqnC28lTbhNRKxuschCam99WFpKnzVUC0oouNOhZhMh+TCgmVSllt
         5T/a4zRrgh1oPbZ4gy25nEEU9vy8vx/ppcOLyq1lqUG3SFPefUDN2/ueIY0wahAS5dHe
         l2Yw==
X-Gm-Message-State: AOJu0YydW2951fASW9e/esJeXcf6D/Dx8LaHAlZZhOog0pnNpVnEzCCS
	K2cs/gphELHIWoJusNxgyALGS7HGQt+uYaFFVNx3C7hwBZtKs03nT1MVOpqf0bONqXWvTcsprO0
	QZO2RAaeio6W95xymCXsgGkf2O8NALs4+9EQS
X-Gm-Gg: ATEYQzwjlEefSRxToG1mOdLWULQ/bprQ79fSNjMN8nSgNGuhgjXHROEMckn3f0dMHzT
	PWE8eVbMLnl4bQ2+3nffwcnfmWAkx1rnZ7GaXUIlXGAA/EanNwCYcSzasm6wxSfHxAdI3ZAPZKb
	0bNukY6q1zLHE6pR/81yJjHF1Gjpc3kuSqNO/jxTkfxAMpqns6NPbzGhtxieuasq0i12YvMOvBw
	tWdI0IITW0WtVipqy2AiIkVHD+HaBNUaqJrmWCo4Me7puT0K/HiyP1LLiD+4/i71nykH3D0AJt9
	RwoVbro8DXQVapdJoiN65G3rCj+bLg5fgWPpk8keNQNDED9nM99YPZSZjua+W0kCwu68K4zr5uA
	UBmMhP28L+vgINkOvej2bUM0GoyV+3BAcOlw=
X-Received: by 2002:a05:6820:1384:b0:67c:1e60:3e90 with SMTP id
 006d021491bc7-6821e869719mr1452701eaf.6.1775220560876; Fri, 03 Apr 2026
 05:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260403012420.4784-1-schonm@gmail.com> <98cc4863-d04d-4d61-9509-b70f5748bd12@gmail.com>
In-Reply-To: <98cc4863-d04d-4d61-9509-b70f5748bd12@gmail.com>
From: "J. S." <schonm@gmail.com>
Date: Fri, 3 Apr 2026 08:49:10 -0400
X-Gm-Features: AQROBzC5lnUssRx2HaN_wvbwotjoOXz8eEGu0c_5_Qyds90IjwwR6OH-QtZisiY
Message-ID: <CABTo8gBOfGUJLTAgqVX1k3wDBX6kiK+z6PDnrx8YJVz=qiRsFw@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] thunar-shares-plugin: add missing HOMEPAGE
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000edd875064e8dbe0c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 12:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125985

--000000000000edd875064e8dbe0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry,  This as intended for [wintlatter]

I missed that the readme.md file there hasn't been updated to reflect the
branch name.

On Fri, Apr 3, 2026 at 1:13=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

> On 4/3/26 03:24, J. S. via lists.openembedded.org wrote:
> > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> >
> > (cherry-picked from commit e5c5731771d9b0acd2035338ac6760963f0d0229)
>
>
> Since it's already in master, I assume you wanted to send this for a
> stable branch?
>
>
> > ---
> >  .../recipes-thunar-plugins/shares/thunar-shares-plugin_0.5.0.bb  | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-xfce/recipes-thunar-plugins/shares/
> thunar-shares-plugin_0.5.0.bb b/meta-xfce/recipes-thunar-plugins/shares/
> thunar-shares-plugin_0.5.0.bb
> > index 3b4f38da02..b270ad0838 100644
> > --- a/meta-xfce/recipes-thunar-plugins/shares/
> thunar-shares-plugin_0.5.0.bb
> > +++ b/meta-xfce/recipes-thunar-plugins/shares/
> thunar-shares-plugin_0.5.0.bb
> > @@ -1,4 +1,5 @@
> >  SUMMARY =3D "Quickly share a folder using Samba from Thunar"
> > +HOMEPAGE =3D "https://docs.xfce.org/xfce/thunar/thunar-shares-plugin"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9=
f6552"
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#125969):
> https://lists.openembedded.org/g/openembedded-devel/message/125969
> > Mute This Topic: https://lists.openembedded.org/mt/118643900/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000edd875064e8dbe0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Sorry,=C2=A0 This as intended for [w=
intlatter]</div><div><br></div><div>I missed that the readme.md file there =
hasn&#39;t been updated to reflect the branch name.</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Apr 3, 2026 at 1:13=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"ma=
ilto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 4/3/26 03:24, J. S. via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> wrote:<br>
&gt; Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com"=
 target=3D"_blank">schonm@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; <br>
&gt; (cherry-picked from commit e5c5731771d9b0acd2035338ac6760963f0d0229)<b=
r>
<br>
<br>
Since it&#39;s already in master, I assume you wanted to send this for a<br=
>
stable branch?<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-thunar-plugins/shares/<a href=3D"http://thunar-share=
s-plugin_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-shares-plugi=
n_0.5.0.bb</a>=C2=A0 | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta-xfce/recipes-thunar-plugins/shares/<a href=3D"http:/=
/thunar-shares-plugin_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar=
-shares-plugin_0.5.0.bb</a> b/meta-xfce/recipes-thunar-plugins/shares/<a hr=
ef=3D"http://thunar-shares-plugin_0.5.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">thunar-shares-plugin_0.5.0.bb</a><br>
&gt; index 3b4f38da02..b270ad0838 100644<br>
&gt; --- a/meta-xfce/recipes-thunar-plugins/shares/<a href=3D"http://thunar=
-shares-plugin_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-shares=
-plugin_0.5.0.bb</a><br>
&gt; +++ b/meta-xfce/recipes-thunar-plugins/shares/<a href=3D"http://thunar=
-shares-plugin_0.5.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-shares=
-plugin_0.5.0.bb</a><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt;=C2=A0 SUMMARY =3D &quot;Quickly share a folder using Samba from Thunar=
&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://docs.xfce.org/xfce/thunar/thuna=
r-shares-plugin" rel=3D"noreferrer" target=3D"_blank">https://docs.xfce.org=
/xfce/thunar/thunar-shares-plugin</a>&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf33659b29=
e73d4adb9f9f6552&quot;<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#125969): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/125969" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/125969</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11864390=
0/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/118643900/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000edd875064e8dbe0c--

