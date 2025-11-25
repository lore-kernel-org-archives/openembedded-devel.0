Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED65CFD368
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 05:59:37 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11062.1764050375134607976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 21:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MCglH+2C;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78a712cfbc0so48231257b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764050374; x=1764655174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EeLApC9vxAY7mU/bcZdX2E35T6NA46vomcgm9bDjWOY=;
        b=MCglH+2C3FpygqLHfaXYm8kAc9CbT22hakwhdr4ejVpb5yoOzGR9cq9MbqU/01Ipnh
         P90bvICaeTVFWQ9ammFd5jKMehwKBtiNhy6CGi3NsCaFNlQmaB5DoAjtl7zneBn6Uite
         K0YMYeVM5Pjzz0hBBZhLUYcqOFSjGuc6stTc3Lrwe0WErP2/S5ETT6mIH9Z+qT8ZmN4U
         nLu6E+IwQsoq+SB2TQtNxH0LWJLRLhBMQA12riof10No7APDt0OtU8lS52u9H0K7efnN
         i/ujOUIAAsz2/LxsAV/MCORDG96a9hJrw396oWGzcOZxOc7AkuAIusCgQDmXskvpXxN6
         8FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764050374; x=1764655174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeLApC9vxAY7mU/bcZdX2E35T6NA46vomcgm9bDjWOY=;
        b=hCPUXnCxSxmlbVB/5g2PgoXNc87tT3Jay5L9l6rILbCmpCEhPI81rTy6iXVps0oa4Z
         jHqmsO61/Gc8yilysBeq8mYTjowXCIeW6i4t7hxAGNywnDjF95nFRd0dyC4VwXGPdP3L
         Xf6Tq+lmGHz8OkzCOEF1GAcCte2nBBRC9n8lwEg38TSM2xNuT3L0z4Y5tP/uTQV8pCzG
         WK28I7pqxldsBj2JjX6WG+D9HTUbmMcZ8mYYt5AamVSqSZXEvVDOw8fU2EyeIfq2xyHT
         9OIuAT/DMDl3iqvumkGPmXClYNMz9oGwylfOrs6ljsY5oKqO4HHXjsHkBH8yV5NvZfg5
         FZ5w==
X-Gm-Message-State: AOJu0Yz9rZOGsxvcFgOy7X3gpIlfAwKimOcg3YmpPU+bNoxUQRFd15zx
	nPsWxetdRDxY0Rkt5ac3tepQBN2+w1bzasI01JZeTWbHKLAtKOp7+3os/AkMFn9qLRocvMdrgs+
	R5/bRJIohGTGwe3jsu9uZQn3mZathN5w=
X-Gm-Gg: ASbGnctARW5Q2rfyLyxfxhWo7D22U3olvAvm/FrF/Z+XayDM/SLhZQoQeuQPAvIZSjo
	Ra9CGEUpP4owWQpsZpOD3xHj6uYvet+e4FsHS6V8cL6F0TS6ZH0OEXWQNy/963WRYwaD1w3f2jP
	H1I2gHAklJmabbu6zXE3nQm3pxFVFCsvV59nB1Z3tsLVHWnHDpmTIVAqpYgMD/KdhuqJB1Mm56P
	Cl/XDqyVfZ524lbRB2kFptoP2pHx/gABzM77eP3K8TzYvp3pYGMuRcifemPDG4csJfj1qcpiU4R
	rcZGmO8C5ZxMUCHkw+PArICxYtlhg2dT9IrTgYXmy46QuTOQFrHXz6p+/N4LsDajmkY1BH+bQ7P
	PLyBt9LnjKx0ypdneQo1CId6DfXmiIYTN1SNkPcxCPKQ=
X-Google-Smtp-Source: AGHT+IE1jggKlrGii2PTtLUiffKc/uYxtc0ruwfcXg9I9zGStRGXNVf59COdQBWzBr0TVTv90QQGrFvMHExpar7ccbg=
X-Received: by 2002:a05:690c:6f0d:b0:786:91ac:e16b with SMTP id
 00721157ae682-78a8b47abbcmr105299027b3.9.1764050374113; Mon, 24 Nov 2025
 21:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20251124092909.3234487-1-leon.anavi@konsulko.com>
