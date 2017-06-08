Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4301780FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 08:08:56 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id v104so15036037wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jun 2017 01:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xg2ante7+IJ3AHRk8p6DrAFocPyvcHxFb9R6RxuoNzY=;
	b=aDwX+cRV25ZqrrdheEzjonLk3n9Kcd2P3CJMNCXIvjSLHN1+q4jT7SWsM9qYmE3Egh
	YL43ty7KOL+LkjgqipazHDH7JZsTuVbiIRjzjDaw2iXkEVOkS+o+xkiAajVrYv+iG5QA
	Eufrz02l1WyLNQPUOOTkzsO587PNXKJhFqPkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xg2ante7+IJ3AHRk8p6DrAFocPyvcHxFb9R6RxuoNzY=;
	b=jKSaQzcffQDVnb0d/akuJJxt69Q7qcNVU0tNPlD/AsLcbb26HNsb2Lh3FCKMe/6s+N
	F++J/itmTTqPubyI2J7ZQImMESRoIn66EAL22neqXD4mDJmLfCXW/USNyowr0NcSCOvh
	r2XcibKmQaDThYGTV6TRM4qOaZ6A5y/AWYM3PAeRmbKUKyjmf0R9RJClic11n8stcSJ3
	dHlQdrPOkG229BWOBL0t2ZvhUuG3R9DNDrNveXBYAjRmkBaEymPTP0VjdQC9jiWf+MdE
	cJmnQbY1d6aTIemSXhjSJdyGMuP5mvcEezijkWLcwMEICerpTiirTmgZA5x2Ae8LrpH+
	86ww==
X-Gm-Message-State: AODbwcCM6Lj/MKyb55XTEIWDXGJ/P3tqQPNV+ldZBa4Vq0J5ZMLTtQ9I
	JAcv58VnVvjHB1C6XVGvpy2gYJyI+5TPoXTY/A==
X-Received: by 10.223.129.183 with SMTP id 52mr11696328wra.71.1496909336942;
	Thu, 08 Jun 2017 01:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.7 with HTTP; Thu, 8 Jun 2017 01:08:56 -0700 (PDT)
In-Reply-To: <ohb0gs$of9$1@blaine.gmane.org>
References: <20170608051111.28630-1-raj.khem@gmail.com>
	<ohb0gs$of9$1@blaine.gmane.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 8 Jun 2017 11:08:56 +0300
Message-ID: <CAGNsrLADRzxdWYu62K+hNe_xFURuv86VvGL7Ovy6GOPZJ8SL8g@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V3] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Thu, 08 Jun 2017 08:08:57 -0000
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 11:05, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 08-06-17 om 07:11 schreef Khem Raj:
>> Helps fixing build issues with gcc7
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Acked-by: Koen Kooi <koen.kooi@linaro.org>

Acked-by: Fathi Boudra <fathi.boudra@linaro.org>

