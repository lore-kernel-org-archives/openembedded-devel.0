Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id EBCF478EEA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:08:23 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id f16-v6so1510264wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tGmDXVH6RyKHUgpQeL6IBLc6dMGHyrOmPWAY0CPDVIw=;
	b=T8Mr0gFD4+9jnzhkj33ZBSkTyBBLp41SFwu5xsf5uBIdW5FSWW6rO/xpYacVxvzOUj
	2Se0nfoq1UpXSw2U+yVtMg4fsnCGf5qzHMcVLtUUbCBGouibl/SXvKCalzPrZax8UKOh
	x5chmHXHJYeaNn/968Knl8/ftno3Kqyu8Y5zex20n75wH14D50M1a5AKRK/sc+RyL7xE
	8dxjPlTqpwPPQhEXqgCYN6XG7v+0bna/QqvHZkBURViauu6my9LZnPCwfoDlwpbXh4Vg
	KxtDYrLhj+tONz7BxTMdwAewVyfD7DOphhMgX5+9VcDHJ/CPKmncX8MITy1OF/PTdc7I
	6UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tGmDXVH6RyKHUgpQeL6IBLc6dMGHyrOmPWAY0CPDVIw=;
	b=FghS9VzXaQTqqQhheSXNm4ZvqI8gBnVcKtv/FAB3wjTnNbSR/ITuBxwmVnIi9pAmMK
	BiOiyQeUW3aRfSk69gZZgNK32yilMKl4BuCShqweX3PBbL35Z+VwPQWMUsQfhr05G9vj
	TcazZB/nTHgk7yP7r3uPmoDsIihQv7dQOjgaOXkvGWKA39cB95w5TaKHcaNW8aC+tC8M
	L8sCtFNx7kz/0+Bst7XiFKvyozoD0FGKXtM1NBOzDr8xuka4MfRduPI27QLjypNQcKTK
	3Lvz/a4Mao7RG31Bw8AKvLbAf3SxMp3R7zTP+lmhcP9b6fJuT29l3NC8UOK/m1qCfrQI
	KV2w==
X-Gm-Message-State: APt69E1e1bUqHqTUpwsooJzppUVBeM6nzvH8grrFte0CV8RydbbIe5Bm
	ZmT+0tLruqVtu0x5bxfVlTrsyJ7id1IMgKxC5RE=
X-Google-Smtp-Source: ADUXVKKYSrJWDj9DbPQe297ycd3znQ179DuA66z28ekUqhakgSoMiQiXS4KPTTWhl3xGy//hLSCVd4QjMSh6AKZklDI=
X-Received: by 2002:adf:9561:: with SMTP id
	88-v6mr2920260wrs.223.1528873704659; 
	Wed, 13 Jun 2018 00:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180320040000.29408-1-raj.khem@gmail.com>
	<20180320040000.29408-5-raj.khem@gmail.com>
	<CA+chaQfdwRNDF6PdY3wY7rk0+Es2g_9RxRi4+cS_wnzRAZdsZA@mail.gmail.com>
In-Reply-To: <CA+chaQfdwRNDF6PdY3wY7rk0+Es2g_9RxRi4+cS_wnzRAZdsZA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Jun 2018 09:08:14 +0200
Message-ID: <CA+chaQfTjcu1sS2U5hMA=2qOMzJfrevYxxVDSc8hP4yNj-5OEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 13 Jun 2018 07:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am i the only one seeing this failure?

I've reverted this upgrade back then and forgot about it.

