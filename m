Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5C2611D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 19:07:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p14so1437081pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=+eV8FzfPKMBT6kIPI2nlgavbeje4j+/C+yvs7jV/hn4=;
	b=p/f0K0NCQsNodE9X8zFtD0yIp6Rie7ZvkBRNLnkrLEeZbgrOmJfgxqrmO0yGRAEWmZ
	PoPptJ9+fevmxssQWHb1BWVQYJYOSLWPCaGRp24ZmEsFBmsyOew9+VaC6mE/DRnovgNj
	vk5wMu61Vs0tG4AHYB9PMFVwpCc2Suvtqu3LpC15dgw7gsDBIWrGpdaJccaLrWPbfW2+
	KByRuOHEypbqKf2rY9gZSMFzzcePJP9KsOAtHVAOh4T5LxqvFTaNCiArNX/OYam5baOR
	wyM6drSGgKjoMwCm3KQAqdwiJDBqNi+WWjNOyroIHEJKdjTOaIlQAsxRtoANyWPCpZHs
	tgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+eV8FzfPKMBT6kIPI2nlgavbeje4j+/C+yvs7jV/hn4=;
	b=UEzlbSP+IoZL38KS8JWtLjnOX3q0RKLdyvFQrVU3ffDsQ32LHlPoNo5BtBixrGb36Y
	fw0u+SU2be6bwvUUOxp43i39dAR99+Cj1yDyNdeC1JKa2h38i0O0/7fTLl844k2CqEMl
	hxPcsiloySHAU1K6hwuDtH2sMV5ge5fmooC8EZNShGQISOrnyAWeEEjouYIxMI7cYl5i
	CJ/lB9koB6kAWqdaTbwCArKZL1N2p4OCCALjyHg0Yvca3CMKk2e0Fa8fvvUX+SP7J+fS
	ReeKzwR7rdxMENQfnU+21dNKr6jEnG0Kcr3legqw4/LpcOi66BPeNMbzuJZfR+VgbHKz
	cZow==
X-Gm-Message-State: ANhLgQ2/DdgNDDSg49N8D6zFAcE/d5s3OTEa12SMCYzZs1/q0HudBFDy
	wtYYZa83xpH9mEwlM/mJ6BZ8jdZxh8s=
X-Google-Smtp-Source: ADFU+vuYesKobRWb80YOt4DgFkG+6/5ml9xeuWHW5ZxW/JWJeePuyiU98n/Ovrcz2FRHSD2GbT4kTg==
X-Received: by 2002:a63:2b4e:: with SMTP id r75mr3901669pgr.32.1583348857576; 
	Wed, 04 Mar 2020 11:07:37 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:dcd2:b9cb:142a:850e?
	([2601:646:9200:4e0:dcd2:b9cb:142a:850e])
	by smtp.gmail.com with ESMTPSA id
	x6sm28746591pfi.83.2020.03.04.11.07.36
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 11:07:36 -0800 (PST)
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <b25011d93f8f1ce2c99de352e13cac94c71e2f14.camel@siemens.com>
	<1c5baebcc371d58c7a12d08b6061f9e410978d56.camel@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <70def329-0b03-a390-ea1f-b9cd725af07b@gmail.com>
Date: Wed, 4 Mar 2020 11:07:35 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1c5baebcc371d58c7a12d08b6061f9e410978d56.camel@siemens.com>
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.4 -> 1.22.8
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
X-List-Received-Date: Wed, 04 Mar 2020 19:07:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Adrian

On 3/4/20 12:23 AM, Freihofer, Adrian wrote:
> What's the status with this patch?
>
It does not appear on patchwork for some reason. Moreover
it did not apply cleanly on top of master, Could you rebase it on 
master-next and resend ?


