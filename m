Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34762CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 04:11:01 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29455.1779336651448878678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 21:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QB476jLr;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7cd35604a95so47439387b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 21:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779336650; cv=none;
        d=google.com; s=arc-20240605;
        b=cgeWg/ZwjND/cgICOWFN0m/JsuQyEoZlL8W5LcPcyK9BY3HGv7lKE2titcFUu0SDtA
         2xIId8n5C5OBpM5JEQ2REI4flVODs9dYZ7qgq8O+z6IFDVXHQAwZ0ZatRuWEjjCuoFEz
         1r6ei6B6HKk0K9YdRLev/g2OzTqEkXLFcEmAEjmp/cRF8j1/8T7kKvnWMLGPkONhHZ/Z
         OYUzXa/jTterkc+MpuCBgOVH4eUSSlUcN8tANsFzIdjThzpceiUZ+338UyGYClarfF34
         cr3q5DhPk4H65OX3YtYfmH9FBz3bA8ISUY0rsmOKqFExFOepI0GxW8dAWgra94bi1pSy
         lgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HR/dgW7fC7VivdrSZ2AbW3FIskFBOrVpsCNqN3Qcyb0=;
        fh=tDsdhJPgG01DWoYSpzSCAIkVHp0Jn1becVrHAX0oCi0=;
        b=NB8EQckDjxd4bJE8ACcvGE8+zPoGbtSf8cqCyfTFaPrNYP/PzxKzCKuhFB+TFJdSNn
         2RXG72UkxVZlXqFgt9ExilxPpv72UlPJ9mgX9foZ3pHVkBjKiXLtGFQqwIcqv4jJ3p8Y
         4RE+wFVJVjxkFLPB+HURrs4T695bvE7Wxx+ihttXaV8j+g2nQ0WHISSBI5lyuuI1Ulhi
         1qujIqHVCYFNuwOLtlHld5JxV/Qb+03kuvWuM65DC9a4W1lLKygR8DDiNFHjqXP4huR2
         ajrakfH0YXu4AeGP6Yx41/zt96ypbw49eYMmxliHGmdQxIDsq/GZU88popepGzbiet1t
         gvsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779336650; x=1779941450; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HR/dgW7fC7VivdrSZ2AbW3FIskFBOrVpsCNqN3Qcyb0=;
        b=QB476jLrERP3iOIxiOrv/k0Qp1mKbCRjtYFYXfhgGe1KJo1UTYbdadtPvZCZYcmqOS
         /3GyCrjIygvXZHDnw3nv92gvLtnJVND0iiL3ScS039yGLu98aERa5LipZlfVO0vCbq1R
         8G0jfck1fGGfVz4Udc4ZaRITmAoWnX9hbwJI7eASEl6QFY0grYF0Y5uSeoUwyftvLkUi
         Qev4BcWYYDIdLdt7osp/n+sNm6oWcQKh523TI9iu21EwtNLqQpur1i11lbk1eaqIS8BY
         pu2cFRACV/B7DfaiaSnPUFMS9KZ1UY1qbwndjFNNyqOqe5/w9L/6c3hzMEDlgnCJONsj
         cwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336650; x=1779941450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR/dgW7fC7VivdrSZ2AbW3FIskFBOrVpsCNqN3Qcyb0=;
        b=Rvkq1yXFUhu0M1cRAM5kx0yVS4uHlg3Rh8ZvJUlhvTwVbt8avQGjIloa59511I8rW1
         fIbw4851xzVkZtLF3psFGjw2h6A8U1z2gXFq9yOndEl0psnROcLgYS7wSkBVgf7W5LuB
         UXMFfS/7aZSlQrUFM9pLLTlbfSWDDi2GOYydzJe9BKaxFaP4FYGmfN/Ws5YFpHFeUBkT
         w9yxla6mhng5rVQdSttjpDwlxbsDXXg9xYqVQK2no0ILw9evd7ll8vRnyQrul1cR9PcY
         q21o4Uxxn7ayqLG0kZrU/VngInKGChtUC1kYEtN6Q6REp9nZlBVgwaZ8rhE6Wc2ecAIx
         zEbA==
X-Gm-Message-State: AOJu0Yw3eNjj5pKE6bVUYri0sAuM2tKm/375qfx6TFNp6qxWcQTWe5Vc
	HC9J1SaVNvFLpiB8nuMbrVuUYv/1sTeod9civAbFAcwr+gki695Wnbf+vymIzf7uTsDTGurmj/f
	10YnfApl5Sye9aSK8QXuIcuDBuF6K2Wc=
