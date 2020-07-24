Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.6178.1595597527375368762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 06:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t2n48Xx1;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id q75so1620719iod.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QC8JqjBqqJ2eY4YTJmg+zfb3QPOUPlxKjLOa2/nK/NY=;
        b=t2n48Xx1jIrdF9sCsoIfawTsB+cLEgaOQOG8pcOsds1KmNRNGDAGh9r6gY0MFHosEs
         um1gTEaj51hyqiAhOKI/XVukjMoRyVk4HayDcBdijrmwy0rjhPhfVYu/n+lEFkNJLOAD
         7Tf8XRO5Cbvr4VtOYy/jRbdETdjMHYWZ9g14WluFiFwtuTF5UrMG7QQCnaofzBJCa7xD
         w6h2b3TYMKfI4gmeX6TZ07XUgVJLRCjhKAMriU+2vhq7naGc5dkdMS2Qucsimve3Io36
         KUK/Z3KlXxhwJ63yqPtafzqIpl5fM0FDx/dZlsuZRjRVb9FqXQsKdWl2A+i4NTR4aC+o
         cMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QC8JqjBqqJ2eY4YTJmg+zfb3QPOUPlxKjLOa2/nK/NY=;
        b=XIzJW8Vtz6kEnKj6oZhhwt5+zDEq9fyOvfwvdNvgqGNPthJ4f3BKRuWLDBzRwiY7+3
         +wzvojpw1EtrCv8dl/70bZ/YoHpcFfC9KuNwean/ePsB/BgrsTWMlcPAbJoJR3nSKT/1
         EDyBYjGKI/yTfOVe5UTcSR5X1XG6HsnJFOoj7QWyLvJywciU1Xr231LIy3oi6CHT2PJT
         aVeJg5fUMRHFRfBflv7//7TyQbvlzqGTaxgHU1vUrsxEio2mnjhMW+m4EgIJ+X+ZCfMD
         t1fXssjwVF9CSY7cIgf6QHx7DaUg2UG3yfPFZRKa0gT4stGrvQW2O5mLRnSeOdwxRxwS
         dg4Q==
X-Gm-Message-State: AOAM5308SfHlQM/o0paUt0KFG04A5dMzyMqDFDDn9Xkp+swp9tHAUDfw
	eL7fpHmQeB9G4dbWidLvHQTDvQbZXOnmMKPEaWk=
X-Google-Smtp-Source: ABdhPJyN/SIKEGRiG21UxT75rtykaAI+BQbKEMYfgHhvIQQSz3I1OdfrkaT/sG4JmD6txfAbOHl8sO+UJrTBQPbGbWI=
X-Received: by 2002:a05:6638:305:: with SMTP id w5mr11182462jap.10.1595597526654;
 Fri, 24 Jul 2020 06:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200724103515.21420-1-leon.anavi@konsulko.com> <20200724103515.21420-7-leon.anavi@konsulko.com>
In-Reply-To: <20200724103515.21420-7-leon.anavi@konsulko.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 24 Jul 2020 06:31:55 -0700
Message-ID: <CANx9H-A41PZrWzGFtG0tycV2z26onespUJUz_JmGzMO-a+DYVg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-matplotlib: Upgrade 3.2.2 -> 3.3.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7e43605ab2fffcf"

--000000000000c7e43605ab2fffcf
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2020 at 3:35 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Upgrade to release 3.3.0:
>
> - Provisional API for composing semantic axes layouts from text
>   or nested lists
> - New Axes.sharex, Axes.sharey methods
> - Turbo colormap
> - colors.BoundaryNorm supports extend keyword argument
> - Text color for legend labels
> - Pcolor and Pcolormesh now accept shading='nearest' and 'auto'
> - Allow tick formatters to be set with str or function inputs
> - New Axes.axline method
> - Dates use a modern epoch
> - Improved font weight detection
> - Axes3D no longer distorts the 3D plot to match the 2D aspect
>   ratio
> - More consistent toolbar behavior across backends
> - Toolbar icons are now styled for dark themes
> - Cursor text now uses a number of significant digits matching
>   pointing precision
> - Functions to compute a Path's size
> - savefig() gained a backend keyword argument
> - Saving SVG now supports adding metadata
> - Saving PDF metadata via PGF now consistent with PDF backend
> - NbAgg and WebAgg no longer use jQuery & jQuery UI
>
> Create setup.cfg with configuration to use the copy of FreeType
> installed on the system.
>
> Please use the tag
License-Update:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

The line and the checksum of the license in setup.py has changed
> but the license remains the same.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...atplotlib_3.2.2.bb => python3-matplotlib_3.3.0.bb} | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-matplotlib_3.2.2.bb
> => python3-matplotlib_3.3.0.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-matplotlib_3.2.2.bb b/meta-python/recipes-devtools/python/
> python3-matplotlib_3.3.0.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/
> python3-matplotlib_3.2.2.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> index b32177d9b..2e88efb56 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>  SECTION = "devel/python"
>  LICENSE = "PSF"
>  LIC_FILES_CHKSUM = "\
> -
> file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753
> \
> +
> file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353
> \
>      file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>  "
>  DEPENDS = "\
> @@ -18,8 +18,8 @@ DEPENDS = "\
>      python3-pytz-native \
>  "
>
> -SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
> -SRC_URI[sha256sum] =
> "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
> +SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
> +SRC_URI[sha256sum] =
> "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
>
>  inherit pypi setuptools3 pkgconfig
>
> @@ -34,4 +34,9 @@ RDEPENDS_${PN} = "\
>      python3-pytz \
>  "
>
> +do_compile_prepend() {
> +    echo [libs] > ${S}/setup.cfg
> +    echo system_freetype = true >> ${S}/setup.cfg
> +}
> +
>  BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> 
>

