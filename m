Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8B27F8DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 00:36:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id s64so5522883pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 16:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=+L0MLqPuPlLRDX2PK+RWlbPb+uaaYNrPAjcAQVouewI=;
	b=YTR9GlrsYBaH2+dGpn17jzsS9pi6i/7pMZngch1DouepqKfXzgB80RPhV0TdSL2H1q
	M52vpYpeEZBrX4GhY7hwr6TGBw6WINT2Ryb/lqFzOEekMBBfAEW7sFo8IvIftdU6HegD
	hh4nG2s0S2kMZHvxA91jSd8dDyscOwg+dIde0xCZzUiyP8scV/wjP1pJiHC/hH7Rop3C
	9nWAA6udFoP8+JzlmatUu9gtsCh5yZRjNbZLaSaf68svqdwGO8xoJ09CGoc4V251Strz
	ydOgaYuMp/smCMbsh0789NNkIwmI/4GZSj26QBtXTMCrLGSDFFqgeOUXMy7mUJRmiLZu
	I7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+L0MLqPuPlLRDX2PK+RWlbPb+uaaYNrPAjcAQVouewI=;
	b=Zauby24Zw4unXVO087kuT4DaMFwB6Ao354Rxt7XNOiuMhSxNwznz+lrsxncrt8Trik
	/kaOuUVUco4Pi6Nf5lDfTBW6J4F4ts3tDORClpOlSIE21wsM77jNl1FLeLxaY41q9yPE
	RfHoO760xXaki8Zc1e68+/GSgBGYcjDHq1Go6nSRO7ZAW6ZPrGxkQW25A85uALuUbfC7
	wJ/AMobZTaYvzuAN8lTGjlK2+ie+Bu6zapRFfCyLXTqPUsMWwbT5N8DdlushoVTPk/Er
	Jf3xY1GfcV++i8Zx+1gIjPfjjt4nFAR6mRPHKEPHKYbUBOiyJevZTQ5logZ6mMLibAt6
	H2gw==
X-Gm-Message-State: APjAAAUP+iA4rxCdH5wckuZ/LRAEvkm8KW1FxDYqPrYzaELVofcB+egr
	LAnv54SSsgbsoWBT977Mr2FKlG0v37w=
X-Google-Smtp-Source: APXvYqy7YLGjqs6zYAY6IS9gqUTmQwwMxQdXXuvI4kDI+5IMmiCqMCXVHuEPosYSeeZ7btUaIxnsnw==
X-Received: by 2002:a63:31cf:: with SMTP id
	x198mr23467796pgx.272.1578962206128; 
	Mon, 13 Jan 2020 16:36:46 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:c8c8:687f:1d3e:adde?
	([2601:646:9200:4e0:c8c8:687f:1d3e:adde])
	by smtp.gmail.com with ESMTPSA id
	o134sm16052161pfg.137.2020.01.13.16.36.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 13 Jan 2020 16:36:45 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<20200113190102.22584-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <673df57a-3aa3-6c7b-eafc-6e17d491baf1@gmail.com>
Date: Mon, 13 Jan 2020 16:36:43 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200113190102.22584-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-gnome][PATCHv2 1/2] sysprof: add a recipe from oe-core
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
X-List-Received-Date: Tue, 14 Jan 2020 00:36:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/13/20 11:01 AM, Martin Jansa wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Latest version (3.34) of sysprof have a hard dependency on polkit,
> which in turn requires mozjs, which pulls in a number of other
> meta-oe packages including python2. This makes it difficult
> to keep sysprof in oe-core, so for the time being it is moved to
> meta-oe.


it fails to build for arm
https://errors.yoctoproject.org/Errors/Details/306463/
https://errors.yoctoproject.org/Errors/Details/306361/

> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   ...thing-in-help-as-it-requires-itstool.patch | 27 ++++++++++++++++
>   .../files/define-NT_GNU_BUILD_ID.patch        | 22 +++++++++++++
>   .../recipes-kernel/sysprof/sysprof_3.32.0.bb  | 32 +++++++++++++++++++
>   3 files changed, 81 insertions(+)
>   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
>   create mode 100644 meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
>   create mode 100644 meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> 
> diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> new file mode 100644
> index 0000000000..ade51cf864
> --- /dev/null
> +++ b/meta-gnome/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
> @@ -0,0 +1,27 @@
> +From d332b480257aa98b63d39c3c94896a111536f937 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 23 Aug 2017 18:38:26 +0300
> +Subject: [PATCH 2/2] Do not build anything in help/ as it requires itstool.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3986273..ae2f65e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -164,7 +164,6 @@ subdir('tools')
> + subdir('tests')
> +
> + subdir('data')
> +-subdir('help')
> + subdir('po')
> +
> + meson.add_install_script('build-aux/meson/post_install.sh')
> +--
> +2.7.4
> +
> diff --git a/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> new file mode 100644
> index 0000000000..f75ddad43a
> --- /dev/null
> +++ b/meta-gnome/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
> @@ -0,0 +1,22 @@
> +On uclibc elf.h does not have GNU extentions but we need this define
> +so we define it locally if its not getting it from elf.h
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: git/elfparser.h
> +===================================================================
> +--- git.orig/lib/util/elfparser.h	2011-07-16 18:57:41.000000000 -0700
> ++++ git/lib/util/elfparser.h	2011-07-16 20:28:54.733829895 -0700
> +@@ -17,6 +17,10 @@
> +  */
> + #include <glib.h>
> +
> ++#ifndef NT_GNU_BUILD_ID
> ++#define NT_GNU_BUILD_ID 3
> ++#endif
> ++
> + typedef struct ElfSym ElfSym;
> + typedef struct ElfParser ElfParser;
> +
> diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> new file mode 100644
> index 0000000000..b92933806c
> --- /dev/null
> +++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.32.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "System-wide Performance Profiler for Linux"
> +HOMEPAGE = "http://www.sysprof.com"
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://src/sp-application.c;endline=17;md5=40e55577ef122c88fe20052acda64875"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +inherit gnomebase gettext systemd upstream-version-is-even gsettings
> +
> +DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
> +
> +SRC_URI[archive.md5sum] = "d1fa9ad216419d722770ca36713ad3af"
> +SRC_URI[archive.sha256sum] = "fc22a69e468701c5ec9036e960c6273afa1ed6a89df1f889fed49417add5554d"
> +SRC_URI += " \
> +           file://define-NT_GNU_BUILD_ID.patch \
> +           file://0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch \
> +           "
> +
> +PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
> +PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3"
> +PACKAGECONFIG[sysprofd] = "-Dwith_sysprofd=bundled,-Dwith_sysprofd=none,polkit"
> +
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""
> +
> +SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'sysprofd', 'sysprof2.service', '', d)}"
> +
> +FILES_${PN} += " \
> +               ${datadir}/dbus-1/system-services \
> +               ${datadir}/dbus-1/system.d \
> +               ${datadir}/metainfo \
> +               "
> 