X-Gm-Gg: Acq92OF9b1n9WsEozzkViLSytX0Sl0ZbtFnaEO9Zc/iDF9/Y6P0o8YW3RcnGBWVQ189
	qhTpiiF+jLDmcc9ihJ0nCTdvCp4F7SGk8/JWh4qJol2UlaNG3uZQgEXYBk1Mb75TXeaYzmrL//c
	+jS9bQeG36VgjGSqyoy/wLfQA9D2ufkZxd5rqMAjr3jJPXw6uz8Hgh9NWiMWDZU0EVAGZvgZvUH
	zNM53OayEsreQPCeR6EE9gVumZYHr9yRleOBJqBEGDDSLQZdP5+tJGMKnLV2k87KPckZFBm7anJ
	pmeR8aiwVrgyM2yV/v2MxsVfx+L6BgJCXoyQvGLMpfM4zNSZOiEbYwyf5d2Hhx89GKgCj+pBcvx
	cnGqNK0QZI1ROVkhJfWUvOFegKMaCEv5B5zSy5QoMmUEVAGzf0ySlcnT3kipHHmQHb7ydh04sPd
	m713oIcRlADNkiB3g=
X-Received: by 2002:a05:690e:444b:b0:654:3fca:3515 with SMTP id
 956f58d0204a3-65eacf4de42mr755799d50.30.1779336650431; Wed, 20 May 2026
 21:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260520113418.2523208-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260520113418.2523208-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 May 2026 21:10:23 -0700
X-Gm-Features: AVHnY4K9wEQ_5ixPg_UKTaCDroKZuwV7NkTp7G7TCgTylto0xaLg-w-TV7sfRLI
Message-ID: <CAMKF1srwcEvDqZRy8CVSx9sFbtUViXE8BJ=nPRD5z7yNqf1c=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: fix building for the ARMv8.3-A and
 later systems
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc1f3f06524c18c3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 04:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127127

