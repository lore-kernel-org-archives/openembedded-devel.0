Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.2343.1620261610913749875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 17:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QiKHBMEw;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id a11so2379536plh.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 17:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yewpfnN/H7BLs/3q7VJnKDJOG9+VpVdwpdzmeS5eaQE=;
        b=QiKHBMEwThYeNfk504X4R9EgAh9cMJ3g+F4kNLQEtMzghEE8epBWABhmOC2i7e+Vjn
         m9UURd10kmVuu9gexd2yJNJlndwDN0+o43ILVS6NjDC9PbjCs1qgkgHyKvfRUvg+jq9H
         CEycNNH2T7ccbAzbgoECFqdl22N/Xanyz8bU7OdcQd3cxtEwQ8BRY2tWlHLv2zpHe25M
         0WSwWSt4YQjv2KDSGB9XBaXZtysLdjJojaB2iBv+LvsKLRasxMyWzMCPMO2rxzYabwUC
         Amy+BESziQzJBUE6IcyjeVk30M0oY9wSVgXYn5coP1fI4IAWRD3VyxO3vVIsO00hzhu6
         PoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yewpfnN/H7BLs/3q7VJnKDJOG9+VpVdwpdzmeS5eaQE=;
        b=LiLD59KYAo2na2Pvv6lSuQgfIErFtWPCSjzWCCD5aGJgslQEnTk3gDrv0qWh6gGc2z
         ieYLD+qqi0CcLJbqPdKP+2krhqZXijpumj0xvxRI6j0CaFyKpYKW1fnfFZvVHU6zouE5
         3kaiMCGvkwcdF8CwyZ5gWxTR+edJBCgsUQdWL98hpf8OoZoouLeEE3EvEBINn/WMNadL
         5ZwV3jrIMmfpggHPZojlaIRnNckPkmlHhVpnxMC2Uv6MHoEcD/PvmiOhmRNKA7eYisNa
         T4Pqr25Sh6QRWaaxIqXUpI9m2bdmwk1t+s8PemksRxboJxwYVd0/8+70SA4zAPlHpM+x
         Va6w==
X-Gm-Message-State: AOAM532x2J2/np8WI2LyTTfcy21uqHPUZduDnVIvHrHB7ynQlBWxAaBE
	14ky0ThUgk+UoRtg/Y/FjtMusNsnDJdSHw==
X-Google-Smtp-Source: ABdhPJz03Eoecg/dXhDGsaHXf+cy+UP7uXc6tbaZhOhtgee+NcPDBk2T+mMEWKiOoRX6xb4/MJeeYw==
X-Received: by 2002:a17:90a:73c4:: with SMTP id n4mr13869631pjk.201.1620261610025;
        Wed, 05 May 2021 17:40:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c0f3:6794:1988:a526? ([2601:646:9200:a0f0:c0f3:6794:1988:a526])
        by smtp.gmail.com with ESMTPSA id l10sm338782pfc.125.2021.05.05.17.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 17:40:09 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/2] poke: add recipe for version 1.2
To: Romain Naour <romain.naour@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210505230545.2574514-1-romain.naour@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cfd7b579-09cc-6d6d-4fa6-6f1f2a31bb5b@gmail.com>
Date: Wed, 5 May 2021 17:40:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210505230545.2574514-1-romain.naour@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Thanks for Patch Roman

Since its a new package can you also send a followup to add it to test 
packagegroup packagegroup-meta-oe-devtools in packagegroup-meta-oe.bb

