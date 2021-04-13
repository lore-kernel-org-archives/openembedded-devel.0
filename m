Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1609.1618339390187081770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 11:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cFw9/pdD;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c17so12013698pfn.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Apr 2021 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vok2Ptir0+X4MeNdVj3gDA59qllzCXvBy0I/Dc4IRsA=;
        b=cFw9/pdDpsKnY+DKOWiZ32MMBOfGv8Jtt0L3Jke+vtG0/onQcBoGsfLD2LBMqbrgWl
         DUDZRXXif3pJCSuFesQDbu99WlHQsTlp/CO1N8KLY6WINN7b6FUmcgkf3kDvso6cUh8O
         9Jxm8KXMBTIMXMR1p6+sL0iiGVrPV+IVvlR7KcHkQG7xKU3LA6tN1PF9NnCeDQ3SSbo1
         fpY2ln12fgHTydSxHq4JqfyBJ6UZwJbUXAjdX88906JGz5cJAq3PVFSynYRWFl2mzQdG
         VH/SqPmI/GvKwqOFNDy2nnUhM5a5EUOoQedEaThIsodHCJ2qxumGJvm3zfbnm97+di0+
         mSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Vok2Ptir0+X4MeNdVj3gDA59qllzCXvBy0I/Dc4IRsA=;
        b=i2k9o5dacaD7davH2LOi8QHPAg4mlmcfqOV0Lt1KIBujdH9yFZpQKe2M9r40uoB1Ko
         qCZ9f00Rr702WQ5swaFcgsEigBY+cssRJ4Yc2bT8lJaQbKyJqnZOKHPXXgvZzgS+auqD
         sXQ86lOxJRwDQQYgzgyQKoKQaP+77AU9bM/zCV+5ZuK8RCnnSJo+S58/LmUP6l4sb7em
         gR0H3mEZjCvnDjg+5rbdx1SB2JT5WVvlL87U/W+0KGzH+dXE2HKxv6qFp6UpV+cUecic
         KSRQplMHj0nnHE4wcJE64gG+df63gqyE1jrrAW9kM31bHi5L59whbCSkVGdlo1hrwTz0
         T+lQ==
X-Gm-Message-State: AOAM5336ukOQL/jePKfJiE9hxHzt6tCi8WiFjIh5e7GCZvHzbTE3Z/Zh
	jcTqAaij2PNpMfapdvEV1bAA4U+CRRMdaQ==
X-Google-Smtp-Source: ABdhPJyC3oHKl1h0Y/xl1+fRFhSW1Cb/lLjp3+DLb2n+wWW6KcUbUHLy/MgukGF2eXpMPnLbzggZjQ==
X-Received: by 2002:a63:d146:: with SMTP id c6mr34392859pgj.131.1618339388828;
        Tue, 13 Apr 2021 11:43:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:45ab:75b7:17a:f9f9? ([2601:646:9200:a0f0:45ab:75b7:17a:f9f9])
        by smtp.gmail.com with ESMTPSA id m9sm15395494pgt.65.2021.04.13.11.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 11:43:08 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: upgrade 1.28.0 -> 1.30.2
To: =?UTF-8?Q?Vin=c3=adcius_Ossanes_Aquino?= <voa.aquino@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210413174529.458526-1-voa.aquino@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <06b6a494-2d6f-1a4b-3ff9-4d4fb5f8a0e3@gmail.com>
Date: Tue, 13 Apr 2021 11:43:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210413174529.458526-1-voa.aquino@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

is it same as what is in master ?

https://git.openembedded.org/meta-openembedded/commit/?id=12a241278aec8893d65dc6fa8d045b0bac0220ea

if there is diff then rebase and resend.

