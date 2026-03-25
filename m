Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C0B109E525
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 22:18:04 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30651.1774463934989748902
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 11:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nmv8NyWz;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: gitbeam@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ea36b56b7so162560fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 11:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774463934; cv=none;
        d=google.com; s=arc-20240605;
        b=BXzf2oArZcvqV8um76FELdPrUxfAkyUveYX//iu0n+59E1M2EXwS9sVX6s5RuN/mF8
         rA1+ESSfgjfx2lj0g/87uLpdvGz5XBbZm75jJcs/x8lRCvohE3j6gWcsRlXhmu42f33/
         /hNnnkCZlupW9WISgvPMdQk0WbrG+XCMfceYusPv7CfgMDUqrNEKzgSczxRpPwWLBKJn
         hA4VApF63VKZr4FrlOvnb7JmvZZ6dVQghA5N+zdcH17zRr9Fk8qGNIBmecpgOJLWQ/28
         IZ33c1ek91O8MEildY9thmhyH6Cy+EGW4rtWU4Y3uQnL/yIQkAFT9Zz98+XFbeMFDymr
         9sxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=853SNAnXG7j3OcFIEI8rGz0uMAMBxYQ6aCu64fXb9SA=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=EZPdDnKtKBdTBm+9t+HEys9Zu1WEMyWl+cCb5uS1FlF3RwPmsOeBBwuFXTq9a3XS3J
         GZdQb2LY3Ddq8AQAGAOiqkvVo140emHJxjPF8wYirfOrlrQ9UiYkbFzAX3t+a07NkMjP
         MBHrV/GAkkpO7qfqhmbwqjkORhaw3+lC4iF62dNB2ZJ8HD499PVan5WIr/bLpSs8LC5o
         /XIR/OBaoizhIJVtpC0n7LniLpqQw+jPQ6oYs4eNwincjPNBy+MiTStYUNfZdIsvx+w5
         OnRvh21eixc4SDmJiphFdenh6J820uEBr01V1x0uJSSIDxkrll3XHT4CVpUdJWbxbjDw
         KZaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463934; x=1775068734; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=853SNAnXG7j3OcFIEI8rGz0uMAMBxYQ6aCu64fXb9SA=;
        b=Nmv8NyWzLNddla1KCwrK0xxbpIQRiu+KyUEnTdTInnZcUpuReBc2x0qB6pAwFvYiLe
         l0KphS95yP1WMk/V5E1H+NJ4ML0lGUEpTVh1aFHOYvsC2rdZ4muvQIITZEgQCitzG/kU
         MaF+01dKIE+5ZZrj9zCZnhlGvOgIWptPLn5mILAR4dyUEHtxFRl0w3fCOKuRri8lMpDD
         kbx6BmtCh64WoBrWMleS1VEc2BiFyZhe10frPxUYlSWsguqT8qmjS1xX3zo4ZveuJHeq
         Y5IAkekIXi6WfVKCdZdvEVhMm4nREJOUwd6bt6tAE5u+WQDJ0yRVqUYqBHw2w/QseQVO
         ysKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463934; x=1775068734;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=853SNAnXG7j3OcFIEI8rGz0uMAMBxYQ6aCu64fXb9SA=;
        b=Vc9+a7eyv2lRw+zbwIZNpvVbTm7XdGsyksTLtULJLpHFWpCG8WfNWaeANiysR4ZDcM
         uPifOCZ8K4Eh4K2SItVCrP5u7RzF00fuCrUSrZVnWXHN2UBs8C4jNEqky3VHxuDoWcwx
         2Wd18TaztAGdTClxUTa6a18wuIFR2pYevu+4gXYhklDgER/CCt/iTl+cX4d3Df67be5f
         DNibEC+6FfwyX4+gqdmEcujTL7q8Gnqj8GZgMdBQofox+B4YZ9iwu2ti9EwFHsIsJ7Ls
         j29uquSqfOu+8NFylVpQyEATKPyg6ivhpOoUBczfLmpIWcNd2g5VQA4Nd9Un+a+c2x+6
         /FYQ==
X-Gm-Message-State: AOJu0YxTnBobGYXb3cDaFshfn+fXSAVSlqeZa9HBN8GRxUvvJEd3TZhi
	+/9jmg2ABi/Ij80U6ao2ILopzOZack4t1D9RipXR+XZwkja7R77jOiwsMA0GXDfaYmEZsGiP5PQ
	dqlO+deigT1N+8RL9lnOsVTT4tzCupvpghGlxtysNrA==
X-Gm-Gg: ATEYQzzt3jXdz8J+i5qKnoQvOvat/4Zs7NKct0hbfpGJLEU0XkcOS5YV/5YSE9lyzD+
	bP1eK9daBbKxWtVzk/zJqQ4BTmK/DmGVyGMTHuQsHZ4efzOauxsVdr73fdYfcHBS/3KE20dxd+a
	5EYqp8q24iU4yvKV4pyfO8zT7QrevPuwHb+E/OFoFVcoDMKhwroZpUNZ8Er2UY0AKMzwc+ObY7N
	eue1QiN/qHsSSO1eqoNI7l1+sQCMhpLZ7ZTIw0kjWldrz6RJ1yyuiyrM3yr3m5+ihpLdkGjFcGk
	f96vnLhuVW6mGBQ2vrhi2/HsCFHXyesIMLfilr9JNG4yyo1LLQ5qUVq2ylqoJxD8y9Y=
