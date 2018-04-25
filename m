Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEC274559;
	Wed, 25 Apr 2018 21:28:38 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id l13-v6so4926563otk.9;
	Wed, 25 Apr 2018 14:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3MqNsQ6T4q0u8qSv7iQbDvKxj+XeQNm8oDbg+TYNkZE=;
	b=BZQzqWxZ5OhRaXCAgL/6zg3QB4CEKw8YtgkKO/F7JGx/M0v/lA7jtaRPZA6awCPI0D
	/FHRlV7WZoMhlTIAYo4XsOSQNXydT/8m1ZVt9JrX8EAvLkO57M0JTRxVzvAy1h5rsWVv
	j9uQtNR/yOv8VxK8HF4GrhJgpI6ShbcWbnqYl3G3fUydgJl9AkRVfYr9Qnh6c8uaBG3+
	kLDfcBApp+r8kkQfFapfwKFVa0YWohWjnnWEteLDnZ3viSP9cOHHp4u0q/0H5x014cPv
	WiwVNcB36v+9c+J0BNtBZsgTdKieeBiKCLPLGoWJpzYf1cc0k0FosCr6X+UY/9nbCJX0
	bM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3MqNsQ6T4q0u8qSv7iQbDvKxj+XeQNm8oDbg+TYNkZE=;
	b=AEY29jE8GkXkjRLL4lk2OCM3Y2rdyR8RBhbyZKxz65M3EwFHLuD8NYr5FJooPqIl+r
	FV9ttUGMP0Lw8BfahgpyMeg0ZQJmDa/HhOOFc0tEHH77sxxR0+WXA4RvGEZyX8+T0ctV
	mLs2NubABygdjRlz87axjrVfMclHhbicPjOf8r0l69QZn2p8KVaMutmQdkZmCnHKyHF1
	QyeTrlh6SpUaSkQw7K+5J7Jr9zAv3TlVbWmdELyTypX+RB6/GWYsBEdrJpehkzVntld8
	rv6mn0ax0IgGvySugU3jpCBVrOIQcJE0YaLHwyoxEemQAp5JRddCZochMXZP+T3xu8cg
	h5mg==
X-Gm-Message-State: ALQs6tATa6Zd0RYzGK7NdLJV+P9ezB9pb9KhZINQrEY9EbOPbjtJjmVa
	V4kgaXTdYKjy+PV/YipitVhJwpaP/bCopGgvyCE=
X-Google-Smtp-Source: AIpwx49nTaBQYQYE7iuj8tamtON/KmmWMYA8BPyNlIF8LLeMh5Sq88QdXjoFKfdjvbNSE4EW0qN5Jb5GC6zVb0buWKM=
X-Received: by 2002:a9d:34b6:: with SMTP id
	g51-v6mr21551655otc.180.1524691718422; 
	Wed, 25 Apr 2018 14:28:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Wed, 25 Apr 2018 14:28:37 -0700 (PDT)
In-Reply-To: <20180425195850.BB9C2232832@git.openembedded.org>
References: <152468633049.2402.13602360060655069355@git.openembedded.org>
	<20180425195850.BB9C2232832@git.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 25 Apr 2018 23:28:37 +0200
Message-ID: <CALbNGRRtjLMg+0O+WJN9O3AEm2uzdWzDemw0v-tNpTPWmWMFfg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 01/07: networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Wed, 25 Apr 2018 21:28:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 25, 2018 at 9:58 PM,  <git@git.openembedded.org> wrote:
> This is an automated email from the git hooks/post-receive script.
>
> joe_macdonald pushed a commit to branch master
> in repository meta-openembedded.
>
> commit 575c14ded56e1e97582a6df0921d19b4da630961
> Author: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> AuthorDate: Thu Mar 22 18:40:52 2018 +0100
>
>     networkmanager: fix gobject-introspection/musl and cleanup
>
>     This adresses the comments for recent patch which updated nm to 1.10.=
6 and is a
>     follow-up for [1].
>
>     * Make gobject-introspection work by skipping creation of gobject-int=
rospection
>       specific documentation. This fixes networkmanager-applet regression=
.
>     * Cleanup patches: Remove current musl patches completely and re-use =
those
>       found in void-linux because they do look much cleaner and don't tou=
ch glibc
>       build. One nice side effect: In the future when nm is updated we ca=
n steal
>       again and don't need to reenvent here. Usually they are much faster=
 than we
