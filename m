Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC92D41D6C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:14 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15030.1765473369162074340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ncb8IaZy;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6446704997cso348282d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 09:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765473368; x=1766078168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmNOoZsNrvCDZBKPmPuoNrf0j1jQkH4n9dmf84t4u1o=;
        b=Ncb8IaZyn6YuHT/1cD4rbgeJkfoFK5/El39NPT9iyBC8Wcw5Cy+dIB32G9QR+dlCrJ
         PwWbawGFiWjRLvPOAVrCB2hZm5QG07Bcl8fQbH0Yg3SADnaNd8wkyZhtmmkkKyKXXhe8
         IqVkGcs32WhFfOZtUiS88HMjwPAykvEEnsPq/p8/rVVMDJduWhs89yB4nZ2LP1xffnsK
         9UMC+S/5jcO0rbCX88Dv1a4CuMsNsTPEFINkjIeAL9g8MTo+9vfLEnUpwtiuxu4yrQu1
         MXQb8p1vZYg3NuiCmBGz3gHG81li3YA4vuXUcHciAM0jAa5LRHHGN7doXIvkGGAqfXYl
         xeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473368; x=1766078168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmNOoZsNrvCDZBKPmPuoNrf0j1jQkH4n9dmf84t4u1o=;
        b=PCUBgEg2lmzs/VC8CzU5rjxjHw2s7REJb+FY+MrVpE72OEzOkn2G86ASS93NNRhH8x
         Y/bz6s3FmpRJrshjQ8Kacx8QEPt+AO7LWmZ7ql1eZRsDo7IafYBcBVAJMCY3h9O3F24f
         iW7+tBQhSrRIrksUXhlUdmGfbLoenI8HX/itXSlcIWfzxb6/yKaFMUu/+hVpHxs/NLoV
         EuZwltkBrBJ6PwI4bTparvLqX5bXDlSkUYBQsCI9qcWdEgCz+jUTx7BWapgLNwg+KtM5
         KJAZEM2vBJoGxmMdDyI/72EfssGzvQ8lBWiMxI84kuvcwr5r5LNmIVogciePSpaqnrKG
         cmUg==
X-Gm-Message-State: AOJu0YzoYfjyfiXqQVbNeLwnlRs08Py8BISVcvU2LCBtzIyfno4FeA9g
	kLIvoPUvTT4alwOpAZXZskV2PS+rJ2JsEEvyTq0fWf68UaDS95LHaBxiKQt0Q8qW/s5ckvClrqV
	B2G3rW23xuBmV+VoCrDWd2X06azLrri0=
X-Gm-Gg: AY/fxX7CE8Ln8BIEgqRjGTg7fKr9t67dhHfBIhHsilrc9ctX21Q8d77IbkK1iCo/tCX
	SK+SWg8SKLojuR8fu7UiCXJkcZ6Pz9xbLovDYAxNQwnwDFcc1dCY1cQFdmmyn5csuIUu9RJpKJN
	lQpetJV//bsyJxzOPQyBHzmGMijczS2pZo7xiO25/4gTr9p5P12ckyORtmOhJa2A26MhVxeO+VC
	dyEWRY6jnpqip2tN//KfILJ5b7P0HeLPVkoO3ETOeBvAjwI9KTPxh+1190MfHYAzSq1JwVjlJlx
	tYXqEF5ezz6yIiKGuHx9t9KNS8T+yJRhCU5RKE+fGi/pRfCun20IUdaWV4U7w9Ui9okvGuZyOXy
	mQWO3fhL2ukti5waDmbu9yO+SbACpMUVHTyOpnRaTipYsqg==
X-Google-Smtp-Source: AGHT+IEM2grrk/roowXN9NMgGmLAnJLmITcsd10pwY7A69+lt9AkbMJ8G4Nul0nt+jFy9p0VQDdvazt6dbP/d0zz2D4=
X-Received: by 2002:a05:690e:1486:b0:644:4625:8868 with SMTP id
 956f58d0204a3-6446e938042mr6354693d50.31.1765473368110; Thu, 11 Dec 2025
 09:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20251203143659.736329-1-pkj@axis.com> <CAMKF1spc9tibcU_NAzuH-8YJR9O9Lckfat9my0BcP5jZYmQS0g@mail.gmail.com>
 <DB5PR02MB10213036046260AF9962E6583EFA1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213036046260AF9962E6583EFA1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Dec 2025 09:15:56 -0800
X-Gm-Features: AQt7F2qeRqe4KrP-MBFsHnee0PybqPAk-OXlv3Nb94rKL_wGSspwER2JRXqHDwA
Message-ID: <CAMKF1so=qfg9k+EpAkSpn9Rdqr7F7nAcF66kfONfbQ54tOSrPA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] Revert "proj: Fix do_package QA issue
 for unshipped bash-completion files"
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f7838d0645b04c14"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 17:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122587

--000000000000f7838d0645b04c14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 5:57=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> This can be integrated now as the fix for OE-Core has been applied.
>
>
Thanks for the nudge

