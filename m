Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E1CB674855
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:53:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id s9so13647267qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=BFguI6rZz4dGWwDKKr9Hruf7epmvG9KzCws5cnGhmK4=;
	b=euHc+W0b/VRZDZw0H2VbKhkep1dFuJH5yIZunY7CLfkpEPcSmnLxdx+Vqb3pU75S7d
	hZbTMNB+0QJqXKWPUbM9YGy5AyTKesLiyzqFpq694hV4UtN46z7a4f/F435LjgxZ7/Bh
	V0blorfdiqvPZrKWYqWPxfHMBycEINm00zu3nxCaUFCVm4SyKqq6c5+5bn1G7cd8a9b8
	aslMbbNw9wRZakkcmYTdjx9FGhW0nYO34nFOiAt53MQX2wC0MJWtzi93v0hHy6qnEEAB
	VZqSLTYm3ZGi05ckhw4lyrqSVWD4O8y8segX0sb5M28bvBnspX/iAB+wHtqZZ8C7t5EB
	vqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=BFguI6rZz4dGWwDKKr9Hruf7epmvG9KzCws5cnGhmK4=;
	b=T3i+EGISpDR8poHE10aw3f1UCc6Mb0+tasHm8vVHblVJw8lIGYg9ncNqjm55red0od
	il7o9ZoIHNjMniKMCMQzbavkQwqyrSBc9Cs0K6Pye7zjkWtO2FIUJUVCxjJUln0FBUd2
	eTgoPEFa4hLi5soSBO+kx2XzK5/LXWO14gvMka+wDpL7+mW+YU5XkyZK75TDfRXpcaBI
	UirdCLCivaTrF5ME0EtP0Y+Zbt863y12ZWebXU8mb20G/cozShoOCST7Pk8MSB19ffgN
	d3wIWJRTuA2XfBnqX9gg10A2unOO9kghkH7AVOhGKuqGEZk+mctoYCodEYZfaWcmIOvh
	TbWQ==
X-Gm-Message-State: ALQs6tBYO0HGCeN2pz6ODXaTVR5G5JIrNPetRXUTUzZzMPKqPKWqMOFt
	8CFkCe7UpBuAfU3bdmYdHIIkhg==
X-Google-Smtp-Source: AIpwx482ceONz6cKZM42rw38FR0Rfjbn4SfvSV9f+ny1XBiiIJ51b/TV6ceABSTolMqWOdmVPqQKfA==
X-Received: by 10.55.144.68 with SMTP id s65mr1110582qkd.226.1523372034733;
	Tue, 10 Apr 2018 07:53:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:c5e:530c:2676:1226?
	([2601:202:4000:1184:c5e:530c:2676:1226])
	by smtp.gmail.com with ESMTPSA id
	l192sm2342755qke.56.2018.04.10.07.53.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Apr 2018 07:53:53 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
	<20180409220249.11796-2-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4bc04e65-e5c8-7a7a-5731-72afd624b0c3@gmail.com>
Date: Tue, 10 Apr 2018 07:53:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180409220249.11796-2-schnitzeltony@gmail.com>
Subject: Re: [PATCH 1/9] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Tue, 10 Apr 2018 14:53:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/09/2018 03:02 PM, Andreas Müller wrote:
> This adresses the comments for recent patch which updated nm to 1.10.6 and is a
> follow-up for [1].

