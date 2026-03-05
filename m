Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217C9EEF30B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 06:20:20 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38466.1772691616852462699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 22:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBKdt9vv;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ca09f2170so8048636d50.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 22:20:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772691616; cv=none;
        d=google.com; s=arc-20240605;
        b=MLRvijlQywKYq1xsb+JFjDjwf3TR/y1KkUIDabs+5gSk/6vY2fBItgJb/QU1EVroMJ
         1IcpPtbGE8JfGfYv0eiz9VqPXOE3Hx0NmC9psXnm7yy7KcDuZZSwbYE/05z7QIIzkGS+
         W6CFwHGcugzLNxzVcbUgbDZLFE1tPAoum7DZR9gLJEpSfQBAzyvMHQ6U1aFQpjwtIViO
         U1ZcTc7qV8ATggYL7sWpe0H23niApTuGrbrBO5ethI6i/+Jf8Zb71DRD0Ft6qVdLfc4y
         8OamZtNK45HoH2O2EUtikNrC0VruouwBx+Kq3be/QyMYfja8A6YTMQu8HkhQXihTmthY
         oybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hliTMbHec+fNIrJjOtbtu2t/Askctyi2K2dwWjRlgFc=;
        fh=T4CPLHS+o6DAwGFfKmQ6x8qUYUzzMdir05T+ffiJoHU=;
        b=CzXtr/B1g4pSgKqcTy0njaWVnyvuXW8kag5BY26aZ+31qABCc9VUslpYebV9/pfmxT
         /EQVjEjjce1rQBO8lv0h+jz0ZHiSewEmlPJUuy8XTd9Jc5JU8ZaWv1RRjZIib/BNmf+p
         jAFCPri27Mf1Y9TNEsWSFqnkKnFJ6Yz/RyBpq/3iAZ5K434i832Ow0VJ389ljSnAH1fD
         RQLE2+6lm14sJ+H+Js86hBFbytWyoP0+oFe0PES0aqloTPNysELxaqRzjswCzdGVal8/
         SHuSYCn60nzlChAvnsDWL3O9A/lOxgjWG3bfLGcou8fwc99atO06iv9VgT+i5tb2SDWY
         DKkA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772691616; x=1773296416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hliTMbHec+fNIrJjOtbtu2t/Askctyi2K2dwWjRlgFc=;
        b=IBKdt9vvbe2lgVAe9l+WCzm2+annYujDUbUSlLo9+0kA69zi5Ur4DyKTJmEFoZhg97
         xXsA+xFFCHzpNzKYlJbhaQZZw5PeMwx9sabQLpfGGxDKs8VZoxrG2mW5K1KCfMUjTwL7
         YkFQ8nQOCRDIVoIfMhgMuJzS1XqvCpVixupa1jv4l8Dr0D0FrXNOig98MBtSiodhDCv0
         PcyaWVwylpCQOwig0WMKBQjrd8AmDifmS1FxYwZ5I3WOlF+7Y9L3YihX5SnIWYDgalQS
         3lqbCNQ/GZg32Mj368TUkEhzUAyiAdG7NsM+AdbtbTdm12oVGvV0Is2xwtjfQzWxjDDA
         qosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691616; x=1773296416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hliTMbHec+fNIrJjOtbtu2t/Askctyi2K2dwWjRlgFc=;
        b=DeKhhSgtT1duNeEqgUB7P6rOdGcQFXqJ8lg0lyLgBD5n5KzjM77Cu0bQPGK+90FkAB
         XKVPBT9crM36kDaetSd0WRcnBg8rLxT1PRN9hn7MJx4wLnYV/FigvdAT7FHEBLqFtxbk
         +LFLiQ8i3idAPuPe/BgeU/Ho2h+95XfNC9/ZRNX6GTfSQ4q51RLQx4qxrE4Bu6UQ11PZ
         CU0erzAoYNIOihdbdbi+8nM3sNwWqD7oz3UKSI7NMetXibtvb+YeJjXqAcXDoGKJ5emg
         BFn94jdd+lX6B6kLXN2MExjZkGk9ziUf59//e4qDxI3XFHF6fvGfYi40tkNjKCht4ngw
         aDLw==
