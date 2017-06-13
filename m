Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id DEF0078313
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:15:56 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u101so31713952wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UU2uBKGh5ZuwKkLY6JPSQclazBZq99tmC8HnBRDR8po=;
	b=ocikBxr+/0WVjsd8Xk9Fv/FDLoQh+DChVflIBEvi329gkc03N9I4jePFQHtxTB+ad0
	M30MRdP/HZIWDBHtXs+XLRqXTk74IKfMbMGMLQb9AOlN1C99XZ7gwgP8lk000sTKwcBQ
	LDxwBgakKRNw+f9r5pa4i83OW6U8JZMxlE3EY6L53FNwFh2BbJF0p7A5jylqVuwBc0my
	E2tOQmYHzct7RnINLcAq83/ZKNqb9FLC1Zq+HJRp8N59xyWR+vYTmAwDB8B+9X+m3Jdo
	yWn5xFmo0FuoIB7CUu0wdNH8GGWluIC922ZDz895UUWZuwNF8irMg3PkyG8VBpcKWJYu
	6p4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UU2uBKGh5ZuwKkLY6JPSQclazBZq99tmC8HnBRDR8po=;
	b=Ja2BEt2Lm2YjJdW2oiIjY9+gS9VtA04g01YEMVrMJaXYfDQxu/D3PN/BqAtSwf4pjW
	dyfXvC+kso7wCzyMcpI6cl8F+2JnOoLYHozzWrQG8uglSubVNkktMDeCyoHoKKSAa98x
	hffEl4tATWWOc7RBEZClTdwmljjKTiu/SdBNI6DB/VcbPCedDIThtkCr4aHwV3WEWfTU
	i+nKrQuFY77H3aDpQa1kJGLVM8JVV5sVJ1cJbDQMhNlruj8xeMFEIfP+0rcRB0t00CbA
	y7JDCDvNPbqm1qP8v//CdwTkXFtAEbnNEmivtpURDxosjEPDjemfvVPl1X+1JMRkALwt
	4mnA==
X-Gm-Message-State: AKS2vOzMAcnGNiyFALqYz6rJdkPaMwqonIlEdIPZm8+GsZb2ywT3CTQx
	pIMjd3GZUeJ8Rcfol6vG+X9KRDcOlQ==
X-Received: by 10.80.144.68 with SMTP id z4mr447550edz.143.1497370557468; Tue,
	13 Jun 2017 09:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20170608235641.16251-1-raj.khem@gmail.com>
	<20170613145432.GB3088@jama>
In-Reply-To: <20170613145432.GB3088@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2017 16:15:46 +0000
Message-ID: <CAMKF1sqVbstGnqiht-DaYJR-Z1PD_yPdXWcu+7k79aBCOmRFCg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V4] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Tue, 13 Jun 2017 16:15:57 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out.

