Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9CEC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 03:44:23 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25055.1787111053321363045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 20:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MI8ITNxC;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso896010a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 20:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787111051; cv=none;
        d=google.com; s=arc-20260327;
        b=GpjmUEBFSigcy4QE3FC+xbOyVYJyTvfbcD6VhH0hlqkg3pApQly6ganthD9ER0lBEw
         tg/h0aq3cjs0ESh5lLQibjNfaOeD87tdh7FsYrc1AMinbEsbHzLwSRpVuwBmrLXwpshF
         H5m9MmwuJIctlHv0SEkc7pIk0WoDVmT3vSMbtqKW1AagYA7eXDWFCXp8DpMB+Opq8Qjz
         huzSg1X9k1XjdUwGQtX3QvlL40sWxqJ/bjQUGCCvGbRTkZIWvxrACCm2ew9fkQ3RRfIo
         T5mgqF3CYHlxST0NvqKjY3DsDJy8CyQuJIadgn4jrqGjAB0vF1SxPSKx/uIXPZgkitrT
         ha0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G3SCwEceX+b9GvS7uytxaq+M9BvAXGBVRoEckzyoqJs=;
        fh=Nt0SiAbLnLwrEcefm911TIzysFSRtVFtN7eq+bt+gQ4=;
        b=mz6kgQ6osByIIckzCZXrpypaDw8ek3vfdikflxvbVs5yOvlEZt7E36JYtQWHJGmX8v
         JfT0MycLjBEQcde9GKs5QTWu4lk+nJEFqKroamr3rxTKIS6WWuGdhe0OCuG6RfpQt/fj
         b5SCqn4g8bfi3LVv630sHJbGKLpxyGi6HJdLG7dGJjm78nBLZBQT/2DpnnmR8Rz4WS8W
         K7pLsblB6j5ELjAYdxP9T2gpFh1WhPtSx+1clK9Zy9A+2gygBqhEs7AOnnW9dBngUDA9
         AkJM2DfG1ud1bN0gatuRTkh0PbjGDODpuuV/iT/3Fae8newvGdeq4oSsK+vypo1fxEla
         Twdg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787111051; x=1787715851; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3SCwEceX+b9GvS7uytxaq+M9BvAXGBVRoEckzyoqJs=;
        b=MI8ITNxC2BKGighZG1lxtySPIAr44XCYv6UUTGJh/JvaxB70BsfsmVezVOl+aco8Rt
         noi4IUs92mcZmE9BeM5P0nqRJnYaTI5lm05X/06UUOCFvAc9f/bUPeJNUkDB9CflkdRi
         gwhiheb/SdQ12bBM8/3eNZumQqVQcSAQUsFg7kHlmm1ZgzW7MU4eo6n1GFBC5LiRwiXB
         FPQ6tg3zo5ijr6Il9hWXwmv5+E6Ha9dLoAp8Y9erq0G/TYMJ11uojmgHcXs2SbEj0sus
         GExi/jDXvkzxPKQzcgjw80Ur9szyQSg9flxOnas5JQt3bx2Vpo+EOPU73zY9fVUWD03r
         TGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787111051; x=1787715851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G3SCwEceX+b9GvS7uytxaq+M9BvAXGBVRoEckzyoqJs=;
        b=Y+AjBTW2bmLrNMzGKhq+blKCXYrzZGFSIvkomg4UceK+5NKKGfgkKYYD/PEGN1exI0
         y3z/apDMrE/QQ8wAKeHH2dl6tYxQlivWHqkcsR0oS/gts2RU34lHmWpbxfZVWQQBDz7j
         ib7TytMo1mzyS2eGOgVFa45Kjicm+pHn0JAjllXoyjcxbiH6VZZktrMPv2mFASyN4bXf
         A4GASNIVQj/uWY/ytthXoy1Q/7pJFD38HH8SBr+2ZHZIFw5XUMM3m5B5czcciFw6uVT7
         vQvv+ecgyM7nk4UMkCI0RgAu3rsNTllIcj7jIXc5aih0AqcvVNJ2b5vNTS7ehxrwom8D
         2pbA==
X-Gm-Message-State: AOJu0YxiEm43J9dFk6MMJMkh7ZeNr6HcQgOm+nDKlmIf0xCASJNW4aE6
	F6B0Wc7sC0Qi22Y3VzK4DG/PKOF8Nv8dYqKtCIyUEKF3Sqc8CZEvRgGx+F/aS0U2TQ9b7rQjCTa
	RooVlzPD2OI3DD9wHPnCEWRu9N5AKs+w=
