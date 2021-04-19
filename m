Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.1232.1618867033945933195
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 14:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dt2F98XF;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w10so25162763pgh.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 14:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qa4majigWunTfn8E8sRmNc3nNe3S9Jt6AYd+fBqJ1hY=;
        b=dt2F98XF1GvPAjUvdRVMaFtJcWiiqjLgF5nUfUv71im8+nL50LF3IkEg9EImeTYXAQ
         2doR44p30+c4a9Brp33NcMzyHor0QPi2lPe4/JETnUEN4H8CchNx2Cr7nhGeJXgfq0Fk
         Q0f7I6zZZ3XpRdTcbaF7J08c1qyX3HGrVOiec9WZjWOyBAwTlUxu3DbqLXQKfIGyWWvW
         I/dWH46JsB8b717PJI0C9ZtSwTgSu2b2QbsLh17irdosjFRBZcSRhmOpLe2j2nT5c3JV
         EA0qVe6A1cBT4mQuBdC9a9i8sHqiazKfY5X9eQHi6LK630/WvznhtA5Ebuwn3oQJQNOw
         XSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Qa4majigWunTfn8E8sRmNc3nNe3S9Jt6AYd+fBqJ1hY=;
        b=GQlpO5OlPJsxn0lHtJSC2adi51q2ts6y+nUHqpecYeHqsQJZ/zIWrIQ6SKfyEXwHXq
         L1PFEe9XHi4MUVMIFI3E+3QT/FpbzWv5j66ArENIJ/XUiRkrqjyvG/DY/x+gL6KdLE54
         d4iJpEu2z971oJ+7XWbIKtPeFbo34o8NfJDOnAor1ZRoVSwctez5ldw3dyx3rMYEaHmj
         P9oULmUH09WW4m7iwLI5ocQvezWkbwWWzhf3MpeKUfZ4NVboVRueQjfrd3/0rwnXa6iw
         mexzn0gNyGmVkCiCVSFbFc1ivvlpc+p1VGxNp086YQl2HQvsX/X3xqpIiUPVLfeEPlwS
         MNLQ==
X-Gm-Message-State: AOAM533tst29K1MnM8/DI2SFQt65RP/WeAnBVcWSjgoxmD1EZlmY5mfU
	XyY6Od+phg7tZcqcAvXJ0e/+hau4LZz2gA==
X-Google-Smtp-Source: ABdhPJw6+xw8kjKsqwb6zOZD/r9GNNZhuC4LaOsNDjB/S1C3pogMyJ1FGSv4euEumhzEzEyM8im6UA==
X-Received: by 2002:a63:e114:: with SMTP id z20mr7038067pgh.388.1618866972921;
        Mon, 19 Apr 2021 14:16:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id u24sm13603608pga.78.2021.04.19.14.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:16:12 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/1] proftpd: Update to 1.3.7a release
To: Andrej Kozemcak <andrej.kozemcak@siemens.com>,
 openembedded-devel@lists.openembedded.org
References: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
 <20210419075251.21268-2-andrej.kozemcak@siemens.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <98ee4faf-76a7-7417-dccc-e27805a176e6@gmail.com>
Date: Mon, 19 Apr 2021 14:16:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419075251.21268-2-andrej.kozemcak@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello Andrej

Thanks for your contribution, there are few comments I have

