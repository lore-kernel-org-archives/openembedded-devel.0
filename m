Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF036131F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 17:36:35 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id fc12so1303958qvb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2020 09:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mIAWSitIZB/Zx6/nAgaxVzkg+CzZIincWa9J4xYSZOI=;
	b=gT3rXPpMMpTSjibZgcROsq/0w1WRTGuzP9aTfeorEH9mLosXanx9Phs0aLwf1VvEnN
	w0N1dxNyywERtpzocU+JniGmznhACmsGk60T4vb7LDdVPVyOF0onSPC/+m84PU8cupgl
	/4SfYN1cOFX/qnJJDIRwQtNzu+TWUnNfaNxqMNuwS/mFoYdGXUT+0MNYQcGHxqTiehaf
	7hincCRu3GWNEu04T/fIIGBcUAty0LKGaMQTY6sRvlnYbGGWsRUeBMOEC3toZdCTs5tB
	ScMTc9VEzvSXUjrPcJ0UwraQBJ76yuhXpBEVZCrUj/0LqPofVOXAS0caR1GJBrqicVQK
	ekiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mIAWSitIZB/Zx6/nAgaxVzkg+CzZIincWa9J4xYSZOI=;
	b=B4gg7xpecK0aSGilS/sxm0szAe9UAmdCkpBQVsOTLZ3pLtvyGjy7xqMbCwzJUcT2X4
	XO/7iUNO9Z7qICe3SMl4+r5AuPTwIueHgbNPZCRamHlhJMq+Zeml4rbk9uYkSXnlsiG9
	Q4aDNquWQ8T068KzgPCiT1GbgrjeuH6Y4zPY4wpUPkmS52BogR64XmPCeEieljNpUCcN
	u6L27jglGzO7ENFDVT/fB7cyGAk8Z4RcXdhfgnEonxIoXGa9YAsguS7NbhG7r4ZciQQM
	zaoC4BM8pxIxyqd6f/2SUhuD23vP0ZpCovBopxXwvUuSPiH6Ln96bS2qBH6XUTTw5krq
	nanQ==
X-Gm-Message-State: ANhLgQ03JrUWzdpq9Pbb64JBj09YD5VJP5c3SC4b8zfNKjZvA93IueKz
	kShjCY6DXo7ii0MJlQvG9EkQ+45iRXzLaFzycd4=
X-Google-Smtp-Source: ADFU+vuuhXHWCVgPSXvKbCo2gLfbTG+hhiJKliLij94O3d41FtXN3FD1X8M1j6RKbie/ISqCjLn+C4Y2Mq3xygssyuk=
X-Received: by 2002:a0c:fccf:: with SMTP id i15mr2970890qvq.130.1583516195608; 
	Fri, 06 Mar 2020 09:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20200305211044.799921-1-adrian.freihofer@siemens.com>
In-Reply-To: <20200305211044.799921-1-adrian.freihofer@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Mar 2020 09:36:23 -0800
Message-ID: <CAMKF1srzK6Xo-mZ8MY7uXS9=rPVbBBHV+hf+83_fGvW9S4iE9A@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] networkmanager: Upgrade 1.18.4 -> 1.22.8
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
X-List-Received-Date: Fri, 06 Mar 2020 17:36:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian

There is build failure on musl

https://errors.yoctoproject.org/Errors/Details/393810/

It seems to be using drand48_r which is non-portable. We might need
something like
https://github.com/tpm2-software/tpm2-abrmd/pull/503/commits/4d652c679ab687=
e0253a65c2677f73661af76725