X-Gm-Gg: AR+sD10NaIxa1GJiCKXjUfbMaodbW5kfF79Y4oe1mOcaDeP5eUiByO3ZZ2l0Wk3P33c
	SfZ+1sG53m91YiNB5ri9y4GH8Lf1tDLwPsMhmq5pYjTur0qS4zq4g6PhfIqKJ204Rhrc5D8bsgk
	eCrcqEdgksNjG/F/a53awvOfiWPac3/kf4lNbzuplUWjvfL64SIdNkLloBeTexoTvIO/8Qp6h5L
	ZO1Q77EFNOOjyiZ/K9S5Zp+PvD4PycVAJTIlIYgfrTalC1PQryIxWMTJevW3rz+cZp5tfRAdMZb
	HjzSjE0VF4mbNeNdCZRajzPZolHpL8sYB/3N9F2tpBPKKQa3S0O7R6Ag3ohciLIR1vkh76LeI/Q
	DUHfTvPCFWQDqejj02AeeIaxMQBvSek3I2lq27GxON6V+CfOHXVuPBs6SIcjGc4QXqM/p0F05ra
	mlSEz9cNH4F3FT0CfyXoNbwEsni0Cs7butILQZvBS5ApvnpbbGIqJG10dZKn3rltCPpKlp6eJPm
	/WDBE/aqmzgendQ
X-Received: by 2002:a05:6402:a0c6:b0:697:e953:d14d with SMTP id
 4fb4d7f45d1cf-6a403327980mr473350a12.17.1787111051258; Tue, 18 Aug 2026
 20:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260818124329.54509-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260818124329.54509-1-jaipaul.cheernam@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Aug 2026 20:43:42 -0700
X-Gm-Features: AcwNN1Xb1eNScUGWoSBFFLs-5pdKtYSlkZ1x4e1E7hp-ZVe6rZimlqJ6RfzGRKU
Message-ID: <CAMKF1spj4D9ozv7HPnb62ANB9kg_kdy1Yp+YMYVtBbT6LkPK=Q@mail.gmail.com>
Subject: Re: [PATCH] libtracefs: remove recipe (moved to oe-core)
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000626e8506595e37f8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 03:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129244

--000000000000626e8506595e37f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ping again when it gets applied in core.

On Tue, Aug 18, 2026 at 5:43=E2=80=AFAM Jaipaul Cheernam <jaipaul.cheernam@=
est.tech>
wrote:

> libtracefs has been imported into openembedded-core [1] as it is now
> required by powertop 2.16 (upstream commit 2b133ed [2]). Remove it
> from meta-oe to avoid duplicate recipes.
>
> - This commit is depends on [1]
>
> [1] https://lists.openembedded.org/g/openembedded-core/topic/120806764
> [2]
> https://github.com/fenrus75/powertop/commit/2b133ed512c6852cf81cb98831bdf=
d585c0317bf
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...not-preserve-ownership-in-cp-command.patch | 28 -------------------
>  .../libtracefs/libtracefs_1.8.3.bb            | 25 -----------------
>  2 files changed, 53 deletions(-)
>  delete mode 100644
> meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-preserv=
e-ownership-in-cp-command.patch
>  delete mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
>
> diff --git
> a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch
> b/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch
> deleted file mode 100644
> index 7eaf29e4c4..0000000000
> ---
> a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 21 Dec 2022 22:50:56 -0800
> -Subject: [PATCH] makefile: Do not preserve ownership in cp command
> -
> -Fixes
> -ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs:
> /usr/lib/libtracefs.so is owned by uid 1000, which is the same as the use=
r
> running bitbake. This may be due to host contamination
> [host-user-contaminated]
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 7f4f5c3..1ba7b9d 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -296,7 +296,7 @@ endif # DESTDIR =3D ""
> -
> - install_libs: libs install_pkgconfig
> -       $(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(libdir_SQ)); \
> --              cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
> -+              cp --no-preserve=3Downership --recursive $(LIB_INSTALL)
> $(DESTDIR)$(libdir_SQ)
> -       $(Q)$(call
> do_install,$(src)/include/tracefs.h,$(includedir_SQ),644)
> -       $(Q)$(call install_ld_config)
> -
> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> deleted file mode 100644
> index 117716dad2..0000000000
> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -
> -SUMMARY =3D "Library to parse raw trace event formats    "
> -HOMEPAGE =3D "
> https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/"
> -LICENSE =3D "GPL-2.0-or-later AND LGPL-2.1-or-later"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749254a51215d13f97 \
> -
> file://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50909238dbd"
> -SECTION =3D "libs"
> -DEPENDS =3D "libtraceevent bison-native flex-native"
> -
> -SRCREV =3D "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
> -SRC_URI =3D "git://
> git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=3D${BPN};proto=
col=3Dhttps
> <http://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=3D$%7B=
BPN%7D;protocol=3Dhttps>
> \
> -
>  file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
> -           "
> -
> -inherit pkgconfig bash-completion
> -
> -do_compile:prepend() {
> -    touch ${S}/src/sqlhist.tab.c
> -}
> -
> -do_install() {
> -    oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgconfi=
g
> -}
>

--000000000000626e8506595e37f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ping again when it gets applied in core.</div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Aug 18, 2026 at 5:43=E2=80=AFAM Jaipaul Cheernam &lt;jai=
paul.cheernam@est.tech&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">libtracefs has been imported into openembedded-core [1] a=
s it is now<br>
required by powertop 2.16 (upstream commit 2b133ed [2]). Remove it<br>
from meta-oe to avoid duplicate recipes.<br>
<br>
- This commit is depends on [1]<br>
<br>
[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/120=
806764" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/topic/120806764</a><br>
[2] <a href=3D"https://github.com/fenrus75/powertop/commit/2b133ed512c6852c=
f81cb98831bdfd585c0317bf" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/fenrus75/powertop/commit/2b133ed512c6852cf81cb98831bdfd585c0317bf</a=
><br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
---<br>
=C2=A0...not-preserve-ownership-in-cp-command.patch | 28 ------------------=
-<br>
=C2=A0.../libtracefs/<a href=3D"http://libtracefs_1.8.3.bb" rel=3D"noreferr=
er" target=3D"_blank">libtracefs_1.8.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 25 -----------------<br>
=C2=A02 files changed, 53 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-kernel/libtracefs/libtracefs/0001-=
makefile-Do-not-preserve-ownership-in-cp-command.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-kernel/libtracefs/<a href=3D"http:=
//libtracefs_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.=
3.bb</a><br>
<br>
diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-=
not-preserve-ownership-in-cp-command.patch b/meta-oe/recipes-kernel/libtrac=
efs/libtracefs/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch<=
br>
deleted file mode 100644<br>
index 7eaf29e4c4..0000000000<br>
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs/0001-makefile-Do-not-pre=
serve-ownership-in-cp-command.patch<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-From ab6f78bfd6811c648ee71663cfc4dc8be151a519 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Wed, 21 Dec 2022 22:50:56 -0800<br>
-Subject: [PATCH] makefile: Do not preserve ownership in cp command<br>
-<br>
-Fixes<br>
-ERROR: libtracefs-1.6.3-r0 do_package_qa: QA Issue: libtracefs: /usr/lib/l=
ibtracefs.so is owned by uid 1000, which is the same as the user running bi=
tbake. This may be due to host contamination [host-user-contaminated]<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- Makefile | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index 7f4f5c3..1ba7b9d 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -296,7 +296,7 @@ endif # DESTDIR =3D &quot;&quot;<br>
- <br>
- install_libs: libs install_pkgconfig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call do_install,$(LIBTRACEFS_SHARED),$(li=
bdir_SQ)); \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fpR $(LIB_INSTALL) $=
(DESTDIR)$(libdir_SQ)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp --no-preserve=3Downer=
ship --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call do_install,$(src)/include/tracefs.h,=
$(includedir_SQ),644)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(call install_ld_config)<br>
- <br>
diff --git a/meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs=
_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a> b/m=
eta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a><br>
deleted file mode 100644<br>
index 117716dad2..0000000000<br>
--- a/meta-oe/recipes-kernel/libtracefs/<a href=3D"http://libtracefs_1.8.3.=
bb" rel=3D"noreferrer" target=3D"_blank">libtracefs_1.8.3.bb</a><br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-# Copyright (C) 2022 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
-# Released under the MIT license (see COPYING.MIT for the terms)<br>
-<br>
-SUMMARY =3D &quot;Library to parse raw trace event formats=C2=A0 =C2=A0 &q=
uot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/pub/scm/libs/libtrace=
/libtraceevent.git/" rel=3D"noreferrer" target=3D"_blank">https://git.kerne=
l.org/pub/scm/libs/libtrace/libtraceevent.git/</a>&quot;<br>
-LICENSE =3D &quot;GPL-2.0-or-later AND LGPL-2.1-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSES/GPL-2.0;md5=3De6a75371ba4d16749=
254a51215d13f97 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSES/LGPL-2.1;md5=3Db370887980db5dd40659b50909238dbd&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-DEPENDS =3D &quot;libtraceevent bison-native flex-native&quot;<br>
-<br>
-SRCREV =3D &quot;6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/libs/libt=
race/libtracefs.git;branch=3D$%7BBPN%7D;protocol=3Dhttps" rel=3D"noreferrer=
" target=3D"_blank">git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;bra=
nch=3D${BPN};protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-makefile-Do-not-prese=
rve-ownership-in-cp-command.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-inherit pkgconfig bash-completion<br>
-<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 touch ${S}/src/sqlhist.tab.c<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/=
pkgconfig<br>
-}<br>
</blockquote></div>

--000000000000626e8506595e37f8--

