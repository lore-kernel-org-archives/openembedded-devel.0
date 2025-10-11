Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34FDCCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 22:53:26 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.9449.1760223200013775994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 15:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyTw/riV;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63470a6f339so3060525d50.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 15:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760223199; x=1760827999; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhEV7EkUyntOdd8qeKQnjnG5HA1oevoU5H2X2Pe8bxM=;
        b=NyTw/riVwAAcjdujnD9uulMw3cHD/27veRh3ZUoAtsh7AtdNfcDn6fglc5L7QZ9tNY
         JHkwFhC4BA7aWIUZOxpFuUHVqA1UTz31bzc9aCw1cnv3M5WHo72YJXQYTkC1Uhuni84S
         48jjarzu0S+EwIz1dIUpD24MeRnQHKI55RnNewBPeNlTnQFfoPvwx4M1qiUzBFSb/RMg
         9R+ftDBqhAypGSvOtZjQGbHv0rceB91X3EI/UKgaqZOEqJqdeBFlz0eOdqeaCMKpWOd4
         YnbOdIgGW+oFgCXjjoBHcZCbLlu2f+TS+3xTq4ZApG23QvxdLaaEbR0Zr+4nlt2QJ8+Z
         Buvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760223199; x=1760827999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhEV7EkUyntOdd8qeKQnjnG5HA1oevoU5H2X2Pe8bxM=;
        b=Ga1n38hsXfX+7i6w+exZIDzkvTjdCdvhysyBWVOLUa1kbnrbp6/OXje0sCVuD63GC/
         HxW0U1W+XDivkN8PXsDxElDJBnSbJqYW00ZaM0NxrbaQFVtlXFssACTl6pyYRZT8c7R9
         SjJ4/L3j0glO7llOjonnLPgc7AfP+w4QfLhGuJI6W7NA9BaH0hsGy1Hwxq6EVmFF0AYc
         NNmbveV/zFfv3WRCDxs9uJwXaDof0bUo4Xui28Msg6zk85JIEDR1XYE2JNDZdI5nsaxP
         gEAOGQRCNqSAjuLXPTgNh6KgZUriaR3q38dQRCyrdvTBM6ZTf6fNA+9sBqtO89gDzuAq
         WsSg==
X-Gm-Message-State: AOJu0YySYMhrwWUSBhtaX2QzT6RHUmQ+pejs0yXK23GyJ3DjEfnU/YlR
	JzXxbhQfSJ+0hh09QqFaC/sA4ZotoR5INlknyKhaKPoddbEG0psYrK/tB300XbP3fXUT3PogPd5
	1l3TCZwM2wqDjXzKiFtgmTM4RoXlLA+c=
X-Gm-Gg: ASbGncsEmg4uFx8dR9IdPDt5jiabRO4l69NFuK/aCpdbWgJ5i8ICEPOeD+O8Qj/m8Lk
	trZLSUXR0dQpvNjXXxYg/ay5TM989zoSCBIcuvRrmBuEqPwKZ4X0boarhRhC9vsXhyP1ZxtYM8D
	awF/9D4C30ywyYvd48fafWYVDvBX9jolbqd1MKBlg0yVzR4XbK+qGozIDr6q8n3Pcz0jMOscEQS
	O9H9Y/NrP6anc4Nc+AzGHycEEk7w8gMxWFnGa2Ay+LVgyT/LNVpqaGnVm0=
X-Google-Smtp-Source: AGHT+IHUE64r4rp+reucK58Au9/8mp+gd636G7QqWd4vX5Ami+OS5aYllevnOLdzUlgEg7PM92PAd6MJ4DXMMfI36UY=
X-Received: by 2002:a05:690c:f0f:b0:77a:4d7c:ef61 with SMTP id
 00721157ae682-780e170c37cmr278197167b3.50.1760223198969; Sat, 11 Oct 2025
 15:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251002104847.1472184-1-zboszor@gmail.com> <20251002104847.1472184-2-zboszor@gmail.com>
In-Reply-To: <20251002104847.1472184-2-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Oct 2025 15:52:52 -0700
X-Gm-Features: AS18NWD_w5iEV865LBPkdjFt7K-XbZj0vx7CtnvBSKCoaOTcp_NqR7ItnXG9_yU
Message-ID: <CAMKF1srYE1q8L=PU-oPKQW75WBSS3Khj9=Cw3QpAiNt0thzpvg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 2/2] mariadb: 11.4.8
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 22:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120512

Its failing to compile for qemuriscv32 with following errors

