Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.16506.1602778971787426455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 09:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TdCsADzz;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id l24so3672899edj.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DXK4QkIRfYFJA7iUd2m4gepCOJDN5nLmDBVnWrxgXZU=;
        b=TdCsADzznVERyL0lS1ESowZj1sJ1m2/UQ25rgzUsQsTXFa09bkU4mmUp9Xd/PuHkih
         q1F7ZTo5oe3vD5+8K3H12rwNED+nMHmQjTX3GPrFlCIcGrMnY+cwBuvskJ1+tMrHdrP6
         kmjNt7PdBe8kt6YtCgpdAMe99HosX+k9YrgA02L03gzX16l2TXtHpEDu6i6WaFWuFxPF
         iBCMC2bR0psK+4bvsjsfbtRVM5sTdTvn0SITcL/msl5nQ/Q+aO7SmvfkFw4oMYo8+acv
         FBZ/GxLnZK1jtg2LVGDZj9eWmCzx30zpNKoDR3nnmjhFFZzg9F+jQHtrQP5buCpHU9Gy
         wJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DXK4QkIRfYFJA7iUd2m4gepCOJDN5nLmDBVnWrxgXZU=;
        b=jPsYoidtjqc0sgfzX+Gq93W8X8MMZitrhFE0dDwv0ezpEMdf1xhfO7aZ6XVf0Z3OxV
         8u1a186M7QiR1tMRP6Lk2D1LK1rW874oCZN+n4QetU2D1B703Qx+G9Nv+DE2dDw1UZr5
         mEGMgqyPcq9GQbeL9WYwUsV7yQ3hNERzWu8q7z3br6np5gG6BddE90Sk5E4HguSgkOR2
         xYrE1jgUgKcYtgLPpLGWhn8ehNHi538KbyTzw9g7fko+Bps4U/PbW+lhjlzl9q99akRI
         B/AtAhoKBsEj8+1B2rbgYFJVABeZ9sgHGcGHHuYnIwKQWXEd8+LKTUcOvJ2wuSvPyNtR
         kvdg==
X-Gm-Message-State: AOAM532VmfXi5NxkQXRJU4/Cg5afN5vHgucqBwVJT7BmN3p1S9Y3kggJ
	svYZnlmg/o3zBpexQrYXCcjhHMkB5M4z3YCAWdg=
X-Google-Smtp-Source: ABdhPJwBLiSuVJGv4mpdnf7PkXifUdRCyDYHnx6iI3WK0Iqb2drJd1ZoB1HTYVoujjmtD7e2AmXMzuDhECelerC0CDg=
X-Received: by 2002:a05:6402:c84:: with SMTP id cm4mr5229690edb.270.1602778970259;
 Thu, 15 Oct 2020 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201015162006.884875-1-raj.khem@gmail.com>
In-Reply-To: <20201015162006.884875-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2020 18:22:39 +0200
Message-ID: <CA+chaQdCMjEQYSj8pPfKiUVEdgPc9fY3jLg9eadocBt-jZiQfg@mail.gmail.com>
Subject: Re: [oe] [PATCH] meta-openembedded: Add gatesgarth to LAYERSERIES_COMPAT
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002d033805b1b80fd5"

--0000000000002d033805b1b80fd5
Content-Type: text/plain; charset="UTF-8"

Please drop at least thud, warrior, zeus.

I guess it doesn't even parse with dunfell as well and this time we don't
even need transition period as gatesgarth is included in oe-core for quite
some time:
https://git.openembedded.org/openembedded-core/commit/meta/conf/layer.conf?id=1e79324f8290b820fee034b0d4a8c353027879da

