Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C484C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:27:18 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37809.1782487635180290711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HwNQIivB;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6649fde483bso945979d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 08:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782487634; cv=none;
        d=google.com; s=arc-20260327;
        b=k6NlV1q4K2a19e6DSN13UxXkcN1cufjKpph/U0TuR9r3VukQ4O3sgTxe2t6tKLpN02
         uWeIXl3m/I7zsYFcD/K95mzbcO7x56al1y0egO19cApySZqTioPBKCNH14Yw0lQEXlBS
         qxbOuxCpG//oLlfms2/Sh+rrahwM6JoXpZ4bfK8rVgo8f0mhx+Kzinf52sXElxn3O0FU
         Ky4z3fDTa4/vN36WZbIfnn04dggL1uHF3P/GSa8r7gDawNVQxGdIXSgPmkEoG3jsveP8
         WMk+t1wMg9oikpxc9tBZABE8rBW3xLe8MxtmlyUZx3+KtQSxCL5kTUp/W+XicSW8SkrM
         CzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UNx9iK2Decn7zU0ZFQUirvQrRlnSQVnV2ETfBnHxgsI=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=Y6SV/rsdKkeCcKQS26EgfcOq5MtvJnTrnUiq/AoW5YObjSSJOLyCNzzSidabEwj+U9
         RCLOiiENetsGb0i7RgXm74+z0j7V4gnztl9pxgP8zfi1S9l1pcGMbNlFnZ7xyhJApr0W
         WM1+eAI/EedNezI+jg4x5thahetWCeAeJ+jWY3M1W51ZQ4BKJYQE1Vlnq3xeFz9PJjYp
         gTr8B54ul69+t1VoZDz93u5W7mR3YJUXMwzdNPTx4GM2Y6E03G3deHseFKHasPnPJIyb
         n8e/KWiuHuFnVZAOoQE3JBtT6Mh5vYnwUon1zYXguxm7+s/74GPzz0RtERlLho2h+nsW
         05cw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782487634; x=1783092434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNx9iK2Decn7zU0ZFQUirvQrRlnSQVnV2ETfBnHxgsI=;
        b=HwNQIivBVr4OgJqvX63C0oVv70lP8fl0MeXGnFdb2VcZdleNhfE5RkDULqngx3XiXE
         wXg1wazoJGWLGeQ2xP8iGCYwmO21enfkpoB0wfQ+I5ZLv4HvHN696sjf2PKxuEy2HYFr
         RyXyMzSmB7/IkiHcOtH6r3LO89z8r3Fib+uiyAkywHlpucq8Ee1tokKg3TvvKaYGsEAa
         JNBMgOesLo4jWRJg+fw4qhaqGzifGFR6MePMnGLFDRB1Omejp2oarvmTZWeBGCA5tSpH
         CZ0iFmRbqaE8WNnDxGR/g9nEY7UyF/x9PcXgLIJnloiaFvSjxMFTul45SEOBrATC+ZV1
         SXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487634; x=1783092434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNx9iK2Decn7zU0ZFQUirvQrRlnSQVnV2ETfBnHxgsI=;
        b=YNgtbUaVftloU+bkSvmKRGbQKiUnVyPIpK1MVksox0ZRsbmReX0PjQPt3PbZCtLDhC
         ATu7M+SD52aJ9WYuUZ4tU04/+a5HUK+Y9oJnh381jJcQ2r2TxBt/pyQXltBEFymbNXme
         p7Rx640M0chL5HcJxhY2RjE0MxVoemd8jk++wX0rjCxLHrpyuHUHit2Ziob7ZrhbSbaX
         SIG72kL96b1PXb5zGN96WRQWgtfG88stYMB1M6EShCaCZ/wmrtdNjM3ih9BOO+ATQnhB
         e008ccjPbXhnksFG2RaPuonNR1kSdbDD4wPEI8g9UKJKRP61QU1T1cCeJp6XxmsG999k
         rlZw==