On 4/13/21 10:45 AM, Vinícius Ossanes Aquino wrote:
> Upgrade to release 1.30.2:
> 
> - 0004-fix_reallocarray_check.patch removed because the current
>    version of nm already includes boths malloc.h and stdlib.h
> - musl/0002-Fix-build-with-musl.patch removed because the commit
>    c50da167bc of nm solves the build issue with musl
> - musl/0001-Fix-build-with-musl-systemd-specific.patch modified
>    to avoid conflicts when applied to current version of nm
> - musl/0003-Fix-build-with-musl-systemd-specific.patch renamed
>    to musl/0002-Fix-build-with-musl-systemd-specific.patch and
>    modified to avoid conflicts when applied to current version of nm
> 
> Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   ...ttings-settings-property-documentati.patch |  50 ++------
>   .../0004-fix_reallocarray_check.patch         |  27 ----
>   ...Fix-build-with-musl-systemd-specific.patch |  52 +++-----
>   ...Fix-build-with-musl-systemd-specific.patch |  26 ++++
>   .../musl/0002-Fix-build-with-musl.patch       | 121 ------------------
>   ...Fix-build-with-musl-systemd-specific.patch |  26 ----
>   ...ger_1.28.0.bb => networkmanager_1.30.2.bb} |   6 +-
>   7 files changed, 59 insertions(+), 249 deletions(-)
>   delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
>   create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
>   delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
>   delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
>   rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.28.0.bb => networkmanager_1.30.2.bb} (96%)
> 
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
> index ecd13504d..0a86abafc 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-settings-property-documentati.patch
> @@ -1,34 +1,29 @@
> -From 9eab96351a726e9ce6a15d158f743e35d73a8900 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -Date: Sat, 16 Jan 2021 14:27:38 +0100
> +From d0dead0478a070b96f37bd3b310443eaa8c93a25 Mon Sep 17 00:00:00 2001
> +From: Vinicius Aquino <voa.aquino@gmail.com>
> +Date: Thu, 1 Apr 2021 14:13:07 -0300
>   Subject: [PATCH] Do not create settings settings/property documentation
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
>   
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
>   It was tried to get this work by adding python3-pygobject-native to DEPENDS but
> -compile could not find (configure passed) python module gi.
> +compile could not find (configure passed) python module gi.
>   Anyway it is not necessary for us to have the settings/property docs.
>   
>   Upstream-Status: Inappropriate [OE specific]
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> -
> +Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
>   ---
> - Makefile.am  | 13 -------------
> - configure.ac |  5 -----
> - 2 files changed, 18 deletions(-)
> + Makefile.am  | 4 ----
> + configure.ac | 5 -----
> + 2 files changed, 9 deletions(-)
>   
>   diff --git a/Makefile.am b/Makefile.am
> -index 110957a..b4cfbcc 100644
> +index 9279672c1..2e52acbb2 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
> -@@ -1587,14 +1587,10 @@ libnm/libnm.typelib: libnm/libnm.gir
> +@@ -1686,14 +1686,10 @@ libnm/libnm.typelib: libnm/libnm.gir
>    INTROSPECTION_GIRS += libnm/NM-1.0.gir
>    
>    libnm_noinst_data = \
> @@ -43,30 +38,11 @@ index 110957a..b4cfbcc 100644
>    	$(NULL)
>    
>    noinst_DATA += $(libnm_noinst_data)
> -@@ -4448,18 +4444,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_lib_h_pub_mkenums)
> - $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
> -
> - clients_common_settings_doc_h = clients/common/settings-docs.h
> --if HAVE_INTROSPECTION
> --$(clients_common_settings_doc_h): clients/common/settings-docs.xsl libnm/nm-settings-docs-gir.xml clients/common/.dirstamp
> --	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
> --DISTCLEANFILES += $(clients_common_settings_doc_h)
> --check-local-settings-docs: $(clients_common_settings_doc_h)
> --	$(srcdir)/tools/check-settings-docs.sh "$(srcdir)" "$(builddir)" "$(clients_common_settings_doc_h)"
> --check_local += check-local-settings-docs
> --else
> - $(clients_common_settings_doc_h): $(clients_common_settings_doc_h).in clients/common/.dirstamp
> - 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_h).in" "$(builddir)/$(clients_common_settings_doc_h)"
> - check-local-settings-docs:
> --endif
> - EXTRA_DIST += \
> - 	$(clients_common_settings_doc_h) \
> - 	$(clients_common_settings_doc_h).in
>   diff --git a/configure.ac b/configure.ac
> -index 704b1c1..18bba87 100644
> +index 784ac4695..681e6cb32 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1228,11 +1228,6 @@ GTK_DOC_CHECK(1.0)
> +@@ -1241,11 +1241,6 @@ GTK_DOC_CHECK(1.0)
>    # check if we can build setting property documentation
>    build_docs=no
>    if test -n "$INTROSPECTION_MAKEFILE"; then
> @@ -79,5 +55,5 @@ index 704b1c1..18bba87 100644
>    	if test -z "$PERL"; then
>    		AC_MSG_ERROR([--enable-introspection requires perl])
>   --
> -2.26.2
> +2.20.1
>   
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
> deleted file mode 100644
> index 2df449f2e..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-fix_reallocarray_check.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -reallocarray() is coming from stdlib.h which maybe indirectly included
> -by malloc.h but not on all libc implementations
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
> -                                                                                      #include <sys/wait.h>'''))
> - config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
> - config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
> --config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
> -+config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
> - config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
> - config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
> -
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
> - AC_CHECK_DECLS([
> - 	reallocarray],
> - 	[], [], [[
> --#include <malloc.h>
> -+#include <stdlib.h>
> - ]])
> -
> - AC_CHECK_DECLS([
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
> index 7807fc77c..692f1ffa4 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
> @@ -1,12 +1,11 @@
> -From 9597122867c22e949ef3b69c779e0facebce6eb5 Mon Sep 17 00:00:00 2001
> +From 44884c7e7655b889f41cb02ffc8ab72a29b52ebf Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>   Date: Tue, 2 Apr 2019 01:34:35 +0200
> -Subject: [PATCH] Fix build with musl - systemd specific
> +Subject: [PATCH 1/2] Fix build with musl - systemd specific
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
>   
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -17,18 +16,18 @@ for musl.
>   Upstream-Status: Pending
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> -
> +Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
>   ---
>    shared/systemd/src/basic/in-addr-util.c |  1 +
>    shared/systemd/src/basic/process-util.c |  9 +++++++++
>    shared/systemd/src/basic/socket-util.h  |  6 ++++++
> - shared/systemd/src/basic/sort-util.h    | 27 ++++---------------------
> + shared/systemd/src/basic/sort-util.h    | 13 ++++---------
>    shared/systemd/src/basic/stdio-util.h   |  2 ++
>    shared/systemd/src/basic/string-util.h  |  5 +++++
> - 6 files changed, 27 insertions(+), 23 deletions(-)
> + 6 files changed, 27 insertions(+), 9 deletions(-)
>   
>   diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
> -index 1ea3e7f..1204393 100644
> +index c315dcbb8..5b7e04eb7 100644
>   --- a/shared/systemd/src/basic/in-addr-util.c
>   +++ b/shared/systemd/src/basic/in-addr-util.c
>   @@ -15,6 +15,7 @@
> @@ -40,7 +39,7 @@ index 1ea3e7f..1204393 100644
>    #include "string-util.h"
>    #include "strxcpyx.h"
>   diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/src/basic/process-util.c
> -index 03ca04e..be8bca8 100644
> +index 0e25b0200..ea2c0fbb4 100644
>   --- a/shared/systemd/src/basic/process-util.c
>   +++ b/shared/systemd/src/basic/process-util.c
>   @@ -17,6 +17,9 @@
> @@ -80,7 +79,7 @@ index 03ca04e..be8bca8 100644
>                                    cached_pid = CACHED_PID_UNSET;
>                                    return new_pid;
>   diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src/basic/socket-util.h
> -index 1ece911..290e94c 100644
> +index 1de069476..f6834fbd2 100644
>   --- a/shared/systemd/src/basic/socket-util.h
>   +++ b/shared/systemd/src/basic/socket-util.h
>   @@ -14,6 +14,12 @@
> @@ -94,10 +93,10 @@ index 1ece911..290e94c 100644
>   +#endif
>   +
>    #include "macro.h"
> + #include "missing_network.h"
>    #include "missing_socket.h"
> - #include "sparse-endian.h"
>   diff --git a/shared/systemd/src/basic/sort-util.h b/shared/systemd/src/basic/sort-util.h
> -index a8dc3bb..ff0aa88 100644
> +index a8984fc16..5fb90f8c5 100644
>   --- a/shared/systemd/src/basic/sort-util.h
>   +++ b/shared/systemd/src/basic/sort-util.h
>   @@ -5,15 +5,10 @@
> @@ -120,40 +119,22 @@ index a8dc3bb..ff0aa88 100644
>    
>    /**
>     * Normal bsearch requires base to be nonnull. Here were require
> -@@ -54,17 +49,3 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
> -                 int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
> -                 _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
> -         })
> --
> --static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
> --        if (nmemb <= 1)
> --                return;
> --
> --        assert(base);
> --        qsort_r(base, nmemb, size, compar, userdata);
> --}
> --
> --#define typesafe_qsort_r(p, n, func, userdata)                          \
> --        ({                                                              \
> --                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
> --                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
> --        })
>   diff --git a/shared/systemd/src/basic/stdio-util.h b/shared/systemd/src/basic/stdio-util.h
> -index c3b9448..e80a938 100644
> +index d45d3c1a6..fee1a57ca 100644
>   --- a/shared/systemd/src/basic/stdio-util.h
>   +++ b/shared/systemd/src/basic/stdio-util.h
> -@@ -1,7 +1,9 @@
> - /* SPDX-License-Identifier: LGPL-2.1+ */
> +@@ -2,7 +2,9 @@
>    #pragma once
>    
> + #if 0 /* NM_IGNORED */
>   +#if defined(__GLIBC__)
>    #include <printf.h>
>   +#endif
> + #endif /* NM_IGNORED */
>    #include <stdarg.h>
>    #include <stdio.h>
> - #include <sys/types.h>
>   diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src/basic/string-util.h
> -index cefbda3..71e4dec 100644
> +index 593cf04ae..541c393f6 100644
>   --- a/shared/systemd/src/basic/string-util.h
>   +++ b/shared/systemd/src/basic/string-util.h
>   @@ -26,6 +26,11 @@
> @@ -168,3 +149,6 @@ index cefbda3..71e4dec 100644
>    int strcmp_ptr(const char *a, const char *b) _pure_;
>    int strcasecmp_ptr(const char *a, const char *b) _pure_;
>    
> +--
> +2.20.1
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
> new file mode 100644
> index 000000000..d83efd39e
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl-systemd-specific.patch
> @@ -0,0 +1,26 @@
> +From 7d9a11a17da425d106791ada7100d7a6559e6065 Mon Sep 17 00:00:00 2001
> +From: Adrian Freihofer <adrian.freihofer@siemens.com>
> +Date: Sat, 7 Mar 2020 14:24:01 +0100
> +Subject: [PATCH 2/2] Fix build with musl - systemd specific
> +
> +---
> + src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c b/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
> +index 3fafd3c0e..79d6096c2 100644
> +--- a/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
> ++++ b/src/core/systemd/src/libsystemd-network/sd-dhcp6-client.c
> +@@ -8,7 +8,9 @@
> + #include <errno.h>
> + #include <sys/ioctl.h>
> + #if 0 /* NM_IGNORED */
> ++#ifdef __GLIBC__  /* musl supplies full set of userspace headers */
> + #include <linux/if_arp.h>
> ++#endif
> + #else /* NM_IGNORED */
> + #include <net/if_arp.h>
> + #endif /* NM_IGNORED */
> +--
> +2.20.1
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
> deleted file mode 100644
> index 0f43c0c68..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
> +++ /dev/null
> @@ -1,121 +0,0 @@
> -From bacc14089c80ec757025789ff054a05e1f9c088d Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -Date: Mon, 8 Apr 2019 23:10:43 +0200
> -Subject: [PATCH] Fix build with musl
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -The build issues caused by definition conflicts musl vs linux-libc headers
> -(error: redefinition of ...) can be reduced to two headers:
> -
> -1. netinet/if_ether.h <-> linux/if_ether.h: linux-libc header plays well with
> -   glibc and musl headers in case libc's variant (netinet/if_ether.h) is
> -   included BEFORE linux variant [1]. We add include at two positions:
> -   1. shared/nm-default.h: This is a global which used for networkmanager and
> -      is included at the very beginning of all c-files.
> -   2. libnm-core/nm-utils.h: This file makes it into installation and is used
> -      by dependent packages as network-manager-applet
> -2. net/if_arp. <-> linux/if_ether.h: linux-libc: Unfortunaly these files do
> -   not play together in harmony. Therefore the libc variant is included early in
> -   shared/nm-default.h and occurances linux/if_arp.h are removed.
> -
> -Note:
> -Be aware that this is still nasty business: We have to trust that musl headers
> -define same signatures as linux would do - just because musl-makers consider
> -linux-libc headers 'notoriously broken for userspace' [2] (search for
> -'error: redefinition of').
> -
> -[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280440.html
> -[2] https://wiki.musl-libc.org/faq.html
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> -
> ----
> - clients/tui/nmt-device-entry.c   | 1 -
> - libnm-core/nm-utils.h            | 4 ++++
> - shared/nm-default.h              | 3 +++
> - src/devices/nm-device.c          | 2 +-
> - src/platform/nm-linux-platform.c | 1 -
> - 5 files changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-entry.c
> -index 692a467..cf9b32e 100644
> ---- a/clients/tui/nmt-device-entry.c
> -+++ b/clients/tui/nmt-device-entry.c
> -@@ -26,7 +26,6 @@
> - #include "nmt-device-entry.h"
> -
> - #include <sys/socket.h>
> --#include <linux/if_arp.h>
> -
> - #include "nmtui.h"
> -
> -diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> -index 9589c51..b82c5cf 100644
> ---- a/libnm-core/nm-utils.h
> -+++ b/libnm-core/nm-utils.h
> -@@ -10,6 +10,10 @@
> -     #error "Only <NetworkManager.h> can be included directly."
> - #endif
> -
> -+/* include as early as possible for musl */
> -+#include <netinet/if_ether.h>
> -+/* #include <net/if_arp.h> - uncoment for broken dependents?? */
> -+
> - #include <glib.h>
> -
> - #include <netinet/in.h>
> -diff --git a/shared/nm-default.h b/shared/nm-default.h
> -index b322f1d..c287dbe 100644
> ---- a/shared/nm-default.h
> -+++ b/shared/nm-default.h
> -@@ -178,6 +178,9 @@
> - #endif
> -
> - #include <stdlib.h>
> -+/* include as early as possible for musl */
> -+#include <netinet/if_ether.h>
> -+#include <net/if_arp.h>
> -
> - /*****************************************************************************/
> -
> -diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
> -index 0be05f2..04061f9 100644
> ---- a/src/devices/nm-device.c
> -+++ b/src/devices/nm-device.c
> -@@ -9,6 +9,7 @@
> - #include "nm-device.h"
> -
> - #include <netinet/in.h>
> -+#include <net/if.h>
> - #include <unistd.h>
> - #include <sys/ioctl.h>
> - #include <signal.h>
> -@@ -17,7 +18,6 @@
> - #include <arpa/inet.h>
> - #include <fcntl.h>
> - #include <linux/if_addr.h>
> --#include <linux/if_arp.h>
> - #include <linux/rtnetlink.h>
> -
> - #include "nm-std-aux/unaligned.h"
> -diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
> -index b377c85..87af59a 100644
> ---- a/src/platform/nm-linux-platform.c
> -+++ b/src/platform/nm-linux-platform.c
> -@@ -14,7 +14,6 @@
> - #include <libudev.h>
> - #include <linux/fib_rules.h>
> - #include <linux/ip.h>
> --#include <linux/if_arp.h>
> - #include <linux/if_bridge.h>
> - #include <linux/if_link.h>
> - #include <linux/if_tun.h>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
> deleted file mode 100644
> index 5735d51a8..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-Fix-build-with-musl-systemd-specific.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From ed748a28076eada9f38e3f4a476f28d7a10ba84b Mon Sep 17 00:00:00 2001
> -From: Adrian Freihofer <adrian.freihofer@siemens.com>
> -Date: Sat, 7 Mar 2020 14:24:01 +0100
> -Subject: [PATCH] Fix build with musl - systemd specific
> -
> ----
> - src/systemd/src/libsystemd-network/sd-dhcp6-client.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/systemd/src/libsystemd-network/sd-dhcp6-client.c b/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
> -index ec7f1be..31bcd4d 100644
> ---- a/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
> -+++ b/src/systemd/src/libsystemd-network/sd-dhcp6-client.c
> -@@ -7,7 +7,9 @@
> -
> - #include <errno.h>
> - #include <sys/ioctl.h>
> -+#ifdef __GLIBC__  /* musl supplies full set of userspace headers */
> - #include <linux/if_arp.h>
> -+#endif
> - #include <linux/if_infiniband.h>
> -
> - #include "sd-dhcp6-client.h"
> ---
> -2.24.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
> similarity index 96%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
> index 7a20e914f..ec3bdd22b 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
> @@ -26,14 +26,12 @@ SRC_URI = " \
>       file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
>       file://0002-Do-not-create-settings-settings-property-documentati.patch \
>       file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
> -    file://0004-fix_reallocarray_check.patch \
>   "
>   SRC_URI_append_libc-musl = " \
>       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> -    file://musl/0002-Fix-build-with-musl.patch \
> -    file://musl/0003-Fix-build-with-musl-systemd-specific.patch \
> +    file://musl/0002-Fix-build-with-musl-systemd-specific.patch \
>   "
> -SRC_URI[sha256sum] = "3e170e9045e20598d2630e40c5789b2e2c46b942bfe5cb220f36202299253062"
> +SRC_URI[sha256sum] = "0c8e80e77877860e4a4e6ab4a0f7cdc1186e356b65b042a751897188b88944d2"
>   
>   S = "${WORKDIR}/NetworkManager-${PV}"
>   
> 
> 
> 
> 
> 
