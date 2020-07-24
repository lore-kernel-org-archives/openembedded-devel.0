Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.6194.1595597240600348667
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 06:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FqK3Dd+T;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id r13so119792ilt.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ftUimovvknHZjDxceHxLriKERQVmHGlozIqdo0uNC3o=;
        b=FqK3Dd+TC9xPJL4YYAU0n5c3O1qzwayOHpkma1YhFWTJlC0Sv/hPepfkfZA2M5rLtc
         Ziuso0R9B0m++JsTDzeHXbNoPZFPNMoNMeSboVBw2sphL4kDeBSw+H9l7x4/5Z4zqbjz
         NLV4hPHJ6vQJ6TD6ozWp0u49pknOqPLm1rHJPSP557SE2MhVH5dw8rfAGRGYEW3g3mBV
         gYR93nr9Cqu4PccUNN1+P6QQeiLVnlKgWKGrl71RNyufZYRgF0NodNU/RAyrENSs3k21
         Nv49JsvL5noZAQS+xJm0JXDchkRXHWJNAhPpwkOnPAM1a+ixQMdppLA1cxLobM/ppIN0
         qL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ftUimovvknHZjDxceHxLriKERQVmHGlozIqdo0uNC3o=;
        b=lVrVwu9Br0CQxnj/6xa0KyCpomnq0iaqiRPdAe2wvT4Ikg81dKAHJJI+ax+GvC8hwD
         8Vs34bi5nVdWSsGYW644iKaPJLuqVYpQ0py4iv5jg178QMEkvETTcyviOftTnY6V6jFH
         cyuuEuYtMWDGDANWVWDW/SXxi4pnKcTbQShv7omWCR++u/U4B+HAj/ZatXLTBf3S1VCR
         3yyjFJw78YSveTxT/BfyxtkMNIqi40GTcRVNhwDQ+HFyNg2svkQD5Sjs4NwVUZE3ojuv
         E1r4C5hEihF1EgRDdvHlDqRvE772bYYx3KV48sMSP8potko/wQs5RtMIPZfLM0TzDgUV
         q0xw==
X-Gm-Message-State: AOAM5307AZXxttvU05f4YD1muZA71ORn0q4h8dgfQQN3cCsymDIEDcuj
	wS+1UXUNuaerttEdVip5ZXUwLVSuyEFMizu7O0c=
X-Google-Smtp-Source: ABdhPJwP0B/Gsr3T7X4ku7YVFZ+BRYFovequqzLncBuHNTEOGhiiTSQdU0SXDQ3gOPtECy4XSmN97EmLB6OAS7BB3rw=
X-Received: by 2002:a92:bf0c:: with SMTP id z12mr9832754ilh.151.1595597239824;
 Fri, 24 Jul 2020 06:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200724103515.21420-1-leon.anavi@konsulko.com> <20200724103515.21420-5-leon.anavi@konsulko.com>
In-Reply-To: <20200724103515.21420-5-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 24 Jul 2020 06:27:09 -0700
Message-ID: <CANx9H-AKh=EEyr6JniUvH9FLysN6rC-ftenFSnxYN9fdeQdWSw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/7] python3-urllib3: Upgrade 1.25.9 -> 1.25.10
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af37c505ab2fee03"

--000000000000af37c505ab2fee03
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 3:35 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Upgarde to release 1.25.10:

Typo: Upgarde -> Upgrade


>
> * Added support for ``SSLKEYLOGFILE`` environment variable for
>   logging TLS session keys with use with programs like
>   Wireshark for decrypting captured web traffic
> * Fixed loading of SecureTransport libraries on macOS Big Sur
>   due to the new dynamic linker cache
> * Collapse chunked request bodies data and framing into one
>   call to ``send()`` to reduce the number of TCP packets by 2-4x
> * Don't insert ``None`` into ``ConnectionPool`` if the pool
>   was empty when requesting a connection
> * Avoid ``hasattr`` call in ``BrotliDecoder.decompress()``
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-urllib3_1.25.9.bb => python3-urllib3_1.25.10.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.9.bb =>
> python3-urllib3_1.25.10.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> index 8cbc1f9f9..db985a2ff 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.10.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
>
> -SRC_URI[md5sum] = "dbf9b868b90880b24b1ac278094e912e"
> -SRC_URI[sha256sum] =
> "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527"
> +SRC_URI[md5sum] = "94e3d4d472a14e788d4bd1a903fd102b"
> +SRC_URI[sha256sum] =
> "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
>
>  inherit pypi setuptools3
>
> --
> 2.17.1
>
> 
>

--000000000000af37c505ab2fee03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 24, 2020 at 3:35 AM Leon Anavi &lt;<a href=3D"=
mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Upgarde to release 1.25.10:</blockquote=
><div dir=3D"auto">Typo: Upgarde -&gt; Upgrade</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
<br>
* Added support for ``SSLKEYLOGFILE`` environment variable for<br>
=C2=A0 logging TLS session keys with use with programs like<br>
=C2=A0 Wireshark for decrypting captured web traffic<br>
* Fixed loading of SecureTransport libraries on macOS Big Sur<br>
=C2=A0 due to the new dynamic linker cache<br>
* Collapse chunked request bodies data and framing into one<br>
=C2=A0 call to ``send()`` to reduce the number of TCP packets by 2-4x<br>
* Don&#39;t insert ``None`` into ``ConnectionPool`` if the pool<br>
=C2=A0 was empty when requesting a connection<br>
* Avoid ``hasattr`` call in ``BrotliDecoder.decompress()``<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-urllib3_1.25.9.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-urllib3_1.25.9.bb</a> =3D&gt; <a href=3D"http://=
python3-urllib3_1.25.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-ur=
llib3_1.25.10.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-urllib3_1.25.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1=
.25.9.bb</a> =3D&gt; <a href=3D"http://python3-urllib3_1.25.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-urllib3_1.25.10.bb</a>} (79%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-urllib3_1.25.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.=
25.9.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-urllib3_1.25.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1=
.25.10.bb</a><br>
similarity index 79%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-=
urllib3_1.25.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.2=
5.9.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ur=
llib3_1.25.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.25=
.10.bb</a><br>
index 8cbc1f9f9..db985a2ff 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-urllib=
3_1.25.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.25.9.bb=
</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-urllib=
3_1.25.10.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_1.25.10.=
bb</a><br>
@@ -3,8 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/shazow/ur=
llib3" rel=3D"noreferrer" target=3D"_blank">https://github.com/shazow/urlli=
b3</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D65715c2eb961313d=
71b297dd5a04f85e&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;dbf9b868b90880b24b1ac278094e912e&quot;<br>
-SRC_URI[sha256sum] =3D &quot;3018294ebefce6572a474f0604c2021e33b3fd8006ec=
d11d62107a5d2a963527&quot;<br>
+SRC_URI[md5sum] =3D &quot;94e3d4d472a14e788d4bd1a903fd102b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;91056c15fa70756691db97756772bb1eb9678fa585d9=
184f24534b100dc60f4a&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000af37c505ab2fee03--
