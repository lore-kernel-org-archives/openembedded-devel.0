Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30F7199A;
	Thu, 28 Dec 2017 07:00:39 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id l41so26242473wre.11;
	Wed, 27 Dec 2017 23:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KSQShgcbIL+TjBePyW9M7kuuDm2gSO2srW7HRi0Y51k=;
	b=ZRUTnxLGfOeEEjxx0Z4pJFu7UyzVNi/bOteVZFyykRVVrECa+L9NxMm4Qjx7xYrXGu
	59AgLtuOOS174JhhZBHguJ2H6iF+S/4FT/9oeBcHcJWwSpuetDZb7/6QTfAjdPVVcH70
	pBWhl5imWuFfYazBCz3IAsJ4t/nIYsJd6oPMX4EGxLi9NK/mZS9Jw6+WUHM+v2UsLzcZ
	WlFUhhELqywmvZKHgaYvJJ1Paw3Uo0n6p2wl+TMOlaNzIJ8bhcXYwVPWyrcaMuR9/haF
	6/cgz1tcz12punT2OmchdI/k3H5mliv3GIvGC+0bhoCyvUN4VZLZ4wglbSm3/JpAbXYu
	Q+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KSQShgcbIL+TjBePyW9M7kuuDm2gSO2srW7HRi0Y51k=;
	b=PsHhqorwiuPqg3/1SDB7iqw4n6fb0hlHntjHCaf9cVM21ZuqltMzn2+OP2duAVbdI4
	Q6vnaOFBClypoZiJdMukQ2+uityFij2sqxh/lt/YMnWKATsYqLG6A6Nj77leiw9mirXB
	JBkyuU0zje0QbjETUzd2AY7JD2XLpAgjFaatb2hjFLfaUqh9iK4tUzOTgvrhmvxikQ+F
	m4PCdaHE9d/uwOt6RHEZ2OEU8eEdNns6oz2JTwrzrxTx3q1Qp6GDLA2t6tm89ENwb319
	l+PiaFHBbLGSXBCLzNZA4zf48qg/n/M2iMz3eu1BIinPqOBUzf1PEFzRdzEWQnIf1/94
	Z97g==
X-Gm-Message-State: AKGB3mLpmJksjbpyWhGYsPI6b27+91Vg8xhMBzfktjTAGCdPDBuE/Xtj
	rMlYjAkUykfxdvAGKXHZfR9iwsAgW3OXsX4bLkJukQ==
X-Google-Smtp-Source: ACJfBovbHxpCcgKn1rTlDnbbtI5Hu91KcIfGg7dJXVRAGj4O/pD1wuio2UOrQYGjb+koMOMxQakaaeoH3roK1aOs4/M=
X-Received: by 10.223.185.83 with SMTP id b19mr20884701wrg.58.1514444440718;
	Wed, 27 Dec 2017 23:00:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 27 Dec 2017 23:00:40 -0800 (PST)
In-Reply-To: <20171227155802.C316E2355F0@git.openembedded.org>
References: <151439028240.18102.14504164584663683151@git.openembedded.org>
	<20171227155802.C316E2355F0@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Dec 2017 08:00:40 +0100
Message-ID: <CA+chaQdipw+NcdvPGib3uVHpYDdozpNoH3Up866JN-tY5cSGog@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 06/06: dnfdragora: new add
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
X-List-Received-Date: Thu, 28 Dec 2017 07:00:40 -0000
Content-Type: text/plain; charset="UTF-8"

What is supposed to provide libyui-ncurses? libyui recipe in meta-oe/master
doesn't provide this package.

ERROR: Nothing RPROVIDES 'libyui-ncurses' (but
meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb RDEPENDS on or
otherwise requires it)
NOTE: Runtime target 'libyui-ncurses' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libyui-ncurses']

