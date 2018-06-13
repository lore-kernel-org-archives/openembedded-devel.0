Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 357FD78A64
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 13:42:55 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id 15-v6so1311447pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=80iWriDkvTFWRohHyTwmW9PtoR/0sQYS5SWbH5C904g=;
	b=FEzrdeo8eKezlhA2laB9888WNsNAPpSFyQCnVQxQJxS2Ca1arA+viJykKhpliVTsAh
	rC04LWr0JvmvFeXcplCjr1fpIISY2jkLSgsytail6rQZ4vqnRJXJMYalV++TrAxp4w0r
	R21JhBI6fgyIOSPNuCSjBeVItjCy/3U322c9V9v79QKcuxuwdg8H++2oBxxCeCczRnTB
	d1BEq7VAYtBqRJVTtNVuSMfz1L57qm+FMkfZgTM3cu6Gz5/5hioBw2SIH/++ZkWYbjWr
	cxMiiCb2/GKUED2n7mveSGPKpJZM81zSOdteOyqH+M5ZqFk1NWDeTf4om/4Pigih3cqK
	ZvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=80iWriDkvTFWRohHyTwmW9PtoR/0sQYS5SWbH5C904g=;
	b=iXKw7hk5MAvw6uiWjAsFOVnvAAjW1ropCWNYTs9/Cuo11ku72VbrrJLnn0d6u70TeE
	qPeV94UiC5QzJJ+hQwkCtsw9Oms2sbP13S36GQrCt0+aPBkRagigGLrt5yQgOL9Z3S28
	l2pX1t7zLXnyQMDbqjhUGAPT3NCtqOogzWeV4aAvbbu/QfItLxNBWPM0DBktokAsefXd
	UZDqJew2l0/4DeqaPC1sirLf4eAYgvoX3eIDuIGpcEg/CLYUD4riW/Ev3elK53vUpfyO
	Bgl5fUVa11EL9r/3iGVlS8//txOaxy85yyfeiOzZn3SaZ9xTRT1kig9IycqQ1gjMbnzo
	LtsA==
X-Gm-Message-State: APt69E3q5t/R3jaN6lex5/EMpdaQXf37V90uhtiDyXYXB7+eGGLzkIu9
	zRhvQElbWIemB7dD/A9O1iL2oqqy
X-Google-Smtp-Source: ADUXVKIidm4wTpvVoEX5k9o1JLah8SATWK4wKY9p3JysytDlLmwne6qcv3N0B0McZGomqcLqkfxc+g==
X-Received: by 2002:a62:211a:: with SMTP id
	h26-v6mr5027450pfh.133.1528897375617; 
	Wed, 13 Jun 2018 06:42:55 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:f1a2:dcff:aa40:34bf])
	by smtp.gmail.com with ESMTPSA id
	i88-v6sm8139993pfi.153.2018.06.13.06.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 06:42:55 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180320040000.29408-1-raj.khem@gmail.com>
	<20180320040000.29408-5-raj.khem@gmail.com>
	<CA+chaQfdwRNDF6PdY3wY7rk0+Es2g_9RxRi4+cS_wnzRAZdsZA@mail.gmail.com>
	<CA+chaQfTjcu1sS2U5hMA=2qOMzJfrevYxxVDSc8hP4yNj-5OEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4b16fe26-6987-3262-1851-c0185d9cf6a8@gmail.com>
Date: Wed, 13 Jun 2018 06:42:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfTjcu1sS2U5hMA=2qOMzJfrevYxxVDSc8hP4yNj-5OEw@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/6] libqb: Upgrade to 1.0.3
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
X-List-Received-Date: Wed, 13 Jun 2018 13:42:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/13/18 12:08 AM, Martin Jansa wrote:
> Am i the only one seeing this failure?
> 

probably due to gold linker. The failing test seems to indicate
that a link test failed.