X-Gm-Message-State: AOJu0YxXcFs//6wOlYpeFqiHC8rXDxncM7w2gcRfMguf7T0dgYC00cvZ
	ps4+AVXVTA3XzFDYkXGMruwruf+6RJxcUbFX04jMt0SA8y4gc46HdznuGnsLQTTHUmTwX9+3Zax
	Zfe05pcCXzLmF6Jv7XDfR88TT8mrdAAA=
X-Gm-Gg: AfdE7ckJRLgfIXc8xYlJ8S+fL1wHmJgduhermApO2EGHw34tREIWgcI5HukB0jSf5lu
	eFOTe3ztpq5Sw7drMIE6OEZukptmV6M0lq8LRk7mhdJZe3WS0l9tIKL1v8S5FfwJ2AJIpy/ldVz
	ehUaEwmBnwbQRc8WSM/VTnCIQ/YQWMRkuCi9dT4jsQjMu74sXFH+/QYeu9fxZu8k6BUot8kkIqi
	N1hz+Ktp8atMdrMnbJIxXCh4v7VSn7Tzjc6NcQeNnpysl1n0tQ3FLg93N/LFdZVDgkgV9RPfgGq
	PP91z/AaxpzethDGbnCnghhlnnn+ZGjLyA2IRNzGn4QlWkGudTtloqrV7PRk2QdovNI4w6k+zwN
	pg/w2AHTxrkWcJMoDGfPXE629FIfMVzgtIpvOVSBOb1u4tlpHF7pYQeKGRpLaljiyOeoylw==
X-Received: by 2002:a53:ac83:0:b0:664:a9a0:af70 with SMTP id
 956f58d0204a3-664a9a0be29mr1239393d50.0.1782487634171; Fri, 26 Jun 2026
 08:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260626151341.154231-1-f_l_k@t-online.de>
In-Reply-To: <20260626151341.154231-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jun 2026 08:26:47 -0700
X-Gm-Features: AVVi8Cel-VmduQjfNTmwH1fNNchu5rlR36GtyTl4w-1YRjz7A9QH8-hSQkN3XAo
Message-ID: <CAMKF1sovMviZ2YdK96K2ipQ73XOO38JVaj7LCcB7wdnOO7KExg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv3] flatpak: update 1.17.6 -> 1.18.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000405cb2065529bec9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127805

--000000000000405cb2065529bec9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This did not work either, I cleaned it up locally before applying.

On Fri, Jun 26, 2026 at 8:13=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Enhancements:
>
> Improve error handling and printed output of flatpak-coredumpctl
>
> Support the AMD vendor specific compute interface (/dev/kfd) via the DRI
> device permission
>
> Improve the output of flatpak update with failure causes
>
> Improve startup time for fish shell integration
>
> Translation updates: =E2=80=8Ezh_CN
>
> Bug fixes:
>
> Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined
>
> Ignore system bus failures in parental controls check
>
> Fix some return values and replace deprecated GTimeVal with
> g_get_real_time()
>
> Suppress an unused-result warning in the tests
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
> View/Reply Online (#127802):
> https://lists.openembedded.org/g/openembedded-devel/message/127802
> Mute This Topic: https://lists.openembedded.org/mt/119991180/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000405cb2065529bec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This did not work either, I cleaned it up locally before a=
pplying.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jun 26, 2026 at 8:13=E2=80=AFAM Marku=
s Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-on=
line.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Enhancements:<br>
<br>
Improve error handling and printed output of flatpak-coredumpctl<br>
<br>
Support the AMD vendor specific compute interface (/dev/kfd) via the DRI<br=
>
device permission<br>
<br>
Improve the output of flatpak update with failure causes<br>
<br>
Improve startup time for fish shell integration<br>
<br>
Translation updates: =E2=80=8Ezh_CN<br>
<br>
Bug fixes:<br>
<br>
Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined<br>
<br>
Ignore system bus failures in parental controls check<br>
<br>
Fix some return values and replace deprecated GTimeVal with<br>
g_get_real_time()<br>
<br>
Suppress an unused-result warning in the tests<br>
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
View/Reply Online (#127802): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127802" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127802</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119991180/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119991180/1997914</a><br>
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

--000000000000405cb2065529bec9--

