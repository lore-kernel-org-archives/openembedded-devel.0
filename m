Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCB6060557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:23:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L8NYTQ011289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Aug 2015 01:23:34 -0700 (PDT)
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 21 Aug 2015 01:23:34 -0700
Message-ID: <55D6E003.7040201@windriver.com>
Date: Fri, 21 Aug 2015 16:23:31 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, "Lei, Maohui"
	<leimaohui@cn.fujitsu.com>
References: <1440144060-46643-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1440144060-46643-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Originating-IP: [128.224.163.137]
Subject: Re: [meta-oe][PATCH] uim: 1.3.1->1.8.6
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
X-List-Received-Date: Fri, 21 Aug 2015 08:23:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi

在 2015年08月21日 16:01, Lei Maohui 写道:
> - delte 0001-fix-bug-about-stdlib.patch that not be needed.
> - modified license
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>   .../uim/uim/0001-fix-bug-about-stdlib.patch        | 40 ----------------------
>   .../uim/uim/0001-fix-bug-for-cross-compile.patch   | 38 ++++++++++----------
>   .../uim/{uim_1.3.1.bb => uim_1.8.6.bb}             | 19 ++++++----
>   3 files changed, 32 insertions(+), 65 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
>   rename meta-oe/recipes-support/uim/{uim_1.3.1.bb => uim_1.8.6.bb} (89%)
>
> diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
> deleted file mode 100644
> index 9e63683..0000000
> --- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From e0e3f82bd2918fdcc722918c108bc33647a4805f Mon Sep 17 00:00:00 2001
> -From: Leimaohui <leimaohui@cn.fujitsu.com>
> -Date: Fri, 25 Oct 2013 18:31:22 +0900
> -Subject: [PATCH] fix bug about stdlib
> -
> -Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
> ----
> - xim/locale.cpp    |    3 ++-
> - xim/ximserver.cpp |    1 +
> - 2 files changed, 3 insertions(+), 1 deletions(-)
> -
> -diff --git a/xim/locale.cpp b/xim/locale.cpp
> -index 380e945..edfaf03 100644
> ---- a/xim/locale.cpp
> -+++ b/xim/locale.cpp
> -@@ -35,7 +35,8 @@
> - #ifdef HAVE_CONFIG_H
> - # include <config.h>
> - #endif
> --
> -+#include <string.h>
> -+#include <stdlib.h>
> - #include <stdio.h>
> - #include <locale.h>
> - #include <iconv.h>
> -diff --git a/xim/ximserver.cpp b/xim/ximserver.cpp
> -index 245c5f8..cde9918 100644
> ---- a/xim/ximserver.cpp
> -+++ b/xim/ximserver.cpp
> -@@ -34,6 +34,7 @@
> - # include <config.h>
> - #endif
> -
> -+#include <stdlib.h>
> - #include <stdio.h>
> - #include <ctype.h>
> - #include <locale.h>
> ---
> -1.7.1
> -
> diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
> index 61392c9..df82b07 100644
> --- a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
> +++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
> @@ -1,28 +1,28 @@
> -From 2e87c39ae3a00b8231ee21a54c47361c1bf502f7 Mon Sep 17 00:00:00 2001
> -From: Leimaohui <leimaohui@cn.fujitsu.com>
> -Date: Fri, 25 Oct 2013 18:23:12 +0900
> +From 2918196ba782dfa4401bdca917ad4de1910505e0 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Fri, 21 Aug 2015 15:58:42 +0900
>   Subject: [PATCH] fix bug for cross compile
>   
> -Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>   ---
> - configure.ac |    4 ++--
> - 1 files changed, 2 insertions(+), 2 deletions(-)
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 3b64593..57395d4 100644
> +index 9be879c..9249bfd 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -601,8 +601,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
> -  if test "x$use_libedit" != "xno"; then
> -      saved_CPPFLAGS=$CPPFLAGS
> -      saved_LDFLAGS=$LDFLAGS
> --     CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
> --     LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
> -+     CPPFLAGS="${CPPFLAGS} "
> -+     LDFLAGS="${LDFLAGS} "
> -      AC_CHECK_LIB(edit, el_init,	
> -      		[
> - 		   LIBEDIT_LIBS="-ledit -lcurses -l$libedit_path/lib"
> +@@ -1208,8 +1208,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
> + if test "x$use_libedit" != "xno"; then
> +     saved_CPPFLAGS=$CPPFLAGS
> +     saved_LDFLAGS=$LDFLAGS
> +-    CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
> +-    LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
> ++    CPPFLAGS="${CPPFLAGS} "
> ++    LDFLAGS="${LDFLAGS} "
> +     AC_CHECK_LIB(curses, tgetent, LIBEDIT_LIBS="-lcurses",
> +         [AC_CHECK_LIB(ncurses, tgetent, LIBEDIT_LIBS="-lncurses",
> +             AC_MSG_WARN("libedit needs libcurses or libncurses. disabled...")
>   --
> -1.7.1
> +1.8.4.2
>   
> diff --git a/meta-oe/recipes-support/uim/uim_1.3.1.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> similarity index 89%
> rename from meta-oe/recipes-support/uim/uim_1.3.1.bb
> rename to meta-oe/recipes-support/uim/uim_1.8.6.bb
> index 01657df..24f14a5 100644
> --- a/meta-oe/recipes-support/uim/uim_1.3.1.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
> @@ -1,17 +1,18 @@
>   DESCRIPTION = "A multilingual user input method library"
>   HOMEPAGE = "http://uim.freedesktop.org/"
> -LICENSE = "BSD"
> +LICENSE = "BSD-3-Clause & LGPLv2+"
>   SECTION = "inputmethods"
>   
>   SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
> -           file://0001-fix-bug-about-stdlib.patch "
> +           "
>   
>   SRC_URI_append_class-target = "file://uim-module-manager.patch \
> -                               file://0001-fix-bug-for-cross-compile.patch"
> +                               file://0001-fix-bug-for-cross-compile.patch \
> +                               "
>   
> -LIC_FILES_CHKSUM = "file://COPYING;md5=9c372efbeca58ce22017a29c1ebf8bf0"
> -SRC_URI[md5sum] = "2832e23d4778bbacbfa4b49bf642d667"
> -SRC_URI[sha256sum] = "ed2cfa15018a4fd2557e875f66fcb3f0b9dabe12fa0700aa2f11cca69c2cb256"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
> +SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
> +SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
>   
>   DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
>   DEPENDS_class-target += "gtk+ uim-native takao-fonts"
> @@ -33,6 +34,12 @@ EXTRA_OECONF += "--disable-emacs \
>   
>   CONFIGUREOPTS_class-target := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"

I had a patch for CONFIGUREOPTS in uim_1.3.1.bb but hadn't merged into 
master.
When enable multilib, the CONFIGUREOPTS isn't expanded correctly.

Please see similar issue:
http://lists.openembedded.org/pipermail/openembedded-core/2013-November/086510.html

Please use _remove to drop the silent rule:
-CONFIGUREOPTS_class-target := "${@d.getVar('CONFIGUREOPTS', 
True).replace('--disable-silent-rules', ' ')}"
+CONFIGUREOPTS_remove_class-target = "--disable-silent-rules"

Thanks,
Yi

>   
> +
> +#Because m4 file's find maxdepth=2, so copy the m4 files of the deep depth.
> +do_configure_prepend () {
> +    cp ${S}/sigscheme/m4/* ${S}/m4/
> +}
> +
>   PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common uim-anthy libuim0 libuim-dev"
>   
>   FILES_libuim0 = "${libdir}/uim/plugin/libuim-custom-enabler.* \


