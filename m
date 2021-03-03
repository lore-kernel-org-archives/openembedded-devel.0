Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.9538.1614790335480015209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 08:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHUjN-0004ch-1b; Wed, 03 Mar 2021 17:52:13 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1lHUjL-0004co-KE; Wed, 03 Mar 2021 17:52:11 +0100
References: <20210302124120.17357-1-u.oelmann@pengutronix.de>
 <7d53aded-45d1-c1b0-7c1d-5008f988a532@gmail.com>
User-agent: mu4e 1.4.13; emacs 28.0.50
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: update to 1.20.0
In-reply-to: <7d53aded-45d1-c1b0-7c1d-5008f988a532@gmail.com>
Date: Wed, 03 Mar 2021 17:52:11 +0100
Message-ID: <6rsg5c9o3o.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Wed, Mar 03 2021 at 05:32 +0100, Khem Raj <raj.khem@gmail.com> wrote:
> I am seeing some packaging errors
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/988

now it's getting interesting as I did not see this problem when testing
my package upgrade. Digging deeper reveals that "50-rc_keymap.conf" (the
file in question) is only conditionally installed [1] (the reason for
this can be found in the discussion starting with [2]). Nevertheless the
actual condition for installing it or not is evaluated in [3] and does
not check the target system but the build host (and this is where the
autobuilder and my build system must differ). As we use systemd v247 in
OpenEmbedded master that check should return true in our case.
Alternatively one could introduce a new configure option for installing
that file or not and by that forward the choice to the v4l-utils recipe.
Both could be achieved by a simple patch to configure.ac.

As all this is necessary to compile BPF programs for IR protocols I
would like to ask the question if this will be possible at all as one
would need to have a working clang environment for that, see [4]-[6].
Do you know by accident a competent clang expert to answer that?   ;-)
If there is no chance to get this running anyway, then it's not worth
the effort and it would be best to instead just add "--disable-bpf" to
EXTRA_OECONF and patch [1] to not install "50-rc_keymap.conf" at all.

What do you think?

Best regards
Ulrich


[1] https://git.linuxtv.org/v4l-utils.git/tree/utils/keytable/Makefile.am?=
h=3Dv4l-utils-1.20.0#n6
[2] https://github.com/systemd/systemd/issues/13787#issuecomment-645972607
[3] https://git.linuxtv.org/v4l-utils.git/tree/configure.ac?h=3Dv4l-utils-=
1.20.0#n558
[4] https://git.linuxtv.org/v4l-utils.git/tree/configure.ac?h=3Dv4l-utils-=
1.20.0#n180
[5] https://git.linuxtv.org/v4l-utils.git/tree/configure.ac?h=3Dv4l-utils-=
1.20.0#n552
[6] https://git.linuxtv.org/v4l-utils.git/tree/utils/keytable/bpf_protocol=
s/Makefile.am?h=3Dv4l-utils-1.20.0#n11

