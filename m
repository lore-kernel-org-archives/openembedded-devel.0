Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE04C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:39:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.4898.1747809558295382713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 23:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dbamkesc;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1074759966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 23:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747809556; x=1748414356; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5D2SNJ3tIw0Zs6uyWqW1dm9aYpqiP4edDXEtTpjofI=;
        b=dbamkescnP5xNL9kBEt31JC/P4fuHA67vx5+F1OjgzpCPkw3lnGrFZhgw4GWKyD4fx
         By0EkeRJ/0QOfmczNQG1e4k6KLVwOwiVZbRgQCrwQxVonECyhFQnjpiutQHJsTysduB9
         JXfM+Ao8DNLHcRr3ewHec0OKyP0874anwfJnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809556; x=1748414356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5D2SNJ3tIw0Zs6uyWqW1dm9aYpqiP4edDXEtTpjofI=;
        b=mFghdDdtvt4ETXo8VJP9q6WLS8n2EI/oluxnttEsfZuA3vvxGxttI2BcGRyP1sOpfZ
         ieHscbjsgB+fn95P5LAXa9WqKqurP+Bcbts52h8M01i3Q8/GmPo96F9B/l7PzyKU8L3Q
         nHLeEkrsyi1feAFk1ABtoy55ejil21Xmh8HnnxY5mTZHLQ/wo/kaWBKrOISVBQ8ddUXq
         FA4R8xXG7taIaS3iQUIYZ6rxUS5f7n0yfqSKiPhR6uT4vGpVDx4Sf6byf0RaLGoYekZy
         wiEwRd5dG2sjEv/+Zh4wAm0ltBU+9H3GwlyxFvVp7vOAeU0KQ6siwgsBWkNn2rYKgyy/
         MLOQ==
X-Gm-Message-State: AOJu0Yzo0DiTYObrbBYXgBt/z9KiUgtAwu+y4Y8dy1K2SxliZWLU8jhO
	HwJCjq2qycBavB+VjC3KSv8a/rmwm4Dqh0UbwLCsD+SylaM10rmtUj0XMMUJ4dKIj7bBN5Gcd6I
	weUqwd0U2lFfB9T/z1VA2GDQPTOB0UND55xI5Gw3u1lHdZtynnExBbfg=
X-Gm-Gg: ASbGncsogmxllPt6gaJ+cQ+/WNlPKs2yZRHhuyutyQ9s2VOl2WoH7Y5EStWGXCgF8KH
	Wf8RLadpZs9+Az9O4cBn4FmHtOZ1Lnc6RS66t2FRWrNqkDi2DC7pJmwom3WoOJC8BAveBQpkqgz
	5fuKC41ebZJWMM31Xl558Nh5uIic7QrLoKSA==
X-Google-Smtp-Source: AGHT+IEW/pMS53C/UBG5Gf4bi5/VNbQo54S3ZJiyM7irSdusGqed73aFgztBmH4yFqug3XYPDPcGAluLjw5p6sl2uLo=
X-Received: by 2002:a17:907:d86:b0:ad2:55e4:454e with SMTP id
 a640c23a62f3a-ad52d5e07f2mr1976216066b.58.1747809555580; Tue, 20 May 2025
 23:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250507125553.1421417-1-vanusuri@mvista.com>
In-Reply-To: <20250507125553.1421417-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 21 May 2025 12:09:03 +0530
X-Gm-Features: AX0GCFuCKEGwWaRvGXpAVCNZoGxT7E8spQdGRBcXy-oVprXfFkhSkVHPpkAMl48
Message-ID: <CANQUz18fGcRtcSHYQo1p0JtaD_4me8Ryqr_8rOLRQHHFxGnd4A@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH] proftpd: Fix CVE-2024-57392
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b21c0506359f9fdb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 06:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117524

--000000000000b21c0506359f9fdb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this ?

Thanks & Regards,
Vijay