On Thu, Oct 15, 2020 at 6:20 PM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-filesystems/conf/layer.conf | 2 +-
>  meta-gnome/conf/layer.conf       | 2 +-
>  meta-initramfs/conf/layer.conf   | 2 +-
>  meta-multimedia/conf/layer.conf  | 2 +-
>  meta-networking/conf/layer.conf  | 2 +-
>  meta-oe/conf/layer.conf          | 2 +-
>  meta-perl/conf/layer.conf        | 2 +-
>  meta-python/conf/layer.conf      | 2 +-
>  meta-webserver/conf/layer.conf   | 2 +-
>  meta-xfce/conf/layer.conf        | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta-filesystems/conf/layer.conf
> b/meta-filesystems/conf/layer.conf
> index be1635deea..745961e6ce 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell
> gatesgarth"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 7706b7ca6b..6629aa36d6 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
>
>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>
> -LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell gatesgarth"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    faenza-icon-theme->gdk-pixbuf \
> diff --git a/meta-initramfs/conf/layer.conf
> b/meta-initramfs/conf/layer.conf
> index 634e0883c6..a459269d9c 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs = "8"
>  LAYERDEPENDS_meta-initramfs = "core"
>
> -LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell gatesgarth"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> index 2d52fb938a..62b6946c70 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
>
>  LAYERDEPENDS_multimedia-layer = "core meta-python"
>
> -LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell
> gatesgarth"
> diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf
> index 7bc0702ba7..cf46c69486 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>  LAYERDEPENDS_networking-layer += "meta-python"
>
> -LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfelli
> gatesgarth"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 5b79b59b71..2620c5df0b 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -37,7 +37,7 @@ LAYERVERSION_openembedded-layer = "1"
>
>  LAYERDEPENDS_openembedded-layer = "core"
>
> -LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell
> gatesgarth"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index 1361fe0842..e3feacce68 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>
>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell gatesgarth"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index 0dbc4296eb..f99aeea09a 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>
>  LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell gatesgarth"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf
> b/meta-webserver/conf/layer.conf
> index 24469115e4..2faec4c7a6 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>
>  LAYERDEPENDS_webserver = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell gatesgarth"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 7e4bb178e0..0ae45a3959 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
>  LAYERDEPENDS_xfce-layer += "networking-layer"
>
> -LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
> +LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell gatesgarth"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    openzone->gdk-pixbuf \
> --
> 2.28.0
>
>
> 
>
>

--0000000000002d033805b1b80fd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please drop at least thud, warrior, zeus.<div><br></div><d=
iv>I guess it doesn&#39;t even parse with dunfell as well and this time we =
don&#39;t even need transition period as gatesgarth is included in oe-core =
for quite some time:<div><a href=3D"https://git.openembedded.org/openembedd=
ed-core/commit/meta/conf/layer.conf?id=3D1e79324f8290b820fee034b0d4a8c35302=
7879da">https://git.openembedded.org/openembedded-core/commit/meta/conf/lay=
er.conf?id=3D1e79324f8290b820fee034b0d4a8c353027879da</a><br></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Oct 15, 2020 at 6:20 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-filesystems/conf/layer.conf | 2 +-<br>
=C2=A0meta-gnome/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-initramfs/conf/layer.conf=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-multimedia/conf/layer.conf=C2=A0 | 2 +-<br>
=C2=A0meta-networking/conf/layer.conf=C2=A0 | 2 +-<br>
=C2=A0meta-oe/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-perl/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-python/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta-webserver/conf/layer.conf=C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-xfce/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A010 files changed, 10 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/laye=
r.conf<br>
index be1635deea..745961e6ce 100644<br>
--- a/meta-filesystems/conf/layer.conf<br>
+++ b/meta-filesystems/conf/layer.conf<br>
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_filesystems-layer =3D &quot;core openembedded-layer&quo=
t;<br>
<br>
-LAYERSERIES_COMPAT_filesystems-layer =3D &quot;thud warrior zeus dunfell&=
quot;<br>
+LAYERSERIES_COMPAT_filesystems-layer =3D &quot;thud warrior zeus dunfell =
gatesgarth&quot;<br>
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf<br>
index 7706b7ca6b..6629aa36d6 100644<br>
--- a/meta-gnome/conf/layer.conf<br>
+++ b/meta-gnome/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_gnome-layer =3D &quot;core openembedded-layer networkin=
g-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_gnome-layer =3D &quot;thud warrior zeus dunfell&quot;<=
br>
+LAYERSERIES_COMPAT_gnome-layer =3D &quot;thud warrior zeus dunfell gatesg=
arth&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
=C2=A0 =C2=A0faenza-icon-theme-&gt;gdk-pixbuf \<br>
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.co=
nf<br>
index 634e0883c6..a459269d9c 100644<br>
--- a/meta-initramfs/conf/layer.conf<br>
+++ b/meta-initramfs/conf/layer.conf<br>
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs :=3D &quot;^${LAYERDIR}/&q=
uot;<br>
=C2=A0BBFILE_PRIORITY_meta-initramfs =3D &quot;8&quot;<br>
=C2=A0LAYERDEPENDS_meta-initramfs =3D &quot;core&quot;<br>
<br>
-LAYERSERIES_COMPAT_meta-initramfs =3D &quot;thud warrior zeus dunfell&quo=
t;<br>
+LAYERSERIES_COMPAT_meta-initramfs =3D &quot;thud warrior zeus dunfell gat=
esgarth&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
=C2=A0 =C2=A0dracut-&gt;virtual/kernel \<br>
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.=
conf<br>
index 2d52fb938a..62b6946c70 100644<br>
--- a/meta-multimedia/conf/layer.conf<br>
+++ b/meta-multimedia/conf/layer.conf<br>
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_multimedia-layer =3D &quot;core meta-python&quot;<br>
<br>
-LAYERSERIES_COMPAT_multimedia-layer =3D &quot;thud warrior zeus dunfell&q=
uot;<br>
+LAYERSERIES_COMPAT_multimedia-layer =3D &quot;thud warrior zeus dunfell g=
atesgarth&quot;<br>
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.=
conf<br>
index 7bc0702ba7..cf46c69486 100644<br>
--- a/meta-networking/conf/layer.conf<br>
+++ b/meta-networking/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer =3D &quot;core&quot;<br>
=C2=A0LAYERDEPENDS_networking-layer +=3D &quot;openembedded-layer&quot;<br=
>
=C2=A0LAYERDEPENDS_networking-layer +=3D &quot;meta-python&quot;<br>
<br>
-LAYERSERIES_COMPAT_networking-layer =3D &quot;thud warrior zeus dunfell&q=
uot;<br>
+LAYERSERIES_COMPAT_networking-layer =3D &quot;thud warrior zeus dunfelli =
gatesgarth&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
index 5b79b59b71..2620c5df0b 100644<br>
--- a/meta-oe/conf/layer.conf<br>
+++ b/meta-oe/conf/layer.conf<br>
@@ -37,7 +37,7 @@ LAYERVERSION_openembedded-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openembedded-layer =3D &quot;core&quot;<br>
<br>
-LAYERSERIES_COMPAT_openembedded-layer =3D &quot;thud warrior zeus dunfell=
&quot;<br>
+LAYERSERIES_COMPAT_openembedded-layer =3D &quot;thud warrior zeus dunfell=
 gatesgarth&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf<br>
