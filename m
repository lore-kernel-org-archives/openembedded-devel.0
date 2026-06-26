Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C437CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 01:55:46 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26694.1782438938966093165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 18:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VMRhcAyo;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6603d8697d2so506084d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 18:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782438938; cv=none;
        d=google.com; s=arc-20260327;
        b=b/o2m6h6WJo8EjnjsBsE71akjDikRSTLnq9ipG9RVE0/+PR1uX8MuUcvizQdnT5Dww
         3hbE+Zew1h/qr2frFgK/16T1tvh+uHG7R5gP5PxWxj0++MS0RyyluB8wHL2gfCjdLp1p
         hVAlObR4ucWlL5K6r253heB61QLOZKUDh4/Av68gvkJHyx665+ohDE96cowfjFdzRZNt
         CDTcLK76YE+vc57hqVwYbG5emwBDQwe25wE3rwsKEXYikwGRIZjpE9P2wSMaXLQWFOtu
         Wi4kxOfL/2ErYZ5kR4B2ZdODmPP4pBatZIeB8DedyXh9r54WMQHT7q6H6dlb2/51nfzm
         qQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i1zcEXAsJUCHFCJfkPdtSAXMQA7IamIjnhlSawyOobY=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=r4/pBe+F0qp9u1bFs7QMPhqooeIQp4+xHZNLF/JyAucdvsD/hcJ1e1lg1uRcu4P+Pt
         Y7YQkEJ2JY6W7gIJvec1KPZU5l9KM6gmL4neF30ujNS2Yp1jYJP4YFEmQrO40hmGdrNU
         sUEcDOqvlQulfNc5FtQ6QpJQBv9nLqWmDNlO+OK+3a0HkKxl0rbQdCvYQ2Kpj8fk5QbN
         S0uAuUTZOnNTaI0sYLMVOBNSbHI2d8B4jBUSXgggzwa/x2juQW2XC51Pa3FojNX/oA4D
         /C1pif3abPcfdy5F2KMUV5yONuKDqI+ZwbiKxKuZ7Y9PIjQh0+xcaBZgkPDRuxWZp6R0
         FJ4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782438938; x=1783043738; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1zcEXAsJUCHFCJfkPdtSAXMQA7IamIjnhlSawyOobY=;
        b=VMRhcAyoL20Z90OucBdxVrL4i5+Fc0dA0tXYp1fWGcSjEZP46zfkWd3GPbmW+KtynU
         qH5O7Y1/8MVyBxOLw8/QC2g77XjpaLLcK5ZeGkwgAPb39Bq7Mp1VfOAa14l/H8cff8m4
         Vq6kdw8LJhZtXI/31ZVwwZ0susp6EFYI+r4NATa4xxwNmO/xr6wj8zM7ORrEtRtoAcVu
         QDW/SKEA6QX/SOCe2f2DhXT0ddQteVaEbaGNFanxPiCwn6QyaZgCNEcxqm+3cFMDpEfs
         dDeyVoR1KOqPNpNNXFvaigB4C2n1jBO6XXc/CRdh9LP7GyRDX+AkKmIuRxzBDb52nWs9
         UXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782438938; x=1783043738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1zcEXAsJUCHFCJfkPdtSAXMQA7IamIjnhlSawyOobY=;
        b=NPyUh94IbfTzhSWGHs4ANNOplSNi0z3j0gZAI+vj51dKOfv8v6Y64NHfViXxFM4zOv
         uH+PeEISIlwlLnOavMw5ougVNrvKwmoT52jmORsTTSg08kt/nwZnPJmUHcghBFfdrnOP
         AJVG/kfMzdko6Ii5u+InmS6e+ajsr4vaKF5RI9l5N8nZ20xcjgTn6lTa11VSAlD6m2H1
         TDiwgZ5jT4BvHPD2knN1hjYQ6QpfZCrFHvN7jnNbapoHZ6TVY9507MPxcrGURvenZjXL
         hxWsHNYj8pqQ6+VFAAMqJn4zlPpvzt4BjcCqbw2o/jB73rAv0forRZIwVMyPhyR1zSjl
         cJ9g==
X-Gm-Message-State: AOJu0YzPrOfHXtwCrA+OTCUeqtWuG29DL8G6QX8xgAQSMjZFnEy85cPH
	IXC+6vEDF5oL6FURGlLfCu+3f4L+eb1T1taDUJJABWgdWePypDKd2dScrApuEDFfv/qRsxViVB/
	2Q+L5CwRNVGINJBTyqvMvuv2p+JNXOG4=
