Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FAA111224F
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 01:48:21 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6855.1775094494248553119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 18:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f4x+SeiB;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65015facf32so398576d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 18:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775094493; cv=none;
        d=google.com; s=arc-20240605;
        b=T5oOPhqZxPh3KLhestNkKUezCZsPcVcXNkMbO41wl64y6oN60wkqCpp5EuHTeEpYV0
         n/iU3GFtLOM7NI124CUCw1QVC+UH1E0BtQ15ySRZFJOUUyNYa5waB9yEhguaCgwsgMwq
         KBoMLhv+2CWgKt6sWIN4LJeO/xGtWE0j6UPp29N9k1Cd4OuGPYIvW8jt8+Lnb3awBZ1N
         82K0Idqm0yJEMg096uxqBJ9E+Z6hiU1KVQ//JGiwNa1iaFeHkWsbcR4MOarMbRx8piA8
         gtgSxz0i0u/BnvOS0o6lDonI2qXY/wH0CyCjRXRyaiNTq/8FFd7ASgzVMaxJ3s36xDrm
         zhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ITb1VL5dHEaQF/8/YHp+lG4j1pKl3b5OW/Qrf/X/1Vc=;
        fh=wFZSh+Ur/tHKoTYlAzPIqsj+M6sQOyVQC7WZa0gS2MQ=;
        b=ixbcAMchUCrDqQojzGGj1Zc14y2o0IlxVsgPx5TQHqmtrujJzfiXdt1/LzfEEpGbwD
         QMlJr/U5tOFSbMC+Wxj0Ol0F9gErR6HU0EJwt0Vx3w9oxIjWeE4vJkgDj4sPhw8AddTn
         1UCdwWkeni8dmRCAisE/ilzCvR+Ve0ertloyEMb0G2KY4cPE9KNrw2JPgD3Jm/rdBK2R
         IjhFLhMlLA2xh0VLJ7fBpUspMGis/RUCPUhYPXPMuKFOG84bfAg8bgt/Cs9fnq+JwS5r
         fB02FEYdEMqBhL+grhTpjYzonylTyTOlUa2RK0oL43Mn52N/fvQ7+DcBUQwZaHo42k9Z
         8i1w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775094493; x=1775699293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ITb1VL5dHEaQF/8/YHp+lG4j1pKl3b5OW/Qrf/X/1Vc=;
        b=f4x+SeiBBUChL6xWmXCmfJ0oo9t5fdevz6iglgqe8pyOZYM4b8uJr1FbR3uQOGkDIU
         2lfFocTa+4TVtEcWwrUH3iXxs2hdupjM4l1kW4mrLe265Zz1fi+VJxt53Q+eK+kgMEeV
         1RW9S7C3NO2IEYEK9345ZNEoFXaZBa8BcQ1cCFJm6EEL7qcccEDImcNJHoa3UKFgzu/o
         d6k9bMipVKoE8JPfcVqvnzqnLPILYBpZI5iR7S0KKRBm+/SdfWdIN1Y2iBfxZ432WEOC
         cHVJfVNBMgnx6B68YzaO6DstbKWp/d6I1ipRH6wh+sj+ap21/cgZAA19Ss3l23VggGV3
         yYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094493; x=1775699293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITb1VL5dHEaQF/8/YHp+lG4j1pKl3b5OW/Qrf/X/1Vc=;
        b=Fa08IA/UyZt/XEtsORwLtcjBvsujI+652TOvMsarEDjuud4WRcPLV8aU/WvDRjPcGT
         k7z/IscuPTZ1yHGPFQ7ig7Bfx9CDDUnwpGhGQonUBSVhAhqbwbQx0AyN06FPYw0meeJW
         YHjhWRfH9C8qKVg3vYaBOpb9aXmkcnpMVPOamDhHOdv3/c4o1nuht1Q29itHIZRl0FSj
         /jVOTIbCG3WO9yTYZWuJhHwhnL5onGV1varW5T8MGlq7OfJV08s37Been6FHqvbFj7ol
         n3Flf0YNSCA3GKEd3y1F0w2/RXHuM8gujB9G102Dfxbq+GCize8MgComGMT+rj49HJEj
         0fIA==
X-Gm-Message-State: AOJu0YxTVr/rCV3P38AFgCPeYqr90zqDu7N1QKiV+M6xPJ0JRtCU73sN
	fkVVgVdrQf95+pef4I+ObZ/JasSkBXEnxiFh0mAy+g+x5Cs4IEjLKXxhkEXP4nkZO1qa5Q+pEA3
	ahdcWtOPkogxmX8uvKcavMeJzVTGYOuA=
X-Gm-Gg: AeBDies2xgR/lvRFZ+0v/ppCLpAID9N5eXF7CXZnqEqb/Uk5HkdCZXWZ9wmS7uzEF+B
	jBrskl42F9GVhtSP38XU0X+lX+nA4EXoU14L/6Zd9z3/qmfaZxBDk+TVExmKe8H/4iE+w6o6fYy
	zI+be6HxjodpvTacpln5InIP6A9LlGo8pyyeE4L8Fqvobo11Stp9aBhQ07S7+4CaXRAvQWhgDaJ
	grIC/bdM4ZfUEqrLYor+TyVyyrnAriX6vPKTdjcXOi/G8Fh2UvOsdrTGrW0WTGZ6PHCR+ZoC1Cy
	fn1tovUN5h7T9DYcNHOipg0cFRpYP+vvoCR1Y2/7YvfdK30edZ5oK0Y8FKIKjH9TnQkY95DWxtY
	vZSzrrThZ0h3TzdSm5o+U7r/p