> I've reverted this upgrade back then and forgot about it.
> 
> On Sat, Mar 31, 2018 at 8:04 AM Martin Jansa <martin.jansa@gmail.com 
> <mailto:martin.jansa@gmail.com>> wrote:
> 
>     This version fails for me in world builds:
> 
>     configure: Enabling inter-library dependencies:
>     checking whether GCC supports __attribute__((section()) + ld
>     supports orphan sections... yes
>     checking whether linker emits global boundary symbols for orphan
>     sections... no
>     checking whether linker workaround for orphan sections usable... no
>     configure: error: Would use section attribute, cannot; see
>     --enable-nosection-fallback
> 
>     On Tue, Mar 20, 2018 at 4:59 AM, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
> 
>         Drop upstreamed patch
>         Backport another patch to fix out of tree build regression
> 
>         Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         ---
>           ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43
>         -----------------
>           ...onfigure-script-neglecting-re-enable-out-.patch | 56
>         ++++++++++++++++++++++
>           .../libqb/{libqb_1.0.2.bb <http://libqb_1.0.2.bb> =>
>         libqb_1.0.3.bb <http://libqb_1.0.3.bb>}       |  6 ++-
>           3 files changed, 60 insertions(+), 45 deletions(-)
>           delete mode 100644
>         meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
>           create mode 100644
>         meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
>           rename meta-oe/recipes-extended/libqb/{libqb_1.0.2.bb
>         <http://libqb_1.0.2.bb> => libqb_1.0.3.bb
>         <http://libqb_1.0.3.bb>} (77%)
> 
>         diff --git
>         a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
>         b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
>         deleted file mode 100644
>         index 28bc5c07d..000000000
>         ---
>         a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
>         +++ /dev/null
>         @@ -1,43 +0,0 @@
>         -From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17
>         00:00:00 2001
>         -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>         -Date: Wed, 29 Mar 2017 16:31:38 -0700
>         -Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
>         -
>         -Does not work during cross compile
>         -
>         -use a compile-time check to detect whether the
>         -monotonic clock is available. This check can run just fine when
>         we are
>         -cross-compiling.
>         -
>         -Signed-off-by: Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>>
>         ----
>         - configure.ac <http://configure.ac> | 12 ++++++++++--
>         - 1 file changed, 10 insertions(+), 2 deletions(-)
>         -
>         -diff --git a/configure.ac <http://configure.ac> b/configure.ac
>         <http://configure.ac>
>         -index fa13ae6..f4f0f46 100644
>         ---- a/configure.ac <http://configure.ac>
>         -+++ b/configure.ac <http://configure.ac>
>         -@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>         -                  )
>         -
>         - AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
>         --AC_RUN_IFELSE([AC_LANG_PROGRAM(
>         -+AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>         - [[#include <time.h>]],
>         --[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts))
>         return -1;]])],
>         -+[[
>         -+#include <unistd.h>
>         -+int main() {
>         -+#if !(defined(_POSIX_MONOTONIC_CLOCK) &&
>         _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
>         -+        #error No monotonic clock
>         -+#endif
>         -+    return 0;
>         -+
>         -+]])],
>         -                     [
>         -                       AC_MSG_RESULT([yes])
>         -                     
>           AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC], 1, [Define
>         to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
>         ---
>         -2.12.1
>         -
>         diff --git
>         a/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
>         b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
>         new file mode 100644
>         index 000000000..c82f3bf01
>         --- /dev/null
>         +++
>         b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
>         @@ -0,0 +1,56 @@
>         +From 73d2aea33e32272bac693550e8a3b0e3ad89707f Mon Sep 17
>         00:00:00 2001
>         +From: =?UTF-8?q?Jan=20Pokorn=C3=BD?= <jpokorny@redhat.com
>         <mailto:jpokorny@redhat.com>>
>         +Date: Tue, 26 Dec 2017 00:02:26 +0100
>         +Subject: [PATCH] build: fix configure script neglecting,
>         re-enable out-of-tree
>         + builds
>         +MIME-Version: 1.0
>         +Content-Type: text/plain; charset=UTF-8
>         +Content-Transfer-Encoding: 8bit
>         +
>         +For the former, a prototype and the final code got (hm,
>         mysteriously)
>         +intertwisted.  For the latter, I am clearly guilty of (rare,
>         anyway)
>         +testing of the out-of-tree builds only with
>         libqb-already-system-wide
>         +scenario, which is rather shortsighted.
>         +
>         +Thanks Fabio and his ci.kronosnet.org <http://ci.kronosnet.org>
>         project for spotting that.
>         +
>         +X-mas-present-for: Fabio M. Di Nitto <fdinitto@redhat.com
>         <mailto:fdinitto@redhat.com>>
>         +Signed-off-by: Jan Pokorný <jpokorny@redhat.com
>         <mailto:jpokorny@redhat.com>>
>         +---
>         +Upstream-Status: Backport
>         +
>         + configure.ac <http://configure.ac>    | 2 +-
>         + lib/Makefile.am | 4 +++-
>         + 2 files changed, 4 insertions(+), 2 deletions(-)
>         +
>         +diff --git a/configure.ac <http://configure.ac> b/configure.ac
>         <http://configure.ac>
>         +index 9900310..f9761cc 100644
>         +--- a/configure.ac <http://configure.ac>
>         ++++ b/configure.ac <http://configure.ac>
>         +@@ -710,7 +710,7 @@ if test "x${GCC}" = xyes; then
>         +                                             | grep
>         __stop___verbose | cut -d" " -f 3)
>         +                        test "${verbose_start_addr}" =
>         "${verbose_stop_addr}" \
>         +                          && gcc_has_attribute_section_visible=no \
>         +-                         || { verbose_start_type=$(${READELF}
>         -s backup \
>         ++                         || { verbose_start_type=$(${READELF}
>         -s "conftest${shrext_cmds}" \
>         +                                                    | sed -n
>         '/__start___verbose/{s/^\s*//p;q}' \
>         +                                                    | tr -s ' ' \
>         +                                                    | cut -d" "
>         -f6)
>         +diff --git a/lib/Makefile.am b/lib/Makefile.am
>         +index 6ca6b15..b035f0b 100644
>         +--- a/lib/Makefile.am
>         ++++ b/lib/Makefile.am
>         +@@ -101,7 +101,9 @@ endif
>         + endif
>         +
>         + qblog_script.ld: %.ld: %.ld.in <http://ld.in>
>         +-      $(AM_V_GEN)$(CPP) -xc -I$(top_srcdir)/include
>         -D_GNU_SOURCE -C -P $< \
>         ++      $(AM_V_GEN)$(CPP) -C -D_GNU_SOURCE -P \
>         ++        -I$(top_srcdir)/include -I$(top_builddir)/include \
>         ++        -xc $< \
>         +         | sed -n "/$$(sed -n '/^[^#]/{s/[*\/]/\\&/g;p;q;}'
>         $<)/,$$ p" \
>         +         > $@
>         +
>         +--
>         +2.16.2
>         +
>         diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>         <http://libqb_1.0.2.bb>
>         b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>         <http://libqb_1.0.3.bb>
>         similarity index 77%
>         rename from meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>         <http://libqb_1.0.2.bb>
>         rename to meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>         <http://libqb_1.0.3.bb>
>         index 574f6601c..73cea5e39 100644
>         --- a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>         <http://libqb_1.0.2.bb>
>         +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>         <http://libqb_1.0.3.bb>
>         @@ -11,12 +11,14 @@ inherit autotools pkgconfig
> 
>           PV .= "+git${SRCPV}"
> 
>         -SRCREV = "608de6d59a3de0eef0fbcbd8f284acbc018daa9a"
>         +# v1.0.3
>         +SRCREV = "28dff090c74b6ba8609c4797294a5afe3fe73987"
>           SRC_URI = "git://github.com/ClusterLabs/${BPN}.git
>         <http://github.com/ClusterLabs/$%7BBPN%7D.git> \
>         -         
>           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
>         +         
>           file://0001-build-fix-configure-script-neglecting-re-enable-out-.patch \
>                     "
>           S = "${WORKDIR}/git"
> 
>         +CFLAGS += "-pthread -D_REENTRANT"
>           do_configure_prepend() {
>               ( cd ${S}
>               ${S}/autogen.sh )
>         --
>         2.16.2
> 
>         --
>         _______________________________________________
>         Openembedded-devel mailing list
>         Openembedded-devel@lists.openembedded.org
>         <mailto:Openembedded-devel@lists.openembedded.org>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

