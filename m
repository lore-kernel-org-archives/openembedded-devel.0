Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE7371A8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 06:55:33 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1dIUsK-00045S-3N for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jun 2017 08:55:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 7 Jun 2017 08:55:25 +0200
Message-ID: <oh880o$dpo$1@blaine.gmane.org>
References: <20170606145026.4204-1-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <20170606145026.4204-1-raj.khem@gmail.com>
Subject: Re: [meta-oe][PATCH V2 1/3] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Wed, 07 Jun 2017 06:55:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 06-06-17 om 16:50 schreef Khem Raj:
> Helps fixing build issues with gcc7
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...e-poll.h-instead-of-deprecated-sys-poll.h.patch | 48 ++++++++++++++++++++++
>  ...efine-__SWORD_TYPE-if-not-defined-by-libc.patch | 33 +++++++++++++++
>  .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch        | 30 ++++++++++++++
>  meta-oe/recipes-test/fwts/fwts_git.bb              |  9 +++-
>  4 files changed, 118 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
>  create mode 100644 meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> 
> diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> new file mode 100644
> index 000000000..8ad078936
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> @@ -0,0 +1,48 @@
> +From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:25:09 -0700
> +Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_ipmi.c   | 3 ++-
> + src/lib/src/fwts_pipeio.c | 2 +-
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
> +index cbb27611..70d11cfa 100644
> +--- a/src/lib/src/fwts_ipmi.c
> ++++ b/src/lib/src/fwts_ipmi.c
> +@@ -18,10 +18,11 @@
> +  *
> +  */
> + 
> ++#include <poll.h>
> ++
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <fcntl.h>
> +-#include <sys/poll.h>
> + #include <sys/ioctl.h>
> + #include <linux/ipmi.h>
> + 
> +diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
> +index fd719640..bdc5b2ea 100644
> +--- a/src/lib/src/fwts_pipeio.c
> ++++ b/src/lib/src/fwts_pipeio.c
> +@@ -30,9 +30,9 @@
> + #include <stdlib.h>
> + #include <string.h>
> + #include <paths.h>
> ++#include <poll.h>
> + 
> + #include <sys/param.h>
> +-#include <sys/poll.h>
> + #include <sys/types.h>
> + #include <sys/wait.h>
> + #include <errno.h>
> +-- 
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> new file mode 100644
> index 000000000..3b83ca57c
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> @@ -0,0 +1,33 @@
> +From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:37:20 -0700
> +Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
> +
> +__SWORD_TYPE is internal to glibc, therefore
> +check and define it if needed e.g. on musl
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_uefi.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
> +index 1f9d31fa..2d925f8d 100644
> +--- a/src/lib/src/fwts_uefi.c
> ++++ b/src/lib/src/fwts_uefi.c
> +@@ -59,6 +59,10 @@ typedef struct {
> + #define UEFI_IFACE_SYSFS		(2)	/* sysfs */
> + #define UEFI_IFACE_EFIVARS		(3)	/* efivar fs */
> + 
> ++#ifndef __SWORD_TYPE
> ++typedef __typeof__( ((struct statfs *)0)->f_type )	__SWORD_TYPE;
> ++#endif
> ++
> + /* File system magic numbers */
> + #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
> + #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
> +-- 
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> new file mode 100644
> index 000000000..f84fbffd8
> --- /dev/null
> +++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> @@ -0,0 +1,30 @@
> +From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 6 Jun 2017 07:39:28 -0700
> +Subject: [PATCH 3/3] Undefine PAGE_SIZE
> +
> +musl defines PAGE_SIZE and build complains
> +of multiple definitions
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/lib/src/fwts_acpi_tables.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
> +index 1d4fc705..71023ad2 100644
> +--- a/src/lib/src/fwts_acpi_tables.c
> ++++ b/src/lib/src/fwts_acpi_tables.c
> +@@ -42,6 +42,7 @@
> + #define BIOS_START	(0x000e0000)		/* Start of BIOS memory */
> + #define BIOS_END  	(0x000fffff)		/* End of BIOS memory */
> + #define BIOS_LENGTH	(BIOS_END - BIOS_START)	/* Length of BIOS memory */
> ++#undef PAGE_SIZE
> + #define PAGE_SIZE	(4096)
> + 
> + static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
> +-- 
> +2.13.0
> +
> diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
> index 4c4ae66d6..6e83c3a20 100644
> --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> @@ -5,11 +5,14 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
>  
> -PV = "17.03.00"
> +PV = "17.03.00+git${SRCPV}"
>  
> -SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
> +SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
>  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
>             file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
> +           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
> +           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
> +           file://0003-Undefine-PAGE_SIZE.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> @@ -17,6 +20,8 @@ S = "${WORKDIR}/git"
>  COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
>  
>  DEPENDS = "libpcre json-c glib-2.0 dtc"
> +DEPENDS_append_libc-musl = " libexecinfo"
> +LDFLAGS_append_libc-musl = " -lexecinfo"

Can you move the LDFLAGS to a more obvious like, like next to do_compile?



