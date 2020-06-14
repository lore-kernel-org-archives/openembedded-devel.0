Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.26625.1592134886456055144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2020 04:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oGPd55Z2;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id s28so7402761edw.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2020 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFImbMIksHIeSTvplgYOOMvVo7P3BMc7cYEX7x3I0y4=;
        b=oGPd55Z2X0d/h1PV3q91S6xqYg3DxHGyudD4kuzCe7UmbdF7MOhLpBJZDjfJFdgnqw
         ebXluidVO9usW069N4uYn1Lj/8foQXIICX8fyBPnvfVJrkKTOWa+CMlQeWg7zAbA1P0s
         SbtUQWmKKRDycO1xg0mVTRtp12tr4BwaOdSVJ6/F+ssYf0zWFsJ2b5ztPecAKwcwgeIu
         xlZOvT5VaO3Yn3jrAWKkzU7V2oTl6vW+Pivl+cVZutWpmL8t+hvqKheT4+HDaVNX5aHO
         PwdNg9CGy9gMaVoSA201/d63t7xLHEsLhghOwU7L1rbx5XR77hIm3NPjBDSa+ZdVH5iA
         ZfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFImbMIksHIeSTvplgYOOMvVo7P3BMc7cYEX7x3I0y4=;
        b=Wkt3EkOB5z2HdEk3WP0yjQ4/Wpb7FmJPBAaLlkQgPfRhXtoc+leIT6Usr3PRI/8tA2
         26A9Om4IDDz+xMCiZJ8dfIPVOX27TC2bL4vDXU7Uvc3nKDSmN5N5zkl4g9ZlMCi9f973
         wdfOMOGYj5p7tGCVXVY7+D1EQijnWu/O1kZ8jNVYlI/v3XwyKPjeN0rGBWzyyFeXEr4G
         zrPpwgIfULT6L12VYmZxTo05W7zl5cA/3e8w0oq7MYFB90oeKDNdKMi/26CAdRMgahlU
         xGDOHNUDjcHqpstXHPvCtzejTJGWaOECr2KF11EGs1TdvxjZexPGkqEMNrtwubFySX5J
         zqzg==
X-Gm-Message-State: AOAM530PxiLw219euncGpniKmgKsuzp14jBWIQxctboy2JlWfA2brD3u
	eZ8np78vll0Qo0WYczmcNTv6k6L4o85EaSKpxBk=
X-Google-Smtp-Source: ABdhPJw6nkBw+BLLOppaG6eHpXjjljSpNkp5spF7cjZhUHCRoW5mK9kBg2/0OkOZVkH2qzQK4gRffQ9ZHZrxvlJP4+8=
X-Received: by 2002:a05:6402:1217:: with SMTP id c23mr19412076edw.270.1592134884780;
 Sun, 14 Jun 2020 04:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
In-Reply-To: <1591012275-14454-1-git-send-email-pjtexier@koncepto.io>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 14 Jun 2020 13:41:13 +0200
Message-ID: <CA+chaQfDJ1_QHD-fYoppqoaxPA9S5ZtJNZZPT+jef8xhthHrHw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] zchunk: upgrade 1.1.5 -> 1.1.6
To: Pierre-Jean Texier <pjtexier@koncepto.io>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003def7405a809ca91"

--0000000000003def7405a809ca91
Content-Type: text/plain; charset="UTF-8"

The argp check added in:
https://github.com/zchunk/zchunk/commit/73f9f26d43f6786eadc49f7d43f1672e03d92b7f

fails in builds with Werror=return-type with:
Code:
 #include <argp.h>
static error_t parse_opt (int key, char *arg, struct argp_state *state) {
argp_usage(state); }; void main() {}
Compiler stdout:

Compiler stderr:
 In file included from
zchunk/1.1.6-r0/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
                 from zchunk/1.1.6-r0/recipe-sysroot/usr/include/stdio.h:27,
                 from zchunk/1.1.6-r0/recipe-sysroot/usr/include/argp.h:23,
                 from
zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c:1:
zchunk/1.1.6-r0/recipe-sysroot/usr/include/features.h:397:4: warning:
#warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Wcpp]
  397 | #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
      |    ^~~~~~~
zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c: In function
'parse_opt':
zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c:2:54: error: no
return statement in function returning non-void [-Werror=return-type]
    2 | static error_t parse_opt (int key, char *arg, struct argp_state
*state) { argp_usage(state); }; void main() {}
      |                                                      ^~~~~~~~~~