> I have sent a followup patch, but please review it and test it out if=20
> its the right way when systemd is in DISTRO_FEATURES
>
> On 3/2/21 4:41 AM, Ulrich ?lmann wrote:
>> Add new buildtime configuration options, update context of two patches =
and
>> remove two patches as there are fixes [1]-[3] found upstream in the mea=
ntime.
>>=20
>> [1] 38f4ce74275a ("keytable: use input_event properly")
>> [2] 8b7e6ce9367f ("keytable: add compatibility for input_event_sec")
>> [3] 976a2f681b4e ("keymap.h needs sys/types.h and argp.h with musl")
>>=20
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>   ...k-mc_nextgen_test-with-libargp-if-ne.patch |  2 +-
>>   ...fine-error_t-and-include-sys-types.h.patch | 45 ------------------=
-
>>   ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 -----------------
>>   .../v4l-utils/0007-Do-not-use-getsubopt.patch |  2 +-
>>   ...4l-utils_1.18.1.bb =3D> v4l-utils_1.20.0.bb} | 10 ++---
>>   5 files changed, 7 insertions(+), 93 deletions(-)
>>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005=
-Define-error_t-and-include-sys-types.h.patch
>>   delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006=
-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>>   rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.18.1.bb =3D> =
v4l-utils_1.20.0.bb} (86%)
>>=20
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib=
-test-Link-mc_nextgen_test-with-libargp-if-ne.patch b/meta-oe/recipes-multi=
media/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libarg=
p-if-ne.patch
>> index 8033fcacf200..a849d465c7bc 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-L=
ink-mc_nextgen_test-with-libargp-if-ne.patch
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-L=
ink-mc_nextgen_test-with-libargp-if-ne.patch
>> @@ -14,7 +14,7 @@ diff --git a/contrib/test/Makefile.am b/contrib/test/=
Makefile.am
>>   index 0188fe2..dac07f3 100644
>>   --- a/contrib/test/Makefile.am
>>   +++ b/contrib/test/Makefile.am
>> -@@ -40,7 +40,7 @@ sdlcam_CFLAGS =3D -I../.. $(SDL2_CFLAGS)
>> +@@ -42,7 +42,7 @@ sdlcam_CFLAGS =3D -I../.. $(SDL2_CFLAGS)
>>    sdlcam_LDADD =3D ../../lib/libv4l2/libv4l2.la  ../../lib/libv4lconve=
rt/libv4lconvert.la
>>    
>>    mc_nextgen_test_CFLAGS =3D $(LIBUDEV_CFLAGS)
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-=
error_t-and-include-sys-types.h.patch b/meta-oe/recipes-multimedia/v4l2apps=
/v4l-utils/0005-Define-error_t-and-include-sys-types.h.patch
>> deleted file mode 100644
>> index 57948add6ed4..000000000000
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0005-Define-error_t=
-and-include-sys-types.h.patch
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -From 137ce23ae677b11e5483ef810751edae7bf96bb9 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Sat, 30 Nov 2019 18:40:06 -0800
>> -Subject: [PATCH] Define error_t and include sys/types.h
>> -
>> -Fix 'unknown type name' for error_t and u_int32_t.
>> -u_int32_t is defined in sys/type.h
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - utils/ir-ctl/keymap.h   | 4 ++++
>> - utils/keytable/keymap.h | 5 +++++
>> - 2 files changed, 9 insertions(+)
>> -
>> -diff --git a/utils/ir-ctl/keymap.h b/utils/ir-ctl/keymap.h
>> -index f2b2963..1f8a3f8 100644
>> ---- a/utils/ir-ctl/keymap.h
>> -+++ b/utils/ir-ctl/keymap.h
>> -@@ -2,6 +2,10 @@
>> - #ifndef __KEYMAP_H
>> - #define __KEYMAP_H
>> -
>> -+#include <sys/types.h>
>> -+#ifndef error_t
>> -+typedef int error_t;
>> -+#endif
>> - struct keymap {
>> - =09struct keymap *next;
>> - =09char *name;
>> -diff --git a/utils/keytable/keymap.h b/utils/keytable/keymap.h
>> -index f2b2963..345d55d 100644
>> ---- a/utils/keytable/keymap.h
>> -+++ b/utils/keytable/keymap.h
>> -@@ -2,6 +2,11 @@
>> - #ifndef __KEYMAP_H
>> - #define __KEYMAP_H
>> -
>> -+#include <sys/types.h>
>> -+#ifndef error_t
>> -+typedef int error_t;
>> -+#endif
>> -+
>> - struct keymap {
>> - =09struct keymap *next;
>> - =09char *name;
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-bui=
ld-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-multimedia/v4l=
2apps/v4l-utils/0006-Fix-build-on-32bit-arches-with-64bit-time_t.patch
>> deleted file mode 100644
>> index a8926762edd2..000000000000
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0006-Fix-build-on-3=
2bit-arches-with-64bit-time_t.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From b213da2d5fcc93cd24fc880c71c717d8e2ce2968 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Sat, 30 Nov 2019 18:43:21 -0800
>> -Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
>> -
>> -time element is deprecated on new input_event structure in kernel's
>> -input.h [1]
>> -
>> -[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit?id=3D152194fe9c3f
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - utils/keytable/keytable.c | 7 ++++++-
>> - 1 file changed, 6 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
>> -index 6cb0217..59ff1ee 100644
>> ---- a/utils/keytable/keytable.c
>> -+++ b/utils/keytable/keytable.c
>> -@@ -53,6 +53,11 @@
>> -
>> - # define N_(string) string
>> -
>> -+#ifndef input_event_sec
>> -+#define input_event_sec time.tv_sec
>> -+#define input_event_usec time.tv_usec
>> -+#endif
>> -+
>> - struct input_keymap_entry_v2 {
>> - #define KEYMAP_BY_INDEX	(1 << 0)
>> - =09u_int8_t  flags;
>> -@@ -1533,7 +1538,7 @@ static void test_event(struct rc_device *rc_dev,=
 int fd)
>> -
>> - =09	for (i =3D 0; i < rd / sizeof(struct input_event); i++) {
>> - =09	=09printf(_("%ld.%06ld: event type %s(0x%02x)"),
>> --	=09	=09ev[i].time.tv_sec, ev[i].time.tv_usec,
>> -+	=09	=09ev[i].input_event_sec, ev[i].input_event_usec,
>> - =09	=09	get_event_name(events_type, ev[i].type), ev[i].type);
>> -
>> - =09	=09switch (ev[i].type) {
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-=
use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do=
-not-use-getsubopt.patch
>> index ac704c72dcac..e3ce45d1673e 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-get=
subopt.patch
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-get=
subopt.patch
>> @@ -20,7 +20,7 @@ diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/uti=
ls/v4l2-ctl/v4l2-ctl-common
>>   index 651917e..cea57b7 100644
>>   --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>   +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> -@@ -782,15 +782,17 @@ static bool parse_subset(char *optarg)
>> +@@ -785,15 +785,17 @@ static bool parse_subset(char *optarg)
>>    
>>    static bool parse_next_subopt(char **subs, char **value)
>>    {
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb b/=
meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
>> similarity index 86%
>> rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
>> rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
>> index 193335deaace..7d9664622042 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.18.1.bb
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
>> @@ -20,14 +20,14 @@ SRC_URI =3D "http://linuxtv.org/downloads/v4l-utils=
/v4l-utils-${PV}.tar.bz2 \
>>              file://mediactl-pkgconfig.patch \
>>              file://export-mediactl-headers.patch \
>>              file://0002-contrib-test-Link-mc_nextgen_test-with-libargp=
-if-ne.patch \
>> -           file://0005-Define-error_t-and-include-sys-types.h.patch \
>> -           file://0006-Fix-build-on-32bit-arches-with-64bit-time_t.pat=
ch \
>>              file://0007-Do-not-use-getsubopt.patch \
>>              "
>> -SRC_URI[md5sum] =3D "ff2dd75970683be9a301ed949b3372b3"
>> -SRC_URI[sha256sum] =3D "25fc42253722401f8742f04dc50a444dfa9b75378e7d09=
b55035bcbb44c5f342"
>> +SRC_URI[md5sum] =3D "46f9e2c0b2fdccd009da2f7e1aa87894"
>> +SRC_URI[sha256sum] =3D "956118713f7ccb405c55c7088a6a2490c32d54300dd9a3=
0d8d5008c28d3726f7"
>>  =20
>> -EXTRA_OECONF =3D "--disable-qv4l2 --enable-shared --with-udevdir=3D${b=
ase_libdir}/udev"
>> +EXTRA_OECONF =3D "--disable-qv4l2 --enable-shared --with-udevdir=3D${b=
ase_libdir}/udev \
>> +                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32 \
>> +                --with-systemdsystemunitdir=3D${systemd_system_unitdir=
}"
>>  =20
>>   VIRTUAL-RUNTIME_ir-keytable-keymaps ?=3D "rc-keymaps"
>>  =20
>>=20
>>=20
>>=20
>>=20
>>=20
>
>=20
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann           =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
