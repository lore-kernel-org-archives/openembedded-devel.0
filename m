Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B042EC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 14:29:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.51267.1748874546017016061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jun 2025 07:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YpiTAZvU;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so3918848f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 07:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1748874544; x=1749479344; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntQBLFswms4OhCDaiCSrz9kzcSY+7GhPlzc4c7YOlu0=;
        b=YpiTAZvUZqRIFWhWvzRq6l7/7/bk1cQKUn1LTIP0AiEyaTsDBItN47dU9H5PfdSfq+
         r3vFPgDRDCMHHcTuv6sU2xJmR9Osp60CNtX4eQPhUfhb0liW6hXp5lDevi4oT/md+wqc
         dfPwqSZKJYt++Kd71sMb31YyMhycOfu6pVu/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748874544; x=1749479344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntQBLFswms4OhCDaiCSrz9kzcSY+7GhPlzc4c7YOlu0=;
        b=k4xgX/5VYczxya4xphAKcvNTgUX0mxRM2Xycwi69hktqCPSQnCY5nmhsobzCcRcWzu
         ib9HFfaF37yjbuBdxjtVrFQZeDf/4lfMrO6i7SJeieKN+Ah3kPYqWqhx67sYUlWUtX9v
         5TJmRPAQJkxXv/exJe8oLvs2pMOGJLAWPkZ55KJutEJGf7kJRsNc4gC8C2A8Vc4d8LZy
         8lojudQrKOMyv5BAm6LvUt1LK1/EVOp0uQv6jvMFfbjMJsluln31D9J2a4/A6HoTpmM2
         Oe0FA9gIxlfGZd8kOBO4t7pINKvVYtKTyvu7itiRj2JDPuAsqRUbVZGwQqWyw5JQ182+
         4vaQ==
X-Gm-Message-State: AOJu0YxNO3753FLm4qSO8Og+RIfZ68Dnl/YxxV70mSOiskK745i9vmPh
	uOmNbC/9WKfx5nsRubtEORFnkZdwM4Qth5kUQt0+/FnIHdSpJWfeD9TecBUhIW9IKK4DSdBfC2z
	kTtiZvTUtkSSn6xTnt/6VYmiNalcGSkugF7Whp2Chew==
X-Gm-Gg: ASbGncv0TW18zEuZVq/UG8xxrFBHWiIkmma4Disyq9lmG2YV7Qr/oV55o9mAK299Lkr
	GMUtg/i54/lwdEfmWldvNQ9vMH+khcpDmbGF5Ue0bw2g/74tQC6wB/d+BgyUweOABoBpK2Bs2AQ
	b9oBYruh+D50kRjC86f+UMNdNwrEO/jNF1vKMTeOKB7ZZlNNvlSudmjauEdu3+MvFdAPjJ4zpl9
	9EAhg==
X-Google-Smtp-Source: AGHT+IH+dg+GfviHpHjpnO21a0Rs0bhM3RoUIkbqh+XBTPly9Z2mRjm9uAn3D+asBmgPPz8tvNdkqoKgvEfe5FSdqJw=
X-Received: by 2002:a05:6000:2303:b0:3a4:deb9:8964 with SMTP id
 ffacd0b85a97d-3a4f7a4d340mr10090257f8f.17.1748874544059; Mon, 02 Jun 2025
 07:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250602140828.518094-1-kelefa.sane@smile.fr>
In-Reply-To: <20250602140828.518094-1-kelefa.sane@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 2 Jun 2025 16:28:37 +0200
X-Gm-Features: AX0GCFtHSMzKLpSgpY6SnvTcsPIMI7NZJA8eNV93nfqWarJGazUKWhc-_WRxySA
Message-ID: <CAMSfU+61BmpJJezOqY92wHUfMrXwWsjn=a2NBXUvjckF30qYYg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] imx-cst:fix race condition build error
To: kelefa.sane@smile.fr
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4b3a40636979588"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Jun 2025 14:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117708

--000000000000f4b3a40636979588
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 2 juin 2025 =C3=A0 16:08, kelefa.sane via lists.openembedded.org
<kelefa.sane=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :

> From: K=C3=A9l=C3=A9fa San=C3=A9 <kelefa.sane@smile.fr>
>
> Add missing makefile rule depedency on compilation of cst_lexer.c, which
> require header cst_parser.h generated at compilation with cst_parser.c
>
> This issue has been detected during the Yocto autobuilder test CI,
> probably during a high CPU load
> (
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/ste=
ps/33/logs/stdio
> ).
>
> Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>


> ---
>  ...fix-missing-makefile-rule-dependency.patch | 45 +++++++++++++++++++
>  .../recipes-support/imx-cst/imx-cst_3.4.0.bb  |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-de=
pendency.patch
>
> diff --git
> a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> new file mode 100644
> index 0000000000..ce7626ab31
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-=
dependency.patch
> @@ -0,0 +1,45 @@
> +From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D <kelefa=
.sane@smile.fr>
> +Date: Mon, 2 Jun 2025 11:07:08 +0200
> +Subject: [PATCH] fix missing makefile rule dependency
> +
> +During, the package build with an high CPU load we can face
> +a build failed issue, caused by the header file cst_parser.h not present
> +when compiling cst_lexer.c, which depend on cst_parser.h:
> +| x86_64-poky-linux-gcc  ... -c cst_lexer.c -o cst_lexer.d
> +| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:
> +|cst_parser.h: No such file or directory
> +|    21 | #include "cst_parser.h"
> +|       |          ^~~~~~~~~~~~~~
> +| compilation terminated.
> +
> +The file cst_parser.h is generated during compilation
> +by a makefile rule which also generate cst_parser.c
> +
> +To fix the issue, makefile rule needed to be update
> +in order for compilation of cst_lexer.c to be done,
> +always after the generation of cst_parser.h and .c
> +
> +Upstream-Status: Submitted [
> https://community.nxp.com/t5/Other-NXP-Products/Package-imx-code-signing-=
tool-3-4-0-dfsg-2-build-issue/m-p/2108575#M28853
> ]
> +
> +Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
> +---
> + code/build/make/rules.mk | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/code/build/make/rules.mk b/code/build/make/rules.mk
> +index 7720e4b..239108b 100644
> +--- a/code/build/make/rules.mk
> ++++ b/code/build/make/rules.mk
> +@@ -35,6 +35,11 @@ LFLAGS  :=3D -t
> +       @echo "Link $@"
> +       $(LD) $^ $(LDFLAGS) -o $@
> +
> ++# Compilation of cst_lexer.c require cst_parser.h
> ++# (cst_lexer.c include cst_parser.h) which is generated
> ++# by the same makefile genrating cst_parser.c
> ++cst_lexer.o: cst_parser.c
> ++
> + %.o: %.c
> +       @echo "Compile $@"
> +       # generate dependency file
> diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> index c4b7ce032d..375c0b4e10 100644
> --- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> +++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> @@ -16,6 +16,7 @@ DEBIAN_PGK_VERSION =3D "${PV}+dfsg"
>
>  SRC_URI =3D "\
>
>  ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBIAN_P=
GK_VERSION}.orig.tar.xz
> \
> +    file://0001-fix-missing-makefile-rule-dependency.patch \
>  "
>
>  SRC_URI[sha256sum] =3D
> "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5df965c5952eba8c8d"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117707):
> https://lists.openembedded.org/g/openembedded-devel/message/117707
> Mute This Topic: https://lists.openembedded.org/mt/113428702/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f4b3a40636979588
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 2 =
juin 2025 =C3=A0=C2=A016:08, kelefa.sane via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;kelefa.sane=3D<a href=3D"mailto:=
smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: K=C3=A9l=C3=A9fa San=C3=A9 &lt;<a href=3D"mailto:kelefa.sane@smile.=
fr" target=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br>
<br>
Add missing makefile rule depedency on compilation of cst_lexer.c, which<br=
>
require header cst_parser.h generated at compilation with cst_parser.c<br>
<br>
This issue has been detected during the Yocto autobuilder test CI,<br>
probably during a high CPU load<br>
(<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/bui=
lds/46/steps/33/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/46/steps/33/logs/s=
tdio</a>).<br>
<br>
Signed-off-by: Kelefa Sane &lt;<a href=3D"mailto:kelefa.sane@smile.fr" targ=
et=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">=
yoann.congal@smile.fr</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
=C2=A0...fix-missing-makefile-rule-dependency.patch | 45 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">imx-cst_3.4.0.bb</a>=C2=A0 |=C2=A0 1 +<br=
>
=C2=A02 files changed, 46 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-m=
issing-makefile-rule-dependency.patch<br>
<br>
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makef=
ile-rule-dependency.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fi=
x-missing-makefile-rule-dependency.patch<br>
new file mode 100644<br>
index 0000000000..ce7626ab31<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rul=
e-dependency.patch<br>
@@ -0,0 +1,45 @@<br>
+From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?K=3DC3=3DA9l=3DC3=3DA9fa=3D20San=3DC3=3DA9?=3D &lt;<a hr=
ef=3D"mailto:kelefa.sane@smile.fr" target=3D"_blank">kelefa.sane@smile.fr</=
a>&gt;<br>
+Date: Mon, 2 Jun 2025 11:07:08 +0200<br>
+Subject: [PATCH] fix missing makefile rule dependency<br>
+<br>
+During, the package build with an high CPU load we can face<br>
+a build failed issue, caused by the header file cst_parser.h not present<b=
r>
+when compiling cst_lexer.c, which depend on cst_parser.h:<br>
+| x86_64-poky-linux-gcc=C2=A0 ... -c cst_lexer.c -o cst_lexer.d<br>
+| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:<br>
+|cst_parser.h: No such file or directory<br>
+|=C2=A0 =C2=A0 21 | #include &quot;cst_parser.h&quot;<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~<br>
+| compilation terminated.<br>
+<br>
+The file cst_parser.h is generated during compilation<br>
+by a makefile rule which also generate cst_parser.c<br>
+<br>
+To fix the issue, makefile rule needed to be update<br>
+in order for compilation of cst_lexer.c to be done,<br>
+always after the generation of cst_parser.h and .c<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://community.nxp.com/t5/Other-=
NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-issue/m-p/210=
8575#M28853" rel=3D"noreferrer" target=3D"_blank">https://community.nxp.com=
/t5/Other-NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-iss=
ue/m-p/2108575#M28853</a>]<br>
+<br>
+Signed-off-by: Kelefa Sane &lt;<a href=3D"mailto:kelefa.sane@smile.fr" tar=
get=3D"_blank">kelefa.sane@smile.fr</a>&gt;<br>
+---<br>
+ code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" target=3D"=
_blank">rules.mk</a> | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer=
" target=3D"_blank">rules.mk</a> b/code/build/make/<a href=3D"http://rules.=
mk" rel=3D"noreferrer" target=3D"_blank">rules.mk</a><br>
+index 7720e4b..239108b 100644<br>
+--- a/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rules.mk</a><br>
++++ b/code/build/make/<a href=3D"http://rules.mk" rel=3D"noreferrer" targe=
t=3D"_blank">rules.mk</a><br>
+@@ -35,6 +35,11 @@ LFLAGS=C2=A0 :=3D -t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Link $@&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LD) $^ $(LDFLAGS) -o $@<br>
+ <br>
++# Compilation of cst_lexer.c require cst_parser.h <br>
++# (cst_lexer.c include cst_parser.h) which is generated<br>
++# by the same makefile genrating cst_parser.c<br>
++cst_lexer.o: cst_parser.c<br>
++<br>
+ %.o: %.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Compile $@&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# generate dependency file<br>
diff --git a/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">imx-cst_3.4.0.bb</a> b/meta-oe/r=
ecipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.0.bb" rel=3D"noreferre=
r" target=3D"_blank">imx-cst_3.4.0.bb</a><br>
index c4b7ce032d..375c0b4e10 100644<br>
--- a/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">imx-cst_3.4.0.bb</a><br>
+++ b/meta-oe/recipes-support/imx-cst/<a href=3D"http://imx-cst_3.4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">imx-cst_3.4.0.bb</a><br>
@@ -16,6 +16,7 @@ DEBIAN_PGK_VERSION =3D &quot;${PV}+dfsg&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK=
_NAME}_${DEBIAN_PGK_VERSION}.orig.tar.xz \<br>
+=C2=A0 =C2=A0 file://0001-fix-missing-makefile-rule-dependency.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;52ee3cee3bc500a42095f73c4584e223b4b9d2df=
c1cd3e5df965c5952eba8c8d&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117707): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117707" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117707</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113428702/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113428702/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f4b3a40636979588--

