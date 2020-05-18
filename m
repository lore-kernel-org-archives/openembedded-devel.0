Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.44224.1589814633765246655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 08:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLLvrwxA;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id i5so10353436qkl.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6TI80X/qnwo/eeBD4EbfKwqIUtXdPkCj07hKNLFDzY8=;
        b=hLLvrwxATLdfzlV8zhsb83xDffYd3CDGp5o3uprp+7t3EWidxeBOyfDe8T221KdzD5
         KeENLNdzGCmZhvjAcYmtQO13lFHuojNApkn0zgTrah8Egmma1iYy8jVcFsnRCnM7lVqG
         0SaOsbfzd6faTxp7edA4sUkH9fcvvykCAJblAZPWUqY6RwHlS+p5VWaWj2tSKhBpHNP4
         GmPVITbwwrk+If/639l1IlrQasnbD20QEWX3yodCdXHy4+MLILJ+ZBFEZzEwrlqiVT+b
         uUvf4J6JRrV+Jlbt13zgnTDczdoc9/FRxSZ7MOiSjN3thEGKMZalG0JAOMkp3r/Gch8m
         uZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TI80X/qnwo/eeBD4EbfKwqIUtXdPkCj07hKNLFDzY8=;
        b=jRAnAFcVPuEYHr0mg63Wc8BtZG7gMDgmNf2PN9PkVLLa7LGV5fM4SC7DPLjdtGhv/i
         fxLztQuKky5I/xACbBvAn43344lw5ecrc5XzSIScQnHGNbhkmzd2pcNqcmsvkypS1HSa
         cFRxLk8HZR1yojrpFtBPd4idjq/jXxjMkpf/flIilRl5Mk/2UjV11lbO8W9JWuFImYfM
         Iy8a2GsbJImAJt5IFDxucEBnBkcvg5Z6tiU/iaRecuFOpLEVVH318K1QkhesByvckA6k
         Cn2k8w1+pJV09lnOCCj/7ATxqjAY28jkglHVU90i896Sa65tDtR18F14dccsTgIw7Du9
         wuZg==
X-Gm-Message-State: AOAM530H0AfJmUZAQv8ExnQputPdLUgALcqFkHFv2Jr6sNFnXJI5v51g
	2eB41Z/37QTiXslLqxFe6tWCGFtwv1dWTTQ+wDDYPIjG
X-Google-Smtp-Source: ABdhPJwVCri4dr0bkTd3wN9M+wdVIoM0zISy092VylenYZON0T5GShAfY61AJ2i4aQztuJp+W4Yxyjul36tbRgITcGg=
X-Received: by 2002:a37:7143:: with SMTP id m64mr17321922qkc.215.1589814632772;
 Mon, 18 May 2020 08:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200518121021.11057-1-bunk@stusta.de>
In-Reply-To: <20200518121021.11057-1-bunk@stusta.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 18 May 2020 08:10:21 -0700
Message-ID: <CAMKF1spFsuS3PTwzT8-m071-Y_DsGVcCdiwAr-Q1Q8qejsfHFg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] unicode-ucd: Remove pointless license check
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071fa4405a5ed90a4"

--00000000000071fa4405a5ed90a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 5:10 AM Adrian Bunk <bunk@stusta.de> wrote:

> WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismatch for local fil=
e
> /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html
> Cleaning and trying again.
> WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming
> /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org.license.html to
> /home/bunk/yoctomaster/yocto-tmp/downloads/unicode.org
> .license.html_bad-checksum_e9dd7d435db23241be3be21b5fca729b5cf883c8c039a=
70ea093031420d06abb
> WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered wi=
th
> download of
> https://www.unicode.org/license.html;name=3Dlicense;subdir=3Dunicode-ucd=
-12.1.0;downloadfilename=3Dunicode.org.license.html
> - will attempt other sources if available
>
> This downloaded a license file from upstream.
> The upstream file did not match (copyright year changed).
> A stale copy was downloaded from a mirror instead and checked.
> The stale file with known contents never changes.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> index 89ab565ce..dc1251777 100644
> --- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> +++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_12.1.0.bb
> @@ -1,18 +1,15 @@
>  SUMMARY =3D "Unicode Character Database"
>  HOMEPAGE =3D "https://unicode.org/ucd/"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://unicode.org.license.html;beginline=3D42;endline=3D85;md5=3D67619=
d0c52706853c0256514e7fd04cd"
> +
> +ERROR_QA_remove =3D "license-checksum"


Isn=E2=80=99t there any other file in archive to checksum ?
If not perhaps add one or compare against the MIT template from licenses
from OE-core having no entry can trip post processing tools


