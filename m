Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20946C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 16:03:33 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46424.1785773012312430383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 09:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VzYYWhIs;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6688dfaed31so4483374d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 09:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773011; cv=none;
        d=google.com; s=arc-20260327;
        b=gzLy1lwquAH86hh27rdx9BF/lOF7+pQGwUAxkDZBNse6qlvvrMtBQMkX+X6ZsbYb0T
         5Mt8ZtG6oN07x3yrbFrTXcj0voBKf3cI/O0PyaFKPBkIoXNxgffKyKIDW5SxKtK1olAv
         ld9a0s0N18pUBN0r5HST0inhoHVzaZu80C6W7JkrVxYpNRnwIhiEZ5SCoxpBlj41M2+t
         bWxAKUWwBwTH4VuftSSJbPZomxuEWUk1Pl4uYaiV6bYIJ+gY65w5MPk0wNijMkH+1/Tc
         2nYfGnWvbVUgDQa7pLZ5MVlAt1YnUSajMUWKW33MMjQr1YNHvUKAlfdEvwyjXHHJ1Elz
         qTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r6OjkjQpfyoREMl5GX9HHPzsNWaDswbeHPO+ZrkA7mc=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=hY3A7ZBkIVEg4XB7yMH4Zv3AZ9hXoSgXuPIjfZfEciUSHuOZYufJxtNiSJrflQ1T21
         u7bTvksfZH7uGvDwMKuH4bCYKaY/xiwmzJalZDG+m5ypkC4W6H9bYdT/FbRHl4iaSp9r
         nw9BeIpBKzrom19BBxzgjs1B9PuOys4ApJM8JPluqMOBdopXWdH9SI7GRGPnkeG5RWvB
         gO+jYlGX2sTcxa7ZVPQ1zByu3okfyaBd4OoltRsn+EGLA7Dma5CrXpgiluRPVWMiqr3F
         /89vg7xbk/gEVBTaPiz/s9EH31ipd4dn4HBGKlZMSbqvbtdlg1QG3IuYazLll7B05h5g
         QJ/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773011; x=1786377811; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r6OjkjQpfyoREMl5GX9HHPzsNWaDswbeHPO+ZrkA7mc=;
        b=VzYYWhIsGq6P6u+lanQVF6Wrkc9dGXLs2zQ6ADA1pVMwnMkdJ6ns55Un1LsbDHuCd1
         iiyUFvE8WMgSX2UqNZeqch9owSL70pwpuhLiUi4dklyJ5zZ86I2vs1k/F4NmkRa++/QQ
         9FJScn841pBIB8ZZN2HwaF3rAJEpl5CSjzq9HGILGNohLYpynFG1GYQLXkBXFtWPLJva
         eoB4mq61FU4fA8U+98jYfxVpyodnoe2rAzqESuGSu5soTaB+SPamQNN/3Jh2OJQglxim
         ogDfV6q1iOCeZt6gbNyI9UVJ8xUDya+/whajNXlPLCwd6dwqa3vx8vBa5dGcNkcw9Qhh
         8OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773011; x=1786377811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r6OjkjQpfyoREMl5GX9HHPzsNWaDswbeHPO+ZrkA7mc=;
        b=ON5ykRSCURSySHDn5AZw7pR2NZEVp/1/n23aAitI0urtJ18Rr+nnJOQt9lxAGQVM1i
         Ce/x/y+CfZApPE6pReGIwSU/7IshiTqmnDnet6IyPqMgQ+eGukRZxLQCfMEtG4Guy82Q
         9aVKC2sOs/5696Vb2H/IESZrSj6M79JhX8OsfZBvH8rWwWowL56KzSGEM00Qnyidb9F0
         mT2ahiIdcH9HCW3+IqqUEPVLgcLp2xH/Cx7JuymMuEnabATmnteF+2qMEppZKDQ5/Gyo
         3PONBwzqUer+9AYM0dLXf+Fe2zRS6Lbz98+q2FqvfBb7RwUZDxNH1rqdmIF5Q1KRIxkw
         th3g==
X-Gm-Message-State: AOJu0Yyi4w/odYqwnE2mgSZkmYx6uCfj7+zmZbOkjNiwKrwG0X4Wvy0y
	hlmzj454AGwZOEB0UtoNWXGV2fD/OQoarb5RdJuQfHR+bPj1qtSmeijSm4dbAROaNaVsN9owAU9
	LTl2AltuNlBppEqVtyWIWwPgFbOIP89Q=
