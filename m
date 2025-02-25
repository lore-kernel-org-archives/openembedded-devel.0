Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90D9C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 17:15:13 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.14148.1740503712239881510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 09:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fDnPbysp;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7273c07149fso2839078a34.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 09:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740503711; x=1741108511; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QQjtt8sleCjGzOB8qk6pbYpSy4vCCM1qEDXMpP4zIM=;
        b=fDnPbysp6H1b7RLKfIZgYwe5fjEIWU317b3m4FK9frvQZ6RNHDE6jjPtKILy6HCd3J
         DxPkXo6aRjc49gtplJbKHaK6ZH6J7oREehkOAWXJHzo1tCmB2ehrJGvdrVgr2TEAunNd
         prrmpreYYbkohC6tlmLX/FDKE1bJUGQYOTYL0nG+69bDTnPXanB7+7ZkbdQol5uHxELW
         nU50pre/y/AB38Gg0nGfcZRs9IQYXai6JAuwEEpqx3sT5BO98xPRqxe5KM3tEJVDD2/c
         P4yZDpznqVvxpBxW5L8rETKQF0yYpXd1LvrFF6oOrnc+gX3WHgGLE/ZJ5Jn+rdu2ta6K
         OTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503711; x=1741108511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QQjtt8sleCjGzOB8qk6pbYpSy4vCCM1qEDXMpP4zIM=;
        b=tqcNYgWNwqH0RTGKDoaXHJokXvEWgRwI8ZBqSQ84uQP9Ow4OKrw1GmhPup61rrWhhm
         E0T7Y+5fSp2NnwSJOxLDS92Nx2ietgTtvaGCjy/USX65u8ufZlHgtL0WGIM5KS4+SvNP
         U2Ubk+Ja0fVlXBuccvKoY5zA90vJ5gCqGO9xxXzQoDMOtxtAJMoqIepcEaDCyMDSxytP
         E7UN0L92qqeevrnidN/m46VvpptF1tm4QgMbp5Zj3l9rXHzNMGMGRhSxmVGe8ayMq7XN
         GrENqy+k+kUb6cbhwrP3QMcYaRFl/ccEyHlhwS3KyaUcgOfVyc7KyJEy72EIIl62Iw1D
         13aQ==
X-Gm-Message-State: AOJu0YxKtJYTmncGLXeIXobm+cBAziU3paApyN1oqEuI4bWpLJZwbwkw
	iVBZlrYzf9PPVChPRRADi9RUAreSAGMAov39TqKxZaGtkLSGmqUF1mgs65ZErEji40ei4oeOCNO
	4RydGLfnDcWXxqV4qqK2LNJXNLhI=
X-Gm-Gg: ASbGnct/9ZaodNQAyUmTcqQG7iMpWz6vCDFM0sMK7h1iSDGxV6c5xkgc7KxTJVYvLjC
	QrCemgZtO8XJocGYA2QZ8MNb8xqKW9RZZ7UJjeR31/Gf7t7e1gWmF96xu5SJoiBQMi+4p2VXPDR
	/HLupHzxD2dLWjRqsKrlYAxA/0iO+/o5lZW9aBi/iyQA==
X-Google-Smtp-Source: AGHT+IFh504mmwIOTGnUUMp72yKGuABEX/uax2doo88De1YtFesI7QEgs+A+MrkYT/0JztguwzTsj9Fahya209A41Eo=
X-Received: by 2002:a05:6808:3847:b0:3f4:95b:b12b with SMTP id
 5614622812f47-3f547e54310mr110113b6e.33.1740503711351; Tue, 25 Feb 2025
 09:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20250225134937.2085793-1-f_l_k@t-online.de> <20250225134937.2085793-4-f_l_k@t-online.de>
In-Reply-To: <20250225134937.2085793-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2025 09:15:00 -0800
X-Gm-Features: AWEUYZlFdk5ygVvOB6FMzsZhS9FeQpnVTZL6hGgNuhkzMEWbbk1nx9xRXdefvvc
Message-ID: <CAMKF1spA7v-Bv-HcyPcS2TLJg5TDEfs6Bbqsk-rVchuXAif52w@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-gnome][PATCH 4/7] gnome-software_: update 47.2 -> 48.beta
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000720c67062efa99fb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 17:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115584

--000000000000720c67062efa99fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Should we wait for final 48 release ?

