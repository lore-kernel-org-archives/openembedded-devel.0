Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85257C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 21:28:54 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.148.1652909329591448044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 14:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Yh/AjyVZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id n13so4374008ejv.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQTBCdGeRv/uJW5Wi9lrKg4+MJ7O6hJ0n0PkvN3RvsQ=;
        b=Yh/AjyVZKZNIbK9LbhjYxiF1R32sfsJRmlbPS9DcAzgyOTGlZy+slcY0Sg8n/YV44q
         jU3RZYBtiuLE6DQcY34NrJEajeQGekYG5kexy678dPzBav/r1BW/MAY/A4LiGU7oAf+G
         TK1tmo6oiFQv8x3KNRQ48NAblhL1P+DZtKScrEBfpXVwZlVfAZvl58t0HXyHO7mh+pFE
         i/h+f9Gy/rJE2d4sT6qsDuWwdjrLQhFUq0ZsYFCCXLvAq7FKEvycELGA9vEzN1bg0rAa
         IgroYn+XJyTcIqVbXsadD49y/puLoEAKWmJKs2bXDEHkvPl9MxfaXgO/z+SHJYRfK2iF
         PhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQTBCdGeRv/uJW5Wi9lrKg4+MJ7O6hJ0n0PkvN3RvsQ=;
        b=5ekRZrWaLElHzkea+/AaU3gjSL1XIBbgnsFM4CQhqaBwd8O14W1lmKWF3DeGwqXXRS
         DTlz88wcy0cCuZuf2yPfXXK565ZK12GdhIJKJUilTOCuZN7WuYfhaNFF3azR484g3hWO
         LeyzV2gQGvi7ZfxRYjTnNT56Idirpnpkjd6p/Wp5sOdFD5+Mz7qeXNEQ02ZiiZPMSY/e
         AnEW2LnnPUm5/yYLLFG8r6iSt9tNqNl8Sic3lHwmfCWhdSF3E6GTxp6bLfW/TKgyb79U
         HJ2Cwc7QVuCRwRr+cG+m12biB8kiQBlHUHt6BTwErDk/lHSJzZkrx2onIbA6IHN5dv3b
         E+Ig==
X-Gm-Message-State: AOAM530z3sWvi1A3Q/We3tPOEUdWrZCAT5+zH2XYq/piwNv5AX+ncYZS
	8Ff+3cpjpSx7dWerUeC/U1bM/sWo7z0L5iGKetbk1Q==
X-Google-Smtp-Source: 
 ABdhPJygQDWWAlpaX1UzLQsi7Ko0C1mVPw1cnQxkypRfjqSG8oM0k8bgGpsY1moxojHrAb0cdAM76CoVaShfJkqI21c=
X-Received: by 2002:a17:907:2da0:b0:6f4:e536:3771 with SMTP id
 gt32-20020a1709072da000b006f4e5363771mr1428852ejc.55.1652909327719; Wed, 18
 May 2022 14:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220509074009.12239-1-omkarpatil10.93@gmail.com>
In-Reply-To: <20220509074009.12239-1-omkarpatil10.93@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 18 May 2022 11:28:36 -1000
Message-ID: 
 <CAOSpxdbh9KVmTUnXw5hQMzvx58qUHQUresp4TxrTnXDj0vDTOA@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] lua: fix CVE-2022-28805
To: omkar <omkarpatil10.93@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, ranjitsinh.rathod@kpit.com,
	Sana Kazi <sana.kazi@kpit.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Omkar Patil <omkar.patil@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 May 2022 21:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97165

On Sun, May 8, 2022 at 9:40 PM omkar <omkarpatil10.93@gmail.com> wrote:
>
> From: Steve Sakoman <steve@sakoman.com>

I'm not the maintainer for meta-openembedded, but this appears to be a
patch that I originally submitted for the lua recipe in oe-core master
branch.  This recipe was moved to oe-core post dunfell release, so it
does make sense to patch the lua version on meta-openembedded.

Perhaps this patch wasn't taken because it has at least one issue, see below.

> singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
> call, leading to a heap-based buffer over-read that might affect a system that
> compiles untrusted Lua code.
>
> https://nvd.nist.gov/vuln/detail/CVE-2022-28805
>
> (From OE-Core rev: d2ba3b8850d461bc7b773240cdf15b22b31a3f9e)
>
> Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 91e14d3a8e6e67267047473f5c449f266b44f354)
> Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
> Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
> ---
>  .../lua/lua/0001-lua-fix-CVE-2022-28805.patch | 73 +++++++++++++++++++
>  .../lua/lua/CVE-2022-28805.patch              | 28 +++++++
>  meta-oe/recipes-devtools/lua/lua_5.3.6.bb     |  1 +
>  3 files changed, 102 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
>  create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
>
> diff --git a/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch
> new file mode 100644
> index 000000000..606c9ea98
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua/0001-lua-fix-CVE-2022-28805.patch