On Thu, Mar 5, 2020 at 1:11 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> - rebased patches
> - Option --enable-polkit-agent is not available with current NM, removed
> - Option --with-libnm-glib is not available with current NM, removed
> - New package NM-cloud-setup for new experimental cloud setup feature
> - NM tries to re-license from GPL to LGPL, added LGPL to LICENSES
> - Removed empty packages libnmutil libnmglib libnmglib-vpn
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  ...e.ac-Fix-pkgconfig-sysroot-locations.patch |  6 +--
>  ...ttings-settings-property-documentati.patch | 23 +++++-----
>  ...Fix-build-with-musl-systemd-specific.patch | 26 ++++++------
>  .../musl/0002-Fix-build-with-musl.patch       | 30 +++++++------
>  ...ger_1.18.4.bb =3D> networkmanager_1.22.8.bb} | 42 ++++++++++++-------
>  5 files changed, 70 insertions(+), 57 deletions(-)
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.18.4.bb =3D> networkmanager_1.22.8.bb} (77%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch b/meta=
-networking/recipes-connectivity/networkmanager/networkmanager/0001-Fixed-c=
onfigure.ac-Fix-pkgconfig-sysroot-locations.patch
> index 302c0292b..19c8c7481 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
> @@ -1,4 +1,4 @@
> -From 3dc3d8e73bc430ea4e93e33f7b2a4b3e0ff175af Mon Sep 17 00:00:00 2001
> +From 9bcf4c81a559d1e7deac47b2e510d7f1e5837a02 Mon Sep 17 00:00:00 2001
>  From: Pablo Saavedra <psaavedra@igalia.com>
>  Date: Tue, 13 Mar 2018 17:36:20 +0100
>  Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysroot locations
> @@ -8,10 +8,10 @@ Subject: [PATCH] Fixed configure.ac: Fix pkgconfig sysr=
oot locations
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 967eac0..b914219 100644
> +index 65ceffb..ad4b0fc 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -592,7 +592,7 @@ if test "$have_jansson" =3D "yes"; then
> +@@ -561,7 +561,7 @@ if test "$have_jansson" =3D "yes"; then
>         AC_DEFINE(WITH_JANSSON, 1, [Define if JANSSON is enabled])
>
>         AC_CHECK_TOOLS(READELF, [eu-readelf readelf])
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/0002-Do-not-create-settings-settings-property-documentati.patch b/me=
ta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Do-no=
t-create-settings-settings-property-documentati.patch
> index 5581dd3aa..446637b27 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0002-Do-not-create-settings-settings-property-documentati.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
0002-Do-not-create-settings-settings-property-documentati.patch
> @@ -1,4 +1,4 @@
> -From 4f000a4a19975d6aba71427e693cd1ed080abda9 Mon Sep 17 00:00:00 2001
> +From 9eab96351a726e9ce6a15d158f743e35d73a8900 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Thu, 22 Mar 2018 11:08:30 +0100
>  Subject: [PATCH] Do not create settings settings/property documentation
> @@ -6,23 +6,29 @@ MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
>  It was tried to get this work but gi / GirRepository could not be found =
by
>  python. Anyway it is not necessary for us to have the settings/property =
docs.
>
>  Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +
>  ---
>   Makefile.am  | 11 -----------
>   configure.ac |  5 -----
>   2 files changed, 16 deletions(-)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index b180466..1ab4658 100644
> +index d5cbcf5..2a1819a 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -1298,9 +1298,7 @@ EXTRA_DIST +=3D \
> - if HAVE_INTROSPECTION
> +@@ -1473,9 +1473,7 @@ libnm/libnm.typelib: libnm/libnm.gir
> + INTROSPECTION_GIRS +=3D libnm/NM-1.0.gir
>
>   libnm_noinst_data =3D \
>  -      libnm/nm-property-docs.xml \
> @@ -31,7 +37,7 @@ index b180466..1ab4658 100644
>         libnm/nm-settings-keyfile-docs.xml \
>         libnm/nm-settings-ifcfg-rh-docs.xml
>
> -@@ -3930,18 +3928,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm=
_lib_h_pub_mkenums)
> +@@ -4236,18 +4234,9 @@ $(clients_common_libnmc_base_la_OBJECTS): $(libnm=
_lib_h_pub_mkenums)
>   $(clients_common_libnmc_base_la_OBJECTS): clients/common/.dirstamp
>
>   clients_common_settings_doc_h =3D clients/common/settings-docs.h
> @@ -51,10 +57,10 @@ index b180466..1ab4658 100644
>         $(clients_common_settings_doc_h) \
>         $(clients_common_settings_doc_h).in
>  diff --git a/configure.ac b/configure.ac
> -index b914219..872c292 100644
> +index ad4b0fc..0092092 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1215,11 +1215,6 @@ GTK_DOC_CHECK(1.0)
> +@@ -1201,11 +1201,6 @@ GTK_DOC_CHECK(1.0)
>   # check if we can build setting property documentation
>   build_docs=3Dno
>   if test -n "$INTROSPECTION_MAKEFILE"; then
> @@ -66,6 +72,3 @@ index b914219..872c292 100644
>         AC_PATH_PROG(PERL, perl)
>         if test -z "$PERL"; then
>                 AC_MSG_ERROR([--enable-introspection requires perl])
> ---
> -2.20.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0001-Fix-build-with-musl-systemd-specific.patch b/meta-networki=
ng/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-w=
ith-musl-systemd-specific.patch
> index af6f938ce..c23fc308f 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0001-Fix-build-with-musl-systemd-specific.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0001-Fix-build-with-musl-systemd-specific.patch
> @@ -1,4 +1,4 @@
> -From a89c2e6d40606f563467a83fb98933e990e71377 Mon Sep 17 00:00:00 2001
> +From e7ed91c48e1a07527a860637a7865eb67ce34cf3 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Tue, 2 Apr 2019 01:34:35 +0200
>  Subject: [PATCH] Fix build with musl - systemd specific
> @@ -12,6 +12,7 @@ for musl.
>  Upstream-Status: Pending
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +
>  ---
>   shared/systemd/src/basic/in-addr-util.c |  1 +
>   shared/systemd/src/basic/process-util.c |  9 +++++++++
> @@ -22,10 +23,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
>   6 files changed, 27 insertions(+), 23 deletions(-)
>
>  diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/sr=
c/basic/in-addr-util.c
> -index 5899f62..0adb248 100644
> +index 91d687c..8388304 100644
>  --- a/shared/systemd/src/basic/in-addr-util.c
>  +++ b/shared/systemd/src/basic/in-addr-util.c
> -@@ -14,6 +14,7 @@
> +@@ -15,6 +15,7 @@
>   #include "in-addr-util.h"
>   #include "macro.h"
>   #include "parse-util.h"
> @@ -34,10 +35,10 @@ index 5899f62..0adb248 100644
>   #include "strxcpyx.h"
>   #include "util.h"
>  diff --git a/shared/systemd/src/basic/process-util.c b/shared/systemd/sr=
c/basic/process-util.c
> -index 7431be3..189060a 100644
> +index 1456167..42f51a0 100644
>  --- a/shared/systemd/src/basic/process-util.c
>  +++ b/shared/systemd/src/basic/process-util.c
> -@@ -21,6 +21,9 @@
> +@@ -17,6 +17,9 @@
>   #include <sys/wait.h>
>   #include <syslog.h>
>   #include <unistd.h>
> @@ -47,7 +48,7 @@ index 7431be3..189060a 100644
>   #if 0 /* NM_IGNORED */
>   #if HAVE_VALGRIND_VALGRIND_H
>   #include <valgrind/valgrind.h>
> -@@ -1183,11 +1186,13 @@ void reset_cached_pid(void) {
> +@@ -1123,11 +1126,13 @@ void reset_cached_pid(void) {
>           cached_pid =3D CACHED_PID_UNSET;
>   }
>
> @@ -61,7 +62,7 @@ index 7431be3..189060a 100644
>
>   pid_t getpid_cached(void) {
>           static bool installed =3D false;
> -@@ -1216,7 +1221,11 @@ pid_t getpid_cached(void) {
> +@@ -1156,7 +1161,11 @@ pid_t getpid_cached(void) {
>                            * only half-documented (glibc doesn't document=
 it but LSB does =E2=80=94 though only superficially)
>                            * we'll check for errors only in the most gene=
ric fashion possible. */
>
> @@ -74,10 +75,10 @@ index 7431be3..189060a 100644
>                                   cached_pid =3D CACHED_PID_UNSET;
>                                   return new_pid;
>  diff --git a/shared/systemd/src/basic/socket-util.h b/shared/systemd/src=
/basic/socket-util.h
> -index 15443f1..4807198 100644
> +index a0886e0..da47d14 100644
>  --- a/shared/systemd/src/basic/socket-util.h
>  +++ b/shared/systemd/src/basic/socket-util.h
> -@@ -13,6 +13,12 @@
> +@@ -14,6 +14,12 @@
>   #include <sys/types.h>
>   #include <sys/un.h>
>
> @@ -147,10 +148,10 @@ index c3b9448..e80a938 100644
>   #include <stdio.h>
>   #include <sys/types.h>
>  diff --git a/shared/systemd/src/basic/string-util.h b/shared/systemd/src=
/basic/string-util.h
> -index b23f4c8..8f2f6e0 100644
> +index 04cc82b..2cf589a 100644
>  --- a/shared/systemd/src/basic/string-util.h
>  +++ b/shared/systemd/src/basic/string-util.h
> -@@ -27,6 +27,11 @@
> +@@ -26,6 +26,11 @@
>   #define strcaseeq(a,b) (strcasecmp((a),(b)) =3D=3D 0)
>   #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) =3D=3D 0)
>
> @@ -162,6 +163,3 @@ index b23f4c8..8f2f6e0 100644
>   int strcmp_ptr(const char *a, const char *b) _pure_;
>
>   static inline bool streq_ptr(const char *a, const char *b) {
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connec=
tivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
> index e0973af1e..196a3358d 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0002-Fix-build-with-musl.patch
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/=
musl/0002-Fix-build-with-musl.patch
> @@ -1,7 +1,7 @@
> -From 3d1307735667758f44378585482fe421db086af8 Mon Sep 17 00:00:00 2001
> +From 877fbb4e848629ff57371b5bdb0d56369abe9d81 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Mon, 8 Apr 2019 23:10:43 +0200
> -Subject: [PATCH 2/2] Fix build with musl
> +Subject: [PATCH] Fix build with musl
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -32,6 +32,7 @@ linux-libc headers 'notoriously broken for userspace' [=
2] (search for
>  Upstream-Status: Pending
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +
>  ---
>   clients/tui/nmt-device-entry.c   | 1 -
>   libnm-core/nm-utils.h            | 4 ++++
> @@ -41,10 +42,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
>   5 files changed, 8 insertions(+), 3 deletions(-)
>
>  diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-ent=
ry.c
> -index 43fbbc1..3eae286 100644
> +index 4ab5932..915248c 100644
>  --- a/clients/tui/nmt-device-entry.c
>  +++ b/clients/tui/nmt-device-entry.c
> -@@ -39,7 +39,6 @@
> +@@ -26,7 +26,6 @@
>   #include "nmt-device-entry.h"
>
>   #include <sys/socket.h>
> @@ -53,10 +54,10 @@ index 43fbbc1..3eae286 100644
>   #include "nmtui.h"
>
>  diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
> -index 2b5baba..f7abab6 100644
> +index 5418a1e..f492da6 100644
>  --- a/libnm-core/nm-utils.h
>  +++ b/libnm-core/nm-utils.h
> -@@ -25,6 +25,10 @@
> +@@ -10,6 +10,10 @@
>   #error "Only <NetworkManager.h> can be included directly."
>   #endif
>
> @@ -68,10 +69,10 @@ index 2b5baba..f7abab6 100644
>
>   #include <netinet/in.h>
>  diff --git a/shared/nm-default.h b/shared/nm-default.h
> -index 54e9916..26e9f4e 100644
> +index ace6ede..25357da 100644
>  --- a/shared/nm-default.h
>  +++ b/shared/nm-default.h
> -@@ -211,6 +211,9 @@
> +@@ -182,6 +182,9 @@
>   #endif
>
>   #include <stdlib.h>
> @@ -82,10 +83,10 @@ index 54e9916..26e9f4e 100644
>   /**********************************************************************=
*******/
>
>  diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
> -index bd4fbcc..f70b309 100644
> +index 3bbc975..4e8a3f6 100644
>  --- a/src/devices/nm-device.c
>  +++ b/src/devices/nm-device.c
> -@@ -24,6 +24,7 @@
> +@@ -9,6 +9,7 @@
>   #include "nm-device.h"
>
>   #include <netinet/in.h>
> @@ -93,7 +94,7 @@ index bd4fbcc..f70b309 100644
>   #include <unistd.h>
>   #include <sys/ioctl.h>
>   #include <signal.h>
> -@@ -32,7 +33,6 @@
> +@@ -17,7 +18,6 @@
>   #include <arpa/inet.h>
>   #include <fcntl.h>
>   #include <linux/if_addr.h>
> @@ -102,10 +103,10 @@ index bd4fbcc..f70b309 100644
>   #include <linux/pkt_sched.h>
>
>  diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-pl=
atform.c
> -index d4b0115..22a3a90 100644
> +index 7abe4df..9f53147 100644
>  --- a/src/platform/nm-linux-platform.c
>  +++ b/src/platform/nm-linux-platform.c
> -@@ -28,7 +28,6 @@
> +@@ -14,7 +14,6 @@
>   #include <libudev.h>
>   #include <linux/fib_rules.h>
>   #include <linux/ip.h>
> @@ -113,6 +114,3 @@ index d4b0115..22a3a90 100644
>   #include <linux/if_bridge.h>
>   #include <linux/if_link.h>
>   #include <linux/if_tun.h>
> ---
> -2.17.1
> -
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.18.4.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.22.8.bb
> similarity index 77%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.18.4.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.22.8.bb
> index 27508c4d9..b26a5ce06 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.18.4.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.22.8.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "NetworkManager"
>  HOMEPAGE =3D "https://wiki.gnome.org/Projects/NetworkManager"
>  SECTION =3D "net/misc"
>
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a48=
23b \
> -                    file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fbd8=
4344a1b816cd \
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> +                    file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b3=
64516c \
>  "
>
>  DEPENDS =3D " \
> @@ -31,8 +31,8 @@ SRC_URI_append_libc-musl =3D " \
>      file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
>      file://musl/0002-Fix-build-with-musl.patch \
>  "
> -SRC_URI[md5sum] =3D "fc86588a3ae54e0d406b560a312d5a5d"
> -SRC_URI[sha256sum] =3D "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f=
51d8852b320fd05e"
> +SRC_URI[md5sum] =3D "b512b4985fe3b7e0b37fdac7ab5b8284"
> +SRC_URI[sha256sum] =3D "9511b92c72c6b5b4f063de9590ef6560696657bb6ba7d360=
676151742c7dab4f"
>
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>
> @@ -65,7 +65,7 @@ PACKAGECONFIG[systemd] =3D " \
>      --with-systemdsystemunitdir=3D${systemd_unitdir}/system --with-sessi=
on-tracking=3Dsystemd, \
>      --without-systemdsystemunitdir, \
>  "
> -PACKAGECONFIG[polkit] =3D "--enable-polkit --enable-polkit-agent,--disab=
le-polkit --disable-polkit-agent,polkit"
> +PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
>  PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,blue=
z5"
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,con=
solekit,consolekit"
> @@ -75,33 +75,47 @@ PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,pp=
p,ppp"
>  PACKAGECONFIG[dhclient] =3D "--with-dhclient=3D${base_sbindir}/dhclient,=
,,dhcp-client"
>  PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/dnsmasq"
>  PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
> -PACKAGECONFIG[glib] =3D "--with-libnm-glib,,dbus-glib-native dbus-glib"
>  PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resol=
vconf,,,resolvconf"
>  PACKAGECONFIG[gnutls] =3D "--with-crypto=3Dgnutls,,gnutls"
>  PACKAGECONFIG[wifi] =3D "--enable-wifi=3Dyes,--enable-wifi=3Dno,,wpa-sup=
plicant"
>  PACKAGECONFIG[ifupdown] =3D "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[qt4-x11-free] =3D "--enable-qt,--disable-qt,qt4-x11-free"
> +PACKAGECONFIG[cloud-setup] =3D "--with-nm-cloud-setup=3Dyes,--with-nm-cl=
oud-setup=3Dno"
>
> -PACKAGES =3D+ "libnmutil libnmglib libnmglib-vpn \
> +PACKAGES =3D+ " \
>    ${PN}-nmtui ${PN}-nmtui-doc \
> -  ${PN}-adsl \
> +  ${PN}-adsl ${PN}-cloud-setup \
>  "
>
> -FILES_libnmutil +=3D "${libdir}/libnm-util.so.*"
> -FILES_libnmglib +=3D "${libdir}/libnm-glib.so.*"
> -FILES_libnmglib-vpn +=3D "${libdir}/libnm-glib-vpn.so.*"
> +SYSTEMD_PACKAGES =3D "${PN} ${PN}-cloud-setup"
>
>  FILES_${PN}-adsl =3D "${libdir}/NetworkManager/${PV}/libnm-device-plugin=
-adsl.so"
>
> +FILES_${PN}-cloud-setup =3D " \
> +    ${libexecdir}/nm-cloud-setup \
> +    ${systemd_system_unitdir}/nm-cloud-setup.service \
> +    ${systemd_system_unitdir}/nm-cloud-setup.timer \
> +    ${libdir}/NetworkManager/dispatcher.d/90-nm-cloud-setup.sh \
> +    ${libdir}/NetworkManager/dispatcher.d/no-wait.d/90-nm-cloud-setup.sh=
 \
> +"
> +ALLOW_EMPTY_${PN}-cloud-setup =3D "1"
> +SYSTEMD_SERVICE_${PN}-cloud-setup =3D "${@bb.utils.contains('PACKAGECONF=
IG', 'cloud-setup', 'nm-cloud-setup.service nm-cloud-setup.timer', '', d)}"
> +
>  FILES_${PN} +=3D " \
>      ${libexecdir} \
>      ${libdir}/NetworkManager/${PV}/*.so \
> -    ${nonarch_libdir}/NetworkManager/VPN \
> +    ${libdir}/NetworkManager \
>      ${nonarch_libdir}/NetworkManager/conf.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-up.d \
> +    ${nonarch_libdir}/NetworkManager/dispatcher.d/no-wait.d \
> +    ${nonarch_libdir}/NetworkManager/VPN \
> +    ${nonarch_libdir}/NetworkManager/system-connections \
>      ${datadir}/polkit-1 \
>      ${datadir}/dbus-1 \
>      ${nonarch_base_libdir}/udev/* \
> -    ${systemd_unitdir}/system \
> +    ${systemd_system_unitdir} \
>      ${libdir}/pppd \
>  "
>
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

