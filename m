Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.1656.1590200508577086626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 19:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HU8dOFTz;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id z18so9947633qto.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 19:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6swklEIU5TCgY0MXJ2DMXk07RBLiXq+pC4QBw945RY=;
        b=HU8dOFTzfE3KP5RT44FvVrgPG00ol5vmNNo63FhKeI4QSsEmlZjNYoU+IfD3nrACY9
         85xuKWR8cS6WECLTqTg2/dt6hv99IoJE1PARbL+WqSdie5Cn8DuIsf9yiBHRuSJgf0PX
         yZ9VuNvwJFlY8cXqigcI6DCNsqkFHB3geZmNHsD2sG26QuuG6XwhjCQesE3lNYV9PBU6
         XTO0Ag/k5f/2whJHIZpuhRwdVnlXBcjCXz5C4SiXwFn4uT/5u+s2Dvzar5DoFIHf3d3i
         r5ncNUAz9QoRsrvv5t5KPyGJqrA0oqDt71qCNB3dMz4IM6p846aw/bs4D2FDNSG8tGNM
         5vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6swklEIU5TCgY0MXJ2DMXk07RBLiXq+pC4QBw945RY=;
        b=J391cIkNT2PQtLY2z/KcUltVvNKPJMaLio0LNZxZbZDyfp/KTLzvvTf0Ak8z9rrlNw
         pymMi0UyBSxoLQsuKfMdZQ3ZfNxAdNpycU67jtzbeZk0gcNlna2bcDNF/PFAg2L+x80J
         PPBLCxT5hDPSH6XJo8rSaprfbzCTKNAS/vr4iH09WgT48NGFiK/r53anOeqaLykWWIc7
         0n09MibWMVusRYsF/DzCymfpcO94bHJDNBEl0Wpy9aslxzZJm6t+zbsxDTVt2i9vvtjv
         9na/3681R9bixqsgDtMilEvYCLfx/ylQtT6sQ42UrRXStVbQjTpLFO+K6KZRWCa6InlW
         KwyQ==
X-Gm-Message-State: AOAM532MeRPlYLUKJsF5cL8HPK0Vrgg5vQhuP5VvGmUhq36tbpubXguQ
	gxBYtH7FNcQjz+oFQrRMu6MlMcZpRhJyt0/j2Sw=
X-Google-Smtp-Source: ABdhPJzx3Ai3aWB84W83vOiQ8VTZ2aT3JblSMzPybtsVj1kL3aoyf4QCHQqNcdAPSKPPUJeL3xLFgaITOz5ciH+/TYI=
X-Received: by 2002:aed:3f55:: with SMTP id q21mr5020960qtf.190.1590200507529;
 Fri, 22 May 2020 19:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200523013827.3218-1-akuster808@gmail.com>
In-Reply-To: <20200523013827.3218-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 22 May 2020 19:21:36 -0700
Message-ID: <CAMKF1somJV53JeyRWNpCBvYwOoh7S3-Fms4dGJ9-CGOMB8eWPQ@mail.gmail.com>
Subject: Re: [oe] [master][dunfell][PATCH] tremor: update SRC_URI as project moved to gitlab
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005f7e4c05a64768c3"

--0000000000005f7e4c05a64768c3
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 6:38 PM akuster <akuster808@gmail.com> wrote:

> It appears Xiph.Org is not on gitlab


Typo not should be now I guess


> https://gitlab.xiph.org/xiph
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> index 28bb5d924..6abf6080b 100644
> --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
>
>  file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
>  DEPENDS = "libogg"
>
> -SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
> +SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
>             file://obsolete_automake_macros.patch;striplevel=0 \
>             file://tremor-arm-thumb2.patch \
>  "
> --
> 2.17.1
>
> 
>

--0000000000005f7e4c05a64768c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 22, 2020 at 6:38 PM akuster &lt;<a href=3D"mai=
lto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">It appears Xiph.Org is not on gitlab</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">Typo not should be now I gue=
ss=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
<a href=3D"https://gitlab.xiph.org/xiph" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.xiph.org/xiph</a><br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tremor_2=
0180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://t=
remor_20180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb<=
/a> b/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tremor_20=
180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a><br>
index 28bb5d924..6abf6080b 100644<br>
--- a/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tremor_2=
0180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/tremor/<a href=3D"http://tremor_2=
0180319.bb" rel=3D"noreferrer" target=3D"_blank">tremor_20180319.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddb1b7a668b=
2a6f47b2af88fb008ad555 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://os.h;beginline=3D3;endline=3D14;md5=3D5c0af5e1bedef3ce8178c89f48=
cd6f1f&quot;<br>
=C2=A0DEPENDS =3D &quot;libogg&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.xiph.org/tremor.git;protoco=
l=3Dhttps" rel=3D"noreferrer" target=3D"_blank">git.xiph.org/tremor.git;pro=
tocol=3Dhttps</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.xiph.org/xiph/tremor.git=
;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.xiph.org/xip=
h/tremor.git;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://obsolete_automake_macros.=
patch;striplevel=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tremor-arm-thumb2.patch \=
<br>
=C2=A0&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005f7e4c05a64768c3--