X-Gm-Message-State: AOJu0YxfxcffeJee4lg8UXUjvPFQPzVA509pFLpf77TRTnde+xY7teXX
	91TgHQxhrF6dJSAFg4KtIUjkNwOfstK6xPDLmktKfyWP87efopROWDm5+XEcBtXpZTq6Msegs9i
	MiVS2Aaf9dl3jfKHC7DXLEy7Q7v7LbBn1VrLL9Rs=
X-Gm-Gg: ATEYQzx29iL9c52pVyftGcWxX+vCM7bB0AZuEvKkgCyUymUqfAu3ugMYvsUPauAPJkJ
	RzsgLFznRHV0RVBydsmjiKqfZTZv/1iX4rwYgu9Ap0c2H3xRQrk4xvuCzhs2AJrQDDVANYndOwi
	Wt3LmwPPJvQ1Uj6uwJXok5uuf8Iy/8wOidDUS19BldxiRfN5t3lV6qCNgFlA0VxHfeMmCud7nbv
	8k5B3rckdsaLN7doaGX4uts9oc4VqMq/GaVnAgGqUKpu5aNTSF2G9nrCMlqQeiX1O1TzIUMzsp3
	tr+7Pzno2RSQMXLoaAOyAulH8KJPL2wyPSg7WEYZn5gTQHWQikWUaOBc7ysOIDaEFU1c/SKgtHj
	xIQQPZgPfRpFVaExA5CjMbcwE
X-Received: by 2002:a53:ece4:0:b0:64c:9bc9:307f with SMTP id
 956f58d0204a3-64cf9bb0fecmr2981306d50.42.1772691615803; Wed, 04 Mar 2026
 22:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260304090519.14820-1-gitbeam@proton.me>
In-Reply-To: <20260304090519.14820-1-gitbeam@proton.me>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Mar 2026 22:19:49 -0800
X-Gm-Features: AaiRm52o8W9HftPKuDWap58cZwQM3XRVbFrizwPS8RRjnlXK8vcnIfuFxci4FBI
Message-ID: <CAMKF1sqTYK2R+y6yP_cJEOZE73+Lgy-tquPUsFhjR=VrfK9t=w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
To: gitbeam@gmail.com
Cc: openembedded-devel@lists.openembedded.org, G B <gitbeam@proton.me>
Content-Type: multipart/alternative; boundary="0000000000000e6d09064c40ee00"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124861

--0000000000000e6d09064c40ee00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to configure with error

| Unknown option: '--enable-debug-gdb'

for more details See

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5616082/raw_inlin=
e



On Wed, Mar 4, 2026 at 1:08=E2=80=AFAM G B via lists.openembedded.org <gitb=
eam=3D
gmail.com@lists.openembedded.org> wrote:

> Upgrade to latest upstream release 1.2.4.
>
> Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html
>
> Signed-off-by: G B <gitbeam@proton.me>
> ---
>  .../ntpsec/{ntpsec_1.2.2a.bb =3D> ntpsec_1.2.4.bb}   | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb =3D>
> ntpsec_1.2.4.bb} (88%)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> similarity index 88%
> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 872d1ce4f7..057f6582f9 100644
> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> @@ -2,12 +2,12 @@ SUMMARY =3D "The Network Time Protocol suite, refactore=
d"
>  HOMEPAGE =3D "https://www.ntpsec.org/"
>
>  LICENSE =3D "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSES/BSD-2;md5=3D653830da7b770a32f6f50f6107e0b186 \
> -
> file://LICENSES/BSD-3;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \
> -
> file://LICENSES/CC-BY-4.0;md5=3D2ab724713fdaf49e4523c4503bfd068d \
> -
> file://LICENSES/MIT;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \
> -
> file://LICENSES/NTP;md5=3Dcb56b7747f86157c78ca81f224806694"
> -
> +LIC_FILES_CHKSUM =3D
> "file://LICENSES/BSD-2-Clause.txt;md5=3D653830da7b770a32f6f50f6107e0b186 =
\
> +
> file://LICENSES/BSD-3-Clause.txt;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \
> +
> file://LICENSES/CC-BY-4.0.txt;md5=3D2ab724713fdaf49e4523c4503bfd068d \
> +
> file://LICENSES/MIT.txt;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \
> +
> file://LICENSES/NTP.txt;md5=3Dcb56b7747f86157c78ca81f224806694"
> +
>  DEPENDS +=3D "bison-native \
>              openssl \
>              python3"
> @@ -17,7 +17,7 @@ SRC_URI =3D "
> https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
>             file://0001-wscript-Add-BISONFLAGS-support.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2aea118a62f0a3226950e"
> +SRC_URI[sha256sum] =3D
> "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
>
>  UPSTREAM_CHECK_URI =3D "ftp://ftp.ntpsec.org/pub/releases/"
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124843):
> https://lists.openembedded.org/g/openembedded-devel/message/124843
> Mute This Topic: https://lists.openembedded.org/mt/118129522/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000e6d09064c40ee00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to configure with error<div><br></div><div>| Unknown=
 option: &#39;--enable-debug-gdb&#39;<br></div><div><br></div><div>for more=
 details See</div><div><br></div><div><a href=3D"https://autobuilder.yoctop=