This seems to be adding a file that is an edited version of my
original patch.  This seems to have no purpose!

> @@ -0,0 +1,73 @@
> +From a38684e4cb4e1439e5f2f7370724496d5b363b32 Mon Sep 17 00:00:00 2001
> +From: Steve Sakoman <steve@sakoman.com>
> +Date: Mon, 18 Apr 2022 09:04:08 -1000
> +Subject: [PATCH] lua: fix CVE-2022-28805
> +
> +singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
> +call, leading to a heap-based buffer over-read that might affect a system that
> +compiles untrusted Lua code.
> +
> +https://nvd.nist.gov/vuln/detail/CVE-2022-28805
> +
> +(From OE-Core rev: d2ba3b8850d461bc7b773240cdf15b22b31a3f9e)
> +
> +Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
> +Signed-off-by: Steve Sakoman <steve@sakoman.com>
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +(cherry picked from commit 91e14d3a8e6e67267047473f5c449f266b44f354)
> +Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
> +---
> + .../lua/lua/CVE-2022-28805.patch              | 28 +++++++++++++++++++
> + meta-oe/recipes-devtools/lua/lua_5.3.6.bb     |  1 +
> + 2 files changed, 29 insertions(+)
> + create mode 100644 meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
> +
> +diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
> +new file mode 100644
> +index 000000000..0a21d1ce7
> +--- /dev/null
> ++++ b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
> +@@ -0,0 +1,28 @@
> ++From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
> ++From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> ++Date: Tue, 15 Feb 2022 12:28:46 -0300
> ++Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
> ++
> ++CVE: CVE-2022-28805
> ++
> ++Upstream-Status: Backport [https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]
> ++
> ++Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
> ++Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ++---
> ++ src/lparser.c         |  1 +
> ++ 1 files changed, 1 insertions(+)
> ++
> ++diff --git a/src/lparser.c b/src/lparser.c
> ++index 3abe3d751..a5cd55257 100644
> ++--- a/src/lparser.c
> +++++ b/src/lparser.c
> ++@@ -300,6 +300,7 @@
> ++     expdesc key;
> ++     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
> ++     lua_assert(var->k != VVOID);  /* this one must exist */
> +++    luaK_exp2anyregup(fs, var);  /* but could be a constant */
> ++     codestring(ls, &key, varname);  /* key is variable name */
> ++     luaK_indexed(fs, var, &key);  /* env[varname] */
> ++   }
> ++
> +diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> +index 342ed1b54..0137cc3c5 100644
> +--- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> ++++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> +@@ -10,6 +10,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
> +            file://CVE-2020-15888.patch \
> +            file://CVE-2020-15945.patch \
> +            file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
> ++           file://CVE-2022-28805.patch \
> +            "
> +
> + # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
> new file mode 100644
> index 000000000..0a21d1ce7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua/CVE-2022-28805.patch
> @@ -0,0 +1,28 @@
> +From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Tue, 15 Feb 2022 12:28:46 -0300
> +Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
> +
> +CVE: CVE-2022-28805
> +
> +Upstream-Status: Backport [https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]
> +
> +Signed-off-by: Sana Kazi <sana.kazi@kpit.com>
> +Signed-off-by: Steve Sakoman <steve@sakoman.com>
> +---
> + src/lparser.c         |  1 +
> + 1 files changed, 1 insertions(+)
> +
> +diff --git a/src/lparser.c b/src/lparser.c
> +index 3abe3d751..a5cd55257 100644
> +--- a/src/lparser.c
> ++++ b/src/lparser.c
> +@@ -300,6 +300,7 @@
> +     expdesc key;
> +     singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
> +     lua_assert(var->k != VVOID);  /* this one must exist */
> ++    luaK_exp2anyregup(fs, var);  /* but could be a constant */
> +     codestring(ls, &key, varname);  /* key is variable name */
> +     luaK_indexed(fs, var, &key);  /* env[varname] */
> +   }
> +
> diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> index 342ed1b54..0137cc3c5 100644
> --- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> +++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
>             file://CVE-2020-15888.patch \
>             file://CVE-2020-15945.patch \
>             file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.patch \
> +           file://CVE-2022-28805.patch \
>             "
>
>  # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
> --
> 2.17.1
>