On Tue, Jun 13, 2017 at 7:54 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Jun 08, 2017 at 04:56:41PM -0700, Khem Raj wrote:
> > Helps fixing build issues with gcc7
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Acked-by: Koen Kooi <koen.kooi@linaro.org>
> > Acked-by: Fathi Boudra <fathi.boudra@linaro.org>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > v2 -> v3
> > - move the LDFLAGS after CFLAGS
> > v3 -> v4
> > - Fix point-to-int incompatibilities seen on x86 with off_t being 64bit
> > - Fix printf formatting issues
>
> I'm sorry but still fails to build for qemux86:
> http://errors.yoctoproject.org/Errors/Details/145075/
> >
> >  ...01-Add-correct-printf-qualifier-for-off_t.patch | 35 ++++++++++
> >  ...e-poll.h-instead-of-deprecated-sys-poll.h.patch | 48 ++++++++++++++
> >  ...-C99-defined-format-for-printing-uint64_t.patch | 53 +++++++++++++++
> >  ...efine-__SWORD_TYPE-if-not-defined-by-libc.patch | 33 ++++++++++
> >  .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch        | 30 +++++++++
> >  ...ntptr_t-to-fix-pointer-to-int-cast-issues.patch | 76
> ++++++++++++++++++++++
> >  meta-oe/recipes-test/fwts/fwts_git.bb              | 12 +++-
> >  7 files changed, 285 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> >  create mode 100644
> meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
> >
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
> b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
> > new file mode 100644
> > index 000000000..891185de6
> > --- /dev/null
> > +++
> b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
> > @@ -0,0 +1,35 @@
> > +From 232daf5fca6fb52cced5e810f2601fe1a71b96d8 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 8 Jun 2017 16:49:50 -0700
> > +Subject: [PATCH 1/3] Add correct printf qualifier for off_t
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/bios/ebda_region/ebda_region.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/bios/ebda_region/ebda_region.c
> b/src/bios/ebda_region/ebda_region.c
> > +index 54768a95..fec04445 100644
> > +--- a/src/bios/ebda_region/ebda_region.c
> > ++++ b/src/bios/ebda_region/ebda_region.c
> > +@@ -83,7 +83,7 @@ static int ebda_test1(fwts_framework *fw)
> > +     if ((entry != NULL) &&
> > +         (entry->type == FWTS_MEMORY_MAP_RESERVED ||
> > +          entry->type == FWTS_MEMORY_MAP_ACPI)) {
> > +-            fwts_passed(fw, "EBDA region mapped at 0x%lx and reserved
> as a %" PRId64
> > ++            fwts_passed(fw, "EBDA region mapped at 0x%jdx and reserved
> as a %" PRId64
> > +                     "K region in the %s table at 0x%" PRIx64 "..0x%"
> PRIx64 ".",
> > +                     ebda_addr,
> > +                     (entry->end_address - entry->start_address) / 1024,
> > +@@ -93,7 +93,7 @@ static int ebda_test1(fwts_framework *fw)
> > +     } else
> > +             fwts_failed(fw, LOG_LEVEL_MEDIUM,
> > +                     "EBDAMappedNotReserved",
> > +-                    "EBDA region mapped at 0x%lx but not reserved in
> the %s table.",
> > ++                    "EBDA region mapped at 0x%jdx but not reserved in
> the %s table.",
> > +                     ebda_addr, memory_map_name);
> > +
> > +     return FWTS_OK;
> > +--
> > +2.13.1
> > +
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> > new file mode 100644
> > index 000000000..8ad078936
> > --- /dev/null
> > +++
> b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
> > @@ -0,0 +1,48 @@
> > +From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 6 Jun 2017 07:25:09 -0700
> > +Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/lib/src/fwts_ipmi.c   | 3 ++-
> > + src/lib/src/fwts_pipeio.c | 2 +-
> > + 2 files changed, 3 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
> > +index cbb27611..70d11cfa 100644
> > +--- a/src/lib/src/fwts_ipmi.c
> > ++++ b/src/lib/src/fwts_ipmi.c
> > +@@ -18,10 +18,11 @@
> > +  *
> > +  */
> > +
> > ++#include <poll.h>
> > ++
> > + #include <sys/types.h>
> > + #include <sys/stat.h>
> > + #include <fcntl.h>
> > +-#include <sys/poll.h>
> > + #include <sys/ioctl.h>
> > + #include <linux/ipmi.h>
> > +
> > +diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
> > +index fd719640..bdc5b2ea 100644
> > +--- a/src/lib/src/fwts_pipeio.c
> > ++++ b/src/lib/src/fwts_pipeio.c
> > +@@ -30,9 +30,9 @@
> > + #include <stdlib.h>
> > + #include <string.h>
> > + #include <paths.h>
> > ++#include <poll.h>
> > +
> > + #include <sys/param.h>
> > +-#include <sys/poll.h>
> > + #include <sys/types.h>
> > + #include <sys/wait.h>
> > + #include <errno.h>
> > +--
> > +2.13.0
> > +
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
> b/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
> > new file mode 100644
> > index 000000000..35ce883a2
> > --- /dev/null
> > +++
> b/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
> > @@ -0,0 +1,53 @@
> > +From 25f18b9ac37960dc12a3b648a5c866bd56ef2cbe Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 8 Jun 2017 16:50:23 -0700
> > +Subject: [PATCH 2/3] Add C99 defined format for printing uint64_t
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/opal/reserv_mem.c | 8 ++++----
> > + 1 file changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/opal/reserv_mem.c b/src/opal/reserv_mem.c
> > +index eeec2947..f0672e05 100644
> > +--- a/src/opal/reserv_mem.c
> > ++++ b/src/opal/reserv_mem.c
> > +@@ -185,7 +185,7 @@ static int reserv_mem_limits_test(fwts_framework
> *fw)
> > +             regions[j].start = (uint64_t)be64toh(ranges[2 * j]);
> > +             regions[j].len = (uint64_t)be64toh(ranges[2 * j + 1]);
> > +             fwts_log_info(fw, "Region name %80s"
> > +-                    " start: 0x%08lx, len: 0x%08lx\n",
> > ++                    " start: 0x%08" PRIx64 ", len: 0x%08" PRIx64 "\n",
> > +                     regions[j].name, regions[j].start, regions[j].len);
> > +     }
> > +
> > +@@ -248,7 +248,7 @@ static int reserv_mem_limits_test(fwts_framework
> *fw)
> > +                             fwts_failed(fw, LOG_LEVEL_MEDIUM,
> > +                                     "ImageSizeMismatch",
> > +                                     "Mismatch in homer-image size, "
> > +-                                    "expected: 0x%lx, actual: 0x%lx",
> > ++                                    "expected: 0x%" PRIx64 ", actual:
> 0x%" PRIx64 "",
> > +                                     configstruct.homer,
> regions[j].len);
> > +                             ok = false;
> > +                     } else
> > +@@ -261,7 +261,7 @@ static int reserv_mem_limits_test(fwts_framework
> *fw)
> > +                             fwts_failed(fw, LOG_LEVEL_MEDIUM,
> > +                                     "ImageSizeMismatch",
> > +                                     "Mismatch in slw-image size, "
> > +-                                    "expected: 0x%lx, actual: 0x%lx",
> > ++                                    "expected: 0x%" PRIx64 ", actual:
> 0x%" PRIx64 "",
> > +                                     configstruct.slw, regions[j].len);
> > +                             ok = false;
> > +                     } else
> > +@@ -274,7 +274,7 @@ static int reserv_mem_limits_test(fwts_framework
> *fw)
> > +                             fwts_failed(fw, LOG_LEVEL_MEDIUM,
> > +                                     "ImageSizeMismatch",
> > +                                     "Mismatch in occ-common-area size,
> "
> > +-                                    "expected: 0x%lx, actual: 0x%lx",
> > ++                                    "expected: 0x%" PRIx64", actual:
> 0x%" PRIx64"",
> > +                                     configstruct.occ_common,
> > +                                     regions[j].len);
> > +                             ok = false;
> > +--
> > +2.13.1
> > +
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> > new file mode 100644
> > index 000000000..3b83ca57c
> > --- /dev/null
> > +++
> b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> > @@ -0,0 +1,33 @@
> > +From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 6 Jun 2017 07:37:20 -0700
> > +Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
> > +
> > +__SWORD_TYPE is internal to glibc, therefore
> > +check and define it if needed e.g. on musl
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/lib/src/fwts_uefi.c | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
> > +index 1f9d31fa..2d925f8d 100644
> > +--- a/src/lib/src/fwts_uefi.c
> > ++++ b/src/lib/src/fwts_uefi.c
> > +@@ -59,6 +59,10 @@ typedef struct {
> > + #define UEFI_IFACE_SYSFS            (2)     /* sysfs */
> > + #define UEFI_IFACE_EFIVARS          (3)     /* efivar fs */
> > +
> > ++#ifndef __SWORD_TYPE
> > ++typedef __typeof__( ((struct statfs *)0)->f_type )  __SWORD_TYPE;
> > ++#endif
> > ++
> > + /* File system magic numbers */
> > + #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
> > + #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
> > +--
> > +2.13.0
> > +
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> > new file mode 100644
> > index 000000000..f84fbffd8
> > --- /dev/null
> > +++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
> > @@ -0,0 +1,30 @@
> > +From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 6 Jun 2017 07:39:28 -0700
> > +Subject: [PATCH 3/3] Undefine PAGE_SIZE
> > +
> > +musl defines PAGE_SIZE and build complains
> > +of multiple definitions
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/lib/src/fwts_acpi_tables.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/src/lib/src/fwts_acpi_tables.c
> b/src/lib/src/fwts_acpi_tables.c
> > +index 1d4fc705..71023ad2 100644
> > +--- a/src/lib/src/fwts_acpi_tables.c
> > ++++ b/src/lib/src/fwts_acpi_tables.c
> > +@@ -42,6 +42,7 @@
> > + #define BIOS_START  (0x000e0000)            /* Start of BIOS memory */
> > + #define BIOS_END    (0x000fffff)            /* End of BIOS memory */
> > + #define BIOS_LENGTH (BIOS_END - BIOS_START) /* Length of BIOS memory */
> > ++#undef PAGE_SIZE
> > + #define PAGE_SIZE   (4096)
> > +
> > + static fwts_acpi_table_info tables[ACPI_MAX_TABLES];
> > +--
> > +2.13.0
> > +
> > diff --git
> a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
> b/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
> > new file mode 100644
> > index 000000000..3cd3fbbc1
> > --- /dev/null
> > +++
> b/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
> > @@ -0,0 +1,76 @@
> > +From d0d76820efe51dd404d381fc4c46544008e757dd Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 8 Jun 2017 16:50:59 -0700
> > +Subject: [PATCH 3/3] use intptr_t to fix pointer-to-int-cast issues
> > +
> > +uintptr_t is guaranteed to be wide enough that
> > +converting a void* to uintptr_t and back again
> > +will yield the original pointer value
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/lib/src/fwts_acpi_tables.c | 4 ++--
> > + src/lib/src/fwts_mmap.c        | 2 +-
> > + src/lib/src/fwts_smbios.c      | 4 ++--
> > + 3 files changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/src/lib/src/fwts_acpi_tables.c
> b/src/lib/src/fwts_acpi_tables.c
> > +index 832f8d66..d0006529 100644
> > +--- a/src/lib/src/fwts_acpi_tables.c
> > ++++ b/src/lib/src/fwts_acpi_tables.c
> > +@@ -150,7 +150,7 @@ static fwts_acpi_table_rsdp
> *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
> > +     fwts_acpi_table_rsdp *rsdp = NULL;
> > +     *rsdp_len = 0;
> > +
> > +-    if ((mem = fwts_mmap((off_t)addr, sizeof(fwts_acpi_table_rsdp)))
> == FWTS_MAP_FAILED)
> > ++    if ((mem = fwts_mmap((uintptr_t)addr,
> sizeof(fwts_acpi_table_rsdp))) == FWTS_MAP_FAILED)
> > +             return NULL;
> > +
> > +     if (fwts_safe_memread(mem, sizeof(fwts_acpi_table_rsdp)) !=
> FWTS_OK) {
> > +@@ -456,7 +456,7 @@ static int
> fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
> > +     if ((rsdp = fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) == NULL)
> > +             return FWTS_ERROR;
> > +
> > +-    fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(off_t)rsdp_addr,
> rsdp_len, FWTS_ACPI_TABLE_FROM_FIRMWARE);
> > ++    fwts_acpi_add_table("RSDP", rsdp, (uint64_t)(uintptr_t)rsdp_addr,
> rsdp_len, FWTS_ACPI_TABLE_FROM_FIRMWARE);
> > +
> > +     /* Load any tables from XSDT if it's valid */
> > +     if (rsdp->xsdt_address) {
> > +diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
> > +index a09f688e..9fe6329a 100644
> > +--- a/src/lib/src/fwts_mmap.c
> > ++++ b/src/lib/src/fwts_mmap.c
> > +@@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
> > +     off_t offset;
> > +
> > +     page_size = fwts_page_size();
> > +-    offset = ((off_t)(mem)) & (page_size - 1);
> > ++    offset = ((uintptr_t)(mem)) & (page_size - 1);
> > +
> > +     if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
> > +             return FWTS_ERROR;
> > +diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
> > +index 8d0ea39b..63b4bf25 100644
> > +--- a/src/lib/src/fwts_smbios.c
> > ++++ b/src/lib/src/fwts_smbios.c
> > +@@ -54,7 +54,7 @@ static void
> *fwts_smbios_find_entry_uefi(fwts_framework *fw, fwts_smbios_entry *
> > +     if ((addr = fwts_scan_efi_systab("SMBIOS")) != NULL) {
> > +             fwts_smbios_entry *mapped_entry;
> > +
> > +-            if ((mapped_entry = fwts_mmap((off_t)addr,
> sizeof(fwts_smbios_entry))) != FWTS_MAP_FAILED) {
> > ++            if ((mapped_entry = fwts_mmap((uintptr_t)addr,
> sizeof(fwts_smbios_entry))) != FWTS_MAP_FAILED) {
> > +                     *entry = *mapped_entry;
> > +                     (void)fwts_munmap(mapped_entry,
> sizeof(fwts_smbios_entry));
> > +                     *type  = FWTS_SMBIOS;
> > +@@ -84,7 +84,7 @@ static void
> *fwts_smbios30_find_entry_uefi(fwts_framework *fw, fwts_smbios30_ent
> > +     if ((addr = fwts_scan_efi_systab("SMBIOS3")) != NULL) {
> > +             fwts_smbios30_entry *mapped_entry;
> > +
> > +-            if ((mapped_entry = fwts_mmap((off_t)addr,
> sizeof(fwts_smbios30_entry))) != FWTS_MAP_FAILED) {
> > ++            if ((mapped_entry = fwts_mmap((uintptr_t)addr,
> sizeof(fwts_smbios30_entry))) != FWTS_MAP_FAILED) {
> > +                     *entry = *mapped_entry;
> > +                     (void)fwts_munmap(mapped_entry,
> sizeof(fwts_smbios30_entry));
> > +                     return addr;
> > +--
> > +2.13.1
> > +
> > diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb
> b/meta-oe/recipes-test/fwts/fwts_git.bb
> > index 4c4ae66d6..87a23af19 100644
> > --- a/meta-oe/recipes-test/fwts/fwts_git.bb
> > +++ b/meta-oe/recipes-test/fwts/fwts_git.bb
> > @@ -5,11 +5,17 @@ HOMEPAGE = "
> https://wiki.ubuntu.com/Kernel/Reference/fwts"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM =
> "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
> >
> > -PV = "17.03.00"
> > +PV = "17.03.00+git${SRCPV}"
> >
> > -SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
> > +SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
> >  SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
> >
>  file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
> > +
>  file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
> > +           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
> \
> > +           file://0003-Undefine-PAGE_SIZE.patch \
> > +           file://0001-Add-correct-printf-qualifier-for-off_t.patch \
> > +
>  file://0002-Add-C99-defined-format-for-printing-uint64_t.patch \
> > +
>  file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
> >             "
> >
> >  S = "${WORKDIR}/git"
> > @@ -17,10 +23,12 @@ S = "${WORKDIR}/git"
> >  COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
> >
> >  DEPENDS = "libpcre json-c glib-2.0 dtc"
> > +DEPENDS_append_libc-musl = " libexecinfo"
> >
> >  inherit autotools pkgconfig
> >
> >  CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
> > +LDFLAGS_append_libc-musl = " -lexecinfo"
> >
> >  FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
> >  FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV}
> ${libdir}/fwts/lib*.la"
> > --
> > 2.13.1
> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

