Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2F1C5DF70
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 22:48:11 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19260.1786920489330712505
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 15:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tJFYTh6c;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81dfdbd86d1so24649297b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 15:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786920488; cv=none;
        d=google.com; s=arc-20260327;
        b=WqEv4v+2MUdI/xledryIXWP7g5TP+1C19/IbH0Nrhtd3gzNk4wXYZvL+ZY9d73iB0W
         zCACnsVonqFWjPYtf02YcKOxucAPCNARy3w8B+oIC41dFjjhfpJTyuM+6jO2lRx+HspK
         rKg3UPYYp9X6s5b+H6weeiCUkKcGjFpaBn61TUT8x5rRK6wmnCe2anb5BjHeI3aTXljS
         fv+FFrcA7pz1Q3v66rCmw1F7F8rWOjQPpRAzpP3xGoqi1+0183mHaNZW2Kl/Ik/KtNS/
         nVrVO1yNjOJT17oTqiYntkPFQGoIIm44q0J9t48wa0tqetEfuXLsAblyEypcShJz7x0u
         UnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLFXRK9srwkX58N91O+Vzm0NnGLQzg938yVbC/X95ik=;
        fh=32dNYDkrd4iFDxQzsKU/8p0Pftk8aq/K3E3B1xpVIPU=;
        b=NSopOIabUmp7th1dV0w4VxHrKWW9o8NcLO0510hMvRAlNAjYSXHOob45I29fLk95yN
         cnjWvyzJePsTlkmv+maPAUJgfdDYt9QMbiDboSfcT32Y1DoKvLEU7aBoL6wYqfSq3YeW
         AtoZJyv0CuFi4NCrgKa1/VE/FDqdRG4PP/Yre8D/ZahB9B4wTpmP/H9UUVMtlsYzKsjU
         pgIAWt1SMTszjpjopcLzXk12DsHp1vW0nMYbO3EL1R7VjaIZrW8MPHSW4zV3ThocHgiK
         wKCRsiKiYrNRg5jSFnG1uWtcqbglfkkx4ej022wNESiTtldCLcW85rzM7KO+UmVycCAW
         xwGA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786920488; x=1787525288; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLFXRK9srwkX58N91O+Vzm0NnGLQzg938yVbC/X95ik=;
        b=tJFYTh6csyeiIquKgyGEIbMjQzYpP0r5V7maG2Z03vKJgRXEu4Fuop/tePBqvpRyS2
         6hApw0LNPhEapSAlbvweQvnuQ3QYUOoLsfw0AhUb106gj8nOxhndRliLBS1lO2T9TQX7
         Ny80UnKN6v9B8d3Ssrd4dEAfMdetr3j/ErgV5mrFdcugLYtZgxziYsJ6qm+RsujRd79d
         6MrtifIlbmR0FveSxMifTzPsYj892yKNl+XW02M2iIBBmXtGm7oITcMD9qxeUCTxORuQ
         y+LIvTBj4qBwVztm9bkNTUhyc9TT6eTTt8zUhgdOmN8sxHGm5hDbkdpjl/PMvK7+m/Op
         WANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786920488; x=1787525288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLFXRK9srwkX58N91O+Vzm0NnGLQzg938yVbC/X95ik=;
        b=SVUmijlOE5FlOTqjdugBKJMVcILw4DGgXcuqiF00ngL+GZuK4N0ufBcjjWTtQdRawv
         k3f1uBmc3qHHLVuQDliRLUfP5ysFNuThZmZMCHUXY1inbV5uhFy2hQc5ry3z1gejvHLb
         PrNkEaX5k+poA3KUjPUyV7bVT6ZcWyJXYD1YII1bT/s8QkEuvreawC1gwwudlO/aTB08
         0UCIr8+fWz4wNBQLrdW9dhKABrPzAO2uIC718aPyT4fCjI/Up889hmz4G7by1nutNMF+
         xx8TQXWY+WAqrT8mrGp4USmLS2RSRrIAT/Csk8BdquZliauirI6mH4bRv8lZBIjwmNUJ
         IV4Q==
X-Gm-Message-State: AOJu0YwvTSWLU3dZY0FKcrm5tJC6Q9HdgbeEG2H2Zsx32DJogkSZaPp/
	xkNKm54EAYj1mlblHE44/LobDiq1qxpz7M8vQJIKYQzgVsUKwea5ir3rxVt0HTmECb5bv6fE3I2
	pg5fAXBYErkYblsKTB2n8WUdD9QQJ9wQE8q21VTU=