>
>
> //Peter
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* den 3 december 2025 17:53
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-oe][PATCH 1/1] Revert "proj: Fix do_package QA
> issue for unshipped bash-completion files"
>
>
>
> Thanks, please send a reminder once it's merged in OE-core lest I forget
> about it.
>
>
>
> On Wed, Dec 3, 2025 at 6:35=E2=80=AFAM Peter Kjellerstedt via
> lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.=
org>
> wrote:
>
> This reverts commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d.
>
> Since this recipe inherits bash-completion, adding
> ${datadir}/bash-completion to FILES:${PN} should not be needed (in
> addition to being the wrong thing to do as the files are expected to be
> packaged in the ${PN}-bash-completion package). The reason the problem
> addressed in commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d turned up
> is due to the recent change to the bash-completion bbclass, where it
> started to use PACKAGE_BEFORE_PN. This clashed with the lib_package
> bbclass, which used to set rather than add to PACKAGE_BEFORE_PN, and
> since it is inherited after bash-completion, it overrid what
> bash-completion does.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> I have sent a patch to openembedded-core to correct lib_package.bbclass,
> and it obviously needs to be accepted before this is integrated.
>
>  meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> index eb9fe46f30..2a41f1ec52 100644
> --- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> @@ -12,9 +12,7 @@ inherit bash-completion cmake lib_package pkgconfig
>
>  EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
>
> -FILES:${PN} +=3D " \
> -       ${datadir}/proj \
> -       ${datadir}/bash-completion"
> +FILES:${PN} +=3D "${datadir}/proj"
>
>  BBCLASSEXTEND =3D "native"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122277):
> https://lists.openembedded.org/g/openembedded-devel/message/122277
> Mute This Topic: https://lists.openembedded.org/mt/116594502/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f7838d0645b04c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Dec 11, 2025 at 5:57=E2=80=AFAM Peter Kjellers=
tedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@=
axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-wo=
rd">
<div class=3D"m_8835890952487668913WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">This can be integrated=
 now as the fix for OE-Core has been applied.</span></p></div></div><div la=
ng=3D"SV" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-word"><di=
v class=3D"m_8835890952487668913WordSection1"><p class=3D"MsoNormal"><span =
lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif;color:#943634"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u></span></p></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks f=
or the nudge=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div lang=3D"SV" lin=
k=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-word"><div class=3D"m_=
8835890952487668913WordSection1"><p class=3D"MsoNormal" dir=3D"auto"><span =
lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif;color:#943634">=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634">//Peter<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#943634"><u></u>=C2=A0<u></u></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;
<br>
<b>Sent:</b> den 3 december 2025 17:53<br>
<b>To:</b> Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [oe] [meta-oe][PATCH 1/1] Revert &quot;proj: Fix do_pac=
kage QA issue for unshipped bash-completion files&quot;<u></u><u></u></span=
></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Thanks, please send a reminder once it&#39;s merged =
in OE-core lest I forget about it.<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Dec 3, 2025 at 6:35<span style=3D"font-famil=
y:&quot;Arial&quot;,sans-serif">=E2=80=AF</span>AM Peter Kjellerstedt via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.opene=
mbedded.org" target=3D"_blank">axis.com@lists.openembedded.org</a>&gt; wrot=
e:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">This reverts commit 1=
175d5c8c13d73568d4ab55a3cf628456fcc1a7d.<br>
<br>
Since this recipe inherits bash-completion, adding<br>
${datadir}/bash-completion to FILES:${PN} should not be needed (in<br>
addition to being the wrong thing to do as the files are expected to be<br>
packaged in the ${PN}-bash-completion package). The reason the problem<br>
addressed in commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d turned up<br>
is due to the recent change to the bash-completion bbclass, where it<br>
started to use PACKAGE_BEFORE_PN. This clashed with the lib_package<br>
bbclass, which used to set rather than add to PACKAGE_BEFORE_PN, and<br>
since it is inherited after bash-completion, it overrid what<br>
bash-completion does.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
I have sent a patch to openembedded-core to correct lib_package.bbclass,<br=
>
and it obviously needs to be accepted before this is integrated.<br>
<br>
=C2=A0meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" targ=
et=3D"_blank">proj_9.7.0.bb</a> | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.b=
b" target=3D"_blank">proj_9.7.0.bb</a> b/meta-oe/recipes-navigation/proj/<a=
 href=3D"http://proj_9.7.0.bb" target=3D"_blank">proj_9.7.0.bb</a><br>
index eb9fe46f30..2a41f1ec52 100644<br>
--- a/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" targ=
et=3D"_blank">proj_9.7.0.bb</a><br>
+++ b/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" targ=
et=3D"_blank">proj_9.7.0.bb</a><br>
@@ -12,9 +12,7 @@ inherit bash-completion cmake lib_package pkgconfig<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DBUILD_TESTING=3DOFF&quot;<br>
<br>
-FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/proj \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/bash-completion&quot;<br>
+FILES:${PN} +=3D &quot;${datadir}/proj&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122277): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122277" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/122277</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116594502/199=
7914" target=3D"_blank">
https://lists.openembedded.org/mt/116594502/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000f7838d0645b04c14--

