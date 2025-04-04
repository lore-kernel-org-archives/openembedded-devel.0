Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83322C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:37:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.86.1743781049931473330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SyoCnb/g;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso15301815e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743781048; x=1744385848; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5/vofdIhO3ZVCpgiitK8Bi3g2EJcLj6aknyTFaAv9o=;
        b=SyoCnb/gR2ZU/cbgKX4fpMRLKkFYI4IL7xE2DVQgPDkbECuDdEBruzCf8tzNs3bXbk
         pWC0g8LUMTRyEhHhWmiGrV0ICt7ME+UUCuEt9b3QzP4xNy0d/6UF42T2nawWzcRLzTnw
         mnuAtBscfZpGG/WcrzIsgBnkn5vp6Aao/Mmlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743781048; x=1744385848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5/vofdIhO3ZVCpgiitK8Bi3g2EJcLj6aknyTFaAv9o=;
        b=rkrs34pFwYs99X6gxs/Dz5j9oBLOV93IgKIDMVogTqXVQfedIeDXxhMJ4B5QeizPUm
         rWGwE05LRhnAn4O5sv9/v49aQPOy7dVu0zY/J4xCwAuOB+4M69HiY2Z/pjQx1vY6jCnt
         kt817algpiX+8nCYmYWH6gb/qD1V5e4K497ZK/JvkmvAe9YEYFU9VJG9/NrSunf0tlsc
         2YKM+QBbrZulkXqHfI2gze5pEHgwL65m9cmz8jMsQQ5MiCopzfzWgXogemcXqKUvL8D9
         HKqLypnQ00yk0qO1FynNdpZ/b7dUhqOQaYEFkoEXJ+sIU+YU/EgkK9THMzSkRFqHbezk
         o2Eg==
X-Gm-Message-State: AOJu0YzLG9oHaXWccbh94G+0irYpJ50E7Z8g8p5lZlou572LABcFG8B3
	PTbPGAG7h6TyZXtCq/n/QIIPFbN0y+sqbw7RTrvpC/sZqlChgMoLC3QCMObQr7s99BF2jKJ7slo
	ytJySqC36dWRruO8sRj7V5EQM65kk1h75oOIzZZuJd7lGPNQlBVY=
X-Gm-Gg: ASbGncsJZIUxQQEVYY0giucEjfHLg25mOjp3Moj8c7pXnn4DvDRKY7vYvNB9S16eIVO
	3Rq2mmO2/9GSgkDCFllWAhJn0sfKSz4eOAFGF0sRjynzT1e4un7QUCoxsSQyVrSuPRozpZ0Kp9Q
	THs1xlMvdwec80fLw/GWBaJ7ffioVb87nBxA7RRIX+Xjsphk9OXOnaEbRps4U=
X-Google-Smtp-Source: AGHT+IHINKTjVe0ETC0Bm9GHGHTi/Z67ker13FFOijoW8lzv6naZcGs1apy5smaO5LadnWjC58W1j/RYQft3aV8khU0=
X-Received: by 2002:a05:6000:40c7:b0:39c:1257:feb8 with SMTP id
 ffacd0b85a97d-39cba97fb05mr3323465f8f.56.1743781048249; Fri, 04 Apr 2025
 08:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250404153448.2765425-1-sofiane.hamam@smile.fr>
In-Reply-To: <20250404153448.2765425-1-sofiane.hamam@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 4 Apr 2025 17:37:01 +0200
X-Gm-Features: ATxdqUFspkhBMHgW6xLK9JfXgGcq3COEkWI6xuNdGp40QUKJueLEvmMXv1no-Vo
Message-ID: <CAMSfU+5_xSpn2NZOR8k0pzYg31GFjnzeVCXM4vjGYP2jbUO8Eg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] openocd : Fix non reproducible build
To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f28c030631f5a9d2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 15:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116591

--000000000000f28c030631f5a9d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Sofiane :)

Le ven. 4 avr. 2025 =C3=A0 17:34, Sofiane HAMAM <sofiane.hamam@smile.fr> a
=C3=A9crit :

