Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57250CD5BC0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 04:03:07 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9314.1779681782392358464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 21:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nCwehs0Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7dd73b7c757so4179414a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 21:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779681781; cv=none;
        d=google.com; s=arc-20240605;
        b=eRlQxAgytJIwOQcf1XeLwK5KoPRXqAiOtLsEoLNCD4uRuaSQlefwpZqEIAKwGD1FKa
         aEbfkNfDVrsPs452GhM3qIE2K1Cj7VQYR3Y4hw8Gz2yLDDIcDSL7Fk5do78JAEP1Sr1j
         c8S+fdJaAqvwXU719Ol9K1OtCJcR5vUQHSyvp0Ig2t02fMj+JyERFOU4PuVTf3JIoxym
         X7Les2BEVgElQibsWVlpChK6behTxHZA+/fmeegH4Oj+fdkHcrBQjP60X5hDm+Y3VVzo
         nY/Z4Cizjage4RyB2ZEvxocQDRhid0zkp4l2llT6ICfkxXz9a68tSZhWF3i8gF2nbrob
         Arjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLgfWb91l8SQBNgAym87pLvO2jHPWjPvoyEO94kB4UE=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=YkpMQOQl14WUUmPVpUMT4Lx82S2hfhWbLDm6O7kiGxBwdjYe+EZxbr7V/n4I1BUa9P
         0+lw1YOxYWDRsiGK4kgTCkNciha7bQiGbGgzHdUxXOb6w6EJ98URMmB55BoNMaC7Vss7
         DYkxhc15CbFL6lNN3jaF7h1LSKqBmZ5Mh1lwORS8uuJpkBvRqCKKEMKv6Jsd9gGkdKfi
         eKjVFTiYa3eJdRiyKrfK90aZEmcEeAoEcTsH6mRZHVGMXpRjcw5Qb+aaGL6+K1ClAREc
         G5fWgL8cEZ38U7Wpygj1niiPuHDqIF/yLpW3jCRqHa9m7bEo/kmy9xA753050a1AraW8
         0E+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779681781; x=1780286581; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLgfWb91l8SQBNgAym87pLvO2jHPWjPvoyEO94kB4UE=;
        b=nCwehs0QA2EgK07BE/1h1GWXK2GUi8EpPLnfjaTSVTmFFBKDEXcfq7tlfhZYJj02sa
         tcfXbN6Q0Qo6X/vPOZFifgYKTQKcVQgDqAFWPk4HpVplcc+k36irJwLyK7ePr11Y5GFn
         Kyp26A5L4/4fZvLio1w6NorW+yy6gZNu4HnnNIU/MD1eSgmNjCBe1i3WU+CheMbd5UyJ
         e7Kr7i0Mw6HRGiuqstk4cGG9BIBSEUWvoGZJgTGmbMlC3vDWIKDC1nFFGcjrq/neDexp
         4uP1MgFT9hPOcJSNkpR1rdwGwgrxhRaAkn9j2i6JW10vTI+zto4juvdvSqS6pMP0chvd
         fJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779681781; x=1780286581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLgfWb91l8SQBNgAym87pLvO2jHPWjPvoyEO94kB4UE=;
        b=ZgEN/1xU69uuPHyWy7bT9mncq4DNT/omnkzocRX1YYIwgZVZjnBsA9ai5pM5ddiSRN
         sqS30oJ1pFdrT8+yBjK6lE4JoIhPn8Gx/aYi1F5HO3pU3PwV3bznTBLtT+jhpd+7j6Iw
         NiEdFg9aDgU0VOXXFTl3NX+wFqLTUBT5/DIv0kQgGFMZrP3itlWNKzFHkJez2rcXANNO
         NW9uRHZJoTM0Rj624yh5U7OeoDnb8Q4QjqK9XBxlQnOdDRARC4x28szyPDVUkfF/3bOY
         XKcqbG1CGppGj1RC8h7hSjbKkzIr2yF6ed37S6kW/tL/QgISP5MUDsHXlrjJpBmyaoTp
         LYuA==
X-Gm-Message-State: AOJu0YzwazOevY/VDZsxUvI7PYdl7M9VJo/CT+RifugfkAmUIH7sCvz3
	YD5zm0E0EIq7w69ydXuCW0IeBOLp09GycYBSiOHiznDg2euaoeMTxuPVzNS/gH+xfpe7QpGoNCI
	CSx5eQ2qazcscyguT+TBCM5dC1qoz/6gcF7Lf