In-Reply-To: <20251124092909.3234487-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Nov 2025 21:59:08 -0800
X-Gm-Features: AWmQ_blLy9KWGio3yJpFjr5CgYCs-Gsn-h7lUDOERDmHgTtHwxHWK5I56_gdoT8
Message-ID: <CAMKF1sqOhnb6t9O1HPnYAFpt5JWQ-XbkKzMgGfGX65_LZ+zHoQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 8.1.4 -> 9.0.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea3e2b064464fb47"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 05:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122021

--000000000000ea3e2b064464fb47
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails on qemuarm - https://errors.yoctoproject.org/Errors/Details/889836/

On Mon, Nov 24, 2025 at 1:29=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 9.0.0:
>
> - HSETEX with FXX should not create an object if it does not exist
> - Fix crash when aborting a slot migration while child snapshot is
>   active
> - Fix double MOVED reply on unblock at failover
> - Fix memory leak with CLIENT LIST/KILL duplicate filters
> - Fix incorrect accounting after completed atomic slot migration
> - Fix Lua VM crash after FUNCTION FLUSH ASYNC + FUNCTION LOAD
> - Fix invalid memory address caused by hashtable shrinking during
>   safe iteration
>
> Replace dependency hiredis with libvalkey.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../hiredis-use-default-CC-if-it-is-set.patch | 43 -------------------
>  .../{valkey_8.1.4.bb =3D> valkey_9.0.0.bb}      |  7 ++-
>  2 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-se=
t.patch
>  rename meta-oe/recipes-extended/valkey/{valkey_8.1.4.bb =3D>
> valkey_9.0.0.bb} (91%)
>
> diff --git
> a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-=
set.patch
> b/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-=
set.patch
> deleted file mode 100644
> index ffb365f371..0000000000
> ---
> a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-=
set.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From a5bcf56630df520040076dd14c3c54fef0785ceb Mon Sep 17 00:00:00 2001
> -From: Venture Research <tech@ventureresearch.com>
> -Date: Fri, 8 Feb 2013 17:39:52 -0600
> -Subject: [PATCH] hiredis: use default CC if it is set
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Instead of trying to automagically figure out CC, which breaks with OE
> -as CC has spaces in it, just skip it if one was already passed in.
> -
> -Signed-off-by: Venture Research <tech@ventureresearch.com>
> -
> -Update to work with 4.0.8
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> -
> -Reworked for 6.0.4
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> -
> -Reworked for 8.0.0
> -Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> -
> -Reworked for 8.1.0
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> -
> -Upstream-Status: Inappropriate [OE-specifc]
> ----
> - deps/hiredis/Makefile | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
> -index 4a3de1f6e..49bb525cd 100644
> ---- a/deps/hiredis/Makefile
> -+++ b/deps/hiredis/Makefile
> -@@ -36,8 +36,6 @@ endef
> - export REDIS_TEST_CONFIG
> -
> - # Fallback to gcc when $CC is not in $PATH.
> --CC:=3D$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(C=
C)
> || echo gcc')
> --CXX:=3D$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo
> $(CXX) || echo g++')
> - OPTIMIZATION?=3D-O3
> - WARNINGS=3D-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings
> -Wno-missing-field-initializers
> - DEBUG_FLAGS?=3D -g -ggdb
> diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
> b/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
> rename to meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
> index 9947a9299c..82b08d7a82 100644
> --- a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
> +++ b/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
> @@ -7,17 +7,16 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D08b9159809d809e8aaa340a8387e693e"
>  DEPENDS =3D "readline lua ncurses"
>
>  SRC_URI =3D " \
> -       git://github.com/valkey-io/valkey.git;branch=3D8.1;protocol=3Dhtt=
ps \
> +       git://github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhtt=
ps \
>          file://valkey.conf \
>         file://init-valkey-server \
>         file://valkey.service \
> -       file://hiredis-use-default-CC-if-it-is-set.patch \
>         file://lua-update-Makefile-to-use-environment-build-setting.patch=
 \