X-Gm-Gg: AR+sD12zW2gm5VzbW6U3gaDL+YSpHnDJEJh1LF9DMIUflTWa16OJ4QdJb4Qyx6QPXOv
	7hYNLqBoJZGth4VCCfpHGTiNpVrNclgCgMyK0G2yYE8BEL79LcJPmpNg4n7A9n01Kh6R2C+ymx3
	JJXZHkU46B0fh/x5ashew46a3k4oekB4hidOOshw3Jvq0DF21boVuPkqIlOja1cr6QZUN1cyY1I
	8EBx3fTHO5V0mvGqq5TyzGnlN/Jotjemx+Pz9mz6b8QOS02i+2Lw5EM79onPjBtq2rrsDAzl+dC
	yxOK7QhAkwerpU6cbcNH5kBxLe9a5gFPWZnOEtq2fz/ddKCEK2bKKKbDFulfww0Fi8mF586+O+z
	0YnTj6Vhc7OYqG9GDbA/HdQhjToxS+X3+wg8p3ffjAbGNqmc8limGJGYhVRdW6HYiXhAr0re8Lb
	nf3tMGLh7qa1hkj6uAqmUZAmHTkGndkeV+4xhtd5LwG0tJCVWTwwb/zxsiVB9VQ8H+RVybOn3n3
	1nt/JYyig7Pag==
X-Received: by 2002:a05:690c:103:b0:836:e0bf:e86e with SMTP id
 00721157ae682-8370d9ea065mr76441857b3.13.1786920488322; Sun, 16 Aug 2026
 15:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20260816163958.3664646-1-ricardo.salveti@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Aug 2026 15:47:41 -0700
X-Gm-Features: AcwNN1UpjMckjGY0Qw6qwljzvYlRoK_kTCBy7-smHBVC05KV9g9mA-P93wGShnE
Message-ID: <CAMKF1sq_Rbg3gs2E4C+SUexJ3xZkkQ57hJP_NpeUt4wXZY2Ycw@mail.gmail.com>
Subject: Re: [oe] [PATCH] redis: fix build of the bundled xxHash with -Og
To: ricardo.salveti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f2c9ae065931d868"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 22:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129177

--000000000000f2c9ae065931d868
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 9:40=E2=80=AFAM Ricardo Salveti via lists.openembed=
ded.org
<ricardo.salveti=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> redis 8.8 started bundling a post-0.8.3 xxHash snapshot in deps/xxhash,
> which is built and linked into redis-server. Its XXH3 accumulate and
> scramble routines are marked always_inline but are only ever reached
> through function pointers, so the compiler has to resolve the indirect
> call before it can honour the attribute.
>
> xxHash drops those inline hints on its own when __NO_INLINE__ is
> defined, which covers -O0 and -fno-inline, but nothing covers -Og.
> Recent GCC no longer resolves the indirect calls at that optimisation
> level, so every build with DEBUG_BUILD =3D "1" fails:
>
>   xxhash.h:5476:1: error: inlining failed in call to 'always_inline'
>   'XXH3_scrambleAcc_neon': function not considered for inlining
>   make[2]: *** [Makefile:108: xxhash] Error 2
>   ld: cannot find ../deps/xxhash/libxxhash.a: No such file or directory
>
> Upstream xxHash closed this as not fixable in code (Cyan4973/xxHash#943)
> and instead documents XXH_NO_INLINE_HINTS as the supported way to
> compile with -Og. Define it when -Og is the selected optimisation,
> leaving regular builds untouched so xxHash keeps its inline hints there.
>
> AI-Generated: Uses Claude Code
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  meta-oe/recipes-extended/redis/redis_8.10.0.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_8.10.0.bb
> b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
> index 6176dc45be..3edaa9155c 100644
> --- a/meta-oe/recipes-extended/redis/redis_8.10.0.bb
> +++ b/meta-oe/recipes-extended/redis/redis_8.10.0.bb
> @@ -43,6 +43,14 @@ EXTRA_OEMAKE +=3D "${PACKAGECONFIG_CONFARGS}"
>
>  TARGET_LDFLAGS:append =3D " ${DEBUG_PREFIX_MAP}"
>
> +# The bundled xxHash marks its XXH3 vector paths always_inline but only
> reaches
> +# them through function pointers. It drops the inline hints on its own
> when
> +# __NO_INLINE__ is defined (-O0, -fno-inline) but never for -Og, and
> recent GCC
> +# no longer resolves those indirect calls at -Og, so deps/xxhash fails t=
o
> +# build. Upstream xxHash closed this as not fixable in code and document=
s
> +# XXH_NO_INLINE_HINTS as the supported way to compile with -Og.
> +CFLAGS:append =3D "${@' -DXXH_NO_INLINE_HINTS' if '-Og' in
> (d.getVar('SELECTED_OPTIMIZATION') or '') else ''}"
> +
>