cc1: some warnings being treated as errors

and then build with glibc fails

../git/meson.build:26:4: ERROR: C library 'argp' not found

It was building fine in 1.1.5 in my world builds, because this argp check
wasn't there yet. Can you please fix it in upstream and do another upgrade?

Thanks

On Mon, Jun 1, 2020 at 1:52 PM Pierre-Jean Texier via lists.openembedded.org
<pjtexier=koncepto.io@lists.openembedded.org> wrote:

> - Remove patches already in version
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  .../zchunk/0001-zck.h-fix-build-on-musl.patch      | 39 --------------
>  .../0002-unzck-fix-build-with-musl-libc.patch      | 61
> ----------------------
>  .../zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb}    |  8 +--
>  3 files changed, 2 insertions(+), 106 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
>  delete mode 100644
> meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
>  rename meta-oe/recipes-support/zchunk/{zchunk_1.1.5.bb => zchunk_1.1.6.bb}
> (66%)
>
> diff --git
> a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
> b/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
> deleted file mode 100644
> index 64e0e8e..0000000
> ---
> a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 78247d478cec254bad27f4ed97b532f4f54bf1b0 Mon Sep 17 00:00:00 2001
> -From: Pierre-Jean Texier <pjtexier@koncepto.io>
> -Date: Thu, 23 Jan 2020 19:14:40 +0100
> -Subject: [PATCH 1/2] zck.h: fix build on musl
> -
> -The ssize_t type requires the <sys/types.h> header. This fixes build with
> musl
> -libc:
> -
> -include/zck.h:68:1: error: unknown type name 'ssize_t'; did you mean
> 'size_t'?
> -   68 | ssize_t zck_read(zckCtx *zck, char *dst, size_t dst_size)
> -      | ^~~~~~~
> -      | size_t
> -include/zck.h:81:1: error: unknown type name 'ssize_t'; did you mean
> 'size_t'?
> -   81 | ssize_t zck_write(zckCtx *zck, const char *src, const size_t
> src_size)
> -      | ^~~~~~~
> -      | size_t
> -
> -Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/23]
> -
> -Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ----
> - include/zck.h.in | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/zck.h.in b/include/zck.h.in
> -index 91d2557..b847576 100644
> ---- a/include/zck.h.in
> -+++ b/include/zck.h.in
> -@@ -5,6 +5,7 @@
> -
> - #include <stdlib.h>
> - #include <stdbool.h>
> -+#include <sys/types.h>
> -
> - typedef enum zck_hash {
> -     ZCK_HASH_SHA1,
> ---
> -2.7.4
> -
> diff --git
> a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
> b/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
> deleted file mode 100644
> index a1c95bf..0000000
> ---
> a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl-libc.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -From 72c55e3da59eccdfea3778d11f83862b58af723d Mon Sep 17 00:00:00 2001
> -From: Pierre-Jean Texier <pjtexier@koncepto.io>
> -Date: Thu, 23 Jan 2020 22:42:40 +0100
> -Subject: [PATCH 2/2] unzck: fix build with musl libc
> -
> -On musl libc "stdout" is a preprocessor macro whose expansion leads to
> -compilation errors.
> -
> -Fixes:
> -
> -| In file included from ../git/src/unzck.c:31:
> -| ../git/src/unzck.c: In function 'parse_opt':
> -| ../git/src/unzck.c:78:24: error: expected identifier before '(' token
> -|    78 |             arguments->stdout = true;
> -|       |                        ^~~~~~
> -| ../git/src/unzck.c: In function 'main':
> -| ../git/src/unzck.c:141:20: error: expected identifier before '(' token
> -|   141 |     if(!(arguments.stdout)) {
> -|       |                    ^~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/23]
> -
> -Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ----
> - src/unzck.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/unzck.c b/src/unzck.c
> -index 8d6c62a..002492c 100644
> ---- a/src/unzck.c
> -+++ b/src/unzck.c
> -@@ -58,7 +58,7 @@ struct arguments {
> -   char *args[1];
> -   zck_log_type log_level;
> -   bool dict;
> --  bool stdout;
> -+  bool stdOut;
> -   bool exit;
> - };
> -
> -@@ -75,7 +75,7 @@ static error_t parse_opt (int key, char *arg, struct
> argp_state *state) {
> -                 arguments->log_level = ZCK_LOG_DDEBUG;
> -             break;
> -         case 'c':
> --            arguments->stdout = true;
> -+            arguments->stdOut = true;
> -             break;
> -         case 'V':
> -             version();
> -@@ -138,7 +138,7 @@ int main (int argc, char *argv[]) {
> -         snprintf(out_name + strlen(base_name) - 4, 7, ".zdict");
> -
> -     int dst_fd = STDOUT_FILENO;
> --    if(!arguments.stdout) {
> -+    if(!arguments.stdOut) {
> -         dst_fd = open(out_name, O_TRUNC | O_WRONLY | O_CREAT, 0666);
> -         if(dst_fd < 0) {
> -             dprintf(STDERR_FILENO, "Unable to open %s", out_name);
> ---
> -2.7.4
> -
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
> b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
> similarity index 66%
> rename from meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
> rename to meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
> index f75412f..e041132 100644
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.1.5.bb
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.1.6.bb
> @@ -4,13 +4,9 @@ AUTHOR = "Jonathan Dieter"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd6e590282010ce90a94ef25dd31410f"
>
> -SRC_URI = " \
> -       git://github.com/zchunk/zchunk.git;protocol=https \
> -       file://0001-zck.h-fix-build-on-musl.patch \
> -       file://0002-unzck-fix-build-with-musl-libc.patch \
> -       "
> +SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https"
>
> -SRCREV = "c01bf12feede792982f165f52f4a6c573e3a8c17"
> +SRCREV = "f5593aa11584faa691c81b4898f0aaded47f8bf7"
>  S = "${WORKDIR}/git"
>
>  DEPENDS = "\
> --
> 2.7.4
>
> 
>

--0000000000003def7405a809ca91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The argp check added in:<div><a href=3D"https://github.com=
/zchunk/zchunk/commit/73f9f26d43f6786eadc49f7d43f1672e03d92b7f">https://git=
hub.com/zchunk/zchunk/commit/73f9f26d43f6786eadc49f7d43f1672e03d92b7f</a><b=
r></div><div><br></div><div>fails in builds with Werror=3Dreturn-type with:=
</div><div>Code:<br>=C2=A0#include &lt;argp.h&gt;<br>static error_t parse_o=
pt (int key, char *arg, struct argp_state *state) { argp_usage(state); }; v=
oid main() {}<br>Compiler stdout:<br><br>Compiler stderr:<br>=C2=A0In file =
included from zchunk/1.1.6-r0/recipe-sysroot/usr/include/bits/libc-header-s=
tart.h:33,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from zchunk/1.1.6-r0/recipe-sysroot/usr/include/stdio.h:27,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from zchunk/1.1.6-r=
0/recipe-sysroot/usr/include/argp.h:23,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from zchunk/1.1.6-r0/build/meson-private/tm=
pqwvjccnp/testfile.c:1:<br>zchunk/1.1.6-r0/recipe-sysroot/usr/include/featu=
res.h:397:4: warning: #warning _FORTIFY_SOURCE requires compiling with opti=
mization (-O) [-Wcpp]<br>=C2=A0 397 | # =C2=A0warning _FORTIFY_SOURCE requi=
res compiling with optimization (-O)<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A0^~~~~~~<br>zchunk/1.1.6-r0/build/meson-private/tmpqwvjccnp/testfile.c: =
In function &#39;parse_opt&#39;:<br>zchunk/1.1.6-r0/build/meson-private/tmp=
qwvjccnp/testfile.c:2:54: error: no return statement in function returning =
non-void [-Werror=3Dreturn-type]<br>=C2=A0 =C2=A0 2 | static error_t parse_=
opt (int key, char *arg, struct argp_state *state) { argp_usage(state); }; =
void main() {}<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0^~~~~~~~~~<br>cc1: some warnings being treated as errors<br></div><d=
iv><br></div><div>and then build with glibc fails</div><div><br></div><div>=
../git/meson.build:26:4: ERROR: C library &#39;argp&#39; not found<br></div=
><div><br></div><div>It was building fine in 1.1.5 in my world builds, beca=
use this argp check wasn&#39;t there yet. Can you please fix it in upstream=
 and do another upgrade?</div><div><br></div><div>Thanks</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1=
, 2020 at 1:52 PM Pierre-Jean Texier via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;pjtexier=3D<a href=3D"mailto:koncept=
o.io@lists.openembedded.org">koncepto.io@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Remove pat=
ches already in version<br>
<br>
Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.=
io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
---<br>
=C2=A0.../zchunk/0001-zck.h-fix-build-on-musl.patch=C2=A0 =C2=A0 =C2=A0 | =
39 --------------<br>
=C2=A0.../0002-unzck-fix-build-with-musl-libc.patch=C2=A0 =C2=A0 =C2=A0 | =
61 ----------------------<br>
=C2=A0.../zchunk/{<a href=3D"http://zchunk_1.1.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">zchunk_1.1.5.bb</a> =3D&gt; <a href=3D"http://zchunk_1.1.6.=
bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.1.6.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 8 +--<br>
=C2=A03 files changed, 2 insertions(+), 106 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-=
fix-build-on-musl.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/zchunk/zchunk/0002-unzck-=
fix-build-with-musl-libc.patch<br>
=C2=A0rename meta-oe/recipes-support/zchunk/{<a href=3D"http://zchunk_1.1.=
5.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.1.5.bb</a> =3D&gt; <a h=
ref=3D"http://zchunk_1.1.6.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_=
1.1.6.bb</a>} (66%)<br>
<br>
diff --git a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on=
-musl.patch b/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on=
-musl.patch<br>
deleted file mode 100644<br>
index 64e0e8e..0000000<br>
--- a/meta-oe/recipes-support/zchunk/zchunk/0001-zck.h-fix-build-on-musl.p=
atch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From 78247d478cec254bad27f4ed97b532f4f54bf1b0 Mon Sep 17 00:00:00 2001<br=
>
-From: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.io" targ=
et=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
-Date: Thu, 23 Jan 2020 19:14:40 +0100<br>
-Subject: [PATCH 1/2] zck.h: fix build on musl<br>
-<br>
-The ssize_t type requires the &lt;sys/types.h&gt; header. This fixes buil=
d with musl<br>
-libc:<br>
-<br>
-include/zck.h:68:1: error: unknown type name &#39;ssize_t&#39;; did you m=
ean &#39;size_t&#39;?<br>
-=C2=A0 =C2=A068 | ssize_t zck_read(zckCtx *zck, char *dst, size_t dst_siz=
e)<br>
-=C2=A0 =C2=A0 =C2=A0 | ^~~~~~~<br>
-=C2=A0 =C2=A0 =C2=A0 | size_t<br>
-include/zck.h:81:1: error: unknown type name &#39;ssize_t&#39;; did you m=
ean &#39;size_t&#39;?<br>
-=C2=A0 =C2=A081 | ssize_t zck_write(zckCtx *zck, const char *src, const s=
ize_t src_size)<br>
-=C2=A0 =C2=A0 =C2=A0 | ^~~~~~~<br>
-=C2=A0 =C2=A0 =C2=A0 | size_t<br>
-=C2=A0 =C2=A0 =C2=A0 <br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/zchunk/zchunk/p=
ull/23" rel=3D"noreferrer" target=3D"_blank">https://github.com/zchunk/zchu=
nk/pull/23</a>]<br>
-<br>
-Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto=
.io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
----<br>
- include/<a href=3D"http://zck.h.in" rel=3D"noreferrer" target=3D"_blank"=
>zck.h.in</a> | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/include/<a href=3D"http://zck.h.in" rel=3D"noreferrer" targe=
t=3D"_blank">zck.h.in</a> b/include/<a href=3D"http://zck.h.in" rel=3D"nore=
ferrer" target=3D"_blank">zck.h.in</a><br>
-index 91d2557..b847576 100644<br>
---- a/include/<a href=3D"http://zck.h.in" rel=3D"noreferrer" target=3D"_b=
lank">zck.h.in</a><br>
-+++ b/include/<a href=3D"http://zck.h.in" rel=3D"noreferrer" target=3D"_b=
lank">zck.h.in</a><br>
-@@ -5,6 +5,7 @@<br>
- <br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;stdbool.h&gt;<br>
-+#include &lt;sys/types.h&gt;<br>
- <br>
- typedef enum zck_hash {<br>
-=C2=A0 =C2=A0 =C2=A0ZCK_HASH_SHA1,<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-wi=
th-musl-libc.patch b/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-b=
uild-with-musl-libc.patch<br>
deleted file mode 100644<br>
index a1c95bf..0000000<br>
--- a/meta-oe/recipes-support/zchunk/zchunk/0002-unzck-fix-build-with-musl=
-libc.patch<br>
+++ /dev/null<br>
@@ -1,61 +0,0 @@<br>
-From 72c55e3da59eccdfea3778d11f83862b58af723d Mon Sep 17 00:00:00 2001<br=
>
-From: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.io" targ=
et=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
-Date: Thu, 23 Jan 2020 22:42:40 +0100<br>
-Subject: [PATCH 2/2] unzck: fix build with musl libc<br>
-<br>
-On musl libc &quot;stdout&quot; is a preprocessor macro whose expansion l=
eads to<br>
-compilation errors.<br>
-<br>
-Fixes:<br>
-<br>
-| In file included from ../git/src/unzck.c:31:<br>
-| ../git/src/unzck.c: In function &#39;parse_opt&#39;:<br>
-| ../git/src/unzck.c:78:24: error: expected identifier before &#39;(&#39;=
 token<br>
-|=C2=A0 =C2=A0 78 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argume=
nts-&gt;stdout =3D true;<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
-| ../git/src/unzck.c: In function &#39;main&#39;:<br>
-| ../git/src/unzck.c:141:20: error: expected identifier before &#39;(&#39=
; token<br>
-|=C2=A0 =C2=A0141 |=C2=A0 =C2=A0 =C2=A0if(!(arguments.stdout)) {<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/zchunk/zchunk/p=
ull/23" rel=3D"noreferrer" target=3D"_blank">https://github.com/zchunk/zchu=
nk/pull/23</a>]<br>
-<br>
-Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto=
.io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
----<br>
- src/unzck.c | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/unzck.c b/src/unzck.c<br>
-index 8d6c62a..002492c 100644<br>
---- a/src/unzck.c<br>
-+++ b/src/unzck.c<br>
-@@ -58,7 +58,7 @@ struct arguments {<br>
-=C2=A0 =C2=A0char *args[1];<br>
-=C2=A0 =C2=A0zck_log_type log_level;<br>
-=C2=A0 =C2=A0bool dict;<br>
--=C2=A0 bool stdout;<br>
-+=C2=A0 bool stdOut;<br>
-=C2=A0 =C2=A0bool exit;<br>
- };<br>
- <br>
-@@ -75,7 +75,7 @@ static error_t parse_opt (int key, char *arg, struct ar=
gp_state *state) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arguments-&=
gt;log_level =3D ZCK_LOG_DDEBUG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;c&#39;:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arguments-&gt;stdout =3D true;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arguments-&gt;stdOut =3D true;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;V&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version();<br>
-@@ -138,7 +138,7 @@ int main (int argc, char *argv[]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(out_name + strlen(base_name) -=
 4, 7, &quot;.zdict&quot;);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0int dst_fd =3D STDOUT_FILENO;<br>
--=C2=A0 =C2=A0 if(!arguments.stdout) {<br>
-+=C2=A0 =C2=A0 if(!arguments.stdOut) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_fd =3D open(out_name, O_TRUNC | O_W=
RONLY | O_CREAT, 0666);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(dst_fd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dprintf(STDERR_FILENO, &q=
uot;Unable to open %s&quot;, out_name);<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.1.5=
.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.1.5.bb</a> b/meta-oe/rec=
ipes-support/zchunk/<a href=3D"http://zchunk_1.1.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">zchunk_1.1.6.bb</a><br>
similarity index 66%<br>
rename from meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.1.5.=
bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.1.5.bb</a><br>
rename to meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.1.6.bb=
" rel=3D"noreferrer" target=3D"_blank">zchunk_1.1.6.bb</a><br>
index f75412f..e041132 100644<br>
--- a/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">zchunk_1.1.5.bb</a><br>
+++ b/meta-oe/recipes-support/zchunk/<a href=3D"http://zchunk_1.1.6.bb" re=
l=3D"noreferrer" target=3D"_blank">zchunk_1.1.6.bb</a><br>
@@ -4,13 +4,9 @@ AUTHOR =3D &quot;Jonathan Dieter&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dcd6e590282010ce90a94=
ef25dd31410f&quot;<br>
<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/zchunk/zchu=
nk.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/zc=
hunk/zchunk.git;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-zck.h-fix-build-on-musl.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-unzck-fix-build-with-musl-libc.pat=
ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/zchunk/zchunk.git;pr=
otocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/zchunk/zchu=
nk.git;protocol=3Dhttps</a>&quot;<br>
<br>
-SRCREV =3D &quot;c01bf12feede792982f165f52f4a6c573e3a8c17&quot;<br>
+SRCREV =3D &quot;f5593aa11584faa691c81b4898f0aaded47f8bf7&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;\<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--0000000000003def7405a809ca91--
