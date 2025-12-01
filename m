Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADE2D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 21:42:39 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3195.1764625352950940371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 13:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUh/hmdC;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7815092cd0bso41686617b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 13:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764625352; x=1765230152; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xeRUwzXcWtqjq8CcXX99nMB6tIYNuU0KVS7gZPOkCJI=;
        b=fUh/hmdCBqeNtw+ozeEkKZtW9yxkgMUs14HqahY5OiI4cSINCPpq0tkZsO+oo0tWfr
         e7KR2x3cwOrzl5VJOApLNToaU38LRQZKxybwI6sZKGBRKo0o0XuGpsqk+QWZlw4ZXuhZ
         2AVzIEI8ACF9z60qjRb2aXsRZF7E3c6Csn/nnHwJUzYn51Uo1HTQ3Vro3JLH3QMAOs/S
         j0F1Bn5ALYUbnCKV5/8z3m+e6q/r2eP7Ec1GK8C0e4z2ckwDt5TMtBNo8sXIdnXKeZY0
         JwRe1iKIp9IUbMkMIiyeVf2dh0xTxkjChiF7Alz7g73rlONjdJOkRNBdk7GXuLexd4ND
         S+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764625352; x=1765230152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeRUwzXcWtqjq8CcXX99nMB6tIYNuU0KVS7gZPOkCJI=;
        b=GQR4Luuqg2VnDkdEe/X76OauZhIp+fmXUMmVOx9mMLKz5rcvoFS5bEvH5yDdtiO98p
         LoF+vKfBU6Ubz0eWaIHiJV6mufXl51TSR76xf7yxYhlT51t7l11RzAw5MKHNou7+1AcN
         W2Y+21JaJbct+yBGq1V6SadP3D6K1xahamuxCul0hyUwcSJCynOKzROE9QweG7mY2JD2
         luMKxWgakpWPnC9zCIlLB2vg33B4kxvHf/pLjG9FdJ5SiQir7K2Ehbk85jopumy/qI0p
         b7rU6crCjA3FxFTDeaeIQtk8DS6ES/4L7UcvTkjdX5nAeZh6PPllFrxo77UkPUf7GFPl
         y4gQ==
X-Gm-Message-State: AOJu0Ywf3TObpvVKPx1XiaaK14/RQtiRvUnwwH2NRzsMpLKtIXgI3I6G
	x3g7SC3K+YdmSjMcaYL270dXtuhhDdJx9yGmg3Pi3gfL+VfwTJdWaWFLhJzU3kj2SXfrgUkkkct
	ArTazSeuifL4ItklCDOgnv4gSg00JwKaFh6h7
X-Gm-Gg: ASbGncvM92nitS00A2aDfLi3A/pQHJdmW05B2YagRbdV24bq48SANRFJzgY/hG1YNcv
	27LJJzJ91jFI8AoBnU+08G+jhsixP19DGQDWD7NzjyfP7jg06PmmGMpWYhY4OLXymhrOsJjWYK2
	1KO2WTgjtwEMZ0tVrn8/ICUROVgMrlrE7DUt0l61xdJkFbIqFwqEcVG4QXrEbnVmNVICuYeDJOG
	TeXOyUiQ9deiBAMvvCEus407XcqTMMsKiBQO80RAOFyXI6kMlsYw7dqRiPVJcS9ReeqdGwC4u8Q
	TBo6ejDwWVMZ28V5uprjeaMrkqlErSvebZsJC1aMEJn4LfY/+HQwiWiHgnKsahvfnmL7y0+XBH/
	dx1/vPrnevmLnjgeY3rKVjR2Td6aZ57knlxelFo6m53LuP8DhHub2
X-Google-Smtp-Source: AGHT+IEXlnE9qor9/oa/BoqRej4WZUBNYBkpNNLYCyXyLmfjAtvpnTQg08Sh4H81vDkIP9JpK+1cDF0cPVMj5rTqsAc=
X-Received: by 2002:a05:690c:6f8e:b0:786:4459:cb84 with SMTP id
 00721157ae682-78ab6e1c93fmr432385927b3.29.1764625351856; Mon, 01 Dec 2025
 13:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20251201203447.2776360-1-skandigraun@gmail.com>
In-Reply-To: <20251201203447.2776360-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Dec 2025 13:42:05 -0800
X-Gm-Features: AWmQ_bnxxfh0NIsKiIv5tGn78OfHuogl39064fVznO0P42eeGalD1zlLc6h7LOI
Message-ID: <CAMKF1soGPvAUvwXebjFv656nK+c6z+5C3dkXZsSW4LAPDvTL1A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] lowpan-tools: drop recipe
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000042543f0644eadbb1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 21:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122219

--00000000000042543f0644eadbb1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, yes I am in favor of removing it. I think there is a need to look
into some more recipes of this kind.