>       are (and I know one major contibutor personally from the good old Z=
80 times..)
>     * Fix typo in PACKAGECONFIG
>
>     [1] https://patchwork.openembedded.org/patch/149244/
>
>     Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  ...adjust-net-headers-for-musl-compatibility.patch | 86 ----------------=
----
>  ...move-net-ethernet.h-seems-to-be-over-spe.patch} |  0
>  ...igure.ac-Fix-pkgconfig-sysroot-locations.patch} |  0
>  ...et-util.h-Include-linux-sockios.h-on-musl.patch | 30 -------
>  .../networkmanager/0003-Define-ETH_ALEN.patch      | 39 ---------
>  ...te-settings-settings-property-documentati.patch | 77 ++++++++++++++++=
++
>  ...Define-missing-features-to-cater-for-musl.patch | 92 ----------------=
------
>  .../0006-check-for-strndupa-before-using-it.patch  | 67 ----------------
>  .../networkmanager/musl/0001-musl-basic.patch      | 53 +++++++++++++
>  .../musl/0002-musl-dlopen-configure-ac.patch       | 35 ++++++++
>  .../musl/0003-musl-network-support.patch           | 72 ++++++++++++++++=
+
>  .../musl/0004-musl-process-util.patch              | 62 +++++++++++++++
>  .../networkmanager/networkmanager_1.10.6.bb        | 33 ++++----
>  13 files changed, 317 insertions(+), 329 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0001-adjust-net-headers-for-musl-compatibility.patch b/meta-networki=
ng/recipes-connectivity/networkmanager/networkmanager/0001-adjust-net-heade=
rs-for-musl-compatibility.patch
> deleted file mode 100644
> index 194e037..0000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0001-adjust-net-headers-for-musl-compatibility.patch
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
> -diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-uti=
ls.h
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
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch b/me=
ta-networking/recipes-connectivity/networkmanager/networkmanager/0001-sd-ll=
dp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager/0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger/0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta=
-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fixed-c=
onfigure.ac-Fix-pkgconfig-sysroot-locations.patch
> similarity index 100%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger/0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0002-socket-util.h-Include-linux-sockios.h-on-musl.patch b/meta-netw=
orking/recipes-connectivity/networkmanager/networkmanager/0002-socket-util.=
h-Include-linux-sockios.h-on-musl.patch
> deleted file mode 100644
> index cdcd397..0000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0002-socket-util.h-Include-linux-sockios.h-on-musl.patch
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
> -diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic=
/socket-util.h
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
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0003-Define-ETH_ALEN.patch b/meta-networking/recipes-connectivity/ne=
tworkmanager/networkmanager/0003-Define-ETH_ALEN.patch
> deleted file mode 100644
> index 549e46e..0000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0003-Define-ETH_ALEN.patch
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
> -+#define ETH_ALEN      6               /* Octets in one ethernet addr   =
*/
> - #include <linux/if_infiniband.h>
> - #include <netinet/in.h>
> -
> -diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-uti=
ls.h
> -index 939080f..2274408 100644
> ---- a/src/platform/wifi/wifi-utils.h
> -+++ b/src/platform/wifi/wifi-utils.h
> -@@ -24,6 +24,8 @@
> -
> - //#include <net/ethernet.h>
> -
> -+#define ETH_ALEN      6               /* Octets in one ethernet addr   =
*/
> -+
> - #include "nm-dbus-interface.h"
> -
> - typedef struct WifiData WifiData;
> ---
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0003-Do-not-create-settings-settings-property-documentati.patch b/me=
ta-networking/recipes-connectivity/networkmanager/networkmanager/0003-Do-no=
t-create-settings-settings-property-documentati.patch
> new file mode 100644
> index 0000000..92485f0
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0003-Do-not-create-settings-settings-property-documentati.patch
> @@ -0,0 +1,77 @@
> +From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 22 Mar 2018 11:08:30 +0100
> +Subject: [PATCH] Do not create settings settings/property documentation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +It was tried to get this work but gi / GirRepository could not be found =
by
> +python. Anyway it is not necessary for us to have the settings/property =
docs.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
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
> + libnm_noinst_data =3D \
> +-      libnm/nm-property-docs.xml \
> +       libnm/nm-settings-docs-overrides.xml \
> +-      libnm/nm-settings-docs.xml \
> +       libnm/nm-settings-keyfile-docs.xml \
> +       libnm/nm-settings-ifcfg-rh-docs.xml
> +
> +@@ -3317,23 +3315,11 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libn=
m_core_lib_h_pub_mkenums)
> + $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
> +
> + clients_common_settings_doc_c =3D clients/common/settings-docs.c
> +-if HAVE_INTROSPECTION
> +-$(clients_common_settings_doc_c): clients/common/settings-docs.xsl libn=
m/nm-property-docs.xml clients/common/.dirstamp
> +-      $(AM_V_GEN) $(XSLTPROC) --output $@ $< $(word 2,$^)
> +-DISTCLEANFILES +=3D $(clients_common_settings_doc_c)
> +-check-local-settings-docs: $(clients_common_settings_doc_c)
> +-      @if test -z "$$NMTST_NO_CHECK_SETTINGS_DOCS" ; then  \
> +-              if ! cmp -s "$(srcdir)/$(clients_common_settings_doc_c).i=
n" "$(builddir)/$(clients_common_settings_doc_c)" ; then \
> +-                      echo "The generated file \"$(builddir)/$(clients_=
common_settings_doc_c)\" differs from the source file \"$(srcdir)/$(clients=
_common_settings_doc_c).in\". You probably should copy the generated file o=
ver to the source file. You can skip this test by setting \$$NMTST_NO_CHECK=
_SETTINGS_DOCS=3Dyes"; \
> +-                      false; \
> +-              fi;\
> +-      fi
> +-check_local +=3D check-local-settings-docs
> +-else
> ++
> + $(clients_common_settings_doc_c): $(clients_common_settings_doc_c).in c=
lients/common/.dirstamp
> +       $(AM_V_GEN) cp "$(srcdir)/$(clients_common_settings_doc_c).in" "$=
(builddir)/$(clients_common_settings_doc_c)"
> + check-local-settings-docs:
> +-endif
> ++
> + EXTRA_DIST +=3D \
> +       $(clients_common_settings_doc_c) \
> +       $(clients_common_settings_doc_c).in
> +diff --git a/configure.ac b/configure.ac
> +index c9d3e56..407222e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1286,10 +1286,6 @@ GTK_DOC_CHECK(1.0)
> + # check if we can build setting property documentation
> + build_docs=3Dno
> + if test -n "$INTROSPECTION_MAKEFILE"; then
> +-      # If g-i is installed we know we have python, but we might not ha=
ve pygobject
> +-      if ! "$PYTHON" -c 'from gi.repository import GObject' >& /dev/nul=
l; then
> +-              AC_MSG_ERROR(["--enable-introspection aims to build the s=
ettings documentation. This requires GObject introspection for python (pygo=
bject)])
> +-      fi
> +
> +       AC_PATH_PROG(PERL, perl)
> +       if test -z "$PERL"; then
> +--
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0004-Define-missing-features-to-cater-for-musl.patch b/meta-networki=
ng/recipes-connectivity/networkmanager/networkmanager/0004-Define-missing-f=
eatures-to-cater-for-musl.patch
> deleted file mode 100644
> index b56f6a3..0000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0004-Define-missing-features-to-cater-for-musl.patch
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
> -diff --git a/src/systemd/sd-adapt/nm-sd-adapt.h b/src/systemd/sd-adapt/n=
m-sd-adapt.h
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
> -diff --git a/src/systemd/src/basic/parse-util.c b/src/systemd/src/basic/=
parse-util.c
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
> -diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/=
stdio-util.h
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
> -diff --git a/src/systemd/src/systemd/sd-event.h b/src/systemd/src/system=
d/sd-event.h
> -index f8cb895..c7e0004 100644
> ---- a/src/systemd/src/systemd/sd-event.h
> -+++ b/src/systemd/src/systemd/sd-event.h
> -@@ -69,11 +69,7 @@ typedef int (*sd_event_handler_t)(sd_event_source *s,=
 void *userdata);