/home/kraj200/yoe/build/tmp/work/riscv32imafdc-yoe-linux-musl/mariadb/11.4.=
8/sources/mariadb-11.4.8/tpool/aio_libaio.cc:61:20:
error: use of undeclared identifier '
   =E2=86=AA __NR_io_getevents'; did you mean 'io_getevents'?
   |    61 |   int ret=3D syscall(__NR_io_getevents, reinterpret_cast<long>=
(ctx),
   |       |                    ^~~~~~~~~~~~~~~~~

On Thu, Oct 2, 2025 at 3:49=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi <zboszor@gmail.com> wrote:
>
> 11.4.7 fixes a huge performance drop from 11.4.5 to 11.4.6.
> https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-seri=
es/mariadb-11.4.7-release-notes
>
> 11.4.8 fixes several crash problems and other issues.
> https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-seri=
es/mariadb-11.4.8-release-notes
>
> Removed 0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
> which is not applicable anymore, the code was rewritten.
>
> Adapted 0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> to fix fuzz.
>
> Add libxml2-native to DEPENDS in mariadb-native to fix the
> do_configure failure with the new version.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  ...ive_11.4.6.bb =3D> mariadb-native_11.4.8.bb} |  2 +-
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>  ...ck-if-syscall-exists-before-using-it.patch | 40 -------------------
>  ...Lists.txt-fix-gen_lex_hash-not-found.patch |  6 +--
>  .../{mariadb_11.4.6.bb =3D> mariadb_11.4.8.bb}  |  0
>  5 files changed, 5 insertions(+), 46 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.6.bb =3D> mariadb-=
native_11.4.8.bb} (92%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Chec=
k-if-syscall-exists-before-using-it.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.6.bb =3D> mariadb_11.4.8.=
bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb b/meta-oe=
/recipes-dbs/mysql/mariadb-native_11.4.8.bb
> similarity index 92%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
> index 578357b480..ff48dcd806 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
> @@ -3,7 +3,7 @@ inherit native
>
>  PROVIDES +=3D "mysql5-native"
>  DEPENDS =3D "ncurses-native zlib-native bison-native libpcre2-native \
> -gnutls-native fmt-native \
> +libxml2-native gnutls-native fmt-native \
>  "
>
>  RDEPENDS:${PN} =3D ""
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 67dd687c02..53a24d14bc 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -15,7 +15,6 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://fix-arm-atomic.patch \
>             file://0001-Fix-library-LZ4-lookup.patch \
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.p=
atch \
> -           file://0001-aio_linux-Check-if-syscall-exists-before-using-it=
.patch \
>             file://ssize_t.patch \
>             file://sys_futex.patch \
>             file://cross-compiling.patch \
> @@ -26,7 +25,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
>             file://riscv32.patch \
>             file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>            "
> -SRC_URI[sha256sum] =3D "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27=
831ec0414fb7df07"
> +SRC_URI[sha256sum] =3D "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c=
31ed73505f49e15c"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/tags"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-sy=
scall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001=
-aio_linux-Check-if-syscall-exists-before-using-it.patch
> deleted file mode 100644
> index eddfdaaf77..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-e=
xists-before-using-it.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 18 Aug 2021 06:49:25 +0000
> -Subject: [PATCH] aio_linux: Check if syscall exists before using it
> -
> -Return -ENOSYS if not implememented, fixes build on arches like RISCV32
> -Fixes
> -tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in=
 this scope; did you mean 'io_getevents'?
> -   63 |   int ret=3D syscall(__NR_io_getevents, reinterpret_cast<long>(c=
tx),
> -      |                    ^~~~~~~~~~~~~~~~~
> -      |                    io_getevents
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tpool/aio_linux.cc | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
> -index 507c6b92..a6adf1af 100644
> ---- a/tpool/aio_linux.cc
> -+++ b/tpool/aio_linux.cc
> -@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Bos=
ton, MA 02111 - 1301 USA*/
> - */
> - static int my_getevents(io_context_t ctx, long min_nr, long nr, io_even=
t *ev)
> - {
> -+#ifdef __NR_io_getevents
> -   int saved_errno=3D errno;
> -   int ret=3D syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
> -                    min_nr, nr, ev, 0);
> -@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr,=
 long nr, io_event *ev)
> -     errno=3D saved_errno;
> -   }
> -   return ret;
> -+#else
> -+  return -ENOSYS;
> -+#endif
> - }
> -
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fi=
x-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql=
-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
> index 1475bb1a51..7c73699b08 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_l=
ex_hash-not-found.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_l=
ex_hash-not-found.patch
> @@ -18,8 +18,8 @@ diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>  index 0195555e..507136cb 100644
>  --- a/sql/CMakeLists.txt
>  +++ b/sql/CMakeLists.txt
> -@@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
> - ${CMAKE_SOURCE_DIR}/tpool
> +@@ -63,11 +63,18 @@
> + ${CMAKE_BINARY_DIR}/sql
>   )
>
>  -ADD_CUSTOM_COMMAND(
> @@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
>
>   FIND_PACKAGE(BISON 2.4)
>
> -@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSS=
COMPILING_EMULATOR)
> +@@ -405,11 +412,18 @@
>     ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>   ENDIF()
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb b/meta-oe/recipe=
s-dbs/mysql/mariadb_11.4.8.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
> --
> 2.51.0
>