>
>  SRC_URI =3D " \
>
> https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdir=3D=
ucd \
> -
> https://www.unicode.org/license.html;name=3Dlicense;subdir=3D${BP};downl=
oadfilename=3Dunicode.org.license.html
> \
>  "
>  SRC_URI[ucd.md5sum] =3D "430cbdac2615451571dd69a976dd08f6"
>  SRC_URI[ucd.sha256sum] =3D
> "25ba51a0d4c6fa41047b7a5e5733068d4a734588f055f61e85f450097834a0a6"
>
> -SRC_URI[license.md5sum] =3D "f03bafb623258f85ff2032c1ce567b7c"
> -SRC_URI[license.sha256sum] =3D
> "983225207de8a707d0903a8d70fb7a4b28c5e0f64f2366e84a6192a2d618fed4"
> -
>  inherit allarch
>
>  do_configure[noexec] =3D "1"
> --
> 2.17.1
>
>=20
>

--00000000000071fa4405a5ed90a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 18, 2020 at 5:10 AM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum mismat=
ch for local file /home/bunk/yoctomaster/yocto-tmp/downloads/<a href=3D"htt=
p://unicode.org" target=3D"_blank">unicode.org</a>.license.html<br>
Cleaning and trying again.<br>
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Renaming /home/bunk/yoctomaster/y=
octo-tmp/downloads/<a href=3D"http://unicode.org" target=3D"_blank">unicode=
.org</a>.license.html to /home/bunk/yoctomaster/yocto-tmp/downloads/<a href=
=
=3D"http://unicode.org" target=3D"_blank">unicode.org</a>.license.html_bad=
-checksum_e9dd7d435db23241be3be21b5fca729b5cf883c8c039a70ea093031420d06abb<=
br>
WARNING: unicode-ucd-12.1.0-r0 do_fetch: Checksum failure encountered with=
 download of <a href=3D"https://www.unicode.org/license.html;name=3Dlicense=
;subdir=3Dunicode-ucd-12.1.0;downloadfilename=3Dunicode.org.license.html" r=
el=3D"noreferrer" target=3D"_blank">https://www.unicode.org/license.html;na=
me=3Dlicense;subdir=3Dunicode-ucd-12.1.0;downloadfilename=3Dunicode.org.lic=
ense.html</a> - will attempt other sources if available<br>
<br>
This downloaded a license file from upstream.<br>
The upstream file did not match (copyright year changed).<br>
A stale copy was downloaded from a mirror instead and checked.<br>
The stale file with known contents never changes.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D=
"_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/unicode-ucd/<a href=3D"http://unicode-ucd_12=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_12.1.0.bb</a> | 7=
 ++-----<br>
=C2=A01 file changed, 2 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/unicode-ucd/<a href=3D"http://unicode=
-ucd_12.1.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_12.1.0.bb<=
/a> b/meta-oe/recipes-support/unicode-ucd/<a href=3D"http://unicode-ucd_12.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_12.1.0.bb</a><br>
index 89ab565ce..dc1251777 100644<br>
--- a/meta-oe/recipes-support/unicode-ucd/<a href=3D"http://unicode-ucd_12=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_12.1.0.bb</a><br>
+++ b/meta-oe/recipes-support/unicode-ucd/<a href=3D"http://unicode-ucd_12=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">unicode-ucd_12.1.0.bb</a><br>
@@ -1,18 +1,15 @@<br>
=C2=A0SUMMARY =3D &quot;Unicode Character Database&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://unicode.org/ucd/" rel=3D"noref=
errer" target=3D"_blank">https://unicode.org/ucd/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://unicode.org.license.html;beginline=3D42=
;endline=3D85;md5=3D67619d0c52706853c0256514e7fd04cd&quot;<br>
+<br>
+ERROR_QA_remove =3D &quot;license-checksum&quot;</blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">Isn=E2=80=99t there any other file in arc=
hive to checksum ?</div><div dir=3D"auto">If not perhaps add one or compare=
 against the MIT template from licenses from OE-core having no entry can tr=
ip post processing tools=C2=A0</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.unicode.org/Public/zipped/$%7BP=
V%7D/UCD.zip;name=3Ducd;subdir=3Ducd" rel=3D"noreferrer" target=3D"_blank">=
https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=3Ducd;subdir=3Ducd=
</a> \<br>
-=C2=A0 =C2=A0 <a href=3D"https://www.unicode.org/license.html;name=3Dlice=
nse;subdir=3D$%7BBP%7D;downloadfilename=3Dunicode.org.license.html" rel=3D"=
noreferrer" target=3D"_blank">https://www.unicode.org/license.html;name=3Dl=
icense;subdir=3D${BP};downloadfilename=3Dunicode.org.license.html</a> \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[ucd.md5sum] =3D &quot;430cbdac2615451571dd69a976dd08f6&quot;=
<br>
=C2=A0SRC_URI[ucd.sha256sum] =3D &quot;25ba51a0d4c6fa41047b7a5e5733068d4a7=
34588f055f61e85f450097834a0a6&quot;<br>
<br>
-SRC_URI[license.md5sum] =3D &quot;f03bafb623258f85ff2032c1ce567b7c&quot;<=
br>
-SRC_URI[license.sha256sum] =3D &quot;983225207de8a707d0903a8d70fb7a4b28c5=
e0f64f2366e84a6192a2d618fed4&quot;<br>
-<br>
=C2=A0inherit allarch<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000071fa4405a5ed90a4--