X-Gm-Gg: Acq92OHQaS2HXv3bjnXv4LHItHq/O6mQcRNlm2Zp0HzlZ8j2xAAJUh/da3TNLLPkJsQ
	aSyO+Yc5KV3rATPuf/yUX8j2bL3thnHZMB/4B7JWjPXFjuMfwwfOgTO0kgImwvnikH/jVEHuj84
	Yg1AdAWBTqfKtdGosqYC66jtRfT/E8bSr5hrVaLkMIMjW17LuTxi+BOwaqIZzcZQxcvLZk+1Knp
	wACpLpuIBUnQzPTJ+kSlLFKZGIL76F1u492JUzoWmk9pezHclGkdbO22icb8ub59I/Wdnh/e7Bz
	hBsmdb5HG/+YdaI5e1Md
X-Received: by 2002:a05:6820:8c6:b0:696:8325:f7eb with SMTP id
 006d021491bc7-69d7ecd0c9amr6739682eaf.45.1779681781320; Sun, 24 May 2026
 21:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
 <20260523123907.2609140-2-ankur.tyagi85@gmail.com> <CA+s=J=yqdHHStXHOk_yYgBYRiW_vKGqpx_DBJJeDZkBzptc_hg@mail.gmail.com>
In-Reply-To: <CA+s=J=yqdHHStXHOk_yYgBYRiW_vKGqpx_DBJJeDZkBzptc_hg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 25 May 2026 16:02:50 +1200
X-Gm-Features: AVHnY4KBEnV0D9sjTtN9bAIMy_WfkFsec_yEU50Lu3L_7-ex9STHlQYC3j3bJ38
Message-ID: <CADySD0GX_yqgfqJcvTZOYnXiuFuWKQwTyQwVinESDV2Fv95orw@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 7.2.12 -> 7.2.14
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 04:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127194

On Mon, May 25, 2026 at 2:44=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Sat, May 23, 2026 at 8:39=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Also refreshed patches to resolve patch fuzz QA issue.
> >
> > Bug and security fix release
> > https://github.com/redis/redis/releases/tag/7.2.13
> > https://github.com/redis/redis/releases/tag/7.2.14
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../0001-hiredis-use-default-CC-if-it-is-set.patch   | 12 ++++++++----
> >  ...e-Makefile-to-use-environment-build-setting.patch |  6 +++---
> >  .../0003-hack-to-force-use-of-libc-malloc.patch      |  8 ++++----
> >  .../redis/0004-src-Do-not-reset-FINAL_LIBS.patch     |  6 +++---
> >  ...GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 10 +++++-----
> >  .../0006-Define-correct-gregs-for-RISCV32.patch      |  8 ++++----
> >  .../redis/{redis_7.2.12.bb =3D> redis_7.2.14.bb}       |  2 +-
> >  7 files changed, 28 insertions(+), 24 deletions(-)
> >  rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb =3D> redis_7.2.=
14.bb} (97%)
>
> Fails with error:
>
>
> ERROR: redis-7.2.14-r0 do_patch: QA Issue: Fuzz detected:
>
> Applying patch 0001-hiredis-use-default-CC-if-it-is-set.patch
> patching file deps/hiredis/Makefile
> Hunk #1 succeeded at 36 with fuzz 2 (offset -6 lines).
>
>
> Applying patch 0003-hack-to-force-use-of-libc-malloc.patch
> patching file src/Makefile
> Hunk #1 succeeded at 13 with fuzz 2.
>
>
> Applying patch 0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.p=
atch
> patching file src/zmalloc.c
> Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
>
>
> The context lines in the patches can be updated with devtool:
>
>     devtool modify redis
>     devtool finish --force-patch-refresh redis <layer_path>
>
> Don't forget to review changes done by devtool!
>
> Patch log indicates that patches do not apply cleanly. [patch-fuzz]
>

odd, I'll try to reproduce the issue and send v2 later on.
Thanks for the feedback.

