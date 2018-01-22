Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id F2AB07854B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:51:47 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id q67so7381257pga.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Jmtp7vr2IM8o3aggG3QNy2ua67/+LyyHp/qVJgOM/FU=;
	b=IlVwLfZGtuQYJAKsZAbM1cbilt8N9z4mFpF6oDxU9xZ76EfTQd5U8waEvFpLC11+T2
	Aqcuav17v+5HdFWHBB21oCoERQWAJKFh3FzoSbNz8moA0+YXwHEGmiGa+vE8Sq0roho/
	f9Uplard1OfgUZoKKdyAc7UUhZ38e+109g+eKqbTJqxrgBHUTohmrxHa6JYLlYQxAI3F
	wzVSTKjx7nbfwFsTVbV8/+459ftCPJP3l9zhbroOcGmfQ8bmqOJo9XqdslEoloyr7kNz
	035nPF441Bk62qtJTTeyZWeliZoI+V822sPwGJMSsZQ37NwUtd7qnQsk6cuI94hM/9lE
	xzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Jmtp7vr2IM8o3aggG3QNy2ua67/+LyyHp/qVJgOM/FU=;
	b=jezDHIC3FahY3lGL6ABZyVAB/mXP062g9yLHxEau1oVgg2CzwhAAG3uIFGlWOLDvsk
	J1Nq625EdHKPGqQi7FNONJ/qj9ZNA8Xlsndb35KqFKQqWBJ5OgiCHOHpKNZnVfiOb54W
	RvCdzXlsmN4T3XOFqV8p6XxIrBy80Z1EAOLG/griVPvnKR9+C/6N3oW7gWg/PJQKomfU
	c1hIabPGoYTc4eT5ofKsNlS9szhZKRgfpWV4yPcMEye9GsjJhupTwUMmW+fWU8ilJsgG
	KdYpHEdhCbT+5/G0rqYVNOdLRhjnTbfNjiZG+DYFmda1ZCpLu2cwMWkkeEhOs/R/QmzL
	Tg+g==
X-Gm-Message-State: AKwxyteJqH9GNxrsx9bl9st0eI2Yz2vdREY/NuE4pociG64w4M2Rybz0
	wVVBk/VkzavBXRt1xmF5nCZBJQ==
X-Google-Smtp-Source: AH8x225eHOt6oDVLqwl/2jTtx9WLdBKWfz7imOmbxn1HxkHygA/mOqE5u4WMHti33GfZQRGFQ6Gtsw==
X-Received: by 2002:a17:902:b2c6:: with SMTP id
	x6-v6mr3941195plw.340.1516636308505; 
	Mon, 22 Jan 2018 07:51:48 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:c85d:e2c0:793e:901c?
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	191sm1022513pfv.127.2018.01.22.07.51.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 07:51:47 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
	<20180117083421.30233-5-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <52158313-66f5-9934-d88f-7514193ba5b5@gmail.com>
Date: Mon, 22 Jan 2018 07:51:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180117083421.30233-5-schnitzeltony@gmail.com>
Subject: Re: [PATCH 04/14] evolution-data-server: update 3.2.3 -> 3.26.3
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
X-List-Received-Date: Mon, 22 Jan 2018 15:51:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/17/2018 12:34 AM, Andreas Müller wrote:
> In recent meta-universe 3.2.3 started to fail with:
>
> | camel-enumtypes.c:42:7: error: expected expression at end of input
> |        { 512, "CAMEL_FOLDER_SHARED_BY_ME", "shared-by-me" },

This is failing on x86-64.
please see http://errors.yoctoproject.org/Errors/Details/164257/

Also , the PV is still 3.2.3