X-Gm-Gg: AfdE7clZ9uqmvU+5TvISoTqQ8dHsQRBYqznnEcJPIB8BjL8NIGMiUyBHymKjAVc4lMj
	S03UvWQVh4Hqcz5KWBIu8ybXTOqdwBDOCGfnLvL8AYbjCo4vVSDqRiO7eJ+8xk5ifBwLjgVWTpe
	QT5bbVeAl+fnmgGbhMn+chWbXrifMU+BxRkcCqkCE+U8+KaQ2j2weXegUn7kxcCzG2AsfwPjBvM
	/8TiKN+TMPLDSp+KJBwz5RCTdx+znmhdZbaDNYRX4UhAOmFLfMmfkiz4VGflE/Zmx1ip8sTBzFe
	UQvk5ANYuyA18AF1MRbOaePvnp1kfYRSE4k4OOy9twQizU8OlfKmc9+ynYyGRCaseqg/ffxzWSm
	R0t+PuUlCZ8FbqOdFQyi8zNTT/KjUIY69Fs4A15TcAsrZsOP4TN1z+8Ghcya59k1AlaaEzVrwmw
	2Ko+QZ
X-Received: by 2002:a05:690e:1699:b0:660:3b18:57ea with SMTP id
 956f58d0204a3-66487af839cmr4099652d50.1.1782438937955; Thu, 25 Jun 2026
 18:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260624163903.3376268-1-f_l_k@t-online.de>
In-Reply-To: <20260624163903.3376268-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jun 2026 18:55:11 -0700
X-Gm-Features: AVVi8Cd4nuNS5TXx_zKqCVKEJPvxw9WvzcaqxROXTEMMFRbQ7Unx6pbdhHabErM
Message-ID: <CAMKF1som+Et4zPsiW5X=qNYEUU2NoOr4_4TJZke0LzvVDKd9+A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] flatpak: update 1.17.6 -> 12.18.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bb129706551e674b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 01:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127785

--000000000000bb129706551e674b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this patch comes out mal-formed, please resend a working version.