roject.org/valkyrie/api/v2/logs/5616082/raw_inline">https://autobuilder.yoc=
toproject.org/valkyrie/api/v2/logs/5616082/raw_inline</a></div><div><br></d=
iv><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 4, 2026 at 1:08=E2=80=
=AFAM G B via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;gitbeam=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">g=
mail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Upgrade to latest upstream release 1.2.4.<=
br>
<br>
Release notes: <a href=3D"https://blog.ntpsec.org/2025/04/18/version-1.2.4.=
html" rel=3D"noreferrer" target=3D"_blank">https://blog.ntpsec.org/2025/04/=
18/version-1.2.4.html</a><br>
<br>
Signed-off-by: G B &lt;<a href=3D"mailto:gitbeam@proton.me" target=3D"_blan=
k">gitbeam@proton.me</a>&gt;<br>
---<br>
=C2=A0.../ntpsec/{<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ntpsec_1.2.2a.bb</a> =3D&gt; <a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a>}=C2=A0 =C2=A0=
| 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/ntpsec/{<a href=3D"http://ntps=
ec_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> =3D=
&gt; <a href=3D"http://ntpsec_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank=
">ntpsec_1.2.4.bb</a>} (88%)<br>
<br>
diff --git a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpse=
c_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> b/me=
ta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
similarity index 88%<br>
rename from meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec=
_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
rename to meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
index 872d1ce4f7..057f6582f9 100644<br>
--- a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.2=
a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
+++ b/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
@@ -2,12 +2,12 @@ SUMMARY =3D &quot;The Network Time Protocol suite, refact=
ored&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.ntpsec.org/" rel=3D"norefer=
rer" target=3D"_blank">https://www.ntpsec.org/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;CC-BY-4.0 &amp; BSD-2-Clause &amp; NTP &amp; BSD-3-=
Clause &amp; MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSES/BSD-2;md5=3D653830da7b770a32f6f=
50f6107e0b186 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/BSD-3;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC-BY-4.0;md5=3D2ab724713fdaf49e4523c4503bfd068d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/MIT;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/NTP;md5=3Dcb56b7747f86157c78ca81f224806694&quot;<br>
-<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES/BSD-2-Clause.txt;md5=3D653830da=
7b770a32f6f50f6107e0b186 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/BSD-3-Clause.txt;md5=3D55e9dcf6a625a2dcfcda4ef6a647fbfd \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/CC-BY-4.0.txt;md5=3D2ab724713fdaf49e4523c4503bfd068d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/MIT.txt;md5=3D5a9dfc801af3eb49df2055c9b07918b2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/NTP.txt;md5=3Dcb56b7747f86157c78ca81f224806694&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
=C2=A0DEPENDS +=3D &quot;bison-native \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0openssl \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python3&quot;<br>
@@ -17,7 +17,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.ntpsec.org/pub/r=
eleases/ntpsec-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https=
://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-wscript-Add-BISONFLAG=
S-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;e0ce93af222a0a9860e6f5a51aadba9bb5ca601d80b2a=
ea118a62f0a3226950e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;443e54a6149d1b0bf08677d17b18fced9028b101fc2ff=
d2c81e0834f87eebc7d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.ntpsec.org/pub/rele=
ases/" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.ntpsec.org/pub/releas=
es/</a>&quot;<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124843): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124843" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124843</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118129522/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118129522/1997914</a><br>
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

--0000000000000e6d09064c40ee00--