On Wed, Dec 27, 2017 at 4:58 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> armin_kuster pushed a commit to branch master
> in repository meta-openembedded.
>
> commit 9c6309582611519c92ec11cbda5769e0f0f0c315
> Author: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> AuthorDate: Wed Dec 20 00:13:52 2017 +0800
>
>     dnfdragora: new add
>
>     Add a new recipe dnfdragora.
>
>     Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...-set-PYTHON_INSTALL_DIR-by-running-python.patch | 26
> ++++++++++++++++++
>  .../0001-Run-python-scripts-using-env.patch        | 25 +++++++++++++++++
>  .../0001-To-fix-error-when-do_package.patch        | 31
> ++++++++++++++++++++++
>  .../dnfdragora/0001-disable-build-manpages.patch   | 25 +++++++++++++++++
>  .../recipes-graphics/dnfdragora/dnfdragora_git.bb  | 30
> +++++++++++++++++++++
>  5 files changed, 137 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-
> not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-
> not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> new file mode 100644
> index 0000000..46d4dbd
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-Do-
> not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> @@ -0,0 +1,26 @@
> +From 80179c297abb9de2829bd02356257241dd414d70 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Mon, 18 Dec 2017 16:25:54 +0900
> +Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python.
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7c66b39..1489ef6 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -19,7 +19,7 @@ else(NOT SPHINX_EXECUTABLE-NOTFOUND)
> +       message(STATUS "Could NOT find sphinx-build.")
> + endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
> +
> +-execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from
> distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')"
> OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
> ++#execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from
> distutils.sysconfig import get_python_lib; print(get_python_lib(), end='')"
> OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
> + string(REGEX REPLACE "\n$" "" ${PYTHON_INSTALL_DIR}
> "${PYTHON_INSTALL_DIR}")
> + execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "import sys;
> sys.stdout.write('%s.%s' % (sys.version_info.major,
> sys.version_info.minor))" OUTPUT_VARIABLE PYTHON_MAJOR_DOT_MINOR_VERSION)
> + message(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-
> Run-python-scripts-using-env.patch b/meta-oe/recipes-graphics/
> dnfdragora/dnfdragora/0001-Run-python-scripts-using-env.patch
> new file mode 100644
> index 0000000..75b6b8f
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-
> Run-python-scripts-using-env.patch
> @@ -0,0 +1,25 @@
> +From 15d0afcfa4868b7b072b3434bac0064617d61f99 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Tue, 19 Dec 2017 14:53:14 +0900
> +Subject: [PATCH] Run python scripts using env
> +
> +Otherwise the build tools hardcode the python path into them.
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + bin/dnfdragora | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bin/dnfdragora b/bin/dnfdragora
> +index b8e0550..cd80f7f 100755
> +--- a/bin/dnfdragora
> ++++ b/bin/dnfdragora
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/python3
> ++#!/usr/bin/env python3
> + # vim: set et ts=4 sw=4:
> + #    Copyright 2016-2017 Angelo Naselli <anaselli@linux.it>
> + #
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-
> fix-error-when-do_package.patch b/meta-oe/recipes-graphics/
> dnfdragora/dnfdragora/0001-To-fix-error-when-do_package.patch
> new file mode 100644
> index 0000000..90ce1d0
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-To-
> fix-error-when-do_package.patch
> @@ -0,0 +1,31 @@
> +From 56d9b838b3475729d7ed9c6c156d72c28943c2b6 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Tue, 19 Dec 2017 11:15:29 +0900
> +Subject: [PATCH] To fix error when do_package
> +
> +QA Issue: nativesdk-dnfdragora: Files/directories were installed but not
> shipped in any package:
> +  /etc
> +  /etc/dnfdragora
> +  /etc/dnfdragora/dnfdragora.yaml
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7c66b39..a5659f7 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -52,7 +52,7 @@ endif(ENABLE_COMPS)
> + set(CMAKE_INSTALL_BINDIR "${CMAKE_INSTALL_PREFIX}/bin")
> + set(CMAKE_INSTALL_DATAROOTDIR "${CMAKE_INSTALL_PREFIX}/share")
> + set(CMAKE_INSTALL_LOCALEDIR "${CMAKE_INSTALL_DATAROOTDIR}/locale")
> +-set(CMAKE_INSTALL_FULL_SYSCONFDIR "/etc")
> ++set(CMAKE_INSTALL_FULL_SYSCONFDIR "${CMAKE_INSTALL_PREFIX}/../etc")
> +
> + # Configure files
> + configure_file(${CMAKE_SOURCE_DIR}/etc/dnfdragora.yaml.in
> ${CMAKE_BINARY_DIR}/etc/dnfdragora.yaml @ONLY)
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-disable-build-manpages.patch
> b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-
> disable-build-manpages.patch
> new file mode 100644
> index 0000000..88bb634
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora/0001-
> disable-build-manpages.patch
> @@ -0,0 +1,25 @@
> +From 2e6a0db24be373a5b7741dc5a0d322a28389fbf0 Mon Sep 17 00:00:00 2001
> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +Date: Thu, 23 Nov 2017 16:35:44 +0900
> +Subject: [PATCH] disable build manpages.
> +
> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> +---
> + CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7c66b39..fc32750 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -65,7 +65,6 @@ endif(GETTEXT_FOUND)
> +
> + # Build and install the man-pages
> + if(NOT SPHINX_EXECUTABLE-NOTFOUND)
> +-      add_subdirectory(man)
> + endif(NOT SPHINX_EXECUTABLE-NOTFOUND)
> +
> + # Installing application code
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> new file mode 100644
> index 0000000..5678f73
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "dnfdragora is a DNF frontend, based on rpmdragora from Mageia
> (originally rpmdrake) Perl code."
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504 \
> +                   "
> +
> +SRC_URI = "git://github.com/manatools/dnfdragora.git \
> +           file://0001-disable-build-manpages.patch \
> +           file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> \
> +           file://0001-To-fix-error-when-do_package.patch \
> +           file://0001-Run-python-scripts-using-env.patch \
> +           "
> +
> +PV = "1.0.1+git"
> +SRCREV = "4fef4ce889b8e4fa03191d414f63bfd50796152a"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake gettext pkgconfig python3-dir python3native distutils3-base
> +
> +DEPENDS += "dnf python3 "
> +#DEPENDS_class-nativesdk += "nativesdk-python3"
> +
> +RDEPENDS_${PN}_class-target = " python3-core libyui libyui-ncurses "
> +
> +# manpages generation requires http://www.sphinx-doc.org/
> +EXTRA_OECMAKE = " -DWITH_MAN=OFF -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}
> -DPYTHON_DESIRED=3"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> +FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/ ${datadir}/ ${bindir}/
> ${sysconfdir}/dnfdragora "
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