On Sat, Mar 31, 2018 at 8:04 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> This version fails for me in world builds:
>
> configure: Enabling inter-library dependencies:
> checking whether GCC supports __attribute__((section()) + ld supports
> orphan sections... yes
> checking whether linker emits global boundary symbols for orphan
> sections... no
> checking whether linker workaround for orphan sections usable... no
> configure: error: Would use section attribute, cannot; see
> --enable-nosection-fallback
>
> On Tue, Mar 20, 2018 at 4:59 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Drop upstreamed patch
>> Backport another patch to fix out of tree build regression
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43 ---------------=
--
>>  ...onfigure-script-neglecting-re-enable-out-.patch | 56
>> ++++++++++++++++++++++
>>  .../libqb/{libqb_1.0.2.bb =3D> libqb_1.0.3.bb}       |  6 ++-
>>  3 files changed, 60 insertions(+), 45 deletions(-)
>>  delete mode 100644
>> meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK=
_MONOTONIC.patch
>>  create mode 100644
>> meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-neg=
lecting-re-enable-out-.patch
>>  rename meta-oe/recipes-extended/libqb/{libqb_1.0.2.bb =3D> libqb_1.0.3.=
bb}
>> (77%)
>>
>> diff --git
>> a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLO=
CK_MONOTONIC.patch
>> b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLO=
CK_MONOTONIC.patch
>> deleted file mode 100644
>> index 28bc5c07d..000000000
>> ---
>> a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLO=
CK_MONOTONIC.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 29 Mar 2017 16:31:38 -0700
>> -Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
>> -
>> -Does not work during cross compile
>> -
>> -use a compile-time check to detect whether the
>> -monotonic clock is available. This check can run just fine when we are
>> -cross-compiling.
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - configure.ac | 12 ++++++++++--
>> - 1 file changed, 10 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index fa13ae6..f4f0f46 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>> -                  )
>> -
>> - AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
>> --AC_RUN_IFELSE([AC_LANG_PROGRAM(
>> -+AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
>> - [[#include <time.h>]],
>> --[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return
>> -1;]])],
>> -+[[
>> -+#include <unistd.h>
>> -+int main() {
>> -+#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >=3D 0=
 &&
>> defined(CLOCK_MONOTONIC))
>> -+        #error No monotonic clock
>> -+#endif
>> -+    return 0;
>> -+
>> -+]])],
>> -                     [
>> -                       AC_MSG_RESULT([yes])
>> -                       AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC]=
,
>> 1, [Define to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
>> ---
>> -2.12.1
>> -
>> diff --git
>> a/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-n=
eglecting-re-enable-out-.patch
>> b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-n=
eglecting-re-enable-out-.patch
>> new file mode 100644
>> index 000000000..c82f3bf01
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-script-n=
eglecting-re-enable-out-.patch
>> @@ -0,0 +1,56 @@
>> +From 73d2aea33e32272bac693550e8a3b0e3ad89707f Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Jan=3D20Pokorn=3DC3=3DBD?=3D <jpokorny@redhat.com>
>> +Date: Tue, 26 Dec 2017 00:02:26 +0100
>> +Subject: [PATCH] build: fix configure script neglecting, re-enable
>> out-of-tree
>> + builds
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +For the former, a prototype and the final code got (hm, mysteriously)
>> +intertwisted.  For the latter, I am clearly guilty of (rare, anyway)
>> +testing of the out-of-tree builds only with libqb-already-system-wide
>> +scenario, which is rather shortsighted.
>> +
>> +Thanks Fabio and his ci.kronosnet.org project for spotting that.
>> +
>> +X-mas-present-for: Fabio M. Di Nitto <fdinitto@redhat.com>
>> +Signed-off-by: Jan Pokorn=C3=BD <jpokorny@redhat.com>
>> +---
>> +Upstream-Status: Backport
>> +
>> + configure.ac    | 2 +-
>> + lib/Makefile.am | 4 +++-
>> + 2 files changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 9900310..f9761cc 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -710,7 +710,7 @@ if test "x${GCC}" =3D xyes; then
>> +                                             | grep __stop___verbose |
>> cut -d" " -f 3)
>> +                        test "${verbose_start_addr}" =3D
>> "${verbose_stop_addr}" \
>> +                          && gcc_has_attribute_section_visible=3Dno \
>> +-                         || { verbose_start_type=3D$(${READELF} -s bac=
kup
>> \
>> ++                         || { verbose_start_type=3D$(${READELF} -s
>> "conftest${shrext_cmds}" \
>> +                                                    | sed -n
>> '/__start___verbose/{s/^\s*//p;q}' \
>> +                                                    | tr -s ' ' \
>> +                                                    | cut -d" " -f6)
>> +diff --git a/lib/Makefile.am b/lib/Makefile.am
>> +index 6ca6b15..b035f0b 100644
>> +--- a/lib/Makefile.am
>> ++++ b/lib/Makefile.am
>> +@@ -101,7 +101,9 @@ endif
>> + endif
>> +
>> + qblog_script.ld: %.ld: %.ld.in
>> +-      $(AM_V_GEN)$(CPP) -xc -I$(top_srcdir)/include -D_GNU_SOURCE -C -=
P
>> $< \
>> ++      $(AM_V_GEN)$(CPP) -C -D_GNU_SOURCE -P \
>> ++        -I$(top_srcdir)/include -I$(top_builddir)/include \
>> ++        -xc $< \
>> +         | sed -n "/$$(sed -n '/^[^#]/{s/[*\/]/\\&/g;p;q;}' $<)/,$$ p" =
\
>> +         > $@
>> +
>> +--
>> +2.16.2
>> +
>> diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>> b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>> similarity index 77%
>> rename from meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>> rename to meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>> index 574f6601c..73cea5e39 100644
>> --- a/meta-oe/recipes-extended/libqb/libqb_1.0.2.bb
>> +++ b/meta-oe/recipes-extended/libqb/libqb_1.0.3.bb
>> @@ -11,12 +11,14 @@ inherit autotools pkgconfig
>>
>>  PV .=3D "+git${SRCPV}"
>>
>> -SRCREV =3D "608de6d59a3de0eef0fbcbd8f284acbc018daa9a"
>> +# v1.0.3
>> +SRCREV =3D "28dff090c74b6ba8609c4797294a5afe3fe73987"
>>  SRC_URI =3D "git://github.com/ClusterLabs/${BPN}.git
>> <http://github.com/ClusterLabs/$%7BBPN%7D.git> \
>> -           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
>> +
>>  file://0001-build-fix-configure-script-neglecting-re-enable-out-.patch =
\
>>            "
>>  S =3D "${WORKDIR}/git"
>>
>> +CFLAGS +=3D "-pthread -D_REENTRANT"
>>  do_configure_prepend() {
>>      ( cd ${S}
>>      ${S}/autogen.sh )
>> --
>> 2.16.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