On Tue, Feb 25, 2025 at 5:49=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Version 48~beta
> ~~~~~~~~~~~~~~~
> Released: 2025-01-31
> This is an unstable release with the following changes:
>  * Support installing flatpaks via a flatpak+https: link
>  * Fix notifying about outdated updates when in power saver mode or offli=
ne
>  * Prioritise verified apps in source list
> This release also updates translations:
>  * Bulgarian (twlvnn kraftwerk)
>  * Czech (Daniel Rusek)
>  * Russian (Artur S0)
>  * Slovenian (Martin)
> Version 48~alpha3
> ~~~~~~~~~~~~~~~~~
> Released: 2025-01-14
> This is an unstable release with the following changes:
>  * Fix downloads of firmware updates
>  * Fix the release process
> This release also updates translations:
>  * Belarusian (Vasil Pupkin)
>  * Slovenian (Martin)
> Version 48~alpha2
> ~~~~~~~~~~~~~~~~~
> Released: 2025-01-04
> This is an unstable release with the following changes:
>  * Fix the release process
> Version 48~alpha
> ~~~~~~~~~~~~~~~~
> Released: 2025-01-04
> This is an unstable release with the following changes:
>  * Include dependencies in estimated download size
>  * Improve performance when loading updates
>  * Fix interface freeze when upvoting/downvoting reviews
>  * Various minor interface improvements for keyboard navigation and small
> screens
>  * Fix crash when uninstalling snaps
>  * Add experimental systemd-sysupdate plugin
>  * Warn about microphone permissions if an app has PipeWire access
> This release also updates translations:
>  * Belarusian (Vasil Pupkin)
>  * Catalan (Jordi Mas i Hernandez, Jordi Mas)
>  * Dutch (Nathan Follens)
>  * French (Vincent Chatelain)
>  * Friulian (Fabio Tomat)
>  * German (J=C3=BCrgen Benvenuti)
>  * Hebrew (Yaron Shahrabani)
>  * Kabyle (Athmane MOKRAOUI)
>  * Latvian (R=C5=ABdolfs Mazurs)
>  * Portuguese (Hugo Carvalho)
>  * Portuguese (Brazil) (Rafael Fontenelle)
>  * Russian (Artur S0)
>  * Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=
=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=B8=
=D1=9B)
>  * Slovak (Jose Riha)
>  * Slovenian (Martin)
>  * Thai (Aefgh Threenine)
>  * Turkish (Sabri =C3=9Cnal)
>  * Ukrainian (Yuri Chornoivan)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-software_47.2.bb =3D> gnome-software_48.beta.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.2.bb
> =3D> gnome-software_48.beta.bb} (90%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-software/
> gnome-software_47.2.bb b/meta-gnome/recipes-gnome/gnome-software/
> gnome-software_48.beta.bb
> similarity index 90%
> rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.b=
b
> rename to meta-gnome/recipes-gnome/gnome-software/
> gnome-software_48.beta.bb
> index 31b13accf8..1b48708595 100644
> --- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_48.beta.bb
> @@ -26,9 +26,9 @@ DEPENDS +=3D " \
>
>  RDEPENDS:${PN} =3D "iso-codes"
>
> -EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
> +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>
> -SRC_URI[archive.sha256sum] =3D
> "112338f8a98e7e5125de3f57229873534215b77eeef37d3fd4262f02151c7cea"
> +SRC_URI[archive.sha256sum] =3D
> "798c48912788b3ff700fd483fe805f3e0f0912cf2e46b7f7334c8a9c6f883296"
>
>  PACKAGECONFIG ?=3D "flatpak"
>  PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115573):
> https://lists.openembedded.org/g/openembedded-devel/message/115573
> Mute This Topic: https://lists.openembedded.org/mt/111376787/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000720c67062efa99fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should we wait for final 48 release ?=C2=A0</div><div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Feb 25, 2025 at 5:49=E2=80=AFAM Markus Volk via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D=
<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Versio=
n 48~beta<br>
~~~~~~~~~~~~~~~<br>
Released: 2025-01-31<br>
This is an unstable release with the following changes:<br>
=C2=A0* Support installing flatpaks via a flatpak+https: link<br>
=C2=A0* Fix notifying about outdated updates when in power saver mode or of=
fline<br>
=C2=A0* Prioritise verified apps in source list<br>
This release also updates translations:<br>
=C2=A0* Bulgarian (twlvnn kraftwerk)<br>
=C2=A0* Czech (Daniel Rusek)<br>
=C2=A0* Russian (Artur S0)<br>
=C2=A0* Slovenian (Martin)<br>
Version 48~alpha3<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2025-01-14<br>
This is an unstable release with the following changes:<br>
=C2=A0* Fix downloads of firmware updates<br>
=C2=A0* Fix the release process<br>
This release also updates translations:<br>
=C2=A0* Belarusian (Vasil Pupkin)<br>
=C2=A0* Slovenian (Martin)<br>
Version 48~alpha2<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2025-01-04<br>
This is an unstable release with the following changes:<br>
=C2=A0* Fix the release process<br>
Version 48~alpha<br>
~~~~~~~~~~~~~~~~<br>
Released: 2025-01-04<br>
This is an unstable release with the following changes:<br>
=C2=A0* Include dependencies in estimated download size<br>
=C2=A0* Improve performance when loading updates<br>
=C2=A0* Fix interface freeze when upvoting/downvoting reviews<br>
=C2=A0* Various minor interface improvements for keyboard navigation and sm=
all screens<br>
=C2=A0* Fix crash when uninstalling snaps<br>
=C2=A0* Add experimental systemd-sysupdate plugin<br>
=C2=A0* Warn about microphone permissions if an app has PipeWire access<br>
This release also updates translations:<br>
=C2=A0* Belarusian (Vasil Pupkin)<br>
=C2=A0* Catalan (Jordi Mas i Hernandez, Jordi Mas)<br>
=C2=A0* Dutch (Nathan Follens)<br>
=C2=A0* French (Vincent Chatelain)<br>
=C2=A0* Friulian (Fabio Tomat)<br>
=C2=A0* German (J=C3=BCrgen Benvenuti)<br>
=C2=A0* Hebrew (Yaron Shahrabani)<br>
=C2=A0* Kabyle (Athmane MOKRAOUI)<br>
=C2=A0* Latvian (R=C5=ABdolfs Mazurs)<br>
=C2=A0* Portuguese (Hugo Carvalho)<br>
=C2=A0* Portuguese (Brazil) (Rafael Fontenelle)<br>
=C2=A0* Russian (Artur S0)<br>
=C2=A0* Serbian (=D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=
=B8=D1=9B, =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=D0=
=B8=D1=9B)<br>
=C2=A0* Slovak (Jose Riha)<br>
=C2=A0* Slovenian (Martin)<br>
=C2=A0* Thai (Aefgh Threenine)<br>
=C2=A0* Turkish (Sabri =C3=9Cnal)<br>
=C2=A0* Ukrainian (Yuri Chornoivan)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://gnome-software_47.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnome-software_47.2.bb</a> =3D&gt; <a href=3D"http://gnome-s=
oftware_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.=
beta.bb</a>}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-software/{<a href=3D"http://gno=
me-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47=
.2.bb</a> =3D&gt; <a href=3D"http://gnome-software_48.beta.bb" rel=3D"noref=
errer" target=3D"_blank">gnome-software_48.beta.bb</a>} (90%)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnom=
e-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.=
2.bb</a> b/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-=
software_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48=
.beta.bb</a><br>
similarity index 90%<br>
rename from meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome=
-software_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.2=
.bb</a><br>
rename to meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-s=
oftware_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.=
beta.bb</a><br>
index 31b13accf8..1b48708595 100644<br>
--- a/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-softw=
are_47.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_47.2.bb</a=
><br>
+++ b/meta-gnome/recipes-gnome/gnome-software/<a href=3D"http://gnome-softw=
are_48.beta.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_48.beta=
.bb</a><br>
@@ -26,9 +26,9 @@ DEPENDS +=3D &quot; \<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;iso-codes&quot;<br>
<br>
-EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse -Dsoup2=3Dfalse&quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse&quot;<br>
<br>
-SRC_URI[archive.sha256sum] =3D &quot;112338f8a98e7e5125de3f57229873534215b=
77eeef37d3fd4262f02151c7cea&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;798c48912788b3ff700fd483fe805f3e0f091=
2cf2e46b7f7334c8a9c6f883296&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;flatpak&quot;<br>
=C2=A0PACKAGECONFIG[flatpak] =3D &quot;-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,f=
latpak ostree&quot;<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115573): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115573" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115573</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111376787/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111376787/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000720c67062efa99fb--