On Wed, Jun 24, 2026 at 9:39=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Changes in 1.18.0
> ~~~~~~~~~~~~~~~~~
> Released: 2026-06-08
>
> Enhancements:
>
> * Improve error handling and printed output of `flatpak-coredumpctl`
> (#6649,
>   #6680)
>
> * Support the AMD vendor specific compute interface (`/dev/kfd`) via the
> DRI
>   device permission (#6648)
>
> * Improve the output of `flatpak update` with failure causes (#6657)
>
> * Improve startup time for fish shell integration (#6635)
>
> * Translation updates: =E2=80=8Ezh_CN (#6671)
>
> Bug fixes:
>
> * Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined
> (#6652)
>
> * Ignore system bus failures in parental controls check (#6663)
>
> * Fix some return values and replace deprecated `GTimeVal` with
>   `g_get_real_time()` (#6646)
>
> * Suppress an unused-result warning in the tests (#6655)
>
> Changes in 1.17.7
> ~~~~~~~~~~~~~~~~~~
> Released: 2026-05-06
>
> Enhancements:
>
> * Add the new permission conditionals `has-usb-device` and
> `has-usb-portal` to
>   allow apps to drop --device=3Dall and --device=3Dusb permissions (#6560=
)
>
> * Always send the `Flatpak-Upgrade-From` header when updating instead of
>   freshly installing, to improve the quality of statistics (#6626)
>
> * Improve how the absence of the system repo is handled (#6621)
>
> * Changes to repos are now more atomic which helps to avoid them being in
> an
>   invalid state. This could be observed when importing the GPG key failed=
,
>   because the system clock was wrong. (#6547)
>
> * A function to report the age of the configuration was added to
> libflatpak,
>   which will help GNOME Software to prevent unnecessary work (#6532)
>
> * Improvements to the build system (#6614, #6610)
>
> * Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)
>
> * Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)
>
> Bug fixes:
>
> * Fix a regression in handling of the fallback-x11 permission, which was
>   affecting overrides from Flatseal (#6632)
>
> * Fix a memory leak in the Flatpak portal (#6613)
>
> * Install SELinux configuration files to the right directory (#6622)
>
> * Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../flatpak/{flatpak_1.17.6.bb =3D> flatpak_1.18.0.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.6.bb =3D>
> flatpak_1.18.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> index 1512b7239f..879455f63c 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb
> @@ -8,7 +8,7 @@ SRC_URI =3D " \
>      file://0001-flatpak-pc-add-pc_sysrootdir.patch \
>  "
>
> -SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"
> +SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
>
>
>  inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection
> python3native mime features_check useradd
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127720):
> https://lists.openembedded.org/g/openembedded-devel/message/127720
> Mute This Topic: https://lists.openembedded.org/mt/119960031/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bb129706551e674b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this patch comes out mal-formed, please resend a working v=
ersion.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jun 24, 2026 at 9:39=E2=80=AFAM Marku=
s Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-on=
line.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Changes in 1.18.0<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2026-06-08<br>
<br>
Enhancements:<br>
<br>
* Improve error handling and printed output of `flatpak-coredumpctl` (#6649=
,<br>
=C2=A0 #6680)<br>
<br>
* Support the AMD vendor specific compute interface (`/dev/kfd`) via the DR=
I<br>
=C2=A0 device permission (#6648)<br>
<br>
* Improve the output of `flatpak update` with failure causes (#6657)<br>
<br>
* Improve startup time for fish shell integration (#6635)<br>
<br>
* Translation updates: =E2=80=8Ezh_CN (#6671)<br>
<br>
Bug fixes:<br>
<br>
* Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined (#=
6652)<br>
<br>
* Ignore system bus failures in parental controls check (#6663)<br>
<br>
* Fix some return values and replace deprecated `GTimeVal` with<br>
=C2=A0 `g_get_real_time()` (#6646)<br>
<br>
* Suppress an unused-result warning in the tests (#6655)<br>
<br>
Changes in 1.17.7<br>
~~~~~~~~~~~~~~~~~~<br>
Released: 2026-05-06<br>
<br>
Enhancements:<br>
<br>
* Add the new permission conditionals `has-usb-device` and `has-usb-portal`=
 to<br>
=C2=A0 allow apps to drop --device=3Dall and --device=3Dusb permissions (#6=
560)<br>
<br>
* Always send the `Flatpak-Upgrade-From` header when updating instead of<br=
>
=C2=A0 freshly installing, to improve the quality of statistics (#6626)<br>
<br>
* Improve how the absence of the system repo is handled (#6621)<br>
<br>
* Changes to repos are now more atomic which helps to avoid them being in a=
n<br>
=C2=A0 invalid state. This could be observed when importing the GPG key fai=
led,<br>
=C2=A0 because the system clock was wrong. (#6547)<br>
<br>
* A function to report the age of the configuration was added to libflatpak=
,<br>
=C2=A0 which will help GNOME Software to prevent unnecessary work (#6532)<b=
r>
<br>
* Improvements to the build system (#6614, #6610)<br>
<br>
* Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)<br>
<br>
* Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)<br>
<br>
Bug fixes:<br>
<br>
* Fix a regression in handling of the fallback-x11 permission, which was<br=
>
=C2=A0 affecting overrides from Flatseal (#6632)<br>
<br>
* Fix a memory leak in the Flatpak portal (#6613)<br>
<br>
* Install SELinux configuration files to the right directory (#6622)<br>
<br>
* Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../flatpak/{<a href=3D"http://flatpak_1.17.6.bb" rel=3D"noreferrer" =
target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt; <a href=3D"http://flatpak_1=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/flatpak/{<a href=3D"http://flatpak_1.=
17.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt;=
 <a href=3D"http://flatpak_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
flatpak_1.18.0.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.1=
7.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> b/meta-o=
e/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17=
.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
rename to meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
index 1512b7239f..879455f63c 100644<br>
--- a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
+++ b/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
@@ -8,7 +8,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-flatpak-pc-add-pc_sysrootdir.patch \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;9b21874f1a175a9b7c79175a221fa043e202ca73&quot;<br>
+SRCREV =3D &quot;5de2b58bdafde88515d9d6b9189bd1cfd3b88c46&quot;<br>
<br>
<br>
=C2=A0inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection=
 python3native mime features_check useradd<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127720): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127720" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127720</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119960031/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119960031/1997914</a><br>
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

--000000000000bb129706551e674b--