I see that its fixed in xxhash recipe in oe-core

CFLAGS +=3D "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og',
'-DXXH_NO_INLINE_HINTS', '', d)}"

I wonder if its better to depend on system xxhash instead of using vendored
version. Please explore if that option is possible.


>  do_compile:prepend() {
>      oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129176):
> https://lists.openembedded.org/g/openembedded-devel/message/129176
> Mute This Topic: https://lists.openembedded.org/mt/120778093/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f2c9ae065931d868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 16,=
 2026 at 9:40=E2=80=AFAM Ricardo Salveti via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;ricardo.salveti=3D<a href=3D"mai=
lto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">redis 8.8 started bundling a post-0.8.3 xxHash snapshot in deps/=
xxhash,<br>
which is built and linked into redis-server. Its XXH3 accumulate and<br>
scramble routines are marked always_inline but are only ever reached<br>
through function pointers, so the compiler has to resolve the indirect<br>
call before it can honour the attribute.<br>
<br>
xxHash drops those inline hints on its own when __NO_INLINE__ is<br>
defined, which covers -O0 and -fno-inline, but nothing covers -Og.<br>
Recent GCC no longer resolves the indirect calls at that optimisation<br>
level, so every build with DEBUG_BUILD =3D &quot;1&quot; fails:<br>
<br>
=C2=A0 xxhash.h:5476:1: error: inlining failed in call to &#39;always_inlin=
e&#39;<br>
=C2=A0 &#39;XXH3_scrambleAcc_neon&#39;: function not considered for inlinin=
g<br>
=C2=A0 make[2]: *** [Makefile:108: xxhash] Error 2<br>
=C2=A0 ld: cannot find ../deps/xxhash/libxxhash.a: No such file or director=
y<br>
<br>
Upstream xxHash closed this as not fixable in code (Cyan4973/xxHash#943)<br=
>
and instead documents XXH_NO_INLINE_HINTS as the supported way to<br>
compile with -Og. Define it when -Og is the selected optimisation,<br>
leaving regular builds untouched so xxHash keeps its inline hints there.<br=
>
<br>
AI-Generated: Uses Claude Code<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salveti@oss.qu=
alcomm.com" target=3D"_blank">ricardo.salveti@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.10.0.bb</a> | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.10.0.=
bb" rel=3D"noreferrer" target=3D"_blank">redis_8.10.0.bb</a> b/meta-oe/reci=
pes-extended/redis/<a href=3D"http://redis_8.10.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">redis_8.10.0.bb</a><br>
index 6176dc45be..3edaa9155c 100644<br>
--- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.10.0.bb</a><br>
+++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.10.0.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.10.0.bb</a><br>
@@ -43,6 +43,14 @@ EXTRA_OEMAKE +=3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<=
br>
<br>
=C2=A0TARGET_LDFLAGS:append =3D &quot; ${DEBUG_PREFIX_MAP}&quot;<br>
<br>
+# The bundled xxHash marks its XXH3 vector paths always_inline but only re=
aches<br>
+# them through function pointers. It drops the inline hints on its own whe=
n<br>
+# __NO_INLINE__ is defined (-O0, -fno-inline) but never for -Og, and recen=
t GCC<br>
+# no longer resolves those indirect calls at -Og, so deps/xxhash fails to<=
br>
+# build. Upstream xxHash closed this as not fixable in code and documents<=
br>
+# XXH_NO_INLINE_HINTS as the supported way to compile with -Og.<br>
+CFLAGS:append =3D &quot;${@&#39; -DXXH_NO_INLINE_HINTS&#39; if &#39;-Og&#3=
9; in (d.getVar(&#39;SELECTED_OPTIMIZATION&#39;) or &#39;&#39;) else &#39;&=
#39;}&quot;<br>
+<br></blockquote><div><br></div><div>I see that its fixed in xxhash recipe=
 in oe-core</div><div><br></div><div>CFLAGS +=3D &quot;${@bb.utils.contains=
(&#39;SELECTED_OPTIMIZATION&#39;, &#39;-Og&#39;, &#39;-DXXH_NO_INLINE_HINTS=
&#39;, &#39;&#39;, d)}&quot;<br></div><div><br></div><div>I wonder if its b=
etter to depend on system xxhash instead of using vendored</div><div>versio=
n. Please explore if that option is possible.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake -C deps hdr_histogram fpconv hiredis lua lin=
enoise<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129176): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129176" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129176</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120778093/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120778093/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f2c9ae065931d868--