--000000000000fc1f3f06524c18c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 4:34=E2=80=AFAM Dmitry Baryshkov via lists.openembe=
dded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Building mariadb for ARMv8.3-A and later, fails with:
>
> Assembler messages:
> {standard input}:169: Error: selected processor does not support `retaa'
> {standard input}:271: Error: selected processor does not support `retaa'
>
> It happens because the pmem_cvap() funciton manually inserts the `.arch
> armv8-2.a` clause, making GAS believe that retaa instruction (inserted
> by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
> prevent GAS from choking on the retaa instructions.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
>  ...-sync-cache.cc-bump-ARMv8-arch-to-AR.patch | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-bum=
p-ARMv8-arch-to-AR.patch
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 9470184d3d43..456c1e1354e8 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -25,6 +25,7 @@ SRC_URI =3D "
> https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://riscv32.patch \
>             file://0001-support-reproducible-builds.patch \
>
> file://0001-storage-mroonga-CMakeLists.txt-fix-reproducible-buil.patch \
> +
>  file://0001-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch \
>            "
>  SRC_URI[sha256sum] =3D
> "14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9e4080a448f00f87a9f0a4a6b"
>
> diff --git
> a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-b=
ump-ARMv8-arch-to-AR.patch
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-b=
ump-ARMv8-arch-to-AR.patch
> new file mode 100644
> index 000000000000..dfb6c7795407
> --- /dev/null
> +++
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc-b=
ump-ARMv8-arch-to-AR.patch
> @@ -0,0 +1,35 @@
> +From ac6553ff3a21eb048f623081b7b7e31e43d38d77 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Wed, 20 May 2026 14:14:02 +0300
> +Subject: [PATCH] storage/innobase/sync/cache.cc: bump ARMv8 arch to
> ARMv8.3
> +
> +Building for ARMv8.3-A and later, fails with:
> +
> +Assembler messages:
> +{standard input}:169: Error: selected processor does not support `retaa'
> +{standard input}:271: Error: selected processor does not support `retaa'
> +
> +It happens because the pmem_cvap() funciton manually inserts the `.arch
> +armv8-2.a` clause, making GAS believe that retaa instruction (inserted
> +by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to
> +prevent GAS from choking on the retaa instructions.
> +
> +Upstream-Status: Inappropriate [upstream ticket
> https://github.com/MariaDB/server/pull/3677#issuecomment-4497763227]
>

I think you can say 'Submitted [https://github.com/MariaDB/server/pull/5105=
]'
now.


> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +---
> + storage/innobase/sync/cache.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/storage/innobase/sync/cache.cc
> b/storage/innobase/sync/cache.cc
> +index c5e67709e22b..104a45cee9ee 100644
> +--- a/storage/innobase/sync/cache.cc
> ++++ b/storage/innobase/sync/cache.cc
> +@@ -85,7 +85,7 @@ static void pmem_cvap(const void* buf, size_t size)
> + #if defined __ARM_ARCH && __ARM_ARCH =3D=3D 9
> +     __asm__ __volatile__(".arch armv9.4-a\n dc cvap, %0" :: "r"(u) :
> "memory");
> + #else
> +-    __asm__ __volatile__(".arch armv8.2-a\n dc cvap, %0" :: "r"(u) :
> "memory");
> ++    __asm__ __volatile__(".arch armv8.3-a\n dc cvap, %0" :: "r"(u) :
> "memory");
> + #endif
> +
> +   __asm__ __volatile__("dmb ishst" ::: "memory");
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127108):
> https://lists.openembedded.org/g/openembedded-devel/message/127108
> Mute This Topic: https://lists.openembedded.org/mt/119406181/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fc1f3f06524c18c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 20,=
 2026 at 4:34=E2=80=AFAM Dmitry Baryshkov via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"m=
ailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Building mariadb for ARMv8.3-A and later, fails with:<br>
<br>
Assembler messages:<br>
{standard input}:169: Error: selected processor does not support `retaa&#39=
;<br>
{standard input}:271: Error: selected processor does not support `retaa&#39=
;<br>
<br>
It happens because the pmem_cvap() funciton manually inserts the `.arch<br>
armv8-2.a` clause, making GAS believe that retaa instruction (inserted<br>
by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to<br>
prevent GAS from choking on the retaa instructions.<br>
<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
=C2=A0...-sync-cache.cc-bump-ARMv8-arch-to-AR.patch | 35 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-storage-inn=
obase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/my=
sql/mariadb.inc<br>
index 9470184d3d43..456c1e1354e8 100644<br>
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc<br>
@@ -25,6 +25,7 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mariadb.org/=
$%7BBP%7D/source/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://archive.mariadb.org/${BP}/source/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://riscv32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-support-reproducible-=
builds.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-storage-mroonga-CMake=
Lists.txt-fix-reproducible-buil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-storage-innobase-sync=
-cache.cc-bump-ARMv8-arch-to-AR.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;14783ddc5edd966ff05aa0efd5ed6d3d369ed5b9=
e4080a448f00f87a9f0a4a6b&quot;<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-c=
ache.cc-bump-ARMv8-arch-to-AR.patch b/meta-oe/recipes-dbs/mysql/mariadb/000=
1-storage-innobase-sync-cache.cc-bump-ARMv8-arch-to-AR.patch<br>
new file mode 100644<br>
index 000000000000..dfb6c7795407<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-storage-innobase-sync-cache.cc=
-bump-ARMv8-arch-to-AR.patch<br>
@@ -0,0 +1,35 @@<br>
+From ac6553ff3a21eb048f623081b7b7e31e43d38d77 Mon Sep 17 00:00:00 2001<br>
+From: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm=
.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<br>
+Date: Wed, 20 May 2026 14:14:02 +0300<br>
+Subject: [PATCH] storage/innobase/sync/cache.cc: bump ARMv8 arch to ARMv8.=
3<br>
+<br>
+Building for ARMv8.3-A and later, fails with:<br>
+<br>
+Assembler messages:<br>
+{standard input}:169: Error: selected processor does not support `retaa&#3=
9;<br>
+{standard input}:271: Error: selected processor does not support `retaa&#3=
9;<br>
+<br>
+It happens because the pmem_cvap() funciton manually inserts the `.arch<br=
>
+armv8-2.a` clause, making GAS believe that retaa instruction (inserted<br>
+by GCC) is invalid. Bump the manually inserted clause to armv8.3-a, to<br>
+prevent GAS from choking on the retaa instructions.<br>
+<br>
+Upstream-Status: Inappropriate [upstream ticket <a href=3D"https://github.=
com/MariaDB/server/pull/3677#issuecomment-4497763227" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/MariaDB/server/pull/3677#issuecomment-44=
97763227</a>]<br></blockquote><div><br></div><div>I think you can say &#39;=
Submitted [<a href=3D"https://github.com/MariaDB/server/pull/5105">https://=
github.com/MariaDB/server/pull/5105</a>]&#39; now.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss=
.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<=
br>
+---<br>
+ storage/innobase/sync/cache.cc | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/storage/innobase/sync/cache.cc b/storage/innobase/sync/cache.=
cc<br>
+index c5e67709e22b..104a45cee9ee 100644<br>
+--- a/storage/innobase/sync/cache.cc<br>
++++ b/storage/innobase/sync/cache.cc<br>
+@@ -85,7 +85,7 @@ static void pmem_cvap(const void* buf, size_t size)<br>
+ #if defined __ARM_ARCH &amp;&amp; __ARM_ARCH =3D=3D 9<br>
+=C2=A0 =C2=A0 =C2=A0__asm__ __volatile__(&quot;.arch armv9.4-a\n dc cvap, =
%0&quot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
+ #else<br>
+-=C2=A0 =C2=A0 __asm__ __volatile__(&quot;.arch armv8.2-a\n dc cvap, %0&qu=
ot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
++=C2=A0 =C2=A0 __asm__ __volatile__(&quot;.arch armv8.3-a\n dc cvap, %0&qu=
ot; :: &quot;r&quot;(u) : &quot;memory&quot;);<br>
+ #endif<br>
+ <br>
+=C2=A0 =C2=A0__asm__ __volatile__(&quot;dmb ishst&quot; ::: &quot;memory&q=
uot;);<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127108): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127108" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127108</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119406181/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119406181/1997914</a><br>
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

--000000000000fc1f3f06524c18c3--