X-Received: by 2002:a05:690e:488a:b0:650:82f:450a with SMTP id
 956f58d0204a3-6502fe81637mr3986335d50.72.1775094493244; Wed, 01 Apr 2026
 18:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <18A059078217E40E.57592@lists.openembedded.org>
 <TYCPR01MB712255E96E3585DA6FFF8AE18B56A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
 <CAMKF1spxZr1sGq538z5ntWm2+ecV6UwcOWRjpYTcVGcmrFmfVw@mail.gmail.com> <TYCPR01MB7122858D88A4E73827FAF2178B51A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB7122858D88A4E73827FAF2178B51A@TYCPR01MB7122.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Apr 2026 18:47:46 -0700
X-Gm-Features: AQROBzCerpW-5CvewxdtxTVYt-_ABraXIS3SbmZAqkqPEmFJtEuPPBCE4hACrv0
Message-ID: <CAMKF1somFaNmQXRhLWj2PFyuU=TZ=DVz-iGMrQVSHHVO1SLtQg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] openct: Fix openct.service waring
To: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b6717c064e706456"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 01:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125914

--000000000000b6717c064e706456
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok please send a patch to drop it from meta-openembedded as well.

On Wed, Apr 1, 2026 at 6:41=E2=80=AFPM Ruoqin Zheng (Fujitsu) <
zhengrq.fnst@fujitsu.com> wrote:

> Hi Khem
>
> Yes, it is unmaintained upstream as well.
> https://github.com/OpenSC/openct
>
> Zheng
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, March 26, 2026 22:25
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@fujitsu.co=
m>
> *Cc:* OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe][meta-oe][PATCH] openct: Fix openct.service waring
>
> Is this unmaintained upstream as well? I am generally in favor
>
> On Thu, Mar 26, 2026, 2:11=E2=80=AFAM zhengruoqin via lists.openembedded.=
org
> <zhengrq.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
>
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

--000000000000b6717c064e706456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ok please send a patch to drop it from meta-openembedded a=
s well.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, 2026 at 6:41=E2=80=AFPM Ruoqin=
 Zheng (Fujitsu) &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fn=
st@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div class=3D"msg-2554432730829859695">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Khem</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Yes, it is unmaintained upstream as well.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<a href=3D"https://github.com/OpenSC/openct" target=3D"_blank">https://gith=
ub.com/OpenSC/openct</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Zheng</div>
<div id=3D"m_-2554432730829859695appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-2554432730829859695divRplyFwdMsg" dir=3D"ltr"><font face=3D"C=
alibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b>=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, March 26, 2026 22:25<br>
<b>To:</b> Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 &lt;<a href=3D"mailto=
:zhengrq.fnst@fujitsu.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&g=
t;<br>
<b>Cc:</b> OpenEmbedded Devel List &lt;<a href=3D"mailto:openembedded-devel=
@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.openemb=
edded.org</a>&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][PATCH] openct: Fix openct.service waring<=
/font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"auto">Is this unmaintained upstream as well? I am generally in =
favor=C2=A0</div>
<br>
<div>
<div dir=3D"ltr">On Thu, Mar 26, 2026, 2:11=E2=80=AFAM zhengruoqin via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu.com@lists.openembe=
dded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wrot=
e:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
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
<div id=3D"m_-2554432730829859695x_m_-7285241667693457072Signature">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Zheng</div>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:10.5pt">--<=
/p>
<p style=3D"margin:0cm;font-family:Calibri,sans-serif;font-size:10.5pt"><sp=
an style=3D"font-family:=E7=AD=89=E7=BA=BF"><br>
</span></p>
<p style=3D"margin:0cm;font-family:=E7=AD=89=E7=BA=BF;font-size:11pt">=C2=
=A0</p>
</div>
<div id=3D"m_-2554432730829859695x_m_-7285241667693457072appendonsend"></di=
v>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-2554432730829859695x_m_-7285241667693457072divRplyFwdMsg" dir=
=3D"ltr"><font face=3D"Calibri, sans-serif" color=3D"#000000" style=3D"font=
-size:11pt"><b>From:</b>
<a href=3D"mailto:openembedded-devel@lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">
openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openemb=
edded-devel@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">op=
enembedded-devel@lists.openembedded.org</a>&gt; on behalf of zhengruoqin vi=
a
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;zhengrq.fnst=3D<a href=3D"mailto:fujitsu=
.com@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">fujitsu.c=
om@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Thursday, March 26, 2026 17:08<br>
<b>To:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">
openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openemb=
edded-devel@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">op=
enembedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH] openct: Fix openct.service waring</fon=
t>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>[You don&#39;t often get email from zhengrq.fnst=3D<a href=3D"mailto:f=
ujitsu.com@lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">fuj=
itsu.com@lists.openembedded.org</a>. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification" rel=3D"noreferrer=
" target=3D"_blank">
https://aka.ms/LearnAboutSenderIdentification</a> ]<br>
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
 rel=3D"noreferrer" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
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
lank">
https://lists.openembedded.org/g/openembedded-devel/message/125640</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118515239/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://lists.openembedded.org/mt/118515239/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" rel=3D"noreferrer" target=3D"_blank">raj.khem@gma=
il.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--000000000000b6717c064e706456--