On Mon, Dec 1, 2025 at 12:34=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> The application has received its last upstream update
> 11 years ago. It has been on the skiplist[1] of meta-networking
> for the past 6 years due to being severly outdated.
>
> There are no recipes that would depend on this recipe in the meta-oe
> layers, nor in the layer-index[3].
>
> Let's bid farewell.
>
> [1]: https://github.com/linux-wpan/lowpan-tools/commits/master/
> [2]:
> https://github.com/openembedded/meta-openembedded/commit/13830393555adbb7=
0ccec18bea177131ff405edc
> [3]:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Alowpan-tools
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../0001-Fix-build-errors-with-clang.patch    |  34 -----
>  ...tential-string-truncation-in-strncpy.patch | 139 ------------------
>  ...0001-Remove-newline-from-format-line.patch |  34 -----
>  ...fig-parse.y-add-missing-time.h-inclu.patch |  46 ------
>  ...oordinator-Fix-strncpy-range-warning.patch |  32 ----
>  ...iz.c-Undef-dprintf-before-redefining.patch |  29 ----
>  .../lowpan-tools/no-help2man.patch            |  41 ------
>  .../lowpan-tools/lowpan-tools_git.bb          |  38 -----
>  8 files changed, 393 deletions(-)
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-build-=
errors-with-clang.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-potent=
ial-string-truncation-in-strncpy.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-new=
line-from-format-line.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coo=
rd-config-parse.y-add-missing-time.h-inclu.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinato=
r-Fix-strncpy-range-warning.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c-U=
ndef-dprintf-before-redefining.patch
>  delete mode 100644
> meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.pat=
ch
>  delete mode 100644 meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb
>
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-buil=
d-errors-with-clang.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-buil=
d-errors-with-clang.patch
> deleted file mode 100644
> index 8e906f7ce0..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-buil=
d-errors-with-clang.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 5f9e80acb0a1ac399839bf160e43f6120c4b5128 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 18 Oct 2016 23:49:09 +0000
> -Subject: [PATCH] Fix build errors with clang
> -
> -|
> ../../../../../../../workspace/sources/lowpan-tools/src/coordinator.c:313=
:50:
> error: format specifies type 'unsigned char' but the argument has type
> 'int' [-Werror,-Wformat]
> -|                 fprintf(stderr, "Opt: %c (%hhx)\n", (char)opt, opt);
> -|                                           ~~~~                 ^~~
> -|                                           %x
> -| 1 error generated.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/coordinator.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/coordinator.c b/src/coordinator.c
> -index c139aae..f0de6d2 100644
> ---- a/src/coordinator.c
> -+++ b/src/coordinator.c
> -@@ -310,7 +310,7 @@ int main(int argc, char **argv)
> - #else
> -               opt =3D getopt(argc, argv, "l:f:d:m:n:i:s:p:c:hv");
> - #endif
> --              fprintf(stderr, "Opt: %c (%hhx)\n", opt, opt);
> -+              fprintf(stderr, "Opt: %c (%hhx)\n", opt, (unsigned
> char)opt);
> -               if (opt =3D=3D -1)
> -                       break;
> -
> ---
> -1.9.1
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-pote=
ntial-string-truncation-in-strncpy.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-pote=
ntial-string-truncation-in-strncpy.patch
> deleted file mode 100644
> index e621d8f2a8..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-pote=
ntial-string-truncation-in-strncpy.patch
> +++ /dev/null
> @@ -1,139 +0,0 @@
> -From 58b6d9a2efe101e5b80fd708e6f84c7ca779ce93 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 31 May 2018 20:27:43 -0700
> -Subject: [PATCH] Fix potential string truncation in strncpy()
> -
> -GCC 8 complains about the string truncation during copy
> -
> -error: 'strncpy' specified bound 16 equals destination size
> -
> -Upstream-Status: Inappropriate [depricated component]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tests/listen-packet.c | 3 ++-
> - tests/listen.c        | 3 ++-
> - tests/test2.c         | 4 ++--
> - tests/test3.c         | 3 ++-
> - tests/test4.c         | 3 ++-
> - tests/test5.c         | 3 ++-
> - tests/test6.c         | 3 ++-
> - tests/test7.c         | 3 ++-
> - 8 files changed, 16 insertions(+), 9 deletions(-)
> -
> -diff --git a/tests/listen-packet.c b/tests/listen-packet.c
> -index e40af81..eae0c71 100644
> ---- a/tests/listen-packet.c
> -+++ b/tests/listen-packet.c
> -@@ -50,7 +50,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, iface, IF_NAMESIZE);
> -+      strncpy(req.ifr_name, iface, IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFINDEX, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFINDEX");
> -diff --git a/tests/listen.c b/tests/listen.c
> -index 75c320b..5ce1ed9 100644
> ---- a/tests/listen.c
> -+++ b/tests/listen.c
> -@@ -47,7 +47,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, iface, IFNAMSIZ);
> -+      strncpy(req.ifr_name, iface, IFNAMSIZ - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFHWADDR, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFHWADDR");
> -diff --git a/tests/test2.c b/tests/test2.c
> -index 58eb74b..5d02838 100644
> ---- a/tests/test2.c
> -+++ b/tests/test2.c
> -@@ -45,8 +45,8 @@ int main(int argc, char **argv) {
> -               perror("socket");
> -               return 1;
> -       }
> --
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFHWADDR, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFHWADDR");
> -diff --git a/tests/test3.c b/tests/test3.c
> -index fb36627..2f50a5a 100644
> ---- a/tests/test3.c
> -+++ b/tests/test3.c
> -@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFHWADDR, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFHWADDR");
> -diff --git a/tests/test4.c b/tests/test4.c
> -index 33c274c..8737149 100644
> ---- a/tests/test4.c
> -+++ b/tests/test4.c
> -@@ -46,7 +46,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFHWADDR, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFHWADDR");
> -diff --git a/tests/test5.c b/tests/test5.c
> -index 4439dfa..28db562 100644
> ---- a/tests/test5.c
> -+++ b/tests/test5.c
> -@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFADDR, &req);
> -       if (ret < 0) {
> -               perror("ioctl: SIOCGIFADDR");
> -diff --git a/tests/test6.c b/tests/test6.c
> -index e375bfb..ce7de59 100644
> ---- a/tests/test6.c
> -+++ b/tests/test6.c
> -@@ -45,7 +45,8 @@ int main(int argc, char **argv) {
> -               return 1;
> -       }
> -
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFADDR, &req);
> -       if (ret < 0) {
> -               perror("ioctl: SIOCGIFADDR");
> -diff --git a/tests/test7.c b/tests/test7.c
> -index e9a5a55..37da22d 100644
> ---- a/tests/test7.c
> -+++ b/tests/test7.c
> -@@ -58,7 +58,8 @@ int main(int argc, char **argv) {
> -       if (ret)
> -               perror("setsockopt");
> -
> --      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE);
> -+      strncpy(req.ifr_name, argv[1] ?: "wpan0", IF_NAMESIZE - 1);
> -+      req.ifr_name[IF_NAMESIZE - 1] =3D '\0';
> -       ret =3D ioctl(sd, SIOCGIFHWADDR, &req);
> -       if (ret < 0)
> -               perror("ioctl: SIOCGIFHWADDR");
> ---
> -2.17.1
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-n=
ewline-from-format-line.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-n=
ewline-from-format-line.patch
> deleted file mode 100644
> index b8fe66f346..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-n=
ewline-from-format-line.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From a36afac485745cf980fba1809526f2025cb4d101 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 23 Apr 2017 00:16:45 -0700
> -Subject: [PATCH] Remove newline from format line
> -
> -Fixes
> -
> -error: '__builtin___snprintf_chk' output truncated before the last forma=
t
> character [-Werror=3Dformat-truncation=3D]
> -     "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
> -                                               ^
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - addrdb/addrdb.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/addrdb/addrdb.c b/addrdb/addrdb.c
> -index 4bb7f79..05d53f3 100644
> ---- a/addrdb/addrdb.c
> -+++ b/addrdb/addrdb.c
> -@@ -178,7 +178,7 @@ int addrdb_dump_leases(const char *lease_file)
> -                       continue;
> -               }
> -               snprintf(hwaddr_buf, sizeof(hwaddr_buf),
> --
> "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
> -+                              "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x"=
,
> -                               lease->hwaddr[0], lease->hwaddr[1],
> -                               lease->hwaddr[2], lease->hwaddr[3],
> -                               lease->hwaddr[4], lease->hwaddr[5],
> ---
> -2.12.2
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-c=
oord-config-parse.y-add-missing-time.h-inclu.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-c=
oord-config-parse.y-add-missing-time.h-inclu.patch
> deleted file mode 100644
> index 81a3f52d90..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-c=
oord-config-parse.y-add-missing-time.h-inclu.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From ab725a3faaeead90ae3c63cbcd370af087c413a5 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Mon, 27 Mar 2017 17:55:06 -0700
> -Subject: [PATCH] addrdb/coord-config-parse.y: add missing <time.h> inclu=
de
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The %union definition uses the time_t structure. In order to use this
> -structure, the <time.h> header has to be included. Otherwise, the build
> -breaks with some C libraries, such as musl:
> -
> -In file included from coord-config-lex.l:23:0:
> -coord-config-parse.y:107:2: error: unknown type name =E2=80=98time_t=E2=
=80=99
> -  time_t timestamp;
> -  ^
> -
> -This patch includes <time.h> using the '%code requires' directive of
> -Yacc.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - addrdb/coord-config-parse.y | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/addrdb/coord-config-parse.y b/addrdb/coord-config-parse.y
> -index 2e10a88..85ee058 100644
> ---- a/addrdb/coord-config-parse.y
> -+++ b/addrdb/coord-config-parse.y
> -@@ -102,6 +102,10 @@
> -
> - %}
> -
> -+%code requires {
> -+#include <time.h>
> -+}
> -+
> - %union {
> -       unsigned long number;
> -       time_t timestamp;
> ---
> -2.12.1
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordina=
tor-Fix-strncpy-range-warning.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordina=
tor-Fix-strncpy-range-warning.patch
> deleted file mode 100644
> index aadfae238d..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordina=
tor-Fix-strncpy-range-warning.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f017353b8f3170ce79e7addc127056c0142f087b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 1 Apr 2018 14:31:05 -0700
> -Subject: [PATCH] coordinator: Fix strncpy range warning
> -
> -Fixes
> -error: 'strncpy' specified bound 4096 equals destination size
> [-Werror=3Dstringop-truncation]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/coordinator.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/coordinator.c b/src/coordinator.c
> -index c139aae..ca49418 100644
> ---- a/src/coordinator.c
> -+++ b/src/coordinator.c
> -@@ -296,7 +296,8 @@ int main(int argc, char **argv)
> -       if(!lease_file)
> -               lease_file =3D LEASE_FILE;
> -
> --      strncpy(pname, argv[0], PATH_MAX);
> -+      strncpy(pname, argv[0], PATH_MAX - 1);
> -+      pname[PATH_MAX - 1] =3D '\0';
> -
> -       pid_file =3D getenv("PID_FILE");
> -       if (!pid_file)
> ---
> -2.16.3
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c=
-Undef-dprintf-before-redefining.patch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c=
-Undef-dprintf-before-redefining.patch
> deleted file mode 100644
> index fec9b5736d..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz.c=
-Undef-dprintf-before-redefining.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From ad088233608ba2205511da4f270f8ba29844b84c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 8 Apr 2017 09:02:02 -0700
> -Subject: [PATCH] src/iz.c: Undef dprintf before redefining
> -
> -Clang is picky and warns about macros redefinition
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/iz.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/iz.c b/src/iz.c
> -index 32be1a8..886f0a5 100644
> ---- a/src/iz.c
> -+++ b/src/iz.c
> -@@ -60,6 +60,7 @@ static int iz_seq =3D 0;
> - /* Parsed options */
> - static int iz_debug =3D 0;
> -
> -+#undef dprintf
> - #define dprintf(lvl, fmt...)                  \
> -       do {                                    \
> -               if (iz_debug >=3D lvl)            \
> ---
> -2.12.2
> -
> diff --git
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.p=
atch
> b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.p=
atch
> deleted file mode 100644
> index 9ecd707b41..0000000000
> ---
> a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man.p=
atch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Disable building manpages so that make install doesn't fail due to lack
> of help2man
> -
> -Upstream-Status: Inappropriate [config]
> -
> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 46c4017..d6ed312 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -9,11 +9,6 @@ izcoordinator_DESC =3D "simple coordinator for IEEE
> 802.15.4 network"
> - iz_DESC =3D "configure an IEEE 802.15.4 interface"
> - izchat_DESC =3D "simple chat program using IEEE 802.15.4"
> -
> --if MANPAGES
> --dist_man_MANS =3D $(manpages)
> --endif
> --EXTRA_DIST =3D $(manpages)
> --
> - izattach_SOURCES =3D serial.c
> -
> - iz_SOURCES =3D iz.c iz-common.c iz-mac.c iz-phy.c
> -@@ -27,18 +22,6 @@ izcoordinator_LDADD =3D ../addrdb/libaddrdb.la $(LDAD=
D)
> $(NL_LIBS) $(LEXLIB)
> - iz_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE
> - iz_LDADD =3D $(LDADD) $(NL_LIBS)
> -
> --izattach.8: $(izattach_SOURCES) $(top_srcdir)/configure.ac
> --      -$(HELP2MAN) -o $@ -s 8 -N -n $(izattach_DESC) $(builddir)/izatta=
ch
> --
> --izcoordinator.8: $(izcoordinator_SOURCES) $(top_srcdir)/configure.ac
> --      -$(HELP2MAN) -o $@ -s 8 -N -n $(izcoordinator_DESC)
> $(builddir)/izcoordinator
> --
> --iz.8: $(iz_SOURCES) $(top_srcdir)/configure.ac
> --      -$(HELP2MAN) -o $@ -s 8 -N -n $(iz_DESC) $(builddir)/iz
> --
> --izchat.1: $(izchat_SOURCES) $(top_srcdir)/configure.ac
> --      -$(HELP2MAN) -o $@ -s 1 -N -n $(izchat_DESC) $(builddir)/izchat
> --
> - install-data-hook:
> -       $(mkinstalldirs) $(DESTDIR)`dirname $(leasefile)`
> -       $(mkinstalldirs) $(DESTDIR)`dirname $(pidfile)`
> diff --git a/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/
> lowpan-tools_git.bb
> deleted file mode 100644
> index b442fb9f56..0000000000
> --- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -SUMMARY =3D "Utilities for managing the Linux LoWPAN stack"
> -DESCRIPTION =3D "This is a set of utils to manage the Linux LoWPAN stack=
. \
> -The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE
> 802.15.4-2006) compatibility."
> -SECTION =3D "net"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -DEPENDS =3D "flex-native bison-native libnl python"
> -
> -PV =3D "0.3.1+git"
> -SRC_URI =3D "git://
> github.com/linux-wpan/lowpan-tools;branch=3Dmaster;protocol=3Dhttps \
> -           file://no-help2man.patch \
> -           file://0001-Fix-build-errors-with-clang.patch \
> -
>  file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
> -           file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
> -           file://0001-Remove-newline-from-format-line.patch \
> -           file://0001-coordinator-Fix-strncpy-range-warning.patch \
> -           file://0001-Fix-potential-string-truncation-in-strncpy.patch =
\
> -           "
> -SRCREV =3D "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
> -
> -
> -inherit autotools python3-dir pkgconfig
> -
> -CACHED_CONFIGUREVARS +=3D
> "am_cv_python_pythondir=3D${PYTHON_SITEPACKAGES_DIR}/lowpan-tools"
> -
> -CFLAGS +=3D "-Wno-initializer-overrides"
> -
> -do_install:append() {
> -    rmdir ${D}${localstatedir}/run
> -}
> -
> -FILES:${PN}-dbg +=3D "${libexecdir}/lowpan-tools/.debug/"
> -
> -PACKAGES =3D+ "${PN}-python"
> -FILES:${PN}-python =3D "${libdir}/python*"
> -
> -SKIP_RECIPE[lowpan-tools] ?=3D "WARNING these tools are deprecated! Use
> wpan-tools instead"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122217):
> https://lists.openembedded.org/g/openembedded-devel/message/122217
> Mute This Topic: https://lists.openembedded.org/mt/116564508/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000042543f0644eadbb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, yes I am in favor of removing it. I think there is=
 a need to look into some more recipes of this kind.</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Dec 1, 2025 at 12:34=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">The application has received its last upstream update<br>
11 years ago. It has been on the skiplist[1] of meta-networking<br>
for the past 6 years due to being severly outdated.<br>
<br>
There are no recipes that would depend on this recipe in the meta-oe<br>
layers, nor in the layer-index[3].<br>
<br>
Let&#39;s bid farewell.<br>
<br>
[1]: <a href=3D"https://github.com/linux-wpan/lowpan-tools/commits/master/"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-wpan/lowpan-=
tools/commits/master/</a><br>
[2]: <a href=3D"https://github.com/openembedded/meta-openembedded/commit/13=
830393555adbb70ccec18bea177131ff405edc" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/openembedded/meta-openembedded/commit/13830393555adbb7=
0ccec18bea177131ff405edc</a><br>
[3]: <a href=3D"https://layers.openembedded.org/layerindex/branch/master/re=
cipes/?q=3Ddepends%3Alowpan-tools" rel=3D"noreferrer" target=3D"_blank">htt=
ps://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%=
3Alowpan-tools</a><br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-build-errors-with-clang.patch=C2=A0 =C2=A0 |=C2=A0 34 --=
---<br>
=C2=A0...tential-string-truncation-in-strncpy.patch | 139 -----------------=
-<br>
=C2=A0...0001-Remove-newline-from-format-line.patch |=C2=A0 34 -----<br>
=C2=A0...fig-parse.y-add-missing-time.h-inclu.patch |=C2=A0 46 ------<br>
=C2=A0...oordinator-Fix-strncpy-range-warning.patch |=C2=A0 32 ----<br>
=C2=A0...iz.c-Undef-dprintf-before-redefining.patch |=C2=A0 29 ----<br>
=C2=A0.../lowpan-tools/no-help2man.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 41 ------<br>
=C2=A0.../lowpan-tools/<a href=3D"http://lowpan-tools_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">lowpan-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 38 -----<br>
=C2=A08 files changed, 393 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-Fix-build-errors-with-clang.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-Fix-potential-string-truncation-in-strncpy.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-Remove-newline-from-format-line.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-coordinator-Fix-strncpy-range-warning.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/0001-src-iz.c-Undef-dprintf-before-redefining.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/lowpa=
n-tools/no-help2man.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/lowpan-tools/<a hr=
ef=3D"http://lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowp=
an-tools_git.bb</a><br>
<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-Fix-build-errors-with-clang.patch b/meta-networking/recipes-support/lowpan=
-tools/lowpan-tools/0001-Fix-build-errors-with-clang.patch<br>
deleted file mode 100644<br>
index 8e906f7ce0..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-bu=
ild-errors-with-clang.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From 5f9e80acb0a1ac399839bf160e43f6120c4b5128 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 18 Oct 2016 23:49:09 +0000<br>
-Subject: [PATCH] Fix build errors with clang<br>
-<br>
-| ../../../../../../../workspace/sources/lowpan-tools/src/coordinator.c:31=
3:50: error: format specifies type &#39;unsigned char&#39; but the argument=
 has type &#39;int&#39; [-Werror,-Wformat]<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(std=
err, &quot;Opt: %c (%hhx)\n&quot;, (char)opt, opt);<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0~~~~=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~=
<br>
-|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0%x<br>
-| 1 error generated.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/coordinator.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/coordinator.c b/src/coordinator.c<br>
-index c139aae..f0de6d2 100644<br>
---- a/src/coordinator.c<br>
-+++ b/src/coordinator.c<br>
-@@ -310,7 +310,7 @@ int main(int argc, char **argv)<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opt =3D getopt(argc=
, argv, &quot;l:f:d:m:n:i:s:p:c:hv&quot;);<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Op=
t: %c (%hhx)\n&quot;, opt, opt);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Op=
t: %c (%hhx)\n&quot;, opt, (unsigned char)opt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt =3D=3D -1)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
- <br>
--- <br>
-1.9.1<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-Fix-potential-string-truncation-in-strncpy.patch b/meta-networking/recipes=
-support/lowpan-tools/lowpan-tools/0001-Fix-potential-string-truncation-in-=
strncpy.patch<br>
deleted file mode 100644<br>
index e621d8f2a8..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Fix-po=
tential-string-truncation-in-strncpy.patch<br>
+++ /dev/null<br>
@@ -1,139 +0,0 @@<br>
-From 58b6d9a2efe101e5b80fd708e6f84c7ca779ce93 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 31 May 2018 20:27:43 -0700<br>
-Subject: [PATCH] Fix potential string truncation in strncpy()<br>
-<br>
-GCC 8 complains about the string truncation during copy<br>
-<br>
-error: &#39;strncpy&#39; specified bound 16 equals destination size<br>
-<br>
-Upstream-Status: Inappropriate [depricated component]<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- tests/listen-packet.c | 3 ++-<br>
- tests/listen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
- tests/test2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
- tests/test3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- tests/test4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- tests/test5.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- tests/test6.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- tests/test7.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
- 8 files changed, 16 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/tests/listen-packet.c b/tests/listen-packet.c<br>
-index e40af81..eae0c71 100644<br>
---- a/tests/listen-packet.c<br>
-+++ b/tests/listen-packet.c<br>
-@@ -50,7 +50,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, iface, IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, iface, IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFINDEX, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFINDEX&quot;);<br>
-diff --git a/tests/listen.c b/tests/listen.c<br>
-index 75c320b..5ce1ed9 100644<br>
---- a/tests/listen.c<br>
-+++ b/tests/listen.c<br>
-@@ -47,7 +47,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, iface, IFNAMSIZ);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, iface, IFNAMSIZ - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFHWADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFHWADDR&quot;);<br>
-diff --git a/tests/test2.c b/tests/test2.c<br>
-index 58eb74b..5d02838 100644<br>
---- a/tests/test2.c<br>
-+++ b/tests/test2.c<br>
-@@ -45,8 +45,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;socket=
&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFHWADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFHWADDR&quot;);<br>
-diff --git a/tests/test3.c b/tests/test3.c<br>
-index fb36627..2f50a5a 100644<br>
---- a/tests/test3.c<br>
-+++ b/tests/test3.c<br>
-@@ -46,7 +46,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFHWADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFHWADDR&quot;);<br>
-diff --git a/tests/test4.c b/tests/test4.c<br>
-index 33c274c..8737149 100644<br>
---- a/tests/test4.c<br>
-+++ b/tests/test4.c<br>
-@@ -46,7 +46,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFHWADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFHWADDR&quot;);<br>
-diff --git a/tests/test5.c b/tests/test5.c<br>
-index 4439dfa..28db562 100644<br>
---- a/tests/test5.c<br>
-+++ b/tests/test5.c<br>
-@@ -45,7 +45,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFADDR&quot;);<br>
-diff --git a/tests/test6.c b/tests/test6.c<br>
-index e375bfb..ce7de59 100644<br>
---- a/tests/test6.c<br>
-+++ b/tests/test6.c<br>
-@@ -45,7 +45,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFADDR&quot;);<br>
-diff --git a/tests/test7.c b/tests/test7.c<br>
-index e9a5a55..37da22d 100644<br>
---- a/tests/test7.c<br>
-+++ b/tests/test7.c<br>
-@@ -58,7 +58,8 @@ int main(int argc, char **argv) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;setsoc=
kopt&quot;);<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(req.ifr_name, argv[1] ?: &quot;wpan0&quot;, =
IF_NAMESIZE - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 req.ifr_name[IF_NAMESIZE - 1] =3D &#39;\0&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D ioctl(sd, SIOCGIFHWADDR, &amp;req);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;ioctl:=
 SIOCGIFHWADDR&quot;);<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-Remove-newline-from-format-line.patch b/meta-networking/recipes-support/lo=
wpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch<br>
deleted file mode 100644<br>
index b8fe66f346..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove=
-newline-from-format-line.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From a36afac485745cf980fba1809526f2025cb4d101 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 23 Apr 2017 00:16:45 -0700<br>
-Subject: [PATCH] Remove newline from format line<br>
-<br>
-Fixes<br>
-<br>
-error: &#39;__builtin___snprintf_chk&#39; output truncated before the last=
 format character [-Werror=3Dformat-truncation=3D]<br>
-=C2=A0 =C2=A0 =C2=A0&quot;%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- addrdb/addrdb.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/addrdb/addrdb.c b/addrdb/addrdb.c<br>
-index 4bb7f79..05d53f3 100644<br>
---- a/addrdb/addrdb.c<br>
-+++ b/addrdb/addrdb.c<br>
-@@ -178,7 +178,7 @@ int addrdb_dump_leases(const char *lease_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(hwaddr_buf=
, sizeof(hwaddr_buf),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%02x:%02x:%02x:%02x:%02x:%02x:%02x:%0=
2x\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%02x:%02x:%02x:%02x:%02x:%02x:%02x:%0=
2x&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lease-&gt;hwaddr[0], lease-&gt;hwaddr=
[1],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lease-&gt;hwaddr[2], lease-&gt;hwaddr=
[3],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lease-&gt;hwaddr[4], lease-&gt;hwaddr=
[5],<br>
--- <br>
-2.12.2<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch b/meta-networki=
ng/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb-coord-config-parse=
.y-add-missing-time.h-inclu.patch<br>
deleted file mode 100644<br>
index 81a3f52d90..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-addrdb=
-coord-config-parse.y-add-missing-time.h-inclu.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From ab725a3faaeead90ae3c63cbcd370af087c413a5 Mon Sep 17 00:00:00 2001<br>
-From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@free-electro=
ns.com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&gt;<br>
-Date: Mon, 27 Mar 2017 17:55:06 -0700<br>
-Subject: [PATCH] addrdb/coord-config-parse.y: add missing &lt;time.h&gt; i=
nclude<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-The %union definition uses the time_t structure. In order to use this<br>
-structure, the &lt;time.h&gt; header has to be included. Otherwise, the bu=
ild<br>
-breaks with some C libraries, such as musl:<br>
-<br>
-In file included from coord-config-lex.l:23:0:<br>
-coord-config-parse.y:107:2: error: unknown type name =E2=80=98time_t=E2=80=
=99<br>
-=C2=A0 time_t timestamp;<br>
-=C2=A0 ^<br>
-<br>
-This patch includes &lt;time.h&gt; using the &#39;%code requires&#39; dire=
ctive of<br>
-Yacc.<br>
-<br>
-Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@fre=
e-electrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&=
gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- addrdb/coord-config-parse.y | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/addrdb/coord-config-parse.y b/addrdb/coord-config-parse.y<br>
-index 2e10a88..85ee058 100644<br>
---- a/addrdb/coord-config-parse.y<br>
-+++ b/addrdb/coord-config-parse.y<br>
-@@ -102,6 +102,10 @@<br>
- <br>
- %}<br>
- <br>
-+%code requires {<br>
-+#include &lt;time.h&gt;<br>
-+}<br>
-+<br>
- %union {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long number;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0time_t timestamp;<br>
--- <br>
-2.12.1<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-coordinator-Fix-strncpy-range-warning.patch b/meta-networking/recipes-supp=
ort/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.pa=
tch<br>
deleted file mode 100644<br>
index aadfae238d..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordi=
nator-Fix-strncpy-range-warning.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From f017353b8f3170ce79e7addc127056c0142f087b Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sun, 1 Apr 2018 14:31:05 -0700<br>
-Subject: [PATCH] coordinator: Fix strncpy range warning<br>
-<br>
-Fixes<br>
-error: &#39;strncpy&#39; specified bound 4096 equals destination size [-We=
rror=3Dstringop-truncation]<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/coordinator.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/coordinator.c b/src/coordinator.c<br>
-index c139aae..ca49418 100644<br>
---- a/src/coordinator.c<br>
-+++ b/src/coordinator.c<br>
-@@ -296,7 +296,8 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if(!lease_file)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lease_file =3D LEAS=
E_FILE;<br>
- <br>
--=C2=A0 =C2=A0 =C2=A0 strncpy(pname, argv[0], PATH_MAX);<br>
-+=C2=A0 =C2=A0 =C2=A0 strncpy(pname, argv[0], PATH_MAX - 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 pname[PATH_MAX - 1] =3D &#39;\0&#39;;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_file =3D getenv(&quot;PID_FILE&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid_file)<br>
--- <br>
-2.16.3<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001=
-src-iz.c-Undef-dprintf-before-redefining.patch b/meta-networking/recipes-s=
upport/lowpan-tools/lowpan-tools/0001-src-iz.c-Undef-dprintf-before-redefin=
ing.patch<br>
deleted file mode 100644<br>
index fec9b5736d..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-src-iz=
.c-Undef-dprintf-before-redefining.patch<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From ad088233608ba2205511da4f270f8ba29844b84c Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sat, 8 Apr 2017 09:02:02 -0700<br>
-Subject: [PATCH] src/iz.c: Undef dprintf before redefining<br>
-<br>
-Clang is picky and warns about macros redefinition<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- src/iz.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/iz.c b/src/iz.c<br>
-index 32be1a8..886f0a5 100644<br>
---- a/src/iz.c<br>
-+++ b/src/iz.c<br>
-@@ -60,6 +60,7 @@ static int iz_seq =3D 0;<br>
- /* Parsed options */<br>
- static int iz_debug =3D 0;<br>
- <br>
-+#undef dprintf<br>
- #define dprintf(lvl, fmt...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iz_debug &gt;=
=3D lvl)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
--- <br>
-2.12.2<br>
-<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-h=
elp2man.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/n=
o-help2man.patch<br>
deleted file mode 100644<br>
index 9ecd707b41..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/no-help2man=
.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-Disable building manpages so that make install doesn&#39;t fail due to lac=
k of help2man<br>
-<br>
-Upstream-Status: Inappropriate [config]<br>
-<br>
-Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.int=
el.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;<br>
-<br>
-diff --git a/src/Makefile.am b/src/Makefile.am<br>
-index 46c4017..d6ed312 100644<br>
---- a/src/Makefile.am<br>
-+++ b/src/Makefile.am<br>
-@@ -9,11 +9,6 @@ izcoordinator_DESC =3D &quot;simple coordinator for IEEE =
802.15.4 network&quot;<br>
- iz_DESC =3D &quot;configure an IEEE 802.15.4 interface&quot;<br>
- izchat_DESC =3D &quot;simple chat program using IEEE 802.15.4&quot;<br>
- <br>
--if MANPAGES<br>
--dist_man_MANS =3D $(manpages)<br>
--endif<br>
--EXTRA_DIST =3D $(manpages)<br>
--<br>
- izattach_SOURCES =3D serial.c<br>
- <br>
- iz_SOURCES =3D iz.c iz-common.c iz-mac.c iz-phy.c<br>
-@@ -27,18 +22,6 @@ izcoordinator_LDADD =3D ../addrdb/<a href=3D"http://lib=
addrdb.la" rel=3D"noreferrer" target=3D"_blank">libaddrdb.la</a> $(LDADD) $=
(NL_LIBS) $(LEXLIB)<br>
- iz_CFLAGS =3D $(AM_CFLAGS) $(NL_CFLAGS) -D_GNU_SOURCE<br>
- iz_LDADD =3D $(LDADD) $(NL_LIBS)<br>
- <br>
--izattach.8: $(izattach_SOURCES) $(top_srcdir)/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
--=C2=A0 =C2=A0 =C2=A0 -$(HELP2MAN) -o $@ -s 8 -N -n $(izattach_DESC) $(bui=
lddir)/izattach<br>
--<br>
--izcoordinator.8: $(izcoordinator_SOURCES) $(top_srcdir)/<a href=3D"http:/=
/configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
--=C2=A0 =C2=A0 =C2=A0 -$(HELP2MAN) -o $@ -s 8 -N -n $(izcoordinator_DESC) =
$(builddir)/izcoordinator<br>
--<br>
--iz.8: $(iz_SOURCES) $(top_srcdir)/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a><br>
--=C2=A0 =C2=A0 =C2=A0 -$(HELP2MAN) -o $@ -s 8 -N -n $(iz_DESC) $(builddir)=
/iz<br>
--<br>
--izchat.1: $(izchat_SOURCES) $(top_srcdir)/<a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
--=C2=A0 =C2=A0 =C2=A0 -$(HELP2MAN) -o $@ -s 1 -N -n $(izchat_DESC) $(build=
dir)/izchat<br>
--<br>
- install-data-hook:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(mkinstalldirs) $(DESTDIR)`dirname $(leasefile=
)`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(mkinstalldirs) $(DESTDIR)`dirname $(pidfile)`=
<br>
diff --git a/meta-networking/recipes-support/lowpan-tools/<a href=3D"http:/=
/lowpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git=
.bb</a> b/meta-networking/recipes-support/lowpan-tools/<a href=3D"http://lo=
wpan-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git.bb=
</a><br>
deleted file mode 100644<br>
index b442fb9f56..0000000000<br>
--- a/meta-networking/recipes-support/lowpan-tools/<a href=3D"http://lowpan=
-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lowpan-tools_git.bb</a>=
<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-SUMMARY =3D &quot;Utilities for managing the Linux LoWPAN stack&quot;<br>
-DESCRIPTION =3D &quot;This is a set of utils to manage the Linux LoWPAN st=
ack. \<br>
-The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 8=
02.15.4-2006) compatibility.&quot;<br>
-SECTION =3D &quot;net&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
-<br>
-DEPENDS =3D &quot;flex-native bison-native libnl python&quot;<br>
-<br>
-PV =3D &quot;0.3.1+git&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-wpan/lowpan-too=
ls;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/linux-wpan/lowpan-tools;branch=3Dmaster;protocol=3Dhttps</a> \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-help2man.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-build-errors-with=
-clang.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-addrdb-coord-config-p=
arse.y-add-missing-time.h-inclu.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-iz.c-Undef-dprint=
f-before-redefining.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Remove-newline-from-f=
ormat-line.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-coordinator-Fix-strnc=
py-range-warning.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-potential-string-=
truncation-in-strncpy.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRCREV =3D &quot;1c2d8674cc6f4b1166a066e8822e295c105ae7a2&quot;<br>
-<br>
-<br>
-inherit autotools python3-dir pkgconfig<br>
-<br>
-CACHED_CONFIGUREVARS +=3D &quot;am_cv_python_pythondir=3D${PYTHON_SITEPACK=
AGES_DIR}/lowpan-tools&quot;<br>
-<br>
-CFLAGS +=3D &quot;-Wno-initializer-overrides&quot;<br>
-<br>
-do_install:append() {<br>
-=C2=A0 =C2=A0 rmdir ${D}${localstatedir}/run<br>
-}<br>
-<br>
-FILES:${PN}-dbg +=3D &quot;${libexecdir}/lowpan-tools/.debug/&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-python&quot;<br>
-FILES:${PN}-python =3D &quot;${libdir}/python*&quot;<br>
-<br>
-SKIP_RECIPE[lowpan-tools] ?=3D &quot;WARNING these tools are deprecated! U=
se wpan-tools instead&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122217): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122217" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122217</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116564508/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116564508/1997914</a><br>
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

--00000000000042543f0644eadbb1--

