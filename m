Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF169D3B98F
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:15:44 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16056.1765307740400442289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMeXdRDJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787ff3f462bso2025567b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765307739; x=1765912539; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzTD+26PiQG4LGnc3PkssEV72kVsFKNCb8bsQxB8AuQ=;
        b=FMeXdRDJXWpFptfJdBrCBti5BipzdfzeTr47es66Btdp9F/dy2i6gMi6hNCq/IYFmi
         oTidkfMjtUZTuUGiKD2Rlqovn4yRwcasHO2pN0gBrUz+ppb6PKWadKFNyVh4J2g0Z2ux
         W0OxF6MlNNVOqQ+JpSBZVvMsFuTJhNn6FNvBrxDJKEiFfqHk1VEcIi5gv+KbYpzvvcuO
         4lzkltTrjIwO9JTfoP2kQYTL9YTPUH4dCgZL3veBwdPAdN4EJGSmWm9TDtIOu4zkl2le
         pZVl9lBoqpAW0mv61rb4lO1FSA73dOIpsHr8RoE7oV8gYY1cTg7kcCYnHEBGyCin6gOh
         Ugiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765307739; x=1765912539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzTD+26PiQG4LGnc3PkssEV72kVsFKNCb8bsQxB8AuQ=;
        b=TM3qeTzGIAEWrJXtQn5EIwIQGG03l5tyBzH244KyHC3YeLqheao2psGgJG4P9Ubtk4
         S5RiDfrKKhL/z/EYJuyTkGbLOHBaBf6KKnhOE6tm9mLbWivytt2IhwlW8ajmRBnHcgtk
         c/RpikTFylWRrECnIhh/DZ9ihOVLAFXII6gcRE/LIOfy9rCDXAalXVubrIgvGGAl9NVQ
         XX7EyJjMWcOybReSONUtgZgDON0NQXtThcizIUpoawCpbqSmgwfEo9OVJd14oabgzM4b
         9RvKEZnWVyi6gTys0YcwSSybt2/jRbf2pRjOqz0HPMLOmT5FtQ/7jgrJdje/fr11bbp1
         YSVQ==
X-Gm-Message-State: AOJu0Yxf8Rrpxwy6VmccSCNFLYoeDlPVQ26fhl4b5TPBSsLVR1FRM5En
	8mA9wsE2xNMVZhJvLH5FZDrIUlP2KYH88bnZw5cmG24EeH67k+q/nU0i77hsNt+4a1ohdu4f24x
	LvY717nC7c9SKlDvnKwSAR9RxV4ikeNo0NDVP3YQ=
X-Gm-Gg: AY/fxX4ozFcKp173cGt6EtuI7iDK5QwMGSvloXo4CecFOaDQL5nF4sHUKnbNZq7i9m2
	UEcSpXgsQH2jltLwHFDdF5r6EXjdufFigtKjJ2sKJnV4DeO46Th050GrB3wG33ec3yKGAYqQeY+
	iUJPs0LdJide4PQWDonSxhUosnjwNSdpr0lDgRblVLJ4hsRDn/D2AFRytZUlSg7mpskMvK/ajVL
	t0Sy5umTrvSZB99b6rc3AzsPctljDhSEfbqlDr59Wp3TdzJIu96HoInK334vyo86bO8KqjmYpPk
	ITPcmrsm0GhZ5fGlXdg/YJMuI1d+hT3A4T0/JFrWj1sALYLVQUXYniCdctETQVYqA1MbFnprvxi
	JI5YbzyC9gahd1T18i6TOFQPMTGaosUMnm4CNg+rX
X-Google-Smtp-Source: AGHT+IFla4NNm8EylmhEc4SMqZbUH2b9F0kvI78dlJOQbuOrPIjCAriIkoOfq/9zc42zYxKSZDjMe7F/TqIR2DxeCJI=
X-Received: by 2002:a05:690e:13c9:b0:644:4259:9b6f with SMTP id
 956f58d0204a3-644678d1835mr2099819d50.3.1765307739342; Tue, 09 Dec 2025
 11:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20251209163552.1419590-1-skandigraun@gmail.com>