>
> >
> > diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-defa=
ult-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hired=
is-use-default-CC-if-it-is-set.patch
> > index 51a6e9c957..035f533661 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-=
if-it-is-set.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-=
if-it-is-set.patch
> > @@ -1,4 +1,4 @@
> > -From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
> > +From 61ae3e0277ac92323584bbe75ce79de6e030e84a Mon Sep 17 00:00:00 2001
> >  From: Venture Research <tech@ventureresearch.com>
> >  Date: Fri, 8 Feb 2013 17:39:52 -0600
> >  Subject: [PATCH] hiredis: use default CC if it is set
> > @@ -6,6 +6,10 @@ MIME-Version: 1.0
> >  Content-Type: text/plain; charset=3DUTF-8
> >  Content-Transfer-Encoding: 8bit
> >
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> >  Instead of trying to automagically figure out CC, which breaks with OE
> >  as CC has spaces in it, just skip it if one was already passed in.
> >
> > @@ -23,15 +27,15 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@g=
mail.com>
> >   1 file changed, 2 deletions(-)
> >
> >  diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
> > -index 7e41c97..54717e3 100644
> > +index bd2106b..9ce768d 100644
> >  --- a/deps/hiredis/Makefile
> >  +++ b/deps/hiredis/Makefile
> > -@@ -42,8 +42,6 @@ endef
> > +@@ -36,8 +36,6 @@ endef
> >   export REDIS_TEST_CONFIG
> >
> >   # Fallback to gcc when $CC is not in $PATH.
> >  -CC:=3D$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $=
(CC) || echo gcc')
> >  -CXX:=3D$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo=
 $(CXX) || echo g++')