X-Received: by 2002:a17:903:320b:b0:2ae:7efb:6068 with SMTP id
 d9443c01a7336-2b0b0987e2dmr52601695ad.7.1774463547369; Wed, 25 Mar 2026
 11:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260306215535.6619-1-gitbeam@proton.me>
In-Reply-To: <20260306215535.6619-1-gitbeam@proton.me>
From: git beam <gitbeam@gmail.com>
Date: Wed, 25 Mar 2026 19:32:16 +0100
X-Gm-Features: AaiRm51_UxTO-56x5bcsD6vISBEVz-0TQyE_I5FEVizBBpmDlEpOr3B3GdnUdLM
Message-ID: <CAEOi+Lt2wC78-QA9ykoNY4sW8jG=Kzun47sD6o3Em6D5nyOKUg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] ntpsec: upgrade 1.2.2a -> 1.2.4
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000686a43064ddd7dd4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 22:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125628

--000000000000686a43064ddd7dd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping =E2=80=93 any feedback on this patch would be appreciated.

On Fri, 6 Mar 2026 at 22:56, G B <gitbeam@gmail.com> wrote:

> Upgrade to latest upstream release 1.2.4.
>
> Release notes: https://blog.ntpsec.org/2025/04/18/version-1.2.4.html
>
> Signed-off-by: G B <gitbeam@proton.me>
> ---
>  .../{ntpsec_1.2.2a.bb =3D> ntpsec_1.2.4.bb}     | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>  rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.2a.bb =3D>
> ntpsec_1.2.4.bb} (86%)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> similarity index 86%
> rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.2a.bb
> rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 872d1ce4f7..9704e2d15e 100644
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
> @@ -63,7 +63,6 @@ EXTRA_OECONF =3D "--cross-compiler=3D'${CC}' \
>                  --pyshebang=3D${bindir}/python3 \
>                  --pythondir=3D${PYTHON_SITEPACKAGES_DIR} \
>                  --pythonarchdir=3D${PYTHON_SITEPACKAGES_DIR} \
> -                --enable-debug-gdb \
>                  --enable-early-droproot"
>
>  EXTRA_OEWAF_BUILD ?=3D "-v"
> @@ -89,6 +88,11 @@ do_install:append() {
>         else
>                 install -D -m 0644 ${T}/volatiles.ntpsec
> ${D}${sysconfdir}/default/volatiles/99_${BPN}
>         fi
> +
> +    if [ -d ${D}/usr/lib64 ]; then
> +        mv ${D}/usr/lib64/* ${D}${libdir}/
> +        rmdir ${D}/usr/lib64
> +    fi
>  }
>
>  PACKAGE_BEFORE_PN =3D "${PN}-python ${PN}-utils ${PN}-viz"
> --
> 2.47.3
>
>

--000000000000686a43064ddd7dd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Gentle ping =E2=80=93 any feedback on thi=
s patch would be appreciated.</div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 6 Mar 2026 at 22=
:56, G B &lt;<a href=3D"mailto:gitbeam@gmail.com">gitbeam@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade =
to latest upstream release 1.2.4.<br>
<br>
Release notes: <a href=3D"https://blog.ntpsec.org/2025/04/18/version-1.2.4.=
html" rel=3D"noreferrer" target=3D"_blank">https://blog.ntpsec.org/2025/04/=
18/version-1.2.4.html</a><br>
<br>
Signed-off-by: G B &lt;<a href=3D"mailto:gitbeam@proton.me" target=3D"_blan=
k">gitbeam@proton.me</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D"noreferrer" target=3D=
"_blank">ntpsec_1.2.2a.bb</a> =3D&gt; <a href=3D"http://ntpsec_1.2.4.bb" re=
l=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a>}=C2=A0 =C2=A0 =C2=A0=
| 20 +++++++++++--------<br>
=C2=A01 file changed, 12 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/ntpsec/{<a href=3D"http://ntps=
ec_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> =3D=
&gt; <a href=3D"http://ntpsec_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank=
">ntpsec_1.2.4.bb</a>} (86%)<br>
<br>
diff --git a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpse=
c_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a> b/me=
ta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
similarity index 86%<br>
rename from meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec=
_1.2.2a.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a><br>
rename to meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1=
.2.4.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
index 872d1ce4f7..9704e2d15e 100644<br>
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
@@ -63,7 +63,6 @@ EXTRA_OECONF =3D &quot;--cross-compiler=3D&#39;${CC}&#39;=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pyshebang=
=3D${bindir}/python3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pythondir=
=3D${PYTHON_SITEPACKAGES_DIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--pythonarchd=
ir=3D${PYTHON_SITEPACKAGES_DIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-debug-gdb=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-earl=
y-droproot&quot;<br>
<br>
=C2=A0EXTRA_OEWAF_BUILD ?=3D &quot;-v&quot;<br>
@@ -89,6 +88,11 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0644 =
${T}/volatiles.ntpsec ${D}${sysconfdir}/default/volatiles/99_${BPN}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 if [ -d ${D}/usr/lib64 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}/usr/lib64/* ${D}${libdir}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir ${D}/usr/lib64<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGE_BEFORE_PN =3D &quot;${PN}-python ${PN}-utils ${PN}-viz&quot;<=
br>
-- <br>
2.47.3<br>
<br>
</blockquote></div></div>

--000000000000686a43064ddd7dd4--