> This package defines PKGBLDDATE as build timestamp which makes
> it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
> use build timestamp. Following best practices, see :
> https://reproducible-builds.org/docs/source-date-epoch/
>
> Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> ---
>  ...SOURCE_DATE_EPOCH-environment-variab.patch | 38 +++++++++++++++++++
>  .../recipes-devtools/openocd/openocd_git.bb   |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644
> meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE=
_EPOCH-environment-variab.patch
>
> diff --git
> a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DA=
TE_EPOCH-environment-variab.patch
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DA=
TE_EPOCH-environment-variab.patch
> new file mode 100644
> index 000000000..0f90cac91
> --- /dev/null
> +++
> b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DA=
TE_EPOCH-environment-variab.patch
> @@ -0,0 +1,38 @@
> +From 65969a2b73ce93db4c80f1706677351b0e57fa72 Mon Sep 17 00:00:00 2001
> +From: Sofiane HAMAM <sofiane.hamam@smile.fr>
> +Date: Fri, 28 Mar 2025 12:31:17 +0100
> +Subject: [PATCH] Makefile.am: Use SOURCE_DATE_EPOCH environment variable
> +
> +This package defines PKGBLDDATE as build timestamp which makes
> +it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
> +use build timestamp. Following best practices, see :
> +https://reproducible-builds.org/docs/source-date-epoch/
> +
> +The patch is BSD compatible too.
> +
> +Change-Id: I26c1a00f2e8059ae31fe72a794b5962af5a84f44
> +Co-developed-by: default avatarYoann Congal <yoann.congal@smile.fr>
> +Signed-off-by: default avatarYoann Congal <yoann.congal@smile.fr>
>

You forgot to cleanup the "default avatar" in this patch.


