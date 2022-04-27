Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CFEC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 23:05:00 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web09.3512.1651100699088089029
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 16:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dY+serBZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id c62so3075038vsc.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 16:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gfiXL7lJPxXvsKpy/ZvSnrQso3nVbf4tpC+rNyCttec=;
        b=dY+serBZ62RC3sLUm3YH+GpIBObXRySoDybnQWeYKHT+h2Tp1mnyY7eDUul8Lb+j64
         raQnBMCO30u++zVoylHb8glTMrb9y5y8tABKrtBxr10DTBW9WIEI4DxI2Sw79dp7qJ9O
         q6laRdgkRtsujcNt9u0Zn+4RVmJMI706YXBlveha9hPJNRdeOT0BNRbWaN3KlYXFrhS2
         IwLh/Y14BaDuyNe0z9BtK/0mPYpvyG+ki6T3FjgCs3rF3FZa1R/fA9OBhFi4FdXO9Q+b
         I7mUVWIeGvIyFFv4D4MyLHqgWNu6aP6Bqu0++cH1+Flxa8If08mJSAD3C2yB0T7wLnVg
         iTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gfiXL7lJPxXvsKpy/ZvSnrQso3nVbf4tpC+rNyCttec=;
        b=EH84AoZkKJTgu7THUbjAUxq/NredUr8X2zkPB+7aGNSFKPDkHVUYllv7IhxVVA895B
         ofWfvjdCe4dTWrg9sZFuqqb8uZigEko0A4rWh1xL9EaaZxxYzZzwbljLcK+EjkeZ0Vdm
         IGmrfyx4kvPjQqQBpzM90omdsDo3bK8nLXl8ZcRhHcIv+OGbeM88YFQpcshcpP50c462
         VBTHn9RAEsZV8cqUAVSWj0ub7MLtPKQggEva3n5Z2k4MmPFd0++ITS7TeLgyOYT1xhRy
         Zew4uO1CjHiLlKe0lh+5Pn6iOVklSERZdLrvxsFpE8BOymKPAI/kxnLsux02uQ5wkXhI
         CQ9w==
X-Gm-Message-State: AOAM530Z1U1BK7ttFJl7WRIW3FZJvuvH48hZ2EHZPMJjgQcKFLEH92w/
	uixYJ/sTJHIgfRDPGzo1W5dnPSi3QUB97a4XE7I=
X-Google-Smtp-Source: 
 ABdhPJxjLUIvJ24DFTBtsaw76ISj1oU7S+gx/sF6T479GiTzwghGOgQOUZJZmnVBo4ysY0v67HdOfYwKbCc5Sgfuk3I=
X-Received: by 2002:a05:6102:3ec6:b0:320:69d7:4634 with SMTP id
 n6-20020a0561023ec600b0032069d74634mr8877138vsv.24.1651100698145; Wed, 27 Apr
 2022 16:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220427220737.3807846-1-akuster808@gmail.com>
In-Reply-To: <20220427220737.3807846-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Apr 2022 01:04:47 +0200
Message-ID: 
 <CA+chaQdg3EYs1aH3KhOn4LpGmSA20H7FJPOvqabnMrbOCeppBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] layer.conf: Post release codename changes
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099f6a405ddaad648"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Apr 2022 23:05:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96815

--00000000000099f6a405ddaad648
Content-Type: text/plain; charset="UTF-8"

Isn't it a bit premature to claim langdale compatibility when we don't know
what changes langdale will need?

I think it makes more sense to add this at the end of cycle, not at the
beginning.

Regards,

On Thu, Apr 28, 2022 at 12:07 AM Armin Kuster <akuster808@gmail.com> wrote:

> Post release add langdale to match core
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
> index 75a27d665..205768e63 100644
> --- a/meta-filesystems/conf/layer.conf
> +++ b/meta-filesystems/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
>
>  LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
> +LAYERSERIES_COMPAT_filesystems-layer = "kirkstone langdale"
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 2fb348515..bf4834aa2 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
>
>  LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
>
> -LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
> +LAYERSERIES_COMPAT_gnome-layer = "kirkstone langdale"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    faenza-icon-theme->gdk-pixbuf \
> diff --git a/meta-initramfs/conf/layer.conf
> b/meta-initramfs/conf/layer.conf
> index c63383faf..6aa64f1e1 100644
> --- a/meta-initramfs/conf/layer.conf
> +++ b/meta-initramfs/conf/layer.conf
> @@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-initramfs = "5"
>  LAYERDEPENDS_meta-initramfs = "core"
>
> -LAYERSERIES_COMPAT_meta-initramfs = "kirkstone"
> +LAYERSERIES_COMPAT_meta-initramfs = "kirkstone langdale"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    dracut->virtual/kernel \
> diff --git a/meta-multimedia/conf/layer.conf
> b/meta-multimedia/conf/layer.conf
> index b5120bb53..ee6694cdf 100644
> --- a/meta-multimedia/conf/layer.conf
> +++ b/meta-multimedia/conf/layer.conf
> @@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
>
>  LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
>
> -LAYERSERIES_COMPAT_multimedia-layer = "kirkstone"
> +LAYERSERIES_COMPAT_multimedia-layer = "kirkstone langdale"
> diff --git a/meta-networking/conf/layer.conf
> b/meta-networking/conf/layer.conf
> index 3f9699ad1..a4f622a8c 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
>  LAYERDEPENDS_networking-layer += "openembedded-layer"
>  LAYERDEPENDS_networking-layer += "meta-python"
>
> -LAYERSERIES_COMPAT_networking-layer = "kirkstone"
> +LAYERSERIES_COMPAT_networking-layer = "kirkstone langdale"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index 88715d5e8..34aa29561 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
>
>  LAYERDEPENDS_openembedded-layer = "core"
>
> -LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
> +LAYERSERIES_COMPAT_openembedded-layer = "kirkstone langdale"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
> index 3cb9571d4..007ae2fbd 100644
> --- a/meta-perl/conf/layer.conf
> +++ b/meta-perl/conf/layer.conf
> @@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
>
>  LAYERDEPENDS_perl-layer = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_perl-layer = "kirkstone"
> +LAYERSERIES_COMPAT_perl-layer = "kirkstone langdale"
> diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
> index e444498ff..481e4ea2c 100644
> --- a/meta-python/conf/layer.conf
> +++ b/meta-python/conf/layer.conf
> @@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
>
>  LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
>
> -LAYERSERIES_COMPAT_meta-python = "kirkstone"
> +LAYERSERIES_COMPAT_meta-python = "kirkstone langdale"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> diff --git a/meta-webserver/conf/layer.conf
> b/meta-webserver/conf/layer.conf
> index 5ae5e796a..bfcd9681c 100644
> --- a/meta-webserver/conf/layer.conf
> +++ b/meta-webserver/conf/layer.conf
> @@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
>
>  LAYERDEPENDS_webserver = "core openembedded-layer"
>
> -LAYERSERIES_COMPAT_webserver = "kirkstone"
> +LAYERSERIES_COMPAT_webserver = "kirkstone langdale"
>
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 28dfc5b34..5785421aa 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
>  LAYERDEPENDS_xfce-layer += "networking-layer"
>
> -LAYERSERIES_COMPAT_xfce-layer = "kirkstone"
> +LAYERSERIES_COMPAT_xfce-layer = "kirkstone langdale"
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
>    openzone->gdk-pixbuf \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96813):
> https://lists.openembedded.org/g/openembedded-devel/message/96813
> Mute This Topic: https://lists.openembedded.org/mt/90741673/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000099f6a405ddaad648
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Isn&#39;t it a bit premature to claim langdale compatibili=
ty when we don&#39;t know what changes langdale will need?<div><br></div><d=
iv>I think it makes more sense to add this at the end of cycle, not at the =
beginning.</div><div><br></div><div>Regards,</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 28, 2022 at 1=
2:07 AM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Post release add langdale to match core<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" tar=
get=3D"_blank">akuster808@gmail.com</a>&gt;<br>
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
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer=
.conf<br>
index 75a27d665..205768e63 100644<br>
--- a/meta-filesystems/conf/layer.conf<br>
+++ b/meta-filesystems/conf/layer.conf<br>
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_filesystems-layer =3D &quot;core openembedded-layer&quot=
;<br>
<br>
-LAYERSERIES_COMPAT_filesystems-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_filesystems-layer =3D &quot;kirkstone langdale&quot;<br=
>
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf<br>
index 2fb348515..bf4834aa2 100644<br>
--- a/meta-gnome/conf/layer.conf<br>
+++ b/meta-gnome/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_gnome-layer =3D &quot;core openembedded-layer networking=
-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_gnome-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_gnome-layer =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
=C2=A0 =C2=A0faenza-icon-theme-&gt;gdk-pixbuf \<br>
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.con=
f<br>
index c63383faf..6aa64f1e1 100644<br>
--- a/meta-initramfs/conf/layer.conf<br>
+++ b/meta-initramfs/conf/layer.conf<br>
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs :=3D &quot;^${LAYERDIR}/&qu=
ot;<br>
=C2=A0BBFILE_PRIORITY_meta-initramfs =3D &quot;5&quot;<br>
=C2=A0LAYERDEPENDS_meta-initramfs =3D &quot;core&quot;<br>
<br>
-LAYERSERIES_COMPAT_meta-initramfs =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_meta-initramfs =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
=C2=A0 =C2=A0dracut-&gt;virtual/kernel \<br>
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.c=
onf<br>
index b5120bb53..ee6694cdf 100644<br>
--- a/meta-multimedia/conf/layer.conf<br>
+++ b/meta-multimedia/conf/layer.conf<br>
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_multimedia-layer =3D &quot;core openembedded-layer meta-=
python&quot;<br>
<br>
-LAYERSERIES_COMPAT_multimedia-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_multimedia-layer =3D &quot;kirkstone langdale&quot;<br>
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.c=
onf<br>
index 3f9699ad1..a4f622a8c 100644<br>
--- a/meta-networking/conf/layer.conf<br>
+++ b/meta-networking/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer =3D &quot;core&quot;<br>
=C2=A0LAYERDEPENDS_networking-layer +=3D &quot;openembedded-layer&quot;<br>
=C2=A0LAYERDEPENDS_networking-layer +=3D &quot;meta-python&quot;<br>
<br>
-LAYERSERIES_COMPAT_networking-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_networking-layer =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf<br>
index 88715d5e8..34aa29561 100644<br>
--- a/meta-oe/conf/layer.conf<br>
+++ b/meta-oe/conf/layer.conf<br>
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openembedded-layer =3D &quot;core&quot;<br>
<br>
-LAYERSERIES_COMPAT_openembedded-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_openembedded-layer =3D &quot;kirkstone langdale&quot;<b=
r>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf<br>
index 3cb9571d4..007ae2fbd 100644<br>
--- a/meta-perl/conf/layer.conf<br>
+++ b/meta-perl/conf/layer.conf<br>
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_perl-layer =3D &quot;core openembedded-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_perl-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_perl-layer =3D &quot;kirkstone langdale&quot;<br>
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf<br>
index e444498ff..481e4ea2c 100644<br>
--- a/meta-python/conf/layer.conf<br>
+++ b/meta-python/conf/layer.conf<br>
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_meta-python =3D &quot;core (&gt;=3D 12) openembedded-lay=
er&quot;<br>
<br>
-LAYERSERIES_COMPAT_meta-python =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_meta-python =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.con=
f<br>
index 5ae5e796a..bfcd9681c 100644<br>
--- a/meta-webserver/conf/layer.conf<br>
+++ b/meta-webserver/conf/layer.conf<br>
@@ -17,7 +17,7 @@ LAYERVERSION_webserver =3D &quot;1&quot;<br>
<br>
=C2=A0LAYERDEPENDS_webserver =3D &quot;core openembedded-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_webserver =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_webserver =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
<br>
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf<br>
index 28dfc5b34..5785421aa 100644<br>
--- a/meta-xfce/conf/layer.conf<br>
+++ b/meta-xfce/conf/layer.conf<br>
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer +=3D &quot;multimedia-layer&quot;=
<br>
=C2=A0LAYERDEPENDS_xfce-layer +=3D &quot;meta-python&quot;<br>
=C2=A0LAYERDEPENDS_xfce-layer +=3D &quot;networking-layer&quot;<br>
<br>
-LAYERSERIES_COMPAT_xfce-layer =3D &quot;kirkstone&quot;<br>
+LAYERSERIES_COMPAT_xfce-layer =3D &quot;kirkstone langdale&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot;\<br>
=C2=A0 =C2=A0openzone-&gt;gdk-pixbuf \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96813): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96813" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96813</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90741673/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90741673/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000099f6a405ddaad648--