X-Gm-Gg: AR+sD128MiTyljRS6Feud/ZKE3PBAwETLoQcX/WLANLqCqmBfn9AhyJs0h2ZujxQR/s
	CkL5tpRh0xMF+y0oV32ZY6caqcVHrPxE15I4Ry/YDD/sr+Py9AeUpTL1Li+ZuGyTjCPZTE55Ve0
	iJCw3ZxLFNCcngvzQz8esXg3US9YMrQ7gKGoehQMQEvaGfvfjAKDxRGcP/wE1/J4BQvh1Dcbvni
	tcP0urDKErtF1ULlU3aUk23k1gQaRqVws5hFjTcAjT63UBzmLYSWf7mopCVu8rw99qNSwV/b4mu
	cx2F9g72A1mI+klxHVAM27To2/NJhlY8HWuFa46Ri4PddhRohEii5BvesIHaRrILjFofeMfHGOv
	KskslgGcZXcmQzUolMfkcvRTgXzX52//bQBxZp/enkD1aKk3J+zD9qQT01EtEpfZV46KpiLtADL
	K/gNC3tD0pSpiSD5v+PJt0tzpJQkPxJncfxR6jSmc7KA==
X-Received: by 2002:a53:a58b:0:b0:664:ed6f:4eb1 with SMTP id
 956f58d0204a3-6694f02412dmr8690771d50.16.1785773010762; Mon, 03 Aug 2026
 09:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260803112055.3926085-1-ankur.tyagi85@gmail.com> <20260803112055.3926085-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260803112055.3926085-2-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Aug 2026 09:03:01 -0700
X-Gm-Features: AUfX_mymke2EkHYsghYWTOiZ48C7tr0kjx_TedkMIOUOmKDoOXxs1-B3d_cKTRI
Message-ID: <CAMKF1srBrKe=4Qw0EQKJ11eT2Y6rKSEwia68JQo2RL9yrpSwzQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/6] gtkwave: upgrade 3.3.127 -> 3.3.128
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4c277065826ad3a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128695

--000000000000f4c277065826ad3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 4:21=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> License-Update: update md5sum
>

we need to mention what is the reason for the checksum update.


>
> Changelog:
> - Hurd compile fix.
> - Update lz4 to 1.10.0.
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../gtkwave/{gtkwave_3.3.127.bb =3D> gtkwave_3.3.128.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb =3D>
> gtkwave_3.3.128.bb} (89%)
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> index 774a30e1a4..62ffafe08d 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> @@ -3,10 +3,10 @@ DESCRIPTION =3D "gtkwave is a viewer for VCD (Value Cha=
nge
> Dump) files which are u
>  HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
>
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5b1819073ecce49dec65a690b638=
c48"
>
>  SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D
> "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
> +SRC_URI[sha256sum] =3D
> "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8eae5af58070ef1d1f8"
>  S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
>
>  DEPENDS =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128677):
> https://lists.openembedded.org/g/openembedded-devel/message/128677
> Mute This Topic: https://lists.openembedded.org/mt/120575195/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f4c277065826ad3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, =
2026 at 4:21=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur =
Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">anku=
r.tyagi85@gmail.com</a>&gt;<br>
<br>
License-Update: update md5sum<br></blockquote><div><br></div><div>we need t=
o mention what is the reason for the checksum update.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Changelog:<br>
- Hurd compile fix.<br>
- Update lz4 to 1.10.0.<br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gtkwave/{<a href=3D"http://gtkwave_3.3.127.bb" rel=3D"noreferrer"=
 target=3D"_blank">gtkwave_3.3.127.bb</a> =3D&gt; <a href=3D"http://gtkwave=
_3.3.128.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/gtkwave/{<a href=3D"http://gtkwave_3.=
3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a> =3D&g=
t; <a href=3D"http://gtkwave_3.3.128.bb" rel=3D"noreferrer" target=3D"_blan=
k">gtkwave_3.3.128.bb</a>} (89%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3=
.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a> b/meta=
-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.128.bb" rel=3D"n=
oreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
similarity index 89%<br>
rename from meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.=
127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a><br>
rename to meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.12=
8.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
index 774a30e1a4..62ffafe08d 100644<br>
--- a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.127.bb=
" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a><br>
+++ b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.128.bb=
" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
@@ -3,10 +3,10 @@ DESCRIPTION =3D &quot;gtkwave is a viewer for VCD (Value =
Change Dump) files which are u<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/" rel=3D=
"noreferrer" target=3D"_blank">http://gtkwave.sourceforge.net/</a>&quot;<br=
>
<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D75859989545e37968a99b631ef=
42722e&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc5b1819073ecce49dec65a690b=
638c48&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/gtkwave-g=
tk3-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.s=
ourceforge.net/gtkwave-gtk3-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f19da2db43b27bbcc669725843451945a68c3a4ce2325=
62e341d6f63b80b55e4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;817e197fc1808f8aac3543c2c2f9683cb01368c91192b=
8eae5af58070ef1d1f8&quot;<br>
=C2=A0S =3D &quot;${UNPACKDIR}/${BPN}-gtk3-${PV}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128677): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128677" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128677</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120575195/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120575195/1997914</a><br>
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

--000000000000f4c277065826ad3a--