> +Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
> +
> +Upstream-Status: Submitted [https://review.openocd.org/c/openocd/+/8619]
> +---
> + src/Makefile.am | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 6d79cd631..9ca697407 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -30,7 +30,10 @@ if RELEASE
> + else
> + %C%_libopenocd_la_CPPFLAGS +=3D -DRELSTR=3D\"`$(top_srcdir)/guess-rev.s=
h
> $(top_srcdir)`\"
> + %C%_libopenocd_la_CPPFLAGS +=3D -DGITVERSION=3D\"`cd $(top_srcdir) && g=
it
> describe`\"
> +-%C%_libopenocd_la_CPPFLAGS +=3D -DPKGBLDDATE=3D\"`date +%F-%R`\"
> ++%C%_libopenocd_la_CPPFLAGS +=3D -DPKGBLDDATE=3D\"`DATE_FMT=3D+%F-%R; \
> ++      SOURCE_DATE_EPOCH=3D"$${SOURCE_DATE_EPOCH:-$$(date +%s)}"; \
> ++      date -u -d "@$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || \
> ++      date -u -r "$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || date
> -u "$$DATE_FMT"`\"
> + endif
> +
> + # add default CPPFLAGS
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> index 559fe29ff..b1ce2ec16 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D " \
>      git://
> repo.or.cz/r/git2cl.git;protocol=3Dhttp;destsuffix=3Dtools/git2cl;name=3D=
git2cl;branch=3Dmaster
> \
>      git://
> github.com/msteveb/jimtcl.git;protocol=3Dhttps;destsuffix=3Dgit/jimtcl;na=
me=3Djimtcl;branch=3Dmaster
> \
>      git://
> repo.or.cz/r/libjaylink.git;protocol=3Dhttp;destsuffix=3Dgit/src/jtag/dri=
vers/libjaylink;name=3Dlibjaylink;branch=3Dmaster
> \
> +
> file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch \
>  "
>
>  SRCREV_FORMAT =3D "openocd"
>


--=20
Yoann Congal
Smile ECS

--000000000000f28c030631f5a9d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Sofiane :)</div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 4 =
avr. 2025 =C3=A0=C2=A017:34, Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.ha=
mam@smile.fr">sofiane.hamam@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This package defines PKGBL=
DDATE as build timestamp which makes<br>
it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise<br>
use build timestamp. Following best practices, see :<br>
<a href=3D"https://reproducible-builds.org/docs/source-date-epoch/" rel=3D"=
noreferrer" target=3D"_blank">https://reproducible-builds.org/docs/source-d=
ate-epoch/</a><br>
<br>
Co-developed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" =
target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.hamam@smile.fr" =
target=3D"_blank">sofiane.hamam@smile.fr</a>&gt;<br>
---<br>
=C2=A0...SOURCE_DATE_EPOCH-environment-variab.patch | 38 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" rel=3D=
"noreferrer" target=3D"_blank">openocd_git.bb</a>=C2=A0 =C2=A0|=C2=A0 1 +<b=
r>
=C2=A02 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Make=
file.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-=
SOURCE_DATE_EPOCH-environment-variab.patch b/meta-oe/recipes-devtools/openo=
cd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch<=
br>
new file mode 100644<br>
index 000000000..0f90cac91<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_=
DATE_EPOCH-environment-variab.patch<br>
@@ -0,0 +1,38 @@<br>
+From 65969a2b73ce93db4c80f1706677351b0e57fa72 Mon Sep 17 00:00:00 2001<br>
+From: Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.hamam@smile.fr" target=
=3D"_blank">sofiane.hamam@smile.fr</a>&gt;<br>
+Date: Fri, 28 Mar 2025 12:31:17 +0100<br>
+Subject: [PATCH] Makefile.am: Use SOURCE_DATE_EPOCH environment variable<b=
r>
+<br>
+This package defines PKGBLDDATE as build timestamp which makes<br>
+it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise<br>
+use build timestamp. Following best practices, see :<br>
+<a href=3D"https://reproducible-builds.org/docs/source-date-epoch/" rel=3D=
"noreferrer" target=3D"_blank">https://reproducible-builds.org/docs/source-=
date-epoch/</a><br>
+<br>
+The patch is BSD compatible too.<br>
+<br>
+Change-Id: I26c1a00f2e8059ae31fe72a794b5962af5a84f44<br>
+Co-developed-by: default avatarYoann Congal &lt;<a href=3D"mailto:yoann.co=
ngal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
+Signed-off-by: default avatarYoann Congal &lt;<a href=3D"mailto:yoann.cong=
al@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br></blockquot=
e><div><br></div><div>You forgot to cleanup the &quot;default avatar&quot; =
in this patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+Signed-off-by: Sofiane HAMAM &lt;<a href=3D"mailto:sofiane.hamam@smile.fr"=
 target=3D"_blank">sofiane.hamam@smile.fr</a>&gt;<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://review.openocd.org/c/openoc=
d/+/8619" rel=3D"noreferrer" target=3D"_blank">https://review.openocd.org/c=
/openocd/+/8619</a>]<br>
+---<br>
+ src/Makefile.am | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/Makefile.am b/src/Makefile.am<br>
+index 6d79cd631..9ca697407 100644<br>
+--- a/src/Makefile.am<br>
++++ b/src/Makefile.am<br>
+@@ -30,7 +30,10 @@ if RELEASE<br>
+ else<br>
+ %C%_libopenocd_la_CPPFLAGS +=3D -DRELSTR=3D\&quot;`$(top_srcdir)/guess-re=
v.sh $(top_srcdir)`\&quot;<br>
+ %C%_libopenocd_la_CPPFLAGS +=3D -DGITVERSION=3D\&quot;`cd $(top_srcdir) &=
amp;&amp; git describe`\&quot;<br>
+-%C%_libopenocd_la_CPPFLAGS +=3D -DPKGBLDDATE=3D\&quot;`date +%F-%R`\&quot=
;<br>
++%C%_libopenocd_la_CPPFLAGS +=3D -DPKGBLDDATE=3D\&quot;`DATE_FMT=3D+%F-%R;=
 \<br>
++=C2=A0 =C2=A0 =C2=A0 SOURCE_DATE_EPOCH=3D&quot;$${SOURCE_DATE_EPOCH:-$$(d=
ate +%s)}&quot;; \<br>
++=C2=A0 =C2=A0 =C2=A0 date -u -d &quot;@$$SOURCE_DATE_EPOCH&quot; &quot;$$=
DATE_FMT&quot; 2&gt;/dev/null || \<br>
++=C2=A0 =C2=A0 =C2=A0 date -u -r &quot;$$SOURCE_DATE_EPOCH&quot; &quot;$$D=
ATE_FMT&quot; 2&gt;/dev/null || date -u &quot;$$DATE_FMT&quot;`\&quot;<br>
+ endif<br>
+ <br>
+ # add default CPPFLAGS<br>
diff --git a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a> b/meta-oe/reci=
pes-devtools/openocd/<a href=3D"http://openocd_git.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openocd_git.bb</a><br>
index 559fe29ff..b1ce2ec16 100644<br>
--- a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
@@ -9,6 +9,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://repo.or.cz/r/git2cl.git;protoco=
l=3Dhttp;destsuffix=3Dtools/git2cl;name=3Dgit2cl;branch=3Dmaster" rel=3D"no=
referrer" target=3D"_blank">repo.or.cz/r/git2cl.git;protocol=3Dhttp;destsuf=
fix=3Dtools/git2cl;name=3Dgit2cl;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/msteveb/jimtcl.git;p=
rotocol=3Dhttps;destsuffix=3Dgit/jimtcl;name=3Djimtcl;branch=3Dmaster" rel=
=3D"noreferrer" target=3D"_blank">github.com/msteveb/jimtcl.git;protocol=3D=
https;destsuffix=3Dgit/jimtcl;name=3Djimtcl;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://repo.or.cz/r/libjaylink.git;pro=
tocol=3Dhttp;destsuffix=3Dgit/src/jtag/drivers/libjaylink;name=3Dlibjaylink=
;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">repo.or.cz/r/libjayl=
ink.git;protocol=3Dhttp;destsuffix=3Dgit/src/jtag/drivers/libjaylink;name=
=3Dlibjaylink;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 file://0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-va=
riab.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV_FORMAT =3D &quot;openocd&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f28c030631f5a9d2--