On Wed, May 7, 2025 at 6:26=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
> https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c6d5cdb01428=
b2269427d
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../proftpd/files/CVE-2024-57392.patch        | 42 +++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
>
> diff --git
> a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
> b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
> new file mode 100644
> index 0000000000..0b50175a55
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
> @@ -0,0 +1,42 @@
> +From 981a37916fdb7b73435c6d5cdb01428b2269427d Mon Sep 17 00:00:00 2001
> +From: TJ Saunders <tj@castaglia.org>
> +Date: Sun, 9 Feb 2025 12:14:25 -0800
> +Subject: [PATCH] Issue #1866: Some of the fuzzing tests submitted in the
> + advisory ran into existing null pointer dereferences (not buffer
> overflows);
> + let's correct them. (#1867)
> +
> +Upstream-Status: Backport [
> https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c6d5cdb01428=
b2269427d
> ]
> +CVE: CVE-2024-57392
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + modules/mod_ls.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/modules/mod_ls.c b/modules/mod_ls.c
> +index 45a3187bd..f7abfe540 100644
> +--- a/modules/mod_ls.c
> ++++ b/modules/mod_ls.c
> +@@ -349,7 +349,8 @@ static int sendline(int flags, char *fmt, ...) {
> +           errno !=3D 0) {
> +         int xerrno =3D errno;
> +
> +-        if (session.d !=3D NULL) {
> ++        if (session.d !=3D NULL &&
> ++          session.d->outstrm !=3D NULL) {
> +           xerrno =3D PR_NETIO_ERRNO(session.d->outstrm);
> +         }
> +
> +@@ -1039,7 +1040,9 @@ static int outputfiles(cmd_rec *cmd) {
> +     return res;
> +   }
> +
> +-  tail->down =3D NULL;
> ++  if (tail !=3D NULL) {
> ++    tail->down =3D NULL;
> ++  }
> +   tail =3D NULL;
> +   colwidth =3D (colwidth | 7) + 1;
> +   if (opt_l || !opt_C) {
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> index ecd2777247..b45cb6aaec 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "git://
> github.com/proftpd/proftpd.git;branch=3D${BRANCH};protocol=3Dhttps
> <http://github.com/proftpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3D=
https>
>             file://contrib.patch  \
>             file://build_fixup.patch \
>             file://proftpd.service \
> +           file://CVE-2024-57392.patch \
>             "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.25.1
>
>

--000000000000b21c0506359f9fdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update on this ?<=
br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, May 7, 2025 at 6:26=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri@mvi=
sta.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanus=
uri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from <a href=3D"https://github.com/proftpd/proftp=
d/commit/981a37916fdb7b73435c6d5cdb01428b2269427d" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c=
6d5cdb01428b2269427d</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../proftpd/files/CVE-2024-57392.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4=
2 +++++++++++++++++++<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-=
2024-57392.patch<br>
<br>
diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.p=
atch b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch<b=
r>
new file mode 100644<br>
index 0000000000..0b50175a55<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch<br=
>
@@ -0,0 +1,42 @@<br>
+From 981a37916fdb7b73435c6d5cdb01428b2269427d Mon Sep 17 00:00:00 2001<br>
+From: TJ Saunders &lt;<a href=3D"mailto:tj@castaglia.org" target=3D"_blank=
">tj@castaglia.org</a>&gt;<br>
+Date: Sun, 9 Feb 2025 12:14:25 -0800<br>
+Subject: [PATCH] Issue #1866: Some of the fuzzing tests submitted in the<b=
r>
+ advisory ran into existing null pointer dereferences (not buffer overflow=
s);<br>
+ let&#39;s correct them. (#1867)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/proftpd/proftpd/c=
ommit/981a37916fdb7b73435c6d5cdb01428b2269427d" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/proftpd/proftpd/commit/981a37916fdb7b73435c6=
d5cdb01428b2269427d</a>]<br>
+CVE: CVE-2024-57392<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ modules/mod_ls.c | 7 +++++--<br>
+ 1 file changed, 5 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/modules/mod_ls.c b/modules/mod_ls.c<br>
+index 45a3187bd..f7abfe540 100644<br>
+--- a/modules/mod_ls.c<br>
++++ b/modules/mod_ls.c<br>
+@@ -349,7 +349,8 @@ static int sendline(int flags, char *fmt, ...) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errno !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int xerrno =3D errno;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (session.d !=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (session.d !=3D NULL &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 session.d-&gt;outstrm !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xerrno =3D PR_NETIO_ERRNO(session=
.d-&gt;outstrm);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -1039,7 +1040,9 @@ static int outputfiles(cmd_rec *cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0return res;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 tail-&gt;down =3D NULL;<br>
++=C2=A0 if (tail !=3D NULL) {<br>
++=C2=A0 =C2=A0 tail-&gt;down =3D NULL;<br>
++=C2=A0 }<br>
+=C2=A0 =C2=A0tail =3D NULL;<br>
+=C2=A0 =C2=A0colwidth =3D (colwidth | 7) + 1;<br>
+=C2=A0 =C2=A0if (opt_l || !opt_C) {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://prof=
tpd_1.3.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> b=
/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.b=
b" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
index ecd2777247..b45cb6aaec 100644<br>
--- a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
+++ b/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/prof=
tpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/proftpd/proftpd.git;branch=3D${BRANCH};protoc=
ol=3Dhttps</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://contrib.patch=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://build_fixup.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://proftpd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-57392.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000b21c0506359f9fdb--

