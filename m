Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 174FC6079E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:02:45 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id f8so27661017wre.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Dec 2017 23:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Ccvg8adwWwuedjl3A2U1k30oXG4PBKhaumoghwRkdY=;
	b=aJeuwJMV8IxK/jmN9OJRFgq2x2V7GNJOMLiRTx8RuJo6hMTYNPgZqomB8Ic2rfU3sY
	IsfBpAi57brEuY/AXjkTATK5AW8ayopcIbKXmg9MKBfJTCklXD61AWvK808T0BSpHdAE
	wHcsfZnxIWwiqipfU313Ov9omDrlQI+7/OW6LzGhlhGMIbIUq8Z2NYJfTj974gqD94D2
	cJRvLyGJT9AGFbOnD1IF84q0ZCzrvCVXQjGqRBlQdwsOVP6Amgg3FhDaHvrCGjx8D23a
	LJYhofoCNimJnYUin24TbAGi6oGrJRrbPeHDwGdiTut7aIWyJ6W9J9ZUuJtaCkwHVBNU
	nlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Ccvg8adwWwuedjl3A2U1k30oXG4PBKhaumoghwRkdY=;
	b=T5HeBLDRG572Nxj1JOhd5riGoikZOFglnpyAGHyFPjMoWXhRFp3brJsCE9hpXxH5SM
	Y+zDVQb7klF9z8QC6ZjsAEmq0D0dZKcOBqyNJRdHgQJXs+1QvMYtI6sEIluth0+l/05r
	nlUw0Sj3CfKH9ucnXbCx3D/+PRl+s5n6Q+zwRxrgivl1M8t4y3E0YPtSPIptkja7wcVr
	e693wKlTmA18ynVlg2YYjQD0vMcrLetfO7aWm/1eSXQlRBZ+ATYDL0eJGzk2/t2JyTQU
	mr9OCgz/6Rj/peYQHhDOec/89kYW8ES2UepXqaslA0M7ZoioCQGsJP6ABxWx+qIJfQZe
	/QZw==
X-Gm-Message-State: AKGB3mKMhTnFhE8rmDfYO+QriNhc9+nSnX2cI4UfnNbM2CL2dTKQLqP0
	3YjnefAJk1TQp4NOmno2ioEiJso6uNejUwGG2xM=
X-Google-Smtp-Source: ACJfBovFHK2V9JrkMRmDjabObJOSBu7+XcX9gcO3FnyBwd0Y4ErwQhxQ4QcwIkeEVr/pK5HgPHOuPiFMIYJjhOHCgog=
X-Received: by 10.223.164.78 with SMTP id e14mr26743619wra.68.1514444566293;
	Wed, 27 Dec 2017 23:02:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 27 Dec 2017 23:02:45 -0800 (PST)
In-Reply-To: <1513780518-29657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1513780518-29657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Dec 2017 08:02:45 +0100
Message-ID: <CA+chaQcxkcjy=GJFM5YjXpY_c9yOTsSypOQfzAQOSGnDQq3c8w@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libyui-ncurses: new add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Dec 2017 07:02:45 -0000
Content-Type: text/plain; charset="UTF-8"

This is missing in master now, because dnfdragora was merged.

Please use 4 spaces for indentation.