index 1361fe0842..e3feacce68 100644<br>
--- a/meta-perl/conf/layer.conf<br>
+++ b/meta-perl/conf/layer.conf<br>
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_perl-layer =3D &quot;core openembedded-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_perl-layer =3D &quot;thud warrior zeus dunfell&quot;<b=
r>
+LAYERSERIES_COMPAT_perl-layer =3D &quot;thud warrior zeus dunfell gatesga=
rth&quot;<br>
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf<br>
index 0dbc4296eb..f99aeea09a 100644<br>
--- a/meta-python/conf/layer.conf<br>
+++ b/meta-python/conf/layer.conf<br>
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-python =3D &quot;core (&gt;=3D 12) openembedded-la=
yer&quot;<br>
<br>
-LAYERSERIES_COMPAT_meta-python =3D &quot;thud warrior zeus dunfell&quot;<=
br>
+LAYERSERIES_COMPAT_meta-python =3D &quot;thud warrior zeus dunfell gatesg=
arth&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.co=
nf<br>
index 24469115e4..2faec4c7a6 100644<br>
--- a/meta-webserver/conf/layer.conf<br>
+++ b/meta-webserver/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERVERSION_webserver =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_webserver =3D &quot;core openembedded-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_webserver =3D &quot;thud warrior zeus dunfell&quot;<br=
>
+LAYERSERIES_COMPAT_webserver =3D &quot;thud warrior zeus dunfell gatesgar=
th&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf<br>
index 7e4bb178e0..0ae45a3959 100644<br>
--- a/meta-xfce/conf/layer.conf<br>
+++ b/meta-xfce/conf/layer.conf<br>
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer +=3D &quot;multimedia-layer&quot=
;<br>
=C2=A0LAYERDEPENDS_xfce-layer +=3D &quot;meta-python&quot;<br>
=C2=A0LAYERDEPENDS_xfce-layer +=3D &quot;networking-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_xfce-layer =3D &quot;thud warrior zeus dunfell&quot;<b=
r>
+LAYERSERIES_COMPAT_xfce-layer =3D &quot;thud warrior zeus dunfell gatesga=
rth&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
=C2=A0 =C2=A0openzone-&gt;gdk-pixbuf \<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002d033805b1b80fd5--