>> ---
>> v2 -> v3
>> - move the LDFLAGS after CFLAGS
>>
>>  ...e-poll.h-instead-of-deprecated-sys-poll.h.patch | 48 ++++++++++++++++++++++
>>  ...efine-__SWORD_TYPE-if-not-defined-by-libc.patch | 33 +++++++++++++++
>>  .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch        | 30 ++++++++++++++
>>  meta-oe/recipes-test/fwts/fwts_git.bb              |  9 +++-
>>  4 files changed, 118 insertions(+), 2 deletions(-)
>>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
>>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
>>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
>>
>> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
>> new file mode 100644
>> index 000000000..8ad078936
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
>> @@ -0,0 +1,48 @@
>> +From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 6 Jun 2017 07:25:09 -0700
>> +Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/lib/src/fwts_ipmi.c   | 3 ++-
>> + src/lib/src/fwts_pipeio.c | 2 +-
>> + 2 files changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
>> +index cbb27611..70d11cfa 100644
>> +--- a/src/lib/src/fwts_ipmi.c
>> ++++ b/src/lib/src/fwts_ipmi.c
>> +@@ -18,10 +18,11 @@
>> +  *
>> +  */
>> +
>> ++#include <poll.h>
>> ++
>> + #include <sys/types.h>
>> + #include <sys/stat.h>
>> + #include <fcntl.h>
>> +-#include <sys/poll.h>
>> + #include <sys/ioctl.h>
>> + #include <linux/ipmi.h>
>> +
>> +diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
>> +index fd719640..bdc5b2ea 100644
>> +--- a/src/lib/src/fwts_pipeio.c
>> ++++ b/src/lib/src/fwts_pipeio.c
>> +@@ -30,9 +30,9 @@
>> + #include <stdlib.h>
>> + #include <string.h>
>> + #include <paths.h>
>> ++#include <poll.h>
>> +
>> + #include <sys/param.h>
>> +-#include <sys/poll.h>
>> + #include <sys/types.h>
>> + #include <sys/wait.h>
>> + #include <errno.h>
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
>> new file mode 100644
>> index 000000000..3b83ca57c
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
>> @@ -0,0 +1,33 @@
>> +From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 6 Jun 2017 07:37:20 -0700
>> +Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
>> +
>> +__SWORD_TYPE is internal to glibc, therefore
>> +check and define it if needed e.g. on musl
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/lib/src/fwts_uefi.c | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
>> +index 1f9d31fa..2d925f8d 100644
>> +--- a/src/lib/src/fwts_uefi.c
>> ++++ b/src/lib/src/fwts_uefi.c
>> +@@ -59,6 +59,10 @@ typedef struct {
>> + #define UEFI_IFACE_SYSFS            (2)     /* sysfs */
>> + #define UEFI_IFACE_EFIVARS          (3)     /* efivar fs */
>> +
>> ++#ifndef __SWORD_TYPE
>> ++typedef __typeof__( ((struct statfs *)0)->f_type )  __SWORD_TYPE;
>> ++#endif
>> ++
>> + /* File system magic numbers */
>> + #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
>> + #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
>> new file mode 100644
>> index 000000000..f84fbffd8
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
>> @@ -0,0 +1,30 @@
>> +From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 6 Jun 2017 07:39:28 -0700
>> +Subject: [PATCH 3/3] Undefine PAGE_SIZE
>> +
>> +musl defines PAGE_SIZE and build complains
>> +of multiple definitions
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/lib/src/fwts_acpi_tables.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
>> +index 1d4fc705..71023ad2 100644
>> +--- a/src/lib/src/fwts_acpi_tables.c
>> ++++ b/src/lib/src/fwts_acpi_tables.c
>> +@@ -42,6 +42,7 @@
>> + #define BIOS_START  (0x000e0000)            /* Start of BIOS memory */
>> + #define BIOS_END    (0x000fffff)            /* End of BIOS memory */
>> + #define BIOS_LENGTH (BIOS_END - BIOS_START) /* Length of BIOS memory */
>> ++#undef PAGE_SIZE
>> + #define PAGE_SIZE   (4096)
>> +
>> + static fwts_acpi_table_info tables[ACPI_MAX_TABLES];
>> +--
>> +2.13.0
>> +
>> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
>> index 4c4ae66d6..d00aefbf8 100644
>> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
>> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
>> @@ -5,11 +5,14 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>>  LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
>>
>> -PV = "17.03.00"
>> +PV = "17.03.00+git${SRCPV}"
>>
>> -SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
>> +SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
>>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
>>             file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
>> +           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
>> +           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
>> +           file://0003-Undefine-PAGE_SIZE.patch \
>>             "
>>
>>  S = "${WORKDIR}/git"
>> @@ -17,10 +20,12 @@ S = "${WORKDIR}/git"
>>  COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
>>
>>  DEPENDS = "libpcre json-c glib-2.0 dtc"
>> +DEPENDS_append_libc-musl = " libexecinfo"
>>
>>  inherit autotools pkgconfig
>>
>>  CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
>> +LDFLAGS_append_libc-musl = " -lexecinfo"
>>
>>  FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
>>  FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
>>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