On 4/19/21 12:52 AM, Andrej Kozemcak wrote:
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>   .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
>   .../proftpd/files/contrib.patch               | 29 ++++----
>   .../{proftpd_1.3.6.bb => proftpd_1.3.7a.bb}   | 12 ++--
>   3 files changed, 47 insertions(+), 63 deletions(-)
>   rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb => proftpd_1.3.7a.bb} (93%)
> 
> diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> index 9816d4d22..d888dd826 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
> @@ -9,10 +9,10 @@ redefine PR_RUN_DIR as ${localstatedir}/run
>   Signed-off-By: Armin Kuster <akuster808@gmail.com>
>   
>   
> -Index: proftpd-1.3.6/Make.rules.in
> -===================================================================
> ---- proftpd-1.3.6.orig/Make.rules.in
> -+++ proftpd-1.3.6/Make.rules.in
> +diff --git a/Make.rules.in b/Make.rules.in
> +index a5028ac..ccd7807 100644
> +--- a/Make.rules.in
> ++++ b/Make.rules.in
>   @@ -30,9 +30,9 @@ INSTALL=@INSTALL@
>    INSTALL_STRIP=@INSTALL_STRIP@
>    INSTALL_USER=@install_user@
> @@ -26,11 +26,11 @@ Index: proftpd-1.3.6/Make.rules.in
>    
>    RM=rm -f
>    SHELL=@CONFIG_SHELL@
> -Index: proftpd-1.3.6/Makefile.in
> -===================================================================
> ---- proftpd-1.3.6.orig/Makefile.in
> -+++ proftpd-1.3.6/Makefile.in
> -@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
> +diff --git a/Makefile.in b/Makefile.in
> +index 9434cbd..13f2e16 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -123,7 +123,6 @@ check: proftpd$(EXEEXT)
>    $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
>    	@if [ ! -d $@ ]; then \
>    		mkdir -p $@; \
> @@ -38,20 +38,20 @@ Index: proftpd-1.3.6/Makefile.in
>    		chmod 0755 $@; \
>    	fi
>    
> -@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
> +@@ -133,7 +132,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(includedir) $(DESTDIR)$(localstate
>    		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
>    	fi
> - 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
> +	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
>   -	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
>    
>    install-libs: $(DESTDIR)$(libdir)/proftpd
>    	cd lib/ && $(MAKE) install
> -@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
> - 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> - 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
> - 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> -+	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
> +@@ -170,11 +168,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
> +	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
> +	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
> +	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
> ++	$(INSTALL) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
>    
>    install-conf: $(DESTDIR)$(sysconfdir)
>    	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
> @@ -60,11 +60,11 @@ Index: proftpd-1.3.6/Makefile.in
>    		           $(top_srcdir)/sample-configurations/basic.conf \
>    	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
>    	fi
> -Index: proftpd-1.3.6/configure
> -===================================================================
> ---- proftpd-1.3.6.orig/configure
> -+++ proftpd-1.3.6/configure
> -@@ -41777,7 +41777,7 @@ _ACEOF
> +diff --git a/configure b/configure
> +index 0a51670..69fa130 100755
> +--- a/configure
> ++++ b/configure
> +@@ -25116,7 +25116,7 @@ _ACEOF
>    
>    
>    cat >>confdefs.h <<_ACEOF
> @@ -73,7 +73,7 @@ Index: proftpd-1.3.6/configure
>    _ACEOF
>    
>    
> -@@ -41787,7 +41787,7 @@ _ACEOF
> +@@ -25126,7 +25126,7 @@ _ACEOF
>    
>    
>    cat >>confdefs.h <<_ACEOF
> @@ -82,11 +82,11 @@ Index: proftpd-1.3.6/configure
>    _ACEOF
>    
>    
> -Index: proftpd-1.3.6/configure.in
> -===================================================================
> ---- proftpd-1.3.6.orig/configure.in
> -+++ proftpd-1.3.6/configure.in
> -@@ -3833,8 +3833,8 @@ locale_dir="`eval echo ${locale_dir}`"
> +diff --git a/configure.in b/configure.in
> +index 50561de..93cad3f 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -4059,8 +4059,8 @@ locale_dir="`eval echo ${locale_dir}`"
>    AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Define the locale directory])
>    
>    AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Define the run directory])
> @@ -97,16 +97,3 @@ Index: proftpd-1.3.6/configure.in
>    
>    prefix="$pr_saved_prefix"
>    exec_prefix="$pr_saved_exec_prefix"
> -Index: proftpd-1.3.6/lib/libcap/Makefile
> -===================================================================
> ---- proftpd-1.3.6.orig/lib/libcap/Makefile
> -+++ proftpd-1.3.6/lib/libcap/Makefile
> -@@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
> - all: $(LIBNAME)
> -
> - _makenames: _makenames.c cap_names.sed
> --	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -+	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> -
> - cap_names.h: _makenames
> - 	./_makenames > cap_names.h
> diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> index 7e2a8e3ce..96c237d38 100644
> --- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> +++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
> @@ -11,32 +11,29 @@ Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
>    2 files changed, 4 insertions(+), 4 deletions(-)
>   
>   diff --git a/Makefile.in b/Makefile.in
> -index 5b2e683..ee72fe1 100644
> +index 9434cbd..8da7d1f 100644
>   --- a/Makefile.in
>   +++ b/Makefile.in
> -@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
> +@@ -163,7 +163,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
>    	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
>    
>    install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
>   -	cd contrib/ && $(MAKE) install-utils
>   +	cd contrib/ && $(MAKE) DESTDIR=${DESTDIR} install-utils
> - 	$(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
> - 	$(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
> - 	$(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
> +	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
> +	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
> +	$(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
>   diff --git a/contrib/Makefile.in b/contrib/Makefile.in
> -index 5bcc038..51d248c 100644
> +index d1a31af..65d2abc 100644
>   --- a/contrib/Makefile.in
>   +++ b/contrib/Makefile.in
> -@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
> +@@ -17,6 +17,6 @@ Makefile: Makefile.in ../config.status
>    	cd ../ && ./config.status
>    
>    install-utils:
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
> --	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
> -+	$(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> -+	$(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
> -+	$(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
> ---
> -1.7.9.5
> -
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> +-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
> ++	$(INSTALL) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> similarity index 93%
> rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> index 1e4697a63..7bd41546e 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
> @@ -4,17 +4,17 @@ HOMEPAGE = "http://www.proftpd.org"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
>   
> -SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
> +SRC_URI = "https://github.com/proftpd/proftpd/archive/refs/tags/v${PV}.tar.gz \

usually we do not use github archive provided tarballs as they are known 
to mutate and checksums change. Perhaps better to use github fetcher if 
there is no other place where release tarballs are available.

>              file://basic.conf.patch \
>              file://proftpd-basic.init \
>              file://default \
> -           file://close-RequireValidShell-check.patch \
> -           file://contrib.patch  \
> +           file://contrib.patch \
>              file://build_fixup.patch \
> +           file://close-RequireValidShell-check.patch \
>              file://proftpd.service \

There seems to mix of spaces and tabs, so perhaps make them uniform as 
well while here, perhaps in a separate patch though.

>              "
> -SRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
> -SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
> +SRC_URI[md5sum] = "4a9b8877b2e9b08d70e71ad56c19e2c9"
> +SRC_URI[sha256sum] = "8b7bbf9757988935352d9dec5ebf96b6a1e6b63a6cdac2e93202ac6c42c4cd96"
>   
>   inherit autotools-brokensep useradd update-rc.d systemd multilib_script
>   
> @@ -24,7 +24,7 @@ PACKAGECONFIG ??= "shadow \
>   
>   PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
>   PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl, openssl"
> -PACKAGECONFIG[pam] = "--enable-auth-pam, --disable-auth-pam, libpam, libpam"
> +PACKAGECONFIG[pam] = "--enable-tests, --enable-auth-pam, --disable-auth-pam, libpam, libpam"

This seems a bit off to me. There is a syntax problem where the comma 
after --enable-tests is not required if  you wanted to enable tests when 
pam is enabled in packageconfig. Second question is if this is required 
to be bundled with this knob or should it be a seprate independent knob.

>   PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
>   PACKAGECONFIG[shadow] = "--enable-shadow, --disable-shadow"
>   PACKAGECONFIG[pcre] = "--enable-pcre, --disable-pcre, libpcre "
> 
> 
> 
> 
> 