> -----Original Message-----
> From: "[ext] Freihofer, Adrian" <adrian.freihofer@siemens.com>
> To: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org>
> Subject: [oe] [meta-networking][PATCH] networkmanager: Upgrade 1.18.4
> -> 1.22.8
> Date: Tue, 25 Feb 2020 08:01:41 +0000
> 
> - rebased patches
> - Option --enable-polkit-agent is not available with current NM,
> removed
> - Option --with-libnm-glib is not available with current NM, removed
> - New package NM-cloud-setup for new experimental cloud setup feature
> - NM tries to re-license from GPL to LGPL, added LGPL to LICENSES
> - Removed empty packages libnmutil libnmglib libnmglib-vpn
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  6 +--
>   ...ttings-settings-property-documentati.patch | 23 +++++-----
>   ...Fix-build-with-musl-systemd-specific.patch | 26 ++++++------
>   .../musl/0002-Fix-build-with-musl.patch       | 30 +++++++------
>   ...ger_1.18.4.bb => networkmanager_1.22.8.bb} | 42 ++++++++++++-------
>   5 files changed, 70 insertions(+), 57 deletions(-)
>   rename meta-networking/recipes-
> connectivity/networkmanager/{networkmanager_1.18.4.bb =>
> networkmanager_1.22.8.bb} (77%)
> 
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-
> pkgconfig-sysroot-locations.patch b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-
> pkgconfig-sysroot-locations.patch
> index 302c0292b..19c8c7481 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-
> pkgconfig-sysroot-locations.patch
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0001-Fixed-configure.ac-Fix-
> pkgconfig-sysroot-locations.patch
> @@ -1,4 +1,4 @@
> -From 3dc3d8e73bc430ea4e93e33f7b2a4b3e0ff175af Mon Sep 17 00:00:00 2001
> +From 9bcf4c81a559d1e7deac47b2e510d7f1e5837a02 Mon Sep 17 00:00:00 2001
>   From: Pablo Saavedra <psaavedra@igalia.com>
>   Date: Tue, 13 Mar 2018 17:36:20 +0100
>   Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
> @@ -8,10 +8,10 @@ Subject: [PATCH] Fixed configure.ac: Fix pkgconfig
> sysroot locations
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/configure.ac b/configure.ac
> -index 967eac0..b914219 100644
> +index 65ceffb..ad4b0fc 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -592,7 +592,7 @@ if test "$have_jansson" = "yes"; then
> +@@ -561,7 +561,7 @@ if test "$have_jansson" = "yes"; then
>    	AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
>    
>    	AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-
> settings-property-documentati.patch b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-
> settings-property-documentati.patch
> index 5581dd3aa..446637b27 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-
> settings-property-documentati.patch
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/0002-Do-not-create-settings-
> settings-property-documentati.patch
> @@ -1,4 +1,4 @@
> -From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
> +From 9eab96351a726e9ce6a15d158f743e35d73a8900 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>   Date: Thu, 22 Mar 2018 11:08:30 +0100
>   Subject: [PATCH] Do not create settings settings/property
> documentation
> @@ -6,23 +6,29 @@ MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
>   
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
>   It was tried to get this work but gi / GirRepository could not be
> found by
>   python. Anyway it is not necessary for us to have the
> settings/property docs.
>   
>   Upstream-Status: Inappropriate [OE specific]
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +
>   ---
>    Makefile.am  | 11 -----------
>    configure.ac |  5 -----
>    2 files changed, 16 deletions(-)
>   
>   diff --git a/Makefile.am b/Makefile.am
> -index b180466..1ab4658 100644
> +index d5cbcf5..2a1819a 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
> -@@ -1298,9 +1298,7 @@ EXTRA_DIST += \
> - if HAVE_INTROSPECTION
> +@@ -1473,9 +1473,7 @@ libnm/libnm.typelib: libnm/libnm.gir
> + INTROSPECTION_GIRS += libnm/NM-1.0.gir
>    
>    libnm_noinst_data = \
>   -	libnm/nm-property-docs.xml \
> @@ -31,7 +37,7 @@ index b180466..1ab4658 100644
>    	libnm/nm-settings-keyfile-docs.xml \
>    	libnm/nm-settings-ifcfg-rh-docs.xml
>    
> -@@ -3930,18 +3928,9 @@ $(clients_common_libnmc_base_la_OBJECTS):
> $(libnm_lib_h_pub_mkenums)
> +@@ -4236,18 +4234,9 @@ $(clients_common_libnmc_base_la_OBJECTS):
> $(libnm_lib_h_pub_mkenums)
>    $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
>    
>    clients_common_settings_doc_h = clients/common/settings-docs.h
> @@ -51,10 +57,10 @@ index b180466..1ab4658 100644
>    	$(clients_common_settings_doc_h) \
>    	$(clients_common_settings_doc_h).in
>   diff --git a/configure.ac b/configure.ac
> -index b914219..872c292 100644
> +index ad4b0fc..0092092 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -1215,11 +1215,6 @@ GTK_DOC_CHECK(1.0)
> +@@ -1201,11 +1201,6 @@ GTK_DOC_CHECK(1.0)
>    # check if we can build setting property documentation
>    build_docs=no
>    if test -n "$INTROSPECTION_MAKEFILE"; then
> @@ -66,6 +72,3 @@ index b914219..872c292 100644
>    	AC_PATH_PROG(PERL, perl)
>    	if test -z "$PERL"; then
>    		AC_MSG_ERROR([--enable-introspection requires perl])
> ---
> -2.20.1
> -
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-
> musl-systemd-specific.patch b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-
> musl-systemd-specific.patch
> index af6f938ce..c23fc308f 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-
> musl-systemd-specific.patch
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-
> musl-systemd-specific.patch
> @@ -1,4 +1,4 @@
> -From a89c2e6d40606f563467a83fb98933e990e71377 Mon Sep 17 00:00:00 2001
> +From e7ed91c48e1a07527a860637a7865eb67ce34cf3 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>   Date: Tue, 2 Apr 2019 01:34:35 +0200
>   Subject: [PATCH] Fix build with musl - systemd specific
> @@ -12,6 +12,7 @@ for musl.
>   Upstream-Status: Pending
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +
>   ---
>    shared/systemd/src/basic/in-addr-util.c |  1 +
>    shared/systemd/src/basic/process-util.c |  9 +++++++++
> @@ -22,10 +23,10 @@ Signed-off-by: Andreas Müller <
> schnitzeltony@gmail.com>
>    6 files changed, 27 insertions(+), 23 deletions(-)
>   
>   diff --git a/shared/systemd/src/basic/in-addr-util.c
> b/shared/systemd/src/basic/in-addr-util.c
> -index 5899f62..0adb248 100644
> +index 91d687c..8388304 100644
>   --- a/shared/systemd/src/basic/in-addr-util.c
>   +++ b/shared/systemd/src/basic/in-addr-util.c
> -@@ -14,6 +14,7 @@
> +@@ -15,6 +15,7 @@
>    #include "in-addr-util.h"
>    #include "macro.h"
>    #include "parse-util.h"
> @@ -34,10 +35,10 @@ index 5899f62..0adb248 100644
>    #include "strxcpyx.h"
>    #include "util.h"
>   diff --git a/shared/systemd/src/basic/process-util.c
> b/shared/systemd/src/basic/process-util.c
> -index 7431be3..189060a 100644
> +index 1456167..42f51a0 100644
>   --- a/shared/systemd/src/basic/process-util.c
>   +++ b/shared/systemd/src/basic/process-util.c
> -@@ -21,6 +21,9 @@
> +@@ -17,6 +17,9 @@
>    #include <sys/wait.h>
>    #include <syslog.h>
>    #include <unistd.h>
> @@ -47,7 +48,7 @@ index 7431be3..189060a 100644
>    #if 0 /* NM_IGNORED */
>    #if HAVE_VALGRIND_VALGRIND_H
>    #include <valgrind/valgrind.h>
> -@@ -1183,11 +1186,13 @@ void reset_cached_pid(void) {
> +@@ -1123,11 +1126,13 @@ void reset_cached_pid(void) {
>            cached_pid = CACHED_PID_UNSET;
>    }
>    
> @@ -61,7 +62,7 @@ index 7431be3..189060a 100644
>    
>    pid_t getpid_cached(void) {
>            static bool installed = false;
> -@@ -1216,7 +1221,11 @@ pid_t getpid_cached(void) {
> +@@ -1156,7 +1161,11 @@ pid_t getpid_cached(void) {
>                             * only half-documented (glibc doesn't
> document it but LSB does — though only superficially)
>                             * we'll check for errors only in the most
> generic fashion possible. */
>    
> @@ -74,10 +75,10 @@ index 7431be3..189060a 100644
>                                    cached_pid = CACHED_PID_UNSET;
>                                    return new_pid;
>   diff --git a/shared/systemd/src/basic/socket-util.h
> b/shared/systemd/src/basic/socket-util.h
> -index 15443f1..4807198 100644
> +index a0886e0..da47d14 100644
>   --- a/shared/systemd/src/basic/socket-util.h
>   +++ b/shared/systemd/src/basic/socket-util.h
> -@@ -13,6 +13,12 @@
> +@@ -14,6 +14,12 @@
>    #include <sys/types.h>
>    #include <sys/un.h>
>    
> @@ -147,10 +148,10 @@ index c3b9448..e80a938 100644
>    #include <stdio.h>
>    #include <sys/types.h>
>   diff --git a/shared/systemd/src/basic/string-util.h
> b/shared/systemd/src/basic/string-util.h
> -index b23f4c8..8f2f6e0 100644
> +index 04cc82b..2cf589a 100644
>   --- a/shared/systemd/src/basic/string-util.h
>   +++ b/shared/systemd/src/basic/string-util.h
> -@@ -27,6 +27,11 @@
> +@@ -26,6 +26,11 @@
>    #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
>    #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
>    
> @@ -162,6 +163,3 @@ index b23f4c8..8f2f6e0 100644
>    int strcmp_ptr(const char *a, const char *b) _pure_;
>    
>    static inline bool streq_ptr(const char *a, const char *b) {
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-
> musl.patch b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-
> musl.patch
> index e0973af1e..196a3358d 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-
> musl.patch
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-
> musl.patch
> @@ -1,7 +1,7 @@
> -From 3d1307735667758f44378585482fe421db086af8 Mon Sep 17 00:00:00 2001
> +From 877fbb4e848629ff57371b5bdb0d56369abe9d81 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
>   Date: Mon, 8 Apr 2019 23:10:43 +0200
> -Subject: [PATCH 2/2] Fix build with musl
> +Subject: [PATCH] Fix build with musl
>   MIME-Version: 1.0
>   Content-Type: text/plain; charset=UTF-8
>   Content-Transfer-Encoding: 8bit
> @@ -32,6 +32,7 @@ linux-libc headers 'notoriously broken for userspace'
> [2] (search for
>   Upstream-Status: Pending
>   
>   Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +
>   ---
>    clients/tui/nmt-device-entry.c   | 1 -
>    libnm-core/nm-utils.h            | 4 ++++
> @@ -41,10 +42,10 @@ Signed-off-by: Andreas Müller <
> schnitzeltony@gmail.com>
>    5 files changed, 8 insertions(+), 3 deletions(-)
>   
>   diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-
> entry.c
> -index 43fbbc1..3eae286 100644
> +index 4ab5932..915248c 100644
>   --- a/clients/tui/nmt-device-entry.c
>   +++ b/clients/tui/nmt-device-entry.c
> -@@ -39,7 +39,6 @@
> +@@ -26,7 +26,6 @@
>    #include "nmt-device-entry.h"
>    
>    #include <sys/socket.h>
> @@ -53,10 +54,10 @@ index 43fbbc1..3eae286 100644
>    #include "nmtui.h"
>    
>   diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> -index 2b5baba..f7abab6 100644
> +index 5418a1e..f492da6 100644
>   --- a/libnm-core/nm-utils.h
>   +++ b/libnm-core/nm-utils.h
> -@@ -25,6 +25,10 @@
> +@@ -10,6 +10,10 @@
>    #error "Only <NetworkManager.h> can be included directly."
>    #endif
>    
> @@ -68,10 +69,10 @@ index 2b5baba..f7abab6 100644
>    
>    #include <netinet/in.h>
>   diff --git a/shared/nm-default.h b/shared/nm-default.h
> -index 54e9916..26e9f4e 100644
> +index ace6ede..25357da 100644
>   --- a/shared/nm-default.h
>   +++ b/shared/nm-default.h
> -@@ -211,6 +211,9 @@
> +@@ -182,6 +182,9 @@
>    #endif
>    
>    #include <stdlib.h>
> @@ -82,10 +83,10 @@ index 54e9916..26e9f4e 100644
>   
> /**********************************************************************
> *******/
>    
>   diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
> -index bd4fbcc..f70b309 100644
> +index 3bbc975..4e8a3f6 100644
>   --- a/src/devices/nm-device.c
>   +++ b/src/devices/nm-device.c
> -@@ -24,6 +24,7 @@
> +@@ -9,6 +9,7 @@
>    #include "nm-device.h"
>    
>    #include <netinet/in.h>
> @@ -93,7 +94,7 @@ index bd4fbcc..f70b309 100644
>    #include <unistd.h>
>    #include <sys/ioctl.h>
>    #include <signal.h>
> -@@ -32,7 +33,6 @@
> +@@ -17,7 +18,6 @@
>    #include <arpa/inet.h>
>    #include <fcntl.h>
>    #include <linux/if_addr.h>
> @@ -102,10 +103,10 @@ index bd4fbcc..f70b309 100644
>    #include <linux/pkt_sched.h>
>    
>   diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-
> platform.c
> -index d4b0115..22a3a90 100644
> +index 7abe4df..9f53147 100644
>   --- a/src/platform/nm-linux-platform.c
>   +++ b/src/platform/nm-linux-platform.c
> -@@ -28,7 +28,6 @@
> +@@ -14,7 +14,6 @@
>    #include <libudev.h>
>    #include <linux/fib_rules.h>
>    #include <linux/ip.h>
> @@ -113,6 +114,3 @@ index d4b0115..22a3a90 100644
>    #include <linux/if_bridge.h>
>    #include <linux/if_link.h>
>    #include <linux/if_tun.h>
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.18.4.bb b/meta-
> networking/recipes-connectivity/networkmanager/networkmanager_1.22.8.bb
> similarity index 77%
> rename from meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.18.4.bb
> rename to meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.22.8.bb
> index 27508c4d9..b26a5ce06 100644
> --- a/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.18.4.bb
> +++ b/meta-networking/recipes-
> connectivity/networkmanager/networkmanager_1.22.8.bb
> @@ -2,9 +2,9 @@ SUMMARY = "NetworkManager"
>   HOMEPAGE = "
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwiki.gnome.org%2FProjects%2FNetworkManager&amp;data=02%7C01%7Cadrian.freihofer%40siemens.com%7C8de3b1ae8ae9457543af08d7b9c8fd91%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C1%7C637182145207584028&amp;sdata=5npYqRQeaw0I7VUPrDIPcEx47%2FLsqsvge5NFQt2XVt8%3D&amp;reserved=0
> "
>   SECTION = "net/misc"
>   
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
> -                    file://libnm-
> util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b3
> 64516c \
>   "
>   
>   DEPENDS = " \
> @@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
>       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>       file://musl/0002-Fix-build-with-musl.patch \
>   "
> -SRC_URI[md5sum] = "fc86588a3ae54e0d406b560a312d5a5d"
> -SRC_URI[sha256sum] =
> "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f51d8852b320fd05e"
> +SRC_URI[md5sum] = "b512b4985fe3b7e0b37fdac7ab5b8284"
> +SRC_URI[sha256sum] =
> "9511b92c72c6b5b4f063de9590ef6560696657bb6ba7d360676151742c7dab4f"
>   
>   S = "${WORKDIR}/NetworkManager-${PV}"
>   
> @@ -65,7 +65,7 @@ PACKAGECONFIG[systemd] = " \
>       --with-systemdsystemunitdir=${systemd_unitdir}/system --with-
> session-tracking=systemd, \
>       --without-systemdsystemunitdir, \
>   "
> -PACKAGECONFIG[polkit] = "--enable-polkit --enable-polkit-agent,
> --disable-polkit --disable-polkit-agent,polkit"
> +PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
>   PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-
> dun,bluez5"
>   # consolekit is not picked by shlibs, so add it to RDEPENDS too
>   PACKAGECONFIG[consolekit] = "--with-session-
> tracking=consolekit,,consolekit,consolekit"
> @@ -75,33 +75,47 @@ PACKAGECONFIG[ppp] = "--enable-ppp,--disable-
> ppp,ppp,ppp"
>   PACKAGECONFIG[dhclient] = "--with-
> dhclient=${base_sbindir}/dhclient,,,dhcp-client"
>   PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
>   PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
> -PACKAGECONFIG[glib] = "--with-libnm-glib,,dbus-glib-native dbus-glib"
>   PACKAGECONFIG[resolvconf] = "--with-
> resolvconf=${base_sbindir}/resolvconf,,,resolvconf"
>   PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls"
>   PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-
> supplicant"
>   PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>   PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
> +PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-
> cloud-setup=no"
>   
> -PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
> +PACKAGES =+ " \
>     ${PN}-nmtui ${PN}-nmtui-doc \
> -  ${PN}-adsl \
> +  ${PN}-adsl ${PN}-cloud-setup \
>   "
>   
> -FILES_libnmutil += "${libdir}/libnm-util.so.*"
> -FILES_libnmglib += "${libdir}/libnm-glib.so.*"
> -FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
> +SYSTEMD_PACKAGES = "${PN} ${PN}-cloud-setup"
>   
>   FILES_${PN}-adsl = "${libdir}/NetworkManager/${PV}/libnm-device-
> plugin-adsl.so"
>   
> +FILES_${PN}-cloud-setup = " \
> +    ${libexecdir}/nm-cloud-setup \
> +    ${systemd_system_unitdir}/nm-cloud-setup.service \
> +    ${systemd_system_unitdir}/nm-cloud-setup.timer \
> +    ${libdir}/NetworkManager/dispatcher.d/90-nm-cloud-setup.sh \
> +    ${libdir}/NetworkManager/dispatcher.d/no-wait.d/90-nm-cloud-
> setup.sh \
> +"
> +ALLOW_EMPTY_${PN}-cloud-setup = "1"
> +SYSTEMD_SERVICE_${PN}-cloud-setup = "${@bb.utils.contains('PACKAGECONF
> IG', 'cloud-setup', 'nm-cloud-setup.service nm-cloud-setup.timer', '',
> d)}"
> +
>   FILES_${PN} += " \
>       ${libexecdir} \
>       ${libdir}/NetworkManager/${PV}/*.so \
> -    ${nonarch_libdir}/NetworkManager/VPN \
> +    ${libdir}/NetworkManager \
>       ${nonarch_libdir}/NetworkManager/conf.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-up.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
> +    ${nonarch_libdir}/NetworkManager/VPN \
> +    ${nonarch_libdir}/NetworkManager/system-connections \
>       ${datadir}/polkit-1 \
>       ${datadir}/dbus-1 \
>       ${nonarch_base_libdir}/udev/* \
> -    ${systemd_unitdir}/system \
> +    ${systemd_system_unitdir} \
>       ${libdir}/pppd \
>   "
> 