>         file://oe-use-libc-malloc.patch \
>         file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>         file://GNU_SOURCE-7.patch \
>  "
> -SRCREV =3D "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
> +SRCREV =3D "5018b12b0de2d2322a1bbf6b041c43740587c0f2"
>
>  RPROVIDES:${PN} =3D "virtual-redis"
>
> @@ -41,7 +40,7 @@ PACKAGECONFIG[systemd] =3D
> "USE_SYSTEMD=3Dyes,USE_SYSTEMD=3Dno,systemd"
>  EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
>
>  do_compile() {
> -    oe_runmake -C deps hiredis lua linenoise
> +    oe_runmake -C deps libvalkey lua linenoise
>      oe_runmake
>  }
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122005):
> https://lists.openembedded.org/g/openembedded-devel/message/122005
> Mute This Topic: https://lists.openembedded.org/mt/116448996/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ea3e2b064464fb47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails on qemuarm -=C2=A0<a href=3D"https://errors.yoctopro=
ject.org/Errors/Details/889836/">https://errors.yoctoproject.org/Errors/Det=
ails/889836/</a></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 24, 2025 at 1:29=E2=80=AF=
AM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembed=
ded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Upgrade to release 9.0.0:<br>
<br>
- HSETEX with FXX should not create an object if it does not exist<br>
- Fix crash when aborting a slot migration while child snapshot is<br>
=C2=A0 active<br>
- Fix double MOVED reply on unblock at failover<br>
- Fix memory leak with CLIENT LIST/KILL duplicate filters<br>
- Fix incorrect accounting after completed atomic slot migration<br>
- Fix Lua VM crash after FUNCTION FLUSH ASYNC + FUNCTION LOAD<br>
- Fix invalid memory address caused by hashtable shrinking during<br>
=C2=A0 safe iteration<br>
<br>
Replace dependency hiredis with libvalkey.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../hiredis-use-default-CC-if-it-is-set.patch | 43 ------------------=
-<br>
=C2=A0.../{<a href=3D"http://valkey_8.1.4.bb" rel=3D"noreferrer" target=3D"=
_blank">valkey_8.1.4.bb</a> =3D&gt; <a href=3D"http://valkey_9.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">valkey_9.0.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 7 ++-<br>
=C2=A02 files changed, 3 insertions(+), 47 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/valkey/valkey/hiredis-use=
-default-CC-if-it-is-set.patch<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_8.1.=
4.bb" rel=3D"noreferrer" target=3D"_blank">valkey_8.1.4.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.0.0.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.0.0.bb</a>} (91%)<br>
<br>
diff --git a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-=
if-it-is-set.patch b/meta-oe/recipes-extended/valkey/valkey/hiredis-use-def=
ault-CC-if-it-is-set.patch<br>
deleted file mode 100644<br>
index ffb365f371..0000000000<br>
--- a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-i=
s-set.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From a5bcf56630df520040076dd14c3c54fef0785ceb Mon Sep 17 00:00:00 2001<br>
-From: Venture Research &lt;<a href=3D"mailto:tech@ventureresearch.com" tar=
get=3D"_blank">tech@ventureresearch.com</a>&gt;<br>
-Date: Fri, 8 Feb 2013 17:39:52 -0600<br>
-Subject: [PATCH] hiredis: use default CC if it is set<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Instead of trying to automagically figure out CC, which breaks with OE<br>
-as CC has spaces in it, just skip it if one was already passed in.<br>
-<br>
-Signed-off-by: Venture Research &lt;<a href=3D"mailto:tech@ventureresearch=
.com" target=3D"_blank">tech@ventureresearch.com</a>&gt;<br>
-<br>
-Update to work with 4.0.8<br>
-Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
-<br>
-Reworked for 6.0.4<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
-<br>
-Reworked for 8.0.0<br>
-Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" t=
arget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
-<br>
-Reworked for 8.1.0<br>
-Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
-<br>
-Upstream-Status: Inappropriate [OE-specifc]<br>
----<br>
- deps/hiredis/Makefile | 2 --<br>
- 1 file changed, 2 deletions(-)<br>
-<br>
-diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile<br>
-index 4a3de1f6e..49bb525cd 100644<br>
---- a/deps/hiredis/Makefile<br>
-+++ b/deps/hiredis/Makefile<br>
-@@ -36,8 +36,6 @@ endef<br>
- export REDIS_TEST_CONFIG<br>
- <br>
- # Fallback to gcc when $CC is not in $PATH.<br>
--CC:=3D$(shell sh -c &#39;type $${CC%% *} &gt;/dev/null 2&gt;/dev/null &am=
p;&amp; echo $(CC) || echo gcc&#39;)<br>
--CXX:=3D$(shell sh -c &#39;type $${CXX%% *} &gt;/dev/null 2&gt;/dev/null &=
amp;&amp; echo $(CXX) || echo g++&#39;)<br>
- OPTIMIZATION?=3D-O3<br>
- WARNINGS=3D-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -Wno=
-missing-field-initializers<br>
- DEBUG_FLAGS?=3D -g -ggdb<br>
diff --git a/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_8.1.4=
.bb" rel=3D"noreferrer" target=3D"_blank">valkey_8.1.4.bb</a> b/meta-oe/rec=
ipes-extended/valkey/<a href=3D"http://valkey_9.0.0.bb" rel=3D"noreferrer" =
target=3D"_blank">valkey_9.0.0.bb</a><br>
similarity index 91%<br>
rename from meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_8.1.4.=
bb" rel=3D"noreferrer" target=3D"_blank">valkey_8.1.4.bb</a><br>
rename to meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.0.bb</a><br>
index 9947a9299c..82b08d7a82 100644<br>
--- a/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_8.1.4.bb" re=
l=3D"noreferrer" target=3D"_blank">valkey_8.1.4.bb</a><br>
+++ b/meta-oe/recipes-extended/valkey/<a href=3D"http://valkey_9.0.0.bb" re=
l=3D"noreferrer" target=3D"_blank">valkey_9.0.0.bb</a><br>
@@ -7,17 +7,16 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D08b915980=
9d809e8aaa340a8387e693e&quot;<br>
=C2=A0DEPENDS =3D &quot;readline lua ncurses&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/valkey-io/va=
lkey.git;branch=3D8.1;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/valkey-io/valkey.git;branch=3D8.1;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/valkey-io/va=
lkey.git;branch=3D9.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">github.com/valkey-io/valkey.git;branch=3D9.0;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://valkey.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init-valkey-server \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://valkey.service \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://hiredis-use-default-CC-if-it-is-set.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lua-update-Makefile-to-use-environment-b=
uild-setting.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://oe-use-libc-malloc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-Do-not-reset-FINAL_LIBS.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://GNU_SOURCE-7.patch \<br>
=C2=A0&quot;<br>
-SRCREV =3D &quot;5f4bae3ea10174a7c872cc099c953b0e91afa93a&quot;<br>
+SRCREV =3D &quot;5018b12b0de2d2322a1bbf6b041c43740587c0f2&quot;<br>
<br>
=C2=A0RPROVIDES:${PN} =3D &quot;virtual-redis&quot;<br>
<br>
@@ -41,7 +40,7 @@ PACKAGECONFIG[systemd] =3D &quot;USE_SYSTEMD=3Dyes,USE_SY=
STEMD=3Dno,systemd&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 oe_runmake -C deps hiredis lua linenoise<br>
+=C2=A0 =C2=A0 oe_runmake -C deps libvalkey lua linenoise<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake<br>
=C2=A0}<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122005): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122005" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122005</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116448996/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116448996/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ea3e2b064464fb47--