- armin
> |        ^
>
> Instead of cleaning I decided to update. The following changed:
>
> * eds builds with cmake instead of autotools
> * musl: I checked src/time/strftime.c and it seems strftime does not support
>   '%l' / '%k'. musl-case was added to be a good boy but was not tested.
> * remove 0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch:
>   src/camel/providers/imapx/camel-imapx-tokens.txt has text-only format these days
> * remove 0002-Fix-for-automake-1.12.x.patch: autotools was replaced by cmake
> * remove 0003-Disable-Werror-for-automake.patch: autotools was replaced by cmake
> * remove 0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch: autotools was replaced by cmake
> * remove 0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch:
>   src/calendar/backends/caldav/e-cal-backend-caldav.c was reworked competely
> * remove 0006-configure.ac-do-not-overwrite-localedir.patch: autotools was replaced by cmake
>
> Tested: abiword build and run
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...1-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch | 39 +++++++++
>  ...x-Fix-signature-for-imapx_tokenise_struct.patch | 33 --------
>  ...ists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch | 53 ++++++++++++
>  .../0002-Fix-for-automake-1.12.x.patch             | 32 -------
>  .../0003-Disable-Werror-for-automake.patch         | 97 ----------------------
>  ...ace-the-Novell-sample-contact-with-somet.patch} | 21 +----
>  ...ix-libical-pkg-config-trying-to-use-host-.patch | 39 ---------
>  ...-soup-adapt-to-new-libxml2-API-from-2.9.0.patch | 77 -----------------
>  ...6-configure.ac-do-not-overwrite-localedir.patch | 34 --------
>  ...rver_git.bb => evolution-data-server_3.26.3.bb} | 84 +++++++++++--------
>  10 files changed, 144 insertions(+), 365 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
>  create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
>  rename meta-gnome/recipes-gnome/eds/evolution-data-server/{0001-contact-Replace-the-Novell-sample-contact-with-somet.patch => 0003-contact-Replace-the-Novell-sample-contact-with-somet.patch} (95%)
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
>  delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
>  rename meta-gnome/recipes-gnome/eds/{evolution-data-server_git.bb => evolution-data-server_3.26.3.bb} (68%)
>
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> new file mode 100644
> index 000000000..a821a14ab
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
> @@ -0,0 +1,39 @@
> +From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Tue, 19 Dec 2017 16:37:20 +0100
> +Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
> +|    _correct_iconv_EXITCODE (advanced)
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + CMakeLists.txt | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 8d07772..a2396f2 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -521,13 +521,8 @@ if(NOT HAVE_ICONV)
> + endif(NOT HAVE_ICONV)
> + 
> + set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBS})
> +-CHECK_C_SOURCE_RUNS("#include \"${CMAKE_SOURCE_DIR}/iconv-detect.c\"" _correct_iconv)
> + unset(CMAKE_REQUIRED_LIBRARIES)
> + 
> +-if(NOT _correct_iconv)
> +-	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
> +-endif(NOT _correct_iconv)
> +-
> + # ******************************
> + # Backtraces for debugging
> + # ******************************
> +-- 
> +2.14.3
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
> deleted file mode 100644
> index f82a76df3..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 0e10e976025b21d12df099e82951f759024ad649 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 24 Aug 2017 22:04:56 -0700
> -Subject: [PATCH] imapx: Fix signature for imapx_tokenise_struct()
> -
> -clang complains about different signature for this patch
> -
> -Fixes
> -camel/providers/imapx/camel-imapx-tokens.txt:56:1: error: conflicting types for 'imapx_tokenise_struct'
> -| imapx_tokenise_struct (register const char *str, register size_t len)
> -| ^
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - camel/providers/imapx/camel-imapx-tokens.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/camel/providers/imapx/camel-imapx-tokens.txt b/camel/providers/imapx/camel-imapx-tokens.txt
> -index d48501865..994c368c0 100644
> ---- a/camel/providers/imapx/camel-imapx-tokens.txt
> -+++ b/camel/providers/imapx/camel-imapx-tokens.txt
> -@@ -1,7 +1,7 @@
> - /* This contains all of the keywords we care about.  These
> -    can be converted to an id very efficiently */
> - struct _imapx_keyword {const gchar *name; camel_imapx_id_t id; };
> --struct _imapx_keyword *imapx_tokenise_struct (register const char *str, register unsigned int len);
> -+struct _imapx_keyword *imapx_tokenise_struct (register const char *str, register size_t len);
> - %%
> - ALERT,          IMAPX_ALERT
> - APPENDUID,	IMAPX_APPENDUID
> --- 
> -2.14.1
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> new file mode 100644
> index 000000000..c8dc7e12c
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
> @@ -0,0 +1,53 @@
> +From 210b204d9edd71202454ff04013cc52b23c598e4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Tue, 19 Dec 2017 16:55:13 +0100
> +Subject: [PATCH] CMakeLists.txt: remove CHECK_C_SOURCE_RUNS check
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +* TRY_RUN: does not work for OE
> +* HAVE_LKSTRFTIME is set by recipe as configure option
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + CMakeLists.txt | 23 -----------------------
> + 1 file changed, 23 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index a2396f2..f3b271b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -573,29 +573,6 @@ CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
> + CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
> + 			int main(void) { char *detail = nl_langinfo (_NL_ADDRESS_COUNTRY_AB2); return 0; }" HAVE__NL_ADDRESS_COUNTRY_AB2)
> + 
> +-# *******************************************************
> +-# Check to see if strftime supports the use of %l and %k
> +-# *******************************************************
> +-
> +-CHECK_C_SOURCE_RUNS("
> +-	#include <stdlib.h>
> +-	#include <string.h>
> +-	#include <time.h>
> +-	int main(int argc, char **argv)	{
> +-	char buf[10];
> +-	time_t rawtime;
> +-	struct tm *timeinfo;
> +-
> +-	time(&rawtime);
> +-	timeinfo=localtime(&rawtime);
> +-	buf[0] = 0;
> +-	strftime(buf, 10, \"%lx%k\", timeinfo);
> +-
> +-	if (!buf[0] || buf[0] == 'x' || strstr(buf, \"l\") || strstr(buf, \"k\"))
> +-		return 1;
> +-	return 0;
> +-	}" HAVE_LKSTRFTIME)
> +-
> + # ******************************
> + # system mail stuff
> + # ******************************
> +-- 
> +2.14.3
> +
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
> deleted file mode 100644
> index 5f222aeaa..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From f46423c9e4b8b19eda27b307456a717de79b75f3 Mon Sep 17 00:00:00 2001
> -From: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: Sun, 4 Aug 2013 09:15:43 +0200
> -Subject: [PATCH 2/5] Fix for automake-1.12.x
> -
> -Fixed these kinds if warning-errors
> -
> -warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
> -
> -Upstream-Status: Pending
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - configure.ac | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 9bd97db..49d7506 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -31,6 +31,7 @@ AC_LANG(C)
> - 
> - dnl Automake 1.11 - Silent Build Rules
> - m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> -+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
> - 
> - dnl Required Package Versions
> - m4_define([glib_minimum_version], [2.28])
> --- 
> -1.8.3.2
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
> deleted file mode 100644
> index a182d4d5e..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -From 37b227cff78fd4c652651662dafd71537280824e Mon Sep 17 00:00:00 2001
> -From: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Date: Sun, 4 Aug 2013 09:16:59 +0200
> -Subject: [PATCH 3/5] Disable Werror for automake
> -
> -Avoid these warning-errors
> -
> -automake: warnings are treated as errors
> -Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
> -Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -addressbook/backends/file/Makefile.am: installing './depcomp'
> -addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX variable name
> -addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
> -addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -addressbook/libedata-book/Makefile.am:2: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:3: warning: subst -,_,$*: non-POSIX variable name
> -addressbook/libedata-book/Makefile.am:3: (probably a GNU make extension)
> -glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
> -addressbook/libedata-book/Makefile.am:86: warning: '%'-style pattern rules are a GNU make extension
> -addressbook/libedata-book/Makefile.am:101: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -calendar/backends/weather/Makefile.am:44: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:53: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:61: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libecal/Makefile.am:62: warning: subst -,_,$*: non-POSIX variable name
> -calendar/libecal/Makefile.am:62: (probably a GNU make extension) calendar/libecal/Makefile.am:68: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -calendar/libedata-cal/Makefile.am:5: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:6: warning: subst -,_,$*: non-POSIX variable name
> -calendar/libedata-cal/Makefile.am:6: (probably a GNU make extension)
> -glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
> -calendar/libedata-cal/Makefile.am:71: warning: '%'-style pattern rules are a GNU make extension
> -calendar/libedata-cal/Makefile.am:86: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -camel/Makefile.am:17: warning: '%'-style pattern rules are a GNU make extension
> -libebackend/Makefile.am:35: warning: '%'-style pattern rules are a GNU make extension
> -libebackend/Makefile.am:41: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -libedataserver/Makefile.am:91: warning: '%'-style pattern rules are a GNU make extension
> -libedataserver/Makefile.am:97: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -libedataserverui/Makefile.am:108: warning: '%'-style pattern rules are a GNU make extension
> -libedataserverui/Makefile.am:118: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/google/libgdata-google/Makefile.am:27: warning: '%'-style pattern rules are a GNU make extension
> -servers/google/libgdata-google/Makefile.am:33: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/google/libgdata/Makefile.am:31: warning: '%'-style pattern rules are a GNU make extension
> -servers/google/libgdata/Makefile.am:37: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a GNU make extension
> -servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
> -autoreconf: automake failed with exit status: 1
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -
> -Conflicts:
> -	configure.ac
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 49d7506..1c802ff 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
> - dnl Autoconf / Automake Initialization
> - AC_PREREQ(2.62)
> - AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
> --AM_INIT_AUTOMAKE([gnu 1.10 tar-ustar dist-xz no-dist-gzip -Wall -Wno-portability -Werror foreign])
> -+AM_INIT_AUTOMAKE([gnu 1.10 tar-ustar dist-xz no-dist-gzip -Wall -Wno-portability foreign])
> - AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_SRCDIR(README)
> - AC_CONFIG_HEADERS(config.h)
> --- 
> -1.8.3.2
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> similarity index 95%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch
> rename to meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> index b77e7b9bd..3cdfa8b6f 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-contact-Replace-the-Novell-sample-contact-with-somet.patch
> @@ -7,26 +7,13 @@ Subject: [PATCH 1/5] contact: Replace the Novell sample contact with something
>  Upstream-Status: Inappropriate [configuration]
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>  ---
> - addressbook/backends/file/Makefile.am    |   1 +
> - addressbook/libedata-book/ximian-vcard.h | 179 ++++++++++++++++++-------------
> + src/addressbook/libedata-book/ximian-vcard.h | 179 ++++++++++++++++++-------------
>   2 files changed, 103 insertions(+), 77 deletions(-)
>  
> -diff --git a/addressbook/backends/file/Makefile.am b/addressbook/backends/file/Makefile.am
> -index 08cf58f..17e7149 100644
> ---- a/addressbook/backends/file/Makefile.am
> -+++ b/addressbook/backends/file/Makefile.am
> -@@ -2,6 +2,7 @@ ebook_backend_LTLIBRARIES = libebookbackendfile.la
> - 
> - libebookbackendfile_la_CPPFLAGS = \
> - 	$(AM_CPPFLAGS)					\
> -+	-DCREATE_DEFAULT_VCARD \
> - 	-DG_LOG_DOMAIN=\"libebookbackend\"		\
> - 	-I$(top_srcdir)					\
> - 	-I$(top_builddir)				\
> -diff --git a/addressbook/libedata-book/ximian-vcard.h b/addressbook/libedata-book/ximian-vcard.h
> +diff --git a/src/addressbook/libedata-book/ximian-vcard.h b/src/addressbook/libedata-book/ximian-vcard.h
>  index 782d37b..5b0b250 100644
> ---- a/addressbook/libedata-book/ximian-vcard.h
> -+++ b/addressbook/libedata-book/ximian-vcard.h
> +--- a/src/addressbook/libedata-book/ximian-vcard.h
> ++++ b/src/addressbook/libedata-book/ximian-vcard.h
>  @@ -1,80 +1,105 @@
>   #define XIMIAN_VCARD \
>   "BEGIN:VCARD\n" \
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
> deleted file mode 100644
> index 138334798..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 2c73b588b9018cb59c666eae3a15fa1af42c56be Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 4 Aug 2013 10:57:08 +0200
> -Subject: [PATCH 4/5] configure: Fix libical pkg-config trying to use host
> - paths
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - calendar/libecal/libecal.pc.in | 2 +-
> - configure.ac                   | 3 ++-
> - 2 files changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/calendar/libecal/libecal.pc.in b/calendar/libecal/libecal.pc.in
> -index fc6b359..d3435bb 100644
> ---- a/calendar/libecal/libecal.pc.in
> -+++ b/calendar/libecal/libecal.pc.in
> -@@ -12,4 +12,4 @@ Description: Client library for evolution calendars
> - Version: @VERSION@
> - Requires: libical >= @LIBICAL_REQUIRED@ libedataserver-1.2 gio-2.0
> - Libs: -L${libdir} -lecal-1.2
> --Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
> -+Cflags: -I${privincludedir}
> -diff --git a/configure.ac b/configure.ac
> -index 1c802ff..f1d4ce8 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1351,7 +1351,8 @@ dnl to differentiate between <libical/ical.h> and <ical.h>
> - dnl We have fixed all our instances to use <libical/ical.h>. Until the .pc from
> - dnl libical is fixed, we have to work-around the buggy CFlags.
> - dnl *****
> --	LIBICAL_EXTRA_CFLAGS=" -I`$PKG_CONFIG --variable=includedir libical` "
> -+	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
> -+	LIBICAL_EXTRA_CFLAGS=" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includedir libical` "
> - 	LIBICAL_EXTRA_LIBS=""
> - 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
> - 	AC_SUBST(LIBICAL_EXTRA_LIBS)
> --- 
> -1.8.3.2
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
> deleted file mode 100644
> index addf2ee8d..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From ac95e89749a01618f98b554a98e78d7c988bfc10 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 27 Nov 2012 08:46:51 +0100
> -Subject: [PATCH 5/5] soup: adapt to new libxml2 API from 2.9.0
> -
> -* for more info see
> -  https://mail.gnome.org/archives/xml/2012-August/msg00005.html
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - calendar/backends/caldav/e-cal-backend-caldav.c | 21 +++++++++++++++++++++
> - 1 file changed, 21 insertions(+)
> -
> -diff --git a/calendar/backends/caldav/e-cal-backend-caldav.c b/calendar/backends/caldav/e-cal-backend-caldav.c
> -index 12f8f22..5555a3e 100644
> ---- a/calendar/backends/caldav/e-cal-backend-caldav.c
> -+++ b/calendar/backends/caldav/e-cal-backend-caldav.c
> -@@ -1172,8 +1172,13 @@ check_calendar_changed_on_server (ECalBackendCalDAV *cbdav)
> - 	soup_message_set_request (message,
> - 				  "application/xml",
> - 				  SOUP_MEMORY_COPY,
> -+#ifdef LIBXML2_NEW_BUFFER
> -+				  (gchar *) xmlOutputBufferGetContent(buf),
> -+				  xmlOutputBufferGetSize(buf));
> -+#else
> - 				  (gchar *) buf->buffer->content,
> - 				  buf->buffer->use);
> -+#endif
> - 
> - 	/* Send the request now */
> - 	send_and_handle_redirection (priv->session, message, NULL);
> -@@ -1321,8 +1326,13 @@ caldav_server_list_objects (ECalBackendCalDAV *cbdav,
> - 	soup_message_set_request (message,
> - 				  "application/xml",
> - 				  SOUP_MEMORY_COPY,
> -+#ifdef LIBXML2_NEW_BUFFER
> -+				  (gchar *) xmlOutputBufferGetContent(buf),
> -+				  xmlOutputBufferGetSize(buf));
> -+#else
> - 				  (gchar *) buf->buffer->content,
> - 				  buf->buffer->use);
> -+#endif
> - 
> - 	/* Send the request now */
> - 	send_and_handle_redirection (priv->session, message, NULL);
> -@@ -1715,8 +1725,14 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
> - 	soup_message_set_request (message,
> - 				  "application/xml",
> - 				  SOUP_MEMORY_COPY,
> -+#ifdef LIBXML2_NEW_BUFFER
> -+				  (gchar *) xmlOutputBufferGetContent(buf),
> -+				  xmlOutputBufferGetSize(buf));
> -+#else
> - 				  (gchar *) buf->buffer->content,
> - 				  buf->buffer->use);
> -+#endif
> -+
> - 
> - 	/* Send the request now */
> - 	send_and_handle_redirection (priv->session, message, NULL);
> -@@ -1765,8 +1781,13 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
> - 		soup_message_set_request (message,
> - 				  "application/xml",
> - 				  SOUP_MEMORY_COPY,
> -+#ifdef LIBXML2_NEW_BUFFER
> -+				  (gchar *) xmlOutputBufferGetContent(buf),
> -+				  xmlOutputBufferGetSize(buf));
> -+#else
> - 				  (gchar *) buf->buffer->content,
> - 				  buf->buffer->use);
> -+#endif
> - 
> - 		/* Send the request now */
> - 		send_and_handle_redirection (priv->session, message, NULL);
> --- 
> -1.8.3.2
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
> deleted file mode 100644
> index 741e5e97d..000000000
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 3feaea8e84b3ad8dc2d551e42224f3b4a9413e7d Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> -Date: Thu, 3 Sep 2015 11:14:24 +0200
> -Subject: [PATCH] configure.ac: do not overwrite localedir
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Backport [1]
> -
> -[1] https://git.gnome.org/browse/evolution-data-server/tree/configure.ac#n298
> -
> -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ----
> - configure.ac | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index f1d4ce8..cee847f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -257,9 +257,6 @@ GETTEXT_PACKAGE=evolution-data-server-$BASE_VERSION
> - AC_SUBST(GETTEXT_PACKAGE)
> - AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [Package name for gettext])
> - 
> --localedir='$(prefix)/$(DATADIRNAME)/locale'
> --AC_SUBST(localedir)
> --
> - dnl ******************************
> - dnl Initialize libtool
> - dnl ******************************
> --- 
> -2.1.0
> -
> diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
> similarity index 68%
> rename from meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> rename to meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
> index aadc4b5e3..2d410e246 100644
> --- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
> +++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
> @@ -4,58 +4,70 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>  
>  LICENSE = "LGPLv2 & LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
> -                    file://camel/camel.h;endline=24;md5=b02175c88f821224746b347a89731a2b \
> -                    file://libedataserver/e-data-server-util.h;endline=20;md5=934502f03c84523aa059d4825887b380 \
> -                    file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"
> -
> -DEPENDS = "intltool-native glib-2.0 gtk+3 gconf dbus db virtual/libiconv zlib libsoup-2.4 libglade libical libgnome-keyring gperf-native libgdata nss"
> -
> -SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
> -
> -# 3.4 series needs libgdata-0.10*, 3.8 series needs also libsecret instead of gnome-keyring
> -PV = "3.2.3+git${SRCPV}"
> -
> -SRC_URI = "git://git.gnome.org/evolution-data-server;branch=gnome-3-2 \
> -           file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
> -           file://0002-Fix-for-automake-1.12.x.patch \
> -           file://0003-Disable-Werror-for-automake.patch \
> -           file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch \
> -           file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
> -           file://0006-configure.ac-do-not-overwrite-localedir.patch \
> -           file://iconv-detect.h \
> -           file://0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools gtk-doc pkgconfig gettext gobject-introspection
> +                    file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1 \
> +                    file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543 \
> +                    file://src/calendar/libecal/e-cal.h;endline=24;md5=e699ec3866f73f129f7a4ffffdcfc196"
> +
> +DEPENDS = " \
> +    intltool-native gperf-native \
> +    glib-2.0 gtk+3 gconf libgnome-keyring libgdata \
> +    dbus db virtual/libiconv zlib libsoup-2.4 libglade libical nss libsecret \
> +"
> +
> +inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative
> +
> +SRC_URI += " \
> +    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
> +    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
> +    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
> +    file://iconv-detect.h \
> +"
> +SRC_URI[archive.md5sum] = "568a21a4df4e0ec985c849b38fc66908"
> +SRC_URI[archive.sha256sum] = "63b1ae5f76be818862f455bf841b5ebb1ec3e1f4df6d3a16dc2be348b7e0a1c5"
> +
> +LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
> +LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
> +
> +EXTRA_OECMAKE = " \
> +    -DWITH_KRB5=OFF \
> +    -DENABLE_GOA=OFF \
> +    -DENABLE_UOA=OFF \
> +    -DENABLE_GOOGLE_AUTH=OFF \
> +    -DENABLE_WEATHER=OFF \
> +    -D${LKSTRFTIME} \
> +"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[openldap] = "-DWITH_OPENLDAP=ON,-DWITH_OPENLDAP=OFF,openldap"
> +
> +EXTRA_OECONF = "--with-libdb=${STAGING_DIR_HOST}${prefix} \
> +                --disable-nntp --disable-gtk-doc"
>  
>  # -ldb needs this on some platforms
>  LDFLAGS += "-lpthread -lgmodule-2.0 -lgthread-2.0"
>  
> -# Parallel make shows many issues with this source code.
> -# Current problems seem to be duplicate execution of the calander/backends
> -# directories by make resulting in truncated/corrupt .la files
> -#PARALLEL_MAKE = ""
> -
>  do_configure_append () {
> -    cp ${WORKDIR}/iconv-detect.h ${S}
> +    cp ${WORKDIR}/iconv-detect.h ${S}/src
> +
> +    # fix native perl shebang
> +    sed -i 's:${STAGING_BINDIR_NATIVE}/perl-native:${bindir}:' ${B}/src/tools/addressbook-export/csv2vcard
>  }
>  
>  do_compile_prepend() {
> -        export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
> +    export GIR_EXTRA_LIBS_PATH="${B}/camel/.libs:${B}/libedataserver/.libs"
>  }
>  
> -EXTRA_OECONF = "--without-openldap \
> -                --with-libdb=${STAGING_DIR_HOST}${prefix} \
> -                --disable-nntp --disable-goa --disable-weather --disable-gtk-doc"
>  
>  PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
>               libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
>               libedataserver libedataserver-dev \
>               libedataserverui libedataserverui-dev"
>  
> -FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
> +FILES_${PN} =+ "${systemd_user_unitdir} \
> +                ${datadir}/dbus-1 \
> +                ${datadir}/evolution-data-server-*/ui/"
> +RDEPENDS_${PN} += "perl"
> +
>  FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
>  FILES_${PN}-dbg =+ "${libdir}/evolution-data-server*/camel-providers/.debug \
>                      ${libdir}/evolution-data-server*/calendar-backends/.debug \