--000000000000c7e43605ab2fffcf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 24, 2020 at 3:35 AM Leon Anavi &lt;<a href=3D"=
mailto:leon.anavi@konsulko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">Upgrade to release 3.3.0:<br>
<br>
- Provisional API for composing semantic axes layouts from text<br>
=C2=A0 or nested lists<br>
- New Axes.sharex, Axes.sharey methods<br>
- Turbo colormap<br>
- colors.BoundaryNorm supports extend keyword argument<br>
- Text color for legend labels<br>
- Pcolor and Pcolormesh now accept shading=3D&#39;nearest&#39; and &#39;au=
to&#39;<br>
- Allow tick formatters to be set with str or function inputs<br>
- New Axes.axline method<br>
- Dates use a modern epoch<br>
- Improved font weight detection<br>
- Axes3D no longer distorts the 3D plot to match the 2D aspect<br>
=C2=A0 ratio<br>
- More consistent toolbar behavior across backends<br>
- Toolbar icons are now styled for dark themes<br>
- Cursor text now uses a number of significant digits matching<br>
=C2=A0 pointing precision<br>
- Functions to compute a Path&#39;s size<br>
- savefig() gained a backend keyword argument<br>
- Saving SVG now supports adding metadata<br>
- Saving PDF metadata via PGF now consistent with PDF backend<br>
- NbAgg and WebAgg no longer use jQuery &amp; jQuery UI<br>
<br>
Create setup.cfg with configuration to use the copy of FreeType<br>
installed on the system.<br>
<br>
</blockquote><div dir=3D"auto">Please use the tag</div><div dir=3D"auto">L=
icense-Update:</div><div dir=3D"auto"><div><a href=3D"https://www.openembed=
ded.org/wiki/Commit_Patch_Message_Guidelines">https://www.openembedded.org/=
wiki/Commit_Patch_Message_Guidelines</a></div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>The line and the checksum of the license in setup.py has changed<br>
but the license remains the same.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://atplotlib_3.2.2.bb" rel=3D"noreferrer" target=
=3D"_blank">atplotlib_3.2.2.bb</a> =3D&gt; <a href=3D"http://python3-matpl=
otlib_3.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.3=
.0.bb</a>} | 11 ++++++++---<br>
=C2=A01 file changed, 8 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python=
3-matplotlib_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplot=
lib_3.2.2.bb</a> =3D&gt; <a href=3D"http://python3-matplotlib_3.3.0.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.3.0.bb</a>} (70%)<b=
r>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-matplotlib_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotl=
ib_3.2.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-matplotlib_3.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-matp=
lotlib_3.3.0.bb</a><br>
similarity index 70%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-=
matplotlib_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotli=
b_3.2.2.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-ma=
tplotlib_3.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_=
3.3.0.bb</a><br>
index b32177d9b..2e88efb56 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplo=
tlib_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.2.=
2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-matplo=
tlib_3.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-matplotlib_3.3.=
0.bb</a><br>
@@ -7,7 +7,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/matplotli=
b/matplotlib" rel=3D"noreferrer" target=3D"_blank">https://github.com/matpl=
otlib/matplotlib</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;PSF&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;\<br>
-=C2=A0 =C2=A0 file://setup.py;beginline=3D253;endline=3D253;md5=3D2a11462=
0e4e6843aa7568d5902501753 \<br>
+=C2=A0 =C2=A0 file://setup.py;beginline=3D251;endline=3D251;md5=3De0ef37d=
e7122ce842bcd1fb54482b353 \<br>
=C2=A0 =C2=A0 =C2=A0file://LICENSE/LICENSE;md5=3Dafec61498aa5f0c45936687da=
9a53d74 \<br>
=C2=A0&quot;<br>
=C2=A0DEPENDS =3D &quot;\<br>
@@ -18,8 +18,8 @@ DEPENDS =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytz-native \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;b60cd68f792a30173d825e16482aedd8&quot;<br>
-SRC_URI[sha256sum] =3D &quot;3d77a6630d093d74cbbfebaa0571d00790966be1ed20=
4e4a8239f5cbd6835c5d&quot;<br>
+SRC_URI[md5sum] =3D &quot;b1de7185687c6f5c092689e3431a69b3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;24e8db94948019d531ce0bcd637ac24b1c8f6744ac86=
d2aa0eb6dbaeb1386f82&quot;<br>
<br>
=C2=A0inherit pypi setuptools3 pkgconfig<br>
<br>
@@ -34,4 +34,9 @@ RDEPENDS_${PN} =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-pytz \<br>
=C2=A0&quot;<br>
<br>
+do_compile_prepend() {<br>
+=C2=A0 =C2=A0 echo [libs] &gt; ${S}/setup.cfg<br>
+=C2=A0 =C2=A0 echo system_freetype =3D true &gt;&gt; ${S}/setup.cfg<br>
+}<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000c7e43605ab2fffcf--