In-Reply-To: <20251209163552.1419590-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 11:15:13 -0800
X-Gm-Features: AQt7F2rBBDlmEGOkcbSDe0wVARQQx3WhOd36xR8qb-XWQpqLjX0_QvWq6D0Qonk
Message-ID: <CAMKF1so8M280n2nwca-paKr23dPUoMfuzEiNFgy38P98Wosgmw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 0/4] Drop dleyna recipes
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b909ea064589bc21"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122472

--000000000000b909ea064589bc21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a good cleanup. Thanks

On Tue, Dec 9, 2025 at 8:35=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> All these recipes have been disabled since at least Scarthgap, due to bei=
ng
> unmaintained, and they fail to compile with the latest gupnp. The upstrea=
m
> repository has been switched to maintenance mode in 2021.
>
> Could not find any dependendees in the layer index.
>
> ---
>
> Gyorgy Sarvari (4):
>   dleyna-connector-dbus: drop recipe
>   dleyna-core: drop recipe
>   dleyna-renderer: drop recipe
>   dleyna-server: drop recipe
>
>  .../dleyna/dleyna-connector-dbus_0.3.0.bb     |  19 ---
>  .../dleyna/dleyna-core_0.6.0.bb               |  21 ---
>  .../0001-add-gupnp-1.2-API-support.patch      | 123 ------------------
>  .../dleyna/dleyna-renderer_0.6.0.bb           |  26 ----
>  .../dleyna/dleyna-server_0.6.0.bb             |  23 ----
>  5 files changed, 212 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/
> dleyna-connector-dbus_0.3.0.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/
> dleyna-core_0.6.0.bb
>  delete mode 100644
> meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer/0001-add-gupnp-=
1.2-API-support.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/
> dleyna-renderer_0.6.0.bb
>  delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/
> dleyna-server_0.6.0.bb
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122466):
> https://lists.openembedded.org/g/openembedded-devel/message/122466
> Mute This Topic: https://lists.openembedded.org/mt/116696338/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b909ea064589bc21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a good cleanup. Thanks</div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Dec 9, 2025 at 8:35=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"=
mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Al=
l these recipes have been disabled since at least Scarthgap, due to being<b=
r>
unmaintained, and they fail to compile with the latest gupnp. The upstream<=
br>
repository has been switched to maintenance mode in 2021.<br>
<br>
Could not find any dependendees in the layer index.<br>
<br>
---<br>
<br>
Gyorgy Sarvari (4):<br>
=C2=A0 dleyna-connector-dbus: drop recipe<br>
=C2=A0 dleyna-core: drop recipe<br>
=C2=A0 dleyna-renderer: drop recipe<br>
=C2=A0 dleyna-server: drop recipe<br>
<br>
=C2=A0.../dleyna/<a href=3D"http://dleyna-connector-dbus_0.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">dleyna-connector-dbus_0.3.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 19 ---<br>
=C2=A0.../dleyna/<a href=3D"http://dleyna-core_0.6.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">dleyna-core_0.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 ---<br>
=C2=A0.../0001-add-gupnp-1.2-API-support.patch=C2=A0 =C2=A0 =C2=A0 | 123 --=
----------------<br>
=C2=A0.../dleyna/<a href=3D"http://dleyna-renderer_0.6.0.bb" rel=3D"norefer=
rer" target=3D"_blank">dleyna-renderer_0.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 26 ----<br>
=C2=A0.../dleyna/<a href=3D"http://dleyna-server_0.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">dleyna-server_0.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 23 ----<br>
=C2=A05 files changed, 212 deletions(-)<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/<a href=
=3D"http://dleyna-connector-dbus_0.3.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">dleyna-connector-dbus_0.3.0.bb</a><br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/<a href=
=3D"http://dleyna-core_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dleyn=
a-core_0.6.0.bb</a><br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-r=
enderer/0001-add-gupnp-1.2-API-support.patch<br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/<a href=
=3D"http://dleyna-renderer_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">d=
leyna-renderer_0.6.0.bb</a><br>
=C2=A0delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/<a href=
=3D"http://dleyna-server_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">dle=
yna-server_0.6.0.bb</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122466): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122466" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122466</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116696338/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116696338/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b909ea064589bc21--