On Wed, Dec 20, 2017 at 3:35 PM, zhengrq <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Add a new recipe libyui-ncurses, which is a rdepend for dnfdragora.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...1-Fix-the-error-of-can-t-find-header-file.patch | 100
> +++++++++++++++++++++
>  .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  50 +++++++++++
>  2 files changed, 150 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
> Fix-the-error-of-can-t-find-header-file.patch
>  create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
>
> diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
> Fix-the-error-of-can-t-find-header-file.patch b/meta-oe/recipes-graphics/
> libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch
> new file mode 100644
> index 0000000..26b4c17
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-
> Fix-the-error-of-can-t-find-header-file.patch
> @@ -0,0 +1,100 @@
> +From eb0086dc4ea8fe9cda069456287b3a29a2631d30 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Wed, 13 Dec 2017 16:18:45 +0900
> +Subject: [PATCH] Fix the error of can't find header file
> +
> +This fix is just for yocto.
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + src/NCApplication.cc | 2 +-
> + src/NCstyle.h        | 2 +-
> + src/NCurses.h        | 2 +-
> + src/ncursesp.h       | 2 +-
> + src/ncursesw.cc      | 2 +-
> + src/ncursesw.h       | 4 ++--
> + 6 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/NCApplication.cc b/src/NCApplication.cc
> +index 5bcf969..510f034 100644
> +--- a/src/NCApplication.cc
> ++++ b/src/NCApplication.cc
> +@@ -23,7 +23,7 @@
> +
> + /-*/
> +
> +-#include <ncursesw/curses.h>
> ++#include <curses.h>
> +
> + #define  YUILogComponent "ncurses"
> + #include <yui/YUILog.h>
> +diff --git a/src/NCstyle.h b/src/NCstyle.h
> +index a40d5a8..3657917 100644
> +--- a/src/NCstyle.h
> ++++ b/src/NCstyle.h
> +@@ -25,7 +25,7 @@
> + #ifndef NCstyle_h
> + #define NCstyle_h
> +
> +-#include <ncursesw/ncurses.h>
> ++#include <ncurses.h>
> +
> + #include <iosfwd>
> + #include <string>
> +diff --git a/src/NCurses.h b/src/NCurses.h
> +index a07c6bf..d17d3c3 100644
> +--- a/src/NCurses.h
> ++++ b/src/NCurses.h
> +@@ -34,7 +34,7 @@
> + #include <yui/YWidget.h>
> + #include <yui/YMenuItem.h>
> +
> +-#include <ncursesw/curses.h>  /* curses.h: #define  NCURSES_CH_T cchar_t
> */
> ++#include <curses.h>   /* curses.h: #define  NCURSES_CH_T cchar_t */
> + #include <wchar.h>
> +
> + #include "ncursesw.h"
> +diff --git a/src/ncursesp.h b/src/ncursesp.h
> +index d478347..2fcfea5 100644
> +--- a/src/ncursesp.h
> ++++ b/src/ncursesp.h
> +@@ -28,7 +28,7 @@
> + #include <iosfwd>
> +
> + #include "ncursesw.h"
> +-#include <ncursesw/panel.h>
> ++#include <panel.h>
> +
> + class NCursesPanel : public NCursesWindow
> + {
> +diff --git a/src/ncursesw.cc b/src/ncursesw.cc
> +index 3c771af..bb83210 100644
> +--- a/src/ncursesw.cc
> ++++ b/src/ncursesw.cc
> +@@ -47,7 +47,7 @@
> + #include <iostream>
> + #include <stdlib.h>
> + #include <string.h>
> +-#include <ncursesw/term.h>
> ++#include <term.h>
> + #undef line
> + #undef columns
> +
> +diff --git a/src/ncursesw.h b/src/ncursesw.h
> +index d25923a..c140d37 100644
> +--- a/src/ncursesw.h
> ++++ b/src/ncursesw.h
> +@@ -27,8 +27,8 @@
> +
> + #include <iosfwd>
> +
> +-#include <ncursesw/curses.h>
> +-#include <ncursesw/etip.h>
> ++#include <curses.h>
> ++#include <etip.h>
> + #include <cstdio>
> + #include <cstdarg>
> + #include <climits>
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
> b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
> new file mode 100644
> index 0000000..f378701
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "Character Based User Interface for libyui"
> +LICENSE = "LGPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=
> e6a600fd5e1d9cbde2d983680233ad02 \
> +                    file://COPYING.lgpl-2.1;md5=
> 4fbd65380cdd255951079008b364516c \
> +                   "
> +
> +SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
> +           "
> +
> +SRC_URI_append_class-target += " file://0001-Fix-the-error-of-
> can-t-find-header-file.patch"
> +
> +PV = "2.48.3+git"
> +SRCREV = "7b251c2ff541df6139f3d210d0a0a27d042926bd"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake gettext pkgconfig
> +
> +DEPENDS += "boost libyui ncurses"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> +do_configure_prepend () {
> +         cd ${S}
> +         git checkout bootstrap.sh
> +         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
> bootstrap.sh
> +         ./bootstrap.sh
> +         mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
> +         cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so*
> ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
> +         cd -
> +         sed -i "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
> ${S}/CMakeLists.txt
> +         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#"
> ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/
> LibyuiLibraryDepends-release.cmake
> +}
> +
> +do_install_append () {
> +        if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d
> ${D}/usr/lib64 ]; then
> +            mv ${D}/usr/lib64 ${D}/usr/lib
> +        fi
> +}
> +
> +do_install_append_class-nativesdk () {
> +        mkdir -p ${D}/${base_prefix}
> +        mv ${D}/usr ${D}/${base_prefix}
> +}
> +
> +FILES_${PN} += "${datadir}/*"
> +
> +FILES_${PN}-dev += "${libdir}/*"
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