> >   OPTIMIZATION?=3D-O3
> > - WARNINGS=3D-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-=
field-initializers
> > + WARNINGS=3D-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings =
-Wno-missing-field-initializers
> >   DEBUG_FLAGS?=3D -g -ggdb
> > diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makef=
ile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis=
/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
> > index 17b533669b..c163aaae8b 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-=
use-environment-build-setting.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-=
use-environment-build-setting.patch
> > @@ -1,4 +1,4 @@
> > -From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
> > +From a35a89981e28fb118efa86a798dacda826eb6f74 Mon Sep 17 00:00:00 2001
> >  From: Venture Research <tech@ventureresearch.com>
> >  Date: Fri, 8 Feb 2013 20:22:19 -0600
> >  Subject: [PATCH] lua: update Makefile to use environment build setting=
s
> > @@ -23,10 +23,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> >   3 files changed, 6 insertions(+), 12 deletions(-)
> >
> >  diff --git a/deps/Makefile b/deps/Makefile
> > -index cbe3aef..76bc222 100644
> > +index 3bf0363..fd8765a 100644
> >  --- a/deps/Makefile
> >  +++ b/deps/Makefile
> > -@@ -81,7 +81,6 @@ endif
> > +@@ -94,7 +94,6 @@ endif
> >   # lua's Makefile defines AR=3D"ar rcu", which is unusual, and makes i=
t more
> >   # challenging to cross-compile lua (and redis).  These defines make i=
t easier
> >   # to fit redis into cross-compilation environments, which typically s=
et AR.
> > diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-us=
e-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-=
force-use-of-libc-malloc.patch
> > index f1021eef6c..f142ff6ec2 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-li=
bc-malloc.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-li=
bc-malloc.patch
> > @@ -1,4 +1,4 @@
> > -From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
> > +From a6246b17e94a2f7ad3560787a476b18aa7a45358 Mon Sep 17 00:00:00 2001
> >  From: Venture Research <tech@ventureresearch.com>
> >  Date: Wed, 6 Feb 2013 20:51:02 -0600
> >  Subject: [PATCH] hack to force use of libc malloc
> > @@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc=
.com>
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >  diff --git a/src/Makefile b/src/Makefile
> > -index 7d75c83..35dd314 100644
> > +index 6a87909..b8e0d44 100644
> >  --- a/src/Makefile
> >  +++ b/src/Makefile
> >  @@ -13,7 +13,8 @@
> > @@ -31,5 +31,5 @@ index 7d75c83..35dd314 100644
> >  +# use fake uname option to force use of generic libc
> >  +uname_S :=3D "USE_LIBC_MALLOC"
> >   uname_M :=3D $(shell sh -c 'uname -m 2>/dev/null || echo not')
> > - OPTIMIZATION?=3D-O2
> > - DEPENDENCY_TARGETS=3Dhiredis linenoise lua hdr_histogram
> > + CLANG :=3D $(findstring clang,$(shell sh -c '$(CC) --version | head -=
1'))
> > + OPTIMIZATION?=3D-O3
> > diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset=
-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-re=
set-FINAL_LIBS.patch
> > index 958106e261..ecf8714d33 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_=
LIBS.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_=
LIBS.patch
> > @@ -1,4 +1,4 @@
> > -From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
> > +From 1b59adad94137eedfbcddb27adae74b80b4e0909 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 10 Sep 2019 20:04:26 -0700
> >  Subject: [PATCH] src: Do not reset FINAL_LIBS
> > @@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/src/Makefile b/src/Makefile
> > -index 35dd314..3770f96 100644
> > +index b8e0d44..3a68fa6 100644
> >  --- a/src/Makefile
> >  +++ b/src/Makefile
> > -@@ -93,7 +93,7 @@ endif
> > +@@ -122,7 +122,7 @@ endif
> >
> >   FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAG=
S)
> >   FINAL_LDFLAGS=3D$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
> > diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOUR=
CE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/=
redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
> > index d73c66c9d0..cd8fae4074 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-g=
et-PTHREAD_MUTEX_INITIALIZER.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-g=
et-PTHREAD_MUTEX_INITIALIZER.patch
> > @@ -1,4 +1,4 @@
> > -From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
> > +From 5a58c573d486411a3a1585ca42bee70a661a983d Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 21 Dec 2019 12:09:51 -0800
> >  Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
> > @@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/src/zmalloc.c b/src/zmalloc.c
> > -index 1f33d09..5e182d1 100644
> > +index bbfa386..93e07ff 100644
> >  --- a/src/zmalloc.c
> >  +++ b/src/zmalloc.c
> > -@@ -28,6 +28,7 @@
> > -  * POSSIBILITY OF SUCH DAMAGE.
> > -  */
> > +@@ -32,6 +32,7 @@
> > + #include "config.h"
> > + #include "solarisfixes.h"
> >
> >  +#define _GNU_SOURCE
> >   #include <stdio.h>
> > diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-g=
regs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-c=
orrect-gregs-for-RISCV32.patch
> > index bb3f5c607e..dd44797437 100644
> > --- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-fo=
r-RISCV32.patch
> > +++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-fo=
r-RISCV32.patch
> > @@ -1,4 +1,4 @@
> > -From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
> > +From 8a16ff40b75671725e4bd92b50a5f083460e796b Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 26 Oct 2020 21:32:22 -0700
> >  Subject: [PATCH] Define correct gregs for RISCV32
> > @@ -14,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> >   1 file changed, 24 insertions(+), 2 deletions(-)
> >
> >  diff --git a/src/debug.c b/src/debug.c
> > -index bb76c5d..55a0696 100644
> > +index 684f692..2ee151f 100644
> >  --- a/src/debug.c
> >  +++ b/src/debug.c
> > -@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc=
, void *eip) {
> > +@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc=
, void *eip) {
> >       #endif
> >   #elif defined(__linux__)
> >       /* Linux */
> > @@ -28,7 +28,7 @@ index bb76c5d..55a0696 100644
> >       GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
> >       #elif defined(__X86_64__) || defined(__x86_64__)
> >       GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
> > -@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
> > +@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
> >       #endif
> >   /* Linux */
> >   #elif defined(__linux__)
> > diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/r=
ecipes-extended/redis/redis_7.2.14.bb
> > similarity index 97%
> > rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > rename to meta-oe/recipes-extended/redis/redis_7.2.14.bb
> > index 2b4087a74b..93235e3707 100644
> > --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
> > +++ b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
> > @@ -17,7 +17,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
> >             file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIAL=
IZER.patch \
> >             file://0006-Define-correct-gregs-for-RISCV32.patch \
> >            "
> > -SRC_URI[sha256sum] =3D "97c60478a7c777ac914ca9d87a7e88ba265926456107e7=
58c62d8f971d0196bc"
> > +SRC_URI[sha256sum] =3D "21326da3f66c0aead4c8204c0ac52ff905337a77cadd16=
9f75ac22835ea30025"
> >
> >  inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#127177): https://lists.openembedded.org/g/openembed=
ded-devel/message/127177
> > Mute This Topic: https://lists.openembedded.org/mt/119453647/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

