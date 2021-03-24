Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1152.1616604152558782853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T4xSP3VF;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u5so33991053ejn.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zp7/C3k1Ag2huXiXSleN/4jrPiQaRLbBYUPg523UBRI=;
        b=T4xSP3VFIrP9rQjXNsLGbQG9rfhXZ+JXjYOMJYNk4b2c0ACclFWMp2LYsDLG+2k1nq
         AUZMgrRDyPNHTVX+/kMS+O4MccWcQaWzEILhn2dpVDrhWkHEFyimtVUkTMgDl1XeMA+A
         P8cLOoYLtSJLPe2fDzOcmnzKPoLTrMTTrTcmorHKXqSnk3MFpege/mg+m7piOUyHIf2o
         cjlFiXZMZxRKgf/0wyuGY/zPuFJN5JcRxL1yEs2/1TDbOhUKVwF6eq6br3HsuQU7nPK9
         EL9tzRR2gazl/ut74f+xigaIPV0TeQ6eWvylNYYGb4eGI4rxSn7jaRt4OyKQvU2wS24i
         CRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zp7/C3k1Ag2huXiXSleN/4jrPiQaRLbBYUPg523UBRI=;
        b=C4NfxplJdRimrDLL9zf2AkN/HvL8CHJvrcu9BF+EsF5rm0RfE38gVjar9NDuK7PHTN
         wnfZzpKqOBq1JB/s8XrKRjhhWJW/9AZY0bq7b7jBEjoyVbDpz0Lmz9xcwKwLXQCf+m1z
         P5rbcBE4z2N7RSAWlDKIu1A20EVnFl4aIlya1TK7oTDdh6sj1zVNw2+8AIQViYoIHqw9
         uD5MvJgIk0hZgrQh1RaMiKISOOobOTOEjZ4NJ9mZJRd+hSR1YksHuVMLST6Kar48NH0G
         AY1ewHaTalV1HSGoEFCtu+A2vAQIXGVaOfahGKKJZWrF9TCm4SoiN4bRoh52WDed4FUV
         G62Q==
X-Gm-Message-State: AOAM533bMOgxs6cggRgZ+OyrUcTdw5FgufX98w6wlWlcymRs+/OQPsaN
	lNIVd2hLjdLBEVVsSRDRCRBscCZXG5kt5eyec6g=
X-Google-Smtp-Source: ABdhPJxGdlNUdBRS1iBqiaMmtFTqAAQzyJjG/eK1PxTCBXQidOo3+5es21U4JMteIQfS2+M+6HtClpaPShrVhWJk5Xc=
X-Received: by 2002:a17:906:aada:: with SMTP id kt26mr4547863ejb.137.1616604150769;
 Wed, 24 Mar 2021 09:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210323211230.1639990-1-raj.khem@gmail.com>
In-Reply-To: <20210323211230.1639990-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 24 Mar 2021 17:42:19 +0100
Message-ID: <CA+chaQfR+Fp2B10=fLT9rDpMVgUb6nxe_xcE47eAMWJYC_q4WA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] guider: Upgrade 3.9.7 -> 3.9.8
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Peace Lee <iipeace5@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000026304b05be4afc32"

--00000000000026304b05be4afc32
Content-Type: text/plain; charset="UTF-8"

The PR on github changed SRCREV couple times (while calling it 3.9.8 whole
time) and the currently latest version on github says

SRCREV = "bab995ce718b58d4b5fee594771884dea238d70a"

On Tue, Mar 23, 2021 at 10:12 PM Khem Raj <raj.khem@gmail.com> wrote:

> From: Peace Lee <iipeace5@gmail.com>
>
> Upgrade to release 3.9.8
>
> Signed-off-by: Peace Lee <iipeace5@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../guider/{guider_3.9.7.bb => guider_3.9.8.bb}             | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/guider/{guider_3.9.7.bb =>
> guider_3.9.8.bb} (78%)
>
> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> similarity index 78%
> rename from meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> rename to meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> index 88fad936ba..91693d8626 100644
> --- a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
> @@ -1,4 +1,4 @@
> -SUMMARY = "runtime performance analyzer"
> +SUMMARY = "performance analyzer"
>  HOMEPAGE = "https://github.com/iipeace/guider"
>  BUGTRACKER = "https://github.com/iipeace/guider/issues"
>  AUTHOR = "Peace Lee <ipeace5@gmail.com>"
> @@ -6,10 +6,10 @@ AUTHOR = "Peace Lee <ipeace5@gmail.com>"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
>
> -PV = "3.9.7+git${SRCPV}"
> +PV = "3.9.8+git${SRCPV}"
>
>  SRC_URI = "git://github.com/iipeace/${BPN}
> <http://github.com/iipeace/$%7BBPN%7D>"
> -SRCREV = "459b5189a46023fc98e19888b196bdc2674022fd"
> +SRCREV = "f2e6d84ffa341728daf0cc2ba2736d58008ea9f1"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.31.0
>
>
> 
>
>

--00000000000026304b05be4afc32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">The PR on github changed SRCREV couple ti=
mes (while calling it 3.9.8 whole time) and the currently latest version on=
 github says<div><br></div><div>SRCREV =3D &quot;bab995ce718b58d4b5fee59477=
1884dea238d70a&quot;</div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 10:12 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Peace Lee =
&lt;<a href=3D"mailto:iipeace5@gmail.com" target=3D"_blank">iipeace5@gmail.=
com</a>&gt;<br>
<br>
Upgrade to release 3.9.8<br>
<br>
Signed-off-by: Peace Lee &lt;<a href=3D"mailto:iipeace5@gmail.com" target=
=3D"_blank">iipeace5@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../guider/{<a href=3D"http://guider_3.9.7.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">guider_3.9.7.bb</a> =3D&gt; <a href=3D"http://guider_3.9.8.=
bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a>}=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/guider/{<a href=3D"http://guider_3.9=
.7.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a> =3D&gt; <a =
href=3D"http://guider_3.9.8.bb" rel=3D"noreferrer" target=3D"_blank">guider=
_3.9.8.bb</a>} (78%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.=
7.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a> b/meta-oe/re=
cipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">guider_3.9.8.bb</a><br>
similarity index 78%<br>
rename from meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.7=
.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a><br>
rename to meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
index 88fad936ba..91693d8626 100644<br>
--- a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.7.bb" r=
el=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a><br>
+++ b/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" r=
el=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
@@ -1,4 +1,4 @@<br>
-SUMMARY =3D &quot;runtime performance analyzer&quot;<br>
+SUMMARY =3D &quot;performance analyzer&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/iipeace/guider" rel=
=
=3D"noreferrer" target=3D"_blank">https://github.com/iipeace/guider</a>&qu=
ot;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/iipeace/guider/is=
sues" rel=3D"noreferrer" target=3D"_blank">https://github.com/iipeace/guide=
r/issues</a>&quot;<br>
=C2=A0AUTHOR =3D &quot;Peace Lee &lt;<a href=3D"mailto:ipeace5@gmail.com" =
target=3D"_blank">ipeace5@gmail.com</a>&gt;&quot;<br>
@@ -6,10 +6,10 @@ AUTHOR =3D &quot;Peace Lee &lt;<a href=3D"mailto:ipeace5=
@gmail.com" target=3D"_blank">ipeace5@gmail.com</a>&gt;&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69=
b932b7e7aff2&quot;<br>
<br>
-PV =3D &quot;3.9.7+git${SRCPV}&quot;<br>
+PV =3D &quot;3.9.8+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iipeace/$%7BBPN=
%7D" rel=3D"noreferrer" target=3D"_blank">github.com/iipeace/${BPN}</a>&quo=
t;<br>
-SRCREV =3D &quot;459b5189a46023fc98e19888b196bdc2674022fd&quot;<br>
+SRCREV =3D &quot;f2e6d84ffa341728daf0cc2ba2736d58008ea9f1&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.31.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000026304b05be4afc32--