On 5/5/21 4:05 PM, Romain Naour wrote:
> Backport a patch to disable tcl/tk dependencies when gui support
> is disabled.
> 
> Add a local patch to workaround a path poisoning issue. Issue
> reported upstream.
> 
> Add another local patch when HELP2MAN is missing.
> 
> See:
> http://www.jemarch.net/poke-1.0-relnotes.html
> http://www.jemarch.net/poke-1.1-relnotes.html
> http://www.jemarch.net/poke-1.2-relnotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>   ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 ++++++++++++++++++
>   ...nfig.in-avoit-host-poisoning-while-c.patch | 45 +++++++++++++++++++
>   ...P2MAN-replace-by-true-when-cross-com.patch | 34 ++++++++++++++
>   meta-oe/recipes-devtools/poke/poke_1.2.bb     | 31 +++++++++++++
>   4 files changed, 153 insertions(+)
>   create mode 100644 meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
>   create mode 100644 meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
>   create mode 100644 meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
>   create mode 100644 meta-oe/recipes-devtools/poke/poke_1.2.bb
> 
> diff --git a/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> new file mode 100644
> index 000000000..3bd041a0e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/poke/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> @@ -0,0 +1,43 @@
> +From cef3fc90f02ef4fc49515745194bac3d81a2265b Mon Sep 17 00:00:00 2001
> +From: "Jose E. Marchesi" <jose.marchesi@oracle.com>
> +Date: Fri, 30 Apr 2021 13:17:05 +0200
> +Subject: [PATCH] build: do not check for Tcl/Tk if --disable-gui is specified
> +
> +2021-04-30  Jose E. Marchesi  <jemarch@gnu.org>
> +
> +	* configure.ac: Do not check for tcl/tk if --disable-gui is
> +	specified at configure time.
> +
> +(cherry picked from commit 280a5e154287e43c0a40d9530a9cc658a7367a9c)
> +[Romain: remove Changelog entry]
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + configure.ac | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c7205513..c2f0760a 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -214,12 +214,15 @@ fi
> + dnl The GUI is optional, and depends on the availability of Tcl and
> + dnl Tk.
> +
> +-POKE_TCLTK
> +-
> + AC_ARG_ENABLE([gui],
> +               AS_HELP_STRING([--enable-gui],
> +                              [Enable the GUI (default is YES)]),
> +-              [gui_enabled=$enableval], [gui_enabled=$has_tcltk])
> ++              [gui_enabled=$enableval], [gui_enabled=yes])
> ++
> ++if test "x$gui_enabled" = "xyes"; then
> ++ POKE_TCLTK
> ++ gui_enabled=$has_tcltk
> ++fi
> +
> + AM_CONDITIONAL([GUI], [test "x$gui_enabled" = "xyes"])
> +
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
> new file mode 100644
> index 000000000..fa55f817f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/poke/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
> @@ -0,0 +1,45 @@
> +From c37419e459bd5863534719fa50755174d0912e6d Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 30 Apr 2021 14:32:21 +0200
> +Subject: [PATCH] jitter: jitter-config.in: avoit host poisoning while
> + cross-compiling
> +
> +When jitter is bundled into another project (poke), jitter-config --cppflags
> +return an unsafe path "-I /usr/include".
> +
> +In the context of Buildroot, such configuration script woulf be "fixed"
> +after installation. But jitter-config is not installed by poke since it's
> +build as static library and liked to poke.
> +
> +For now, patch jitter-config.in instead of jitter-config.in.m4sh since
> +there is an issue while converting the M4sh m4sh script ( .in.m4sh )
> +into a portable shell script ( .in ) ready to be processed by aclocal
> +for @-substitutions.
> +
> +[1] https://git.buildroot.net/buildroot/tree/package/pkg-generic.mk?h=2021.02.1#n291
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + jitter/bin/jitter-config.in | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/jitter/bin/jitter-config.in b/jitter/bin/jitter-config.in
> +index 5e124f0..af0ac9d 100644
> +--- a/jitter/bin/jitter-config.in
> ++++ b/jitter/bin/jitter-config.in
> +@@ -998,11 +998,7 @@ while test "$#" != "0"; do
> +             append_to_output cflags;;
> +         --cppflags)
> +             no_option_argument
> +-            append_to_output cppflags
> +-            # Append a -I argument.  This is defined separately from the rest,
> +-            # as the installation prefix can be decided very late, at Jitter
> +-            # installation time.
> +-            output="$output -I $includedir";;
> ++            append_to_output cppflags;;
> +         --ldadd)
> +             no_option_argument
> +             append_to_output ldadd;;
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> new file mode 100644
> index 000000000..f217c917f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/poke/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
> @@ -0,0 +1,34 @@
> +From 8ba76a5a7ce311f67890199c5595bc1f626495ad Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 30 Apr 2021 15:43:59 +0200
> +Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
> + cross-compiling
> +
> +Avoid:
> +/usr/bin/make  ./../poke/poke
> +../run \
> +  : -p poke --name="The GNU extensible binary editor" \
> +      ./../poke/poke -o ./poke.1
> +../run: line 51: exec: :: not found
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index c2f0760a..93769ef9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
> + if test $cross_compiling = no; then
> +   AM_MISSING_PROG(HELP2MAN, help2man)
> + else
> +-  HELP2MAN=:
> ++  HELP2MAN=true
> + fi
> +
> + dnl recfix is part of the GNU recutils suite, and is used in cfg.mk to
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/poke/poke_1.2.bb b/meta-oe/recipes-devtools/poke/poke_1.2.bb
> new file mode 100644
> index 000000000..dcb547ff8
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/poke/poke_1.2.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "GNU poke is an extensible editor for structured binary data"
> +HOMEPAGE = "https://pokology.org"
> +DESCRIPTION = "GNU poke is an interactive, extensible editor for binary data. Not limited to editing basic entities such as bits and bytes, it provides a full-fledged procedural, interactive programming language designed to describe data structures and to operate on them."
> +SECTION = "console/utils"
> +LICENSE = "GPL-3.0+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
> +          file://0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch \
> +          file://0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch \
> +          file://0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch \
> +          "
> +
> +DEPENDS = "flex-native bison-native bdwgc readline"
> +
> +SRC_URI[sha256sum] = "f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62"
> +
> +# poke does not support using out-of-tree builds
> +inherit autotools-brokensep gettext pkgconfig
> +
> +# The automatic m4 path detection gets confused, so force the right value from
> +# the poke bootstrap script.
> +acpaths = "-I ./m4"
> +
> +EXTRA_OECONF = "--disable-gui \
> +                --disable-libnbd \
> +                --disable-mi \
> +                --with-libreadline-prefix=${STAGING_INCDIR} \
> +                "
> +
> +FILES_${PN} += "${datadir}/emacs/site-lisp"
> 
> 
> 
> 
> 