There is a form of this  already in my stagging/master-next. Should it
be removed and replaced by this one?
- armin
>
> * Make gobject-introspection work by skipping creation of gobject-introspection
>   specific documentation. This fixes networkmanager-applet regression.
> * Cleanup patches: Remove current musl patches completely and re-use those
>   found in void-linux because they do look much cleaner and don't touch glibc
>   build. One nice side effect: In the future when nm is updated we can steal
>   again and don't need to reenvent here. Usually they are much faster than we
>   are (and I know one major contibutor personally from the good old Z80 times..)
>
> [1] https://patchwork.openembedded.org/patch/149244/
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...adjust-net-headers-for-musl-compatibility.patch | 86 --------------------
>  ...move-net-ethernet.h-seems-to-be-over-spe.patch} |  0
>  ...igure.ac-Fix-pkgconfig-sysroot-locations.patch} |  0
>  ...et-util.h-Include-linux-sockios.h-on-musl.patch | 30 -------
>  .../networkmanager/0003-Define-ETH_ALEN.patch      | 39 ---------
>  ...te-settings-settings-property-documentati.patch | 77 ++++++++++++++++++
>  ...Define-missing-features-to-cater-for-musl.patch | 92 ----------------------
>  .../0006-check-for-strndupa-before-using-it.patch  | 67 ----------------
>  .../networkmanager/musl/0001-musl-basic.patch      | 53 +++++++++++++
>  .../musl/0002-musl-dlopen-configure-ac.patch       | 35 ++++++++
>  .../musl/0003-musl-network-support.patch           | 72 +++++++++++++++++
>  .../musl/0004-musl-process-util.patch              | 62 +++++++++++++++
>  .../networkmanager/networkmanager_1.10.6.bb        | 31 ++++----
>  13 files changed, 316 insertions(+), 328 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch => 0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch} (100%)
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch => 0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch} (100%)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
> deleted file mode 100644
> index 194e03722..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-headers-for-musl-compatibility.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From f81abf62c0ae93628df36c27357358523be25fb8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 15:57:05 -0700
> -Subject: [PATCH 1/7] adjust net/ headers for musl compatibility
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libnm-core/nm-utils.c          | 13 ++++++++-----
> - libnm-core/nm-utils.h          |  5 ++---
> - src/platform/wifi/wifi-utils.h |  2 +-
> - 3 files changed, 11 insertions(+), 9 deletions(-)
> -
> -diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
> -index ebbbfd3..77273df 100644
> ---- a/libnm-core/nm-utils.c
> -+++ b/libnm-core/nm-utils.c
> -@@ -19,14 +19,9 @@
> -  * Copyright 2005 - 2017 Red Hat, Inc.
> -  */
> - 
> --#include "nm-default.h"
> --
> --#include "nm-utils.h"
> --
> - #include <string.h>
> - #include <errno.h>
> - #include <stdlib.h>
> --#include <netinet/ether.h>
> - #include <arpa/inet.h>
> - #include <uuid/uuid.h>
> - #include <libintl.h>
> -@@ -34,12 +29,20 @@
> - #include <sys/stat.h>
> - #include <net/if.h>
> - #include <linux/pkt_sched.h>
> -+//#include <net/if_arp.h>
> -+//#include <net/ethernet.h>
> -+#include <netinet/ether.h>
> -+
> -+#include "nm-default.h"
> -+
> -+#include "nm-utils.h"
> - 
> - #if WITH_JANSSON
> - #include "nm-json.h"
> - #include <jansson.h>
> - #endif
> - 
> -+
> - #include "nm-utils/nm-enum-utils.h"
> - #include "nm-utils/nm-hash-utils.h"
> - #include "nm-common-macros.h"
> -diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> -index df9284b..02e24ea 100644
> ---- a/libnm-core/nm-utils.h
> -+++ b/libnm-core/nm-utils.h
> -@@ -27,11 +27,10 @@
> - 
> - #include <glib.h>
> - 
> --#include <netinet/in.h>
> --
> - /* For ETH_ALEN and INFINIBAND_ALEN */
> --#include <linux/if_ether.h>
> -+//#include <linux/if_ether.h>
> - #include <linux/if_infiniband.h>
> -+#include <netinet/in.h>
> - 
> - #include "nm-core-enum-types.h"
> - #include "nm-setting-wireless-security.h"
> -diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
> -index 705717b..939080f 100644
> ---- a/src/platform/wifi/wifi-utils.h
> -+++ b/src/platform/wifi/wifi-utils.h
> -@@ -22,7 +22,7 @@
> - #ifndef __WIFI_UTILS_H__
> - #define __WIFI_UTILS_H__
> - 
> --#include <net/ethernet.h>
> -+//#include <net/ethernet.h>
> - 
> - #include "nm-dbus-interface.h"
> - 
> --- 
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
> deleted file mode 100644
> index cdcd397d7..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 7f0e0613abe8aa1861946e2cc25397690da7128b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 16:05:05 -0700
> -Subject: [PATCH 2/7] socket-util.h: Include linux/sockios.h on musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/systemd/src/basic/socket-util.h | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
> -index d7e2d85..2e7f7b6 100644
> ---- a/src/systemd/src/basic/socket-util.h
> -+++ b/src/systemd/src/basic/socket-util.h
> -@@ -30,6 +30,12 @@
> - #include <linux/if_infiniband.h>
> - #include <linux/if_packet.h>
> - 
> -+#if !defined(__GLIBC__)
> -+/* SIOCGSTAMPNS from linux/asm-generic.h
> -+ * for src/systemd/src/libsystemd-network/sd-lldp.c */
> -+#include <linux/sockios.h>
> -+#endif
> -+
> - #include "macro.h"
> - #include "missing.h"
> - #include "util.h"
> --- 
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
> deleted file mode 100644
> index 549e46e0e..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Define-ETH_ALEN.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From d0951fe7da63d8296a305781d7322ce4d3249415 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 16:08:45 -0700
> -Subject: [PATCH 3/7] Define ETH_ALEN
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - libnm-core/nm-utils.h          | 1 +
> - src/platform/wifi/wifi-utils.h | 2 ++
> - 2 files changed, 3 insertions(+)
> -
> -diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> -index 02e24ea..5ff279c 100644
> ---- a/libnm-core/nm-utils.h
> -+++ b/libnm-core/nm-utils.h
> -@@ -29,6 +29,7 @@
> - 
> - /* For ETH_ALEN and INFINIBAND_ALEN */
> - //#include <linux/if_ether.h>
> -+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
> - #include <linux/if_infiniband.h>
> - #include <netinet/in.h>
> - 
> -diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
> -index 939080f..2274408 100644
> ---- a/src/platform/wifi/wifi-utils.h
> -+++ b/src/platform/wifi/wifi-utils.h
> -@@ -24,6 +24,8 @@
> - 
> - //#include <net/ethernet.h>
> - 
> -+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
> -+
> - #include "nm-dbus-interface.h"
> - 
> - typedef struct WifiData WifiData;
> --- 
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
> new file mode 100644
> index 000000000..92485f044
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-not-create-settings-settings-property-documentati.patch
> @@ -0,0 +1,77 @@
> +From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Thu, 22 Mar 2018 11:08:30 +0100
> +Subject: [PATCH] Do not create settings settings/property documentation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It was tried to get this work but gi / GirRepository could not be found by
> +python. Anyway it is not necessary for us to have the settings/property docs.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + Makefile.am  | 18 ++----------------
> + configure.ac |  4 ----
> + 2 files changed, 2 insertions(+), 20 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 639921d..314a61d 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -961,9 +961,7 @@ endif
> + if HAVE_INTROSPECTION
> + 
> + libnm_noinst_data = \
> +-	libnm/nm-property-docs.xml \
> + 	libnm/nm-settings-docs-overrides.xml \
> +-	libnm/nm-settings-docs.xml \
> + 	libnm/nm-settings-keyfile-docs.xml \
> + 	libnm/nm-settings-ifcfg-rh-docs.xml
> + 
> +@@ -3317,23 +3315,11 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm_core_lib_h_pub_mkenums)
> + $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
> + 
> + clients_common_settings_doc_c = clients/common/settings-docs.c
> +-if HAVE_INTROSPECTION
> +-$(clients_common_settings_doc_c): clients/common/settings-docs.xsl libnm/nm-property-docs.xml clients/common/.dirstamp
> +-	$(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
> +-DISTCLEANFILES += $(clients_common_settings_doc_c)
> +-check-local-settings-docs: $(clients_common_settings_doc_c)
> +-	@if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then  \
> +-		if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)" ; then \
> +-			echo "The generated file \"$(builddir)/$(clients_common_settings_doc_c)\" differs from the source file \"$(srcdir)/$(clients_common_settings_doc_c).in\". You probably should copy the generated file over to the source file. You can skip this test by setting \$$NMTST_NO_CHECK_SETTINGS_DOCS=yes"; \
> +-			false; \
> +-		fi;\
> +-	fi
> +-check_local += check-local-settings-docs
> +-else
> ++
> + $(clients_common_settings_doc_c): $(clients_common_settings_doc_c).in clients/common/.dirstamp
> + 	$(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_c).in" "$(builddir)/$(clients_common_settings_doc_c)"
> + check-local-settings-docs:
> +-endif
> ++
> + EXTRA_DIST += \
> + 	$(clients_common_settings_doc_c) \
> + 	$(clients_common_settings_doc_c).in
> +diff --git a/configure.ac b/configure.ac
> +index c9d3e56..407222e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1286,10 +1286,6 @@ GTK_DOC_CHECK(1.0)
> + # check if we can build setting property documentation
> + build_docs=no
> + if test -n "$INTROSPECTION_MAKEFILE"; then
> +-	# If g-i is installed we know we have python, but we might not have pygobject
> +-	if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/null; then
> +-		AC_MSG_ERROR(["--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)])
> +-	fi
> + 
> + 	AC_PATH_PROG(PERL, perl)
> + 	if test -z "$PERL"; then
> +-- 
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
> deleted file mode 100644
> index b56f6a37d..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-features-to-cater-for-musl.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From c9e0f112a90b6b1ade87a698608dca8d6fbe89cc Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 16:09:41 -0700
> -Subject: [PATCH 4/7] Define missing features to cater for musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/systemd/sd-adapt/nm-sd-adapt.h | 2 +-
> - src/systemd/src/basic/parse-util.c | 4 ++++
> - src/systemd/src/basic/stdio-util.h | 2 ++
> - src/systemd/src/basic/util.h       | 5 +++++
> - src/systemd/src/systemd/sd-event.h | 4 ----
> - 5 files changed, 12 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/systemd/sd-adapt/nm-sd-adapt.h b/src/systemd/sd-adapt/nm-sd-adapt.h
> -index 0d291e2..d88dd9b 100644
> ---- a/src/systemd/sd-adapt/nm-sd-adapt.h
> -+++ b/src/systemd/sd-adapt/nm-sd-adapt.h
> -@@ -134,7 +134,7 @@ G_STMT_START { \
> - #  ifdef HAVE___SECURE_GETENV
> - #    define secure_getenv __secure_getenv
> - #  else
> --#    error neither secure_getenv nor __secure_getenv is available
> -+#    define secure_getenv getenv
> - #  endif
> - #endif
> - 
> -diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/parse-util.c
> -index 6d978e9..e74e84b 100644
> ---- a/src/systemd/src/basic/parse-util.c
> -+++ b/src/systemd/src/basic/parse-util.c
> -@@ -21,7 +21,11 @@
> - 
> - #include <errno.h>
> - #include <inttypes.h>
> -+#ifdef __GLIBC__
> -+#include <xlocale.h>
> -+#else
> - #include <locale.h>
> -+#endif
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <string.h>
> -diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
> -index bd1144b..c92e935 100644
> ---- a/src/systemd/src/basic/stdio-util.h
> -+++ b/src/systemd/src/basic/stdio-util.h
> -@@ -19,7 +19,9 @@
> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> - ***/
> - 
> -+#ifdef __GLIBC__
> - #include <printf.h>
> -+#endif
> - #include <stdarg.h>
> - #include <stdio.h>
> - #include <sys/types.h>
> -diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
> -index b31dfd1..9b7032c 100644
> ---- a/src/systemd/src/basic/util.h
> -+++ b/src/systemd/src/basic/util.h
> -@@ -46,6 +46,11 @@
> - #include "missing.h"
> - #include "time-util.h"
> - 
> -+#if !defined(__GLIBC__)
> -+typedef int (*__compar_fn_t) (const void*, const void*);
> -+typedef __compar_fn_t comparison_fn_t;
> -+#endif
> -+
> - size_t page_size(void) _pure_;
> - #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
> - 
> -diff --git a/src/systemd/src/systemd/sd-event.h b/src/systemd/src/systemd/sd-event.h
> -index f8cb895..c7e0004 100644
> ---- a/src/systemd/src/systemd/sd-event.h
> -+++ b/src/systemd/src/systemd/sd-event.h
> -@@ -69,11 +69,7 @@ typedef int (*sd_event_handler_t)(sd_event_source *s, void *userdata);
> - typedef int (*sd_event_io_handler_t)(sd_event_source *s, int fd, uint32_t revents, void *userdata);
> - typedef int (*sd_event_time_handler_t)(sd_event_source *s, uint64_t usec, void *userdata);
> - typedef int (*sd_event_signal_handler_t)(sd_event_source *s, const struct signalfd_siginfo *si, void *userdata);
> --#if defined _GNU_SOURCE || _POSIX_C_SOURCE >= 199309L
> - typedef int (*sd_event_child_handler_t)(sd_event_source *s, const siginfo_t *si, void *userdata);
> --#else
> --typedef void* sd_event_child_handler_t;
> --#endif
> - 
> - int sd_event_default(sd_event **e);
> - 
> --- 
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
> deleted file mode 100644
> index 6adb84baa..000000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-before-using-it.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From f24d958fc85f9a43ac13abc85f74c4ae233dc8a4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 31 Mar 2017 18:37:19 -0700
> -Subject: [PATCH 6/7] check for strndupa before using it
> -
> -musl does not have strndupa
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - config.h.in                        |  4 ++++
> - configure.ac                       |  1 +
> - src/systemd/src/basic/alloc-util.h | 12 ++++++++++++
> - 3 files changed, 17 insertions(+)
> -
> -diff --git a/config.h.in b/config.h.in
> -index edec211..0799030 100644
> ---- a/config.h.in
> -+++ b/config.h.in
> -@@ -34,6 +34,10 @@
> -    */
> - #undef HAVE_DCGETTEXT
> - 
> -+/* Define to 1 if you have the declaration of `strndupa', and to 0 if you
> -+   don't. */
> -+#undef HAVE_DECL_STRNDUPA
> -+
> - /* Define to 1 if you have the declaration of `explicit_bzero', and to 0 if
> -    you don't. */
> - #undef HAVE_DECL_EXPLICIT_BZERO
> -diff --git a/configure.ac b/configure.ac
> -index 8a066ad..51e5eb6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -56,6 +56,7 @@ AC_SUBST(NM_VERSION)
> - 
> - GIT_SHA_RECORD(NM_GIT_SHA)
> - 
> -+AC_CHECK_DECLS([strndupa], [], [], [[#include <string.h>]])
> - dnl
> - dnl Checks for typedefs, structures, and compiler characteristics.
> - dnl
> -diff --git a/src/systemd/src/basic/alloc-util.h b/src/systemd/src/basic/alloc-util.h
> -index 0a89691..1e95260 100644
> ---- a/src/systemd/src/basic/alloc-util.h
> -+++ b/src/systemd/src/basic/alloc-util.h
> -@@ -25,6 +25,18 @@
> - #include <string.h>
> - 
> - #include "macro.h"
> -+#include "config.h"
> -+
> -+#if !HAVE_DECL_STRNDUPA
> -+#define strndupa(s, n) \
> -+  ({ \
> -+    const char *__old = (s); \
> -+    size_t __len = strnlen(__old, (n)); \
> -+    char *__new = (char *)alloca(__len + 1); \
> -+    __new[__len] = '\0'; \
> -+    (char *)memcpy(__new, __old, __len); \
> -+  })
> -+#endif
> - 
> - #define new(t, n) ((t*) malloc_multiply(sizeof(t), (n)))
> - 
> --- 
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
> new file mode 100644
> index 000000000..9d208e1fd
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-musl-basic.patch
> @@ -0,0 +1,53 @@
> +From e92de7409a3e107f90d108a9c5d49bd0418296dd Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Thu, 22 Mar 2018 17:54:10 +0100
> +Subject: [PATCH 1/4] Usual fix for musl libc
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + src/systemd/src/basic/stdio-util.h | 2 ++
> + src/systemd/src/basic/util.h       | 5 +++++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/stdio-util.h
> +index bd1144b..9eafacb 100644
> +--- a/src/systemd/src/basic/stdio-util.h
> ++++ b/src/systemd/src/basic/stdio-util.h
> +@@ -19,7 +19,9 @@
> +   along with systemd; If not, see <http://www.gnu.org/licenses/>.
> + ***/
> + 
> ++#if defined(__GLIBC__)
> + #include <printf.h>
> ++#endif
> + #include <stdarg.h>
> + #include <stdio.h>
> + #include <sys/types.h>
> +diff --git a/src/systemd/src/basic/util.h b/src/systemd/src/basic/util.h
> +index b31dfd1..9b7032c 100644
> +--- a/src/systemd/src/basic/util.h
> ++++ b/src/systemd/src/basic/util.h
> +@@ -46,6 +46,11 @@
> + #include "missing.h"
> + #include "time-util.h"
> + 
> ++#if !defined(__GLIBC__)
> ++typedef int (*__compar_fn_t) (const void*, const void*);
> ++typedef __compar_fn_t comparison_fn_t;
> ++#endif
> ++
> + size_t page_size(void) _pure_;
> + #define PAGE_ALIGN(l) ALIGN_TO((l), page_size())
> + 
> +-- 
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
> new file mode 100644
> index 000000000..548cccb32
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-ac.patch
> @@ -0,0 +1,35 @@
> +From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Thu, 22 Mar 2018 18:18:06 +0100
> +Subject: [PATCH 2/4] musl: dlopen is included so LD_LIBS="" instead of
> + LD_LIBS="none required"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 487a266..96ae4f7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -305,6 +305,7 @@ dnl
> + dnl Checks for libdl - on certain platforms its part of libc
> + dnl
> + AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
> ++AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
> + AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
> + 
> + PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
> +-- 
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
> new file mode 100644
> index 000000000..5dd17b63b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
> @@ -0,0 +1,72 @@
> +From 714b4731a238653e9c7d885c0dee10677b0a4df3 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Thu, 22 Mar 2018 18:24:07 +0100
> +Subject: [PATCH 3/4] musl: network support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + libnm-core/nm-utils.h               | 4 ++++
> + src/platform/wifi/wifi-utils.h      | 4 ++++
> + src/systemd/src/basic/socket-util.h | 5 +++++
> + 3 files changed, 13 insertions(+)
> +
> +diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> +index df9284b..2bcf4b8 100644
> +--- a/libnm-core/nm-utils.h
> ++++ b/libnm-core/nm-utils.h
> +@@ -30,7 +30,11 @@
> + #include <netinet/in.h>
> + 
> + /* For ETH_ALEN and INFINIBAND_ALEN */
> ++#if defined(__GLIBC__)
> + #include <linux/if_ether.h>
> ++#else
> ++#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
> ++#endif
> + #include <linux/if_infiniband.h>
> + 
> + #include "nm-core-enum-types.h"
> +diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-utils.h
> +index 705717b..da3edc4 100644
> +--- a/src/platform/wifi/wifi-utils.h
> ++++ b/src/platform/wifi/wifi-utils.h
> +@@ -22,7 +22,11 @@
> + #ifndef __WIFI_UTILS_H__
> + #define __WIFI_UTILS_H__
> + 
> ++#if defined(__GLIBC__)
> + #include <net/ethernet.h>
> ++#else /* musl libc */
> ++#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
> ++#endif
> + 
> + #include "nm-dbus-interface.h"
> + 
> +diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic/socket-util.h
> +index d7e2d85..d109c84 100644
> +--- a/src/systemd/src/basic/socket-util.h
> ++++ b/src/systemd/src/basic/socket-util.h
> +@@ -29,6 +29,11 @@
> + #include <linux/netlink.h>
> + #include <linux/if_infiniband.h>
> + #include <linux/if_packet.h>
> ++#if !defined(__GLIBC__)
> ++/* SIOCGSTAMPNS from linux/asm-generic.h
> ++ * for src/systemd/src/libsystemd-network/sd-lldp.c */
> ++#include <linux/sockios.h>
> ++#endif
> + 
> + #include "macro.h"
> + #include "missing.h"
> +-- 
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
> new file mode 100644
> index 000000000..fc55ce85f
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
> @@ -0,0 +1,62 @@
> +From d513c8bfc982dbd976617178b040c512c95710b6 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +Date: Thu, 22 Mar 2018 18:29:00 +0100
> +Subject: [PATCH 4/4] musl: process-util
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + src/systemd/src/basic/process-util.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basic/process-util.c
> +index 272030d..485f1db 100644
> +--- a/src/systemd/src/basic/process-util.c
> ++++ b/src/systemd/src/basic/process-util.c
> +@@ -36,6 +36,9 @@
> + #include <sys/wait.h>
> + #include <syslog.h>
> + #include <unistd.h>
> ++#ifndef __GLIBC__
> ++#include <pthread.h>
> ++#endif
> + #if 0 /* NM_IGNORED */
> + #if HAVE_VALGRIND_VALGRIND_H
> + #include <valgrind/valgrind.h>
> +@@ -1015,11 +1018,13 @@ static void reset_cached_pid(void) {
> +         cached_pid = CACHED_PID_UNSET;
> + }
> + 
> ++#ifdef __GLIBC__
> + /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
> +  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
> +  * libpthread, as it is part of glibc anyway. */
> + extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void * __dso_handle);
> + extern void* __dso_handle __attribute__ ((__weak__));
> ++#endif
> + 
> + pid_t getpid_cached(void) {
> +         pid_t current_value;
> +@@ -1042,7 +1047,11 @@ pid_t getpid_cached(void) {
> + 
> +                 new_pid = getpid();
> + 
> ++#ifdef __GLIBC__
> +                 if (__register_atfork(NULL, NULL, reset_cached_pid, __dso_handle) != 0) {
> ++#else
> ++                if (pthread_atfork(NULL, NULL, reset_cached_pid) != 0) {
> ++#endif
> +                         /* OOM? Let's try again later */
> +                         cached_pid = CACHED_PID_UNSET;
> +                         return new_pid;
> +-- 
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> index 6538e7b82..972556176 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
>  
>  DEPENDS = " \
>      intltool-native \
> +    libxslt-native \
>      libnl \
>      dbus \
>      dbus-glib \
> @@ -23,18 +24,18 @@ DEPENDS = " \
>      curl \
>  "
>  
> -inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
> -
> -GI_DATA_ENABLED_libc-musl = "False"
> -
> -SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
> -           file://0001-adjust-net-headers-for-musl-compatibility.patch \
> -           file://0002-socket-util.h-Include-linux-sockios.h-on-musl.patch \
> -           file://0003-Define-ETH_ALEN.patch \
> -           file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
> -           file://0006-check-for-strndupa-before-using-it.patch \
> -           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
> -           "
> +inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection gtk-doc
> +
> +SRC_URI = " \
> +    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
> +    file://0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
> +    file://0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
> +    file://0003-Do-not-create-settings-settings-property-documentati.patch \
> +    file://musl/0001-musl-basic.patch \
> +    file://musl/0002-musl-dlopen-configure-ac.patch \
> +    file://musl/0003-musl-network-support.patch \
> +    file://musl/0004-musl-process-util.patch \
> +"
>  SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
>  SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
>  
> @@ -44,15 +45,17 @@ EXTRA_OECONF = " \
>      --disable-ifcfg-rh \
>      --disable-ifnet \
>      --disable-ifcfg-suse \
> -    --disable-introspection \
>      --disable-more-warnings \
>      --with-iptables=${sbindir}/iptables \
>      --with-tests \
>      --with-nmtui=yes \
>  "
>  
> +# gobject-introspection related
> +GI_DATA_ENABLED_libc-musl = "False"
> +
>  do_compile_prepend() {
> -        export GIR_EXTRA_LIBS_PATH="${B}/libnm-util/.libs"
> +    export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
>  }
>  
>  PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \


