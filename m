Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id E3C0A6D319
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 09:52:35 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so3591203wes.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TFOL17U28d2HrnmldxmXoZN1gngOcnZx3eu1Qnsy1ZU=;
	b=XMle+2gLNIZhKF5aC3QzGgKJKWjY9ZxiG/OFSacptk1HzA+raJ/yekpgVXirF5ec14
	HV5dZuShLxkXA4tpk48joRKe0NYBGjAGTyJ2+0lWzyAT87z/f8GtQFJl2ZzmqrKYaTCg
	KGI+jScGwye3xIOAvNIEycfr64hew4Ztj9N/rb6nmDkj+5v+bPPv0JPpSlJa9srxeTY9
	a0AotE675HvEtQMg7/IEtO+Q0k8aSKWibOPt+yhbenBAG9rAPOaPi+FNn/MHM4jJK+mK
	y3tgpED+I2QALBQNhOaTX/cKzoNOr2azLcHwmr0BNH0NlMtOeyrsOh/y0h5sYolPeB7b
	juVg==
MIME-Version: 1.0
X-Received: by 10.180.211.111 with SMTP id nb15mr1646391wic.55.1382694757155; 
	Fri, 25 Oct 2013 02:52:37 -0700 (PDT)
Received: by 10.194.179.198 with HTTP; Fri, 25 Oct 2013 02:52:37 -0700 (PDT)
In-Reply-To: <1382691396-3929-1-git-send-email-cazfi74@gmail.com>
References: <1382691396-3929-1-git-send-email-cazfi74@gmail.com>
Date: Fri, 25 Oct 2013 11:52:37 +0200
Message-ID: <CA+chaQfqyNSS+PvjZk8eGKRi69iJJQ8dhxX4=HpNfA6-JpgZAQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] lua5.1: apply lua.org patches for lua-5.1.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2013 09:52:36 -0000
Content-Type: text/plain; charset=UTF-8

There is also alternative patch for 5.2.2 proposed to be merged in oe-core



On Fri, Oct 25, 2013 at 10:56 AM, Marko Lindqvist <cazfi74@gmail.com> wrote:

> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch | 18 +++++++++
>  meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch | 44
> ++++++++++++++++++++++
>  meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb       |  4 +-
>  3 files changed, 65 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
>  create mode 100644 meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
>
> diff --git a/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
> b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
> new file mode 100644
> index 0000000..b64a6a2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_1.patch
> @@ -0,0 +1,18 @@
> +lua.org patch 1 for lua-5.1.5.
> +from http://www.lua.org/bugs.html
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd lua-5.1.5/src/Makefile lua-5.1.5/src/Makefile
> +--- lua-5.1.5/src/Makefile     2012-02-13 22:41:22.000000000 +0200
> ++++ lua-5.1.5/src/Makefile     2013-10-25 11:29:49.769540434 +0300
> +@@ -48,7 +48,7 @@
> + a:    $(ALL_A)
> +
> + $(LUA_A): $(CORE_O) $(LIB_O)
> +-      $(AR) $@ $(CORE_O) $(LIB_O)     # DLL needs all object files
> ++      $(AR) $@ $(CORE_O) $(LIB_O)
> +       $(RANLIB) $@
> +
> + $(LUA_T): $(LUA_O) $(LUA_A)
> diff --git a/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
> b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
> new file mode 100644
> index 0000000..0c48ea2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/lua/lua5.1/luaorg_2.patch
> @@ -0,0 +1,44 @@
> +lua.org patch 2 for lua-5.1.5.
> +from http://www.lua.org/bugs.html
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd lua-5.1.5/src/lzio.c lua-5.1.5/src/lzio.c
> +--- lua-5.1.5/src/lzio.c       2007-12-27 15:02:25.000000000 +0200
> ++++ lua-5.1.5/src/lzio.c       2013-10-25 11:32:45.773536572 +0300
> +@@ -22,10 +22,14 @@
> +   size_t size;
> +   lua_State *L = z->L;
> +   const char *buff;
> ++  if (z->eoz) return EOZ;
> +   lua_unlock(L);
> +   buff = z->reader(L, z->data, &size);
> +   lua_lock(L);
> +-  if (buff == NULL || size == 0) return EOZ;
> ++  if (buff == NULL || size == 0) {
> ++    z->eoz = 1;  /* avoid calling reader function next time */
> ++    return EOZ;
> ++  }
> +   z->n = size - 1;
> +   z->p = buff;
> +   return char2int(*(z->p++));
> +@@ -51,6 +55,7 @@
> +   z->data = data;
> +   z->n = 0;
> +   z->p = NULL;
> ++  z->eoz = 0;
> + }
> +
> +
> +diff -Nurd lua-5.1.5/src/lzio.h lua-5.1.5/src/lzio.h
> +--- lua-5.1.5/src/lzio.h       2007-12-27 15:02:25.000000000 +0200
> ++++ lua-5.1.5/src/lzio.h       2013-10-25 11:31:50.301537789 +0300
> +@@ -59,6 +59,7 @@
> +   lua_Reader reader;
> +   void* data;                 /* additional data */
> +   lua_State *L;                       /* Lua state (for reader) */
> ++  int eoz;                    /* true if reader has no more data */
> + };
> +
> +
> diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bbb/meta-oe/recipes-devtools/lua/
> lua5.1_5.1.5.bb
> index 19fee01..f946994 100644
> --- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
> +++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.5.bb
> @@ -4,12 +4,14 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=59bdd99bb82238f238cf5c65c21604fd"
>  HOMEPAGE = "http://www.lua.org/"
>
> -PR = "r1"
> +PR = "r2"
>
>  DEPENDS += "readline"
>  SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
>             file://bitwise_operators.patch \
>             file://lua5.1.pc \
> +           file://luaorg_1.patch \
> +           file://luaorg_2.patch \
>  "
>  S = "${WORKDIR}/lua-${PV}"
>
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