> - typedef int (*sd_event_io_handler_t)(sd_event_source *s, int fd, uint32=
_t revents, void *userdata);
> - typedef int (*sd_event_time_handler_t)(sd_event_source *s, uint64_t use=
c, void *userdata);
> - typedef int (*sd_event_signal_handler_t)(sd_event_source *s, const stru=
ct signalfd_siginfo *si, void *userdata);
> --#if defined _GNU_SOURCE || _POSIX_C_SOURCE >=3D 199309L
> - typedef int (*sd_event_child_handler_t)(sd_event_source *s, const sigin=
fo_t *si, void *userdata);
> --#else
> --typedef void* sd_event_child_handler_t;
> --#endif
> -
> - int sd_event_default(sd_event **e);
> -
> ---
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0006-check-for-strndupa-before-using-it.patch b/meta-networking/reci=
pes-connectivity/networkmanager/networkmanager/0006-check-for-strndupa-befo=
re-using-it.patch
> deleted file mode 100644
> index 6adb84b..0000000
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0006-check-for-strndupa-before-using-it.patch
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
> -+/* Define to 1 if you have the declaration of `strndupa', and to 0 if y=
ou
> -+   don't. */
> -+#undef HAVE_DECL_STRNDUPA
> -+
> - /* Define to 1 if you have the declaration of `explicit_bzero', and to =
0 if
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
> -diff --git a/src/systemd/src/basic/alloc-util.h b/src/systemd/src/basic/=
alloc-util.h
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
> -+    const char *__old =3D (s); \
> -+    size_t __len =3D strnlen(__old, (n)); \
> -+    char *__new =3D (char *)alloca(__len + 1); \
> -+    __new[__len] =3D '\0'; \
> -+    (char *)memcpy(__new, __old, __len); \
> -+  })
> -+#endif
> -
> - #define new(t, n) ((t*) malloc_multiply(sizeof(t), (n)))
> -
> ---
> -2.14.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0001-musl-basic.patch b/meta-networking/recipes-connectivity/ne=
tworkmanager/networkmanager/musl/0001-musl-basic.patch
> new file mode 100644
> index 0000000..9d208e1
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0001-musl-basic.patch
> @@ -0,0 +1,53 @@
> +From e92de7409a3e107f90d108a9c5d49bd0418296dd Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 22 Mar 2018 17:54:10 +0100
> +Subject: [PATCH 1/4] Usual fix for musl libc
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/Netwo=
rkManager/patches
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + src/systemd/src/basic/stdio-util.h | 2 ++
> + src/systemd/src/basic/util.h       | 5 +++++
> + 2 files changed, 7 insertions(+)
> +
> +diff --git a/src/systemd/src/basic/stdio-util.h b/src/systemd/src/basic/=
stdio-util.h
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
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0002-musl-dlopen-configure-ac.patch b/meta-networking/recipes-c=
onnectivity/networkmanager/networkmanager/musl/0002-musl-dlopen-configure-a=
c.patch
> new file mode 100644
> index 0000000..548cccb
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0002-musl-dlopen-configure-ac.patch
> @@ -0,0 +1,35 @@
> +From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 22 Mar 2018 18:18:06 +0100
> +Subject: [PATCH 2/4] musl: dlopen is included so LD_LIBS=3D"" instead of
> + LD_LIBS=3D"none required"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/Netwo=
rkManager/patches
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
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
> + AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=3D])
> ++AS_IF([test "$ac_cv_search_dlopen" =3D "none required"],[ac_cv_search_d=
lopen=3D""])
> + AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
> +
> + PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >=3D 2.37.6 gmodule-2.0],
> +--
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0003-musl-network-support.patch b/meta-networking/recipes-conne=
ctivity/networkmanager/networkmanager/musl/0003-musl-network-support.patch
> new file mode 100644
> index 0000000..5dd17b6
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0003-musl-network-support.patch
> @@ -0,0 +1,72 @@
> +From 714b4731a238653e9c7d885c0dee10677b0a4df3 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 22 Mar 2018 18:24:07 +0100
> +Subject: [PATCH 3/4] musl: network support
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/Netwo=
rkManager/patches
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
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
> ++#define ETH_ALEN      6               /* Octets in one ethernet addr   =
*/
> ++#endif
> + #include <linux/if_infiniband.h>
> +
> + #include "nm-core-enum-types.h"
> +diff --git a/src/platform/wifi/wifi-utils.h b/src/platform/wifi/wifi-uti=
ls.h
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
> ++#define ETH_ALEN      6               /* Octets in one ethernet addr   =
*/
> ++#endif
> +
> + #include "nm-dbus-interface.h"
> +
> +diff --git a/src/systemd/src/basic/socket-util.h b/src/systemd/src/basic=
/socket-util.h
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
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0004-musl-process-util.patch b/meta-networking/recipes-connecti=
vity/networkmanager/networkmanager/musl/0004-musl-process-util.patch
> new file mode 100644
> index 0000000..fc55ce8
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0004-musl-process-util.patch
> @@ -0,0 +1,62 @@
> +From d513c8bfc982dbd976617178b040c512c95710b6 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Thu, 22 Mar 2018 18:29:00 +0100
> +Subject: [PATCH 4/4] musl: process-util
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Pending
> +
> +Stolen from [1] and prettyfied slightly
> +
> +[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/Netwo=
rkManager/patches
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + src/systemd/src/basic/process-util.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/systemd/src/basic/process-util.c b/src/systemd/src/basi=
c/process-util.c
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
> +         cached_pid =3D CACHED_PID_UNSET;
> + }
> +
> ++#ifdef __GLIBC__
> + /* We use glibc __register_atfork() + __dso_handle directly here, as th=
ey are not included in the glibc
> +  * headers. __register_atfork() is mostly equivalent to pthread_atfork(=
), but doesn't require us to link against
> +  * libpthread, as it is part of glibc anyway. */
> + extern int __register_atfork(void (*prepare) (void), void (*parent) (vo=
id), void (*child) (void), void * __dso_handle);
> + extern void* __dso_handle __attribute__ ((__weak__));
> ++#endif
> +
> + pid_t getpid_cached(void) {
> +         pid_t current_value;
> +@@ -1042,7 +1047,11 @@ pid_t getpid_cached(void) {
> +
> +                 new_pid =3D getpid();
> +
> ++#ifdef __GLIBC__
> +                 if (__register_atfork(NULL, NULL, reset_cached_pid, __d=
so_handle) !=3D 0) {
> ++#else
> ++                if (pthread_atfork(NULL, NULL, reset_cached_pid) !=3D 0=
) {
> ++#endif
> +                         /* OOM? Let's try again later */
> +                         cached_pid =3D CACHED_PID_UNSET;
> +                         return new_pid;
> +--
> +2.14.3
> +
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.10.6.bb
> index 6538e7b..f201a75 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.10.6.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.10.6.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227=
ada506640fe950a4823b \
>
>  DEPENDS =3D " \
>      intltool-native \
> +    libxslt-native \
>      libnl \
>      dbus \
>      dbus-glib \
> @@ -23,18 +24,18 @@ DEPENDS =3D " \
>      curl \
>  "
>
> -inherit gnomebase gettext systemd bluetooth bash-completion vala gobject=
-introspection
> -
> -GI_DATA_ENABLED_libc-musl =3D "False"
> -
> -SRC_URI =3D "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/Ne=
tworkManager-${PV}.tar.xz \
> -           file://0001-adjust-net-headers-for-musl-compatibility.patch \
> -           file://0002-socket-util.h-Include-linux-sockios.h-on-musl.pat=
ch \
> -           file://0003-Define-ETH_ALEN.patch \
> -           file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-=
spe.patch \
> -           file://0006-check-for-strndupa-before-using-it.patch \
> -           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-location=
s.patch \
> -           "
> +inherit gnomebase gettext systemd bluetooth bash-completion vala gobject=
-introspection gtk-doc
> +
> +SRC_URI =3D " \
> +    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkMana=
ger-${PV}.tar.xz \
> +    file://0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.pat=
ch \
> +    file://0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch=
 \
> +    file://0003-Do-not-create-settings-settings-property-documentati.pat=
ch \
> +    file://musl/0001-musl-basic.patch \
> +    file://musl/0002-musl-dlopen-configure-ac.patch \
> +    file://musl/0003-musl-network-support.patch \
> +    file://musl/0004-musl-process-util.patch \
> +"
>  SRC_URI[md5sum] =3D "de3c7147a693da6f80eb22f126086a14"
>  SRC_URI[sha256sum] =3D "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aa=
ec8aad16481fac76"
>
> @@ -44,20 +45,22 @@ EXTRA_OECONF =3D " \
>      --disable-ifcfg-rh \
>      --disable-ifnet \
>      --disable-ifcfg-suse \
> -    --disable-introspection \
>      --disable-more-warnings \
>      --with-iptables=3D${sbindir}/iptables \
>      --with-tests \
>      --with-nmtui=3Dyes \
>  "
>
> +# gobject-introspection related
> +GI_DATA_ENABLED_libc-musl =3D "False"
> +
>  do_compile_prepend() {
> -        export GIR_EXTRA_LIBS_PATH=3D"${B}/libnm-util/.libs"
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/libnm/.libs:${B}/libnm-glib/.libs=
:${B}/libnm-util/.libs"
>  }
>
>  PACKAGECONFIG ??=3D "nss ifupdown netconfig dhclient dnsmasq \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
> -       bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d),=
 d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d),=
 d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '',=
 d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
>  "
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
Again and again: The wrong patch - now in master. That introduced
parse failures and does NOT fix musl. Are you sure everything is under
control?

Andreas

