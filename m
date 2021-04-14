Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13488.1618409245183762494
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 877F211D4
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:07:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13C453F694
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:07:22 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fwts: upgrade to 21.03.00
Date: Wed, 14 Apr 2021 15:07:20 +0100
Message-Id: <20210414140720.3121004-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rebase the musl patches.

Drop json-c dependency as this is no longer used.

Drop FILES_${PN}-dbg packaging as this happens magically now.

Drop -Wno-error CFLAGS as we patch out -Werror entirely.

Add dtc RDEPENDS as this is needed at runtime.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...d-correct-printf-qualifier-for-off_t.patch | 20 ++++++----
 ....h-instead-of-deprecated-sys-poll.h.patch} | 12 +++---
 ...ch =3D> 0003-Remove-Werror-from-build.patch} | 18 ++++++---
 ...__SWORD_TYPE-if-not-defined-by-libc.patch} | 12 +++---
 ...ZE.patch =3D> 0005-Undefine-PAGE_SIZE.patch} | 10 +++--
 ...t-to-fix-pointer-to-int-cast-issues.patch} | 37 ++++++++-----------
 .../{fwts_20.07.00.bb =3D> fwts_21.03.00.bb}    | 18 ++++-----
 7 files changed, 69 insertions(+), 58 deletions(-)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Include-poll.h-instead-of-de=
precated-sys-poll.h.patch =3D> 0002-Include-poll.h-instead-of-deprecated-=
sys-poll.h.patch} (81%)
 rename meta-oe/recipes-test/fwts/fwts/{0001-Remove-Werror-from-build.pat=
ch =3D> 0003-Remove-Werror-from-build.patch} (74%)
 rename meta-oe/recipes-test/fwts/fwts/{0002-Define-__SWORD_TYPE-if-not-d=
efined-by-libc.patch =3D> 0004-Define-__SWORD_TYPE-if-not-defined-by-libc=
.patch} (79%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-Undefine-PAGE_SIZE.patch =3D=
> 0005-Undefine-PAGE_SIZE.patch} (83%)
 rename meta-oe/recipes-test/fwts/fwts/{0003-use-intptr_t-to-fix-pointer-=
to-int-cast-issues.patch =3D> 0006-use-intptr_t-to-fix-pointer-to-int-cas=
t-issues.patch} (64%)
 rename meta-oe/recipes-test/fwts/{fwts_20.07.00.bb =3D> fwts_21.03.00.bb=
} (65%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-quali=
fier-for-off_t.patch b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-pr=
intf-qualifier-for-off_t.patch
index c2d679aabc..0d73d73109 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-fo=
r-off_t.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-fo=
r-off_t.patch
@@ -1,16 +1,15 @@
-From 613e5cfe7751068062cc92f83870e436669fc0a8 Mon Sep 17 00:00:00 2001
+From ee787b53d734cd952c170c9303d213d3dd18a86f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:49:50 -0700
-Subject: [PATCH] Add correct printf qualifier for off_t
+Subject: [PATCH 1/6] Add correct printf qualifier for off_t
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
- src/bios/ebda_region/ebda_region.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
+ src/bios/ebda_region/ebda_region.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/src/bios/ebda_region/ebda_region.c b/src/bios/ebda_region/e=
bda_region.c
-index 16c39357..ad6d635c 100644
+index b70ced10..947a24bd 100644
 --- a/src/bios/ebda_region/ebda_region.c
 +++ b/src/bios/ebda_region/ebda_region.c
 @@ -83,9 +83,9 @@ static int ebda_test1(fwts_framework *fw)
@@ -25,14 +24,19 @@ index 16c39357..ad6d635c 100644
  			(entry->end_address - entry->start_address) / 1024,
  			memory_map_name,
  			entry->start_address,
-@@ -93,8 +93,8 @@ static int ebda_test1(fwts_framework *fw)
+@@ -93,9 +93,9 @@ static int ebda_test1(fwts_framework *fw)
  	} else
  		fwts_failed(fw, LOG_LEVEL_MEDIUM,
  			"EBDAMappedNotReserved",
 -			"EBDA region mapped at 0x%lx but not reserved in the %s table.",
 -			ebda_addr, memory_map_name);
+-
 +			"EBDA region mapped at 0x%jdx but not reserved in the %s table.",
 +			(intmax_t)ebda_addr, memory_map_name);
- 	=09
++	=09
  	return FWTS_OK;
  }
+=20
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-o=
f-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0002-Inclu=
de-poll.h-instead-of-deprecated-sys-poll.h.patch
similarity index 81%
rename from meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of=
-deprecated-sys-poll.h.patch
rename to meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-d=
eprecated-sys-poll.h.patch
index 4baefe4a4c..82379331ec 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-depre=
cated-sys-poll.h.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0002-Include-poll.h-instead-of-depre=
cated-sys-poll.h.patch
@@ -1,19 +1,18 @@
-From ed988c27efde5355c3ba9d0de8a14a4a40f798cc Mon Sep 17 00:00:00 2001
+From 1575b5ce3ecb8709806908061f689315553b40c7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:25:09 -0700
-Subject: [PATCH] Include poll.h instead of deprecated sys/poll.h
+Subject: [PATCH 2/6] Include poll.h instead of deprecated sys/poll.h
=20
 Upstream-Status: Pending
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_ipmi.c   | 3 ++-
  src/lib/src/fwts_pipeio.c | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
-index a4c8a511..e298969e 100644
+index ca7c55bb..0b16bec3 100644
 --- a/src/lib/src/fwts_ipmi.c
 +++ b/src/lib/src/fwts_ipmi.c
 @@ -18,10 +18,11 @@
@@ -30,7 +29,7 @@ index a4c8a511..e298969e 100644
  #include <linux/ipmi.h>
 =20
 diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
-index 3b3cfaff..289564d1 100644
+index 716297c4..37752297 100644
 --- a/src/lib/src/fwts_pipeio.c
 +++ b/src/lib/src/fwts_pipeio.c
 @@ -30,9 +30,9 @@
@@ -44,3 +43,6 @@ index 3b3cfaff..289564d1 100644
  #include <sys/types.h>
  #include <sys/wait.h>
  #include <errno.h>
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build=
.patch b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.pat=
ch
similarity index 74%
rename from meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.=
patch
rename to meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.pa=
tch
index 93a42213bb..906ec99a9d 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Remove-Werror-from-build.patch
@@ -1,16 +1,17 @@
-From 475979cf5c1af978f4e8409666365ec75b3320ea Mon Sep 17 00:00:00 2001
+From 7317aba872f2bcf052a7db9fa3c7a7ce3c55dc6b Mon Sep 17 00:00:00 2001
 From: Benjamin Berg <bberg@redhat.com>
 Date: Mon, 21 Aug 2017 10:34:40 +0200
-Subject: [PATCH] Remove -Werror from build
+Subject: [PATCH 3/6] Remove -Werror from build
=20
 Upstream-Status: Pending
-
 ---
  src/Makefile.am           | 2 +-
  src/lib/src/Makefile.am   | 2 +-
  src/utilities/Makefile.am | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
=20
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a26a197b..70a28174 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -14,7 +14,7 @@ AM_CPPFLAGS =3D \
@@ -22,6 +23,8 @@ Upstream-Status: Pending
  	-Wno-address-of-packed-member			\
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index 55c52b41..b85d0101 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
 @@ -25,7 +25,7 @@ AM_CPPFLAGS =3D \
@@ -33,6 +36,8 @@ Upstream-Status: Pending
  	-Wno-address-of-packed-member
 =20
  pkglib_LTLIBRARIES =3D libfwts.la
+diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
+index ecc25f0a..129c1036 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
@@ -42,5 +47,8 @@ Upstream-Status: Pending
 -AM_CPPFLAGS =3D -Wall -Werror -Wextra -DDATAROOTDIR=3D\"$(datarootdir)\=
" \
 +AM_CPPFLAGS =3D -Wall -Wextra -DDATAROOTDIR=3D\"$(datarootdir)\" \
  	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c`
-=20
+ 	`pkg-config --silence-errors --cflags json-c` \
+ 	-I../lib/include
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-n=
ot-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0004-Define-__S=
WORD_TYPE-if-not-defined-by-libc.patch
similarity index 79%
rename from meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-no=
t-defined-by-libc.patch
rename to meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-=
defined-by-libc.patch
index b45e46a3d9..83d1cbbfe0 100644
--- a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defi=
ned-by-libc.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0004-Define-__SWORD_TYPE-if-not-defi=
ned-by-libc.patch
@@ -1,7 +1,7 @@
-From 1112e51d240a206bdcf253878ef1f4963b92da8a Mon Sep 17 00:00:00 2001
+From 9456f2f779d3ed4a134d55571d8bec78ad3b28c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:37:20 -0700
-Subject: [PATCH] Define __SWORD_TYPE if not defined by libc
+Subject: [PATCH 4/6] Define __SWORD_TYPE if not defined by libc
=20
 __SWORD_TYPE is internal to glibc, therefore
 check and define it if needed e.g. on musl
@@ -9,16 +9,15 @@ check and define it if needed e.g. on musl
 Upstream-Status: Pending
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_uefi.c | 4 ++++
  1 file changed, 4 insertions(+)
=20
 diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
-index 544145fa..460b0b77 100644
+index 138f1164..13d9e36c 100644
 --- a/src/lib/src/fwts_uefi.c
 +++ b/src/lib/src/fwts_uefi.c
-@@ -59,6 +59,10 @@ typedef struct {
+@@ -63,6 +63,10 @@ typedef struct {
  #define UEFI_IFACE_SYSFS		(2)	/* sysfs */
  #define UEFI_IFACE_EFIVARS		(3)	/* efivar fs */
 =20
@@ -29,3 +28,6 @@ index 544145fa..460b0b77 100644
  /* File system magic numbers */
  #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
  #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch=
 b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
similarity index 83%
rename from meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
rename to meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
index 1d8c620efa..319e0855c4 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0005-Undefine-PAGE_SIZE.patch
@@ -1,7 +1,7 @@
-From 244e9551ab9bbc1dfa91d19cd472ef254a94ae41 Mon Sep 17 00:00:00 2001
+From 53b9f97fb7faed043134f2ab738347b20379d32f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:39:28 -0700
-Subject: [PATCH] Undefine PAGE_SIZE
+Subject: [PATCH 5/6] Undefine PAGE_SIZE
=20
 musl defines PAGE_SIZE and build complains
 of multiple definitions
@@ -9,13 +9,12 @@ of multiple definitions
 Upstream-Status: Pending
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_acpi_tables.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tabl=
es.c
-index bdd224aa..58e982a6 100644
+index dc42a8bd..4fa1246a 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
 @@ -42,6 +42,7 @@
@@ -26,3 +25,6 @@ index bdd224aa..58e982a6 100644
  #define PAGE_SIZE	(4096)
 =20
  static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-poin=
ter-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0006-use-in=
tptr_t-to-fix-pointer-to-int-cast-issues.patch
similarity index 64%
rename from meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-point=
er-to-int-cast-issues.patch
rename to meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer=
-to-int-cast-issues.patch
index bebbfa4ad1..eb8b0b78e8 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-=
int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0006-use-intptr_t-to-fix-pointer-to-=
int-cast-issues.patch
@@ -1,25 +1,24 @@
-From 1848b8f8b9be500046ca5d632789a068d6151815 Mon Sep 17 00:00:00 2001
+From f723458eb649a9ad1d5d0e3dd6e801b284680fa7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:50:59 -0700
-Subject: [PATCH] use intptr_t to fix pointer-to-int-cast issues
+Subject: [PATCH 6/6] use intptr_t to fix pointer-to-int-cast issues
=20
 uintptr_t is guaranteed to be wide enough that
 converting a void* to uintptr_t and back again
 will yield the original pointer value
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/lib/src/fwts_acpi_tables.c | 4 ++--
  src/lib/src/fwts_mmap.c        | 2 +-
- src/lib/src/fwts_smbios.c      | 4 ++--
- 3 files changed, 5 insertions(+), 5 deletions(-)
+ src/lib/src/fwts_smbios.c      | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tabl=
es.c
-index 58e982a6..6522032f 100644
+index 4fa1246a..7ef197cd 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -156,7 +156,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts=
_framework *fw, void *addr,
+@@ -173,7 +173,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts=
_framework *fw, void *addr,
  		return NULL;
  	}
 =20
@@ -28,7 +27,7 @@ index 58e982a6..6522032f 100644
  		return NULL;
 =20
  	if (fwts_safe_memcpy(rsdp, mem, sizeof(fwts_acpi_table_rsdp)) !=3D FWT=
S_OK) {
-@@ -455,7 +455,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_=
framework *fw)
+@@ -486,7 +486,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_=
framework *fw)
  	if ((rsdp =3D fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) =3D=3D NUL=
L)
  		return FWTS_ERROR;
 =20
@@ -38,10 +37,10 @@ index 58e982a6..6522032f 100644
  	/* Load any tables from XSDT if it's valid */
  	if (rsdp->xsdt_address) {
 diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
-index e28abf87..2180b2cc 100644
+index 2f2514f1..fbd946f4 100644
 --- a/src/lib/src/fwts_mmap.c
 +++ b/src/lib/src/fwts_mmap.c
-@@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
+@@ -82,7 +82,7 @@ int fwts_munmap(void *mem, const size_t size)
  	off_t offset;
 =20
  	page_size =3D fwts_page_size();
@@ -51,24 +50,18 @@ index e28abf87..2180b2cc 100644
  	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
  		return FWTS_ERROR;
 diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
-index e5b3c774..c8134926 100644
+index 8da572e9..04315bd3 100644
 --- a/src/lib/src/fwts_smbios.c
 +++ b/src/lib/src/fwts_smbios.c
-@@ -55,7 +55,7 @@ static void *fwts_smbios_find_entry_uefi(fwts_framewor=
k *fw, fwts_smbios_entry *
+@@ -78,7 +78,7 @@ static void *fwts_smbios_find_entry_uefi(
+ 	if ((addr =3D fwts_scan_efi_systab(smbios)) !=3D NULL) {
  		fwts_smbios_entry *mapped_entry;
- 		const size_t size =3D sizeof(fwts_smbios_entry);
 =20
 -		if ((mapped_entry =3D fwts_mmap((off_t)addr, size)) !=3D FWTS_MAP_FAI=
LED) {
 +		if ((mapped_entry =3D fwts_mmap((uintptr_t)addr, size)) !=3D FWTS_MAP=
_FAILED) {
  			if (fwts_safe_memcpy(entry, mapped_entry, size) =3D=3D FWTS_OK) {
  				(void)fwts_munmap(mapped_entry, size);
  				*type  =3D FWTS_SMBIOS;
-@@ -91,7 +91,7 @@ static void *fwts_smbios30_find_entry_uefi(fwts_framew=
ork *fw, fwts_smbios30_ent
- 		fwts_smbios30_entry *mapped_entry;
- 		const size_t size =3D sizeof(fwts_smbios30_entry);
-=20
--		if ((mapped_entry =3D fwts_mmap((off_t)addr, size)) !=3D FWTS_MAP_FAI=
LED) {
-+		if ((mapped_entry =3D fwts_mmap((uintptr_t)addr, size)) !=3D FWTS_MAP=
_FAILED) {
- 			if (fwts_safe_memread(mapped_entry, size) =3D=3D FWTS_OK) {
- 				*entry =3D *mapped_entry;
- 				(void)fwts_munmap(mapped_entry, size);
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-test/fwts/fwts_20.07.00.bb b/meta-oe/recipes=
-test/fwts/fwts_21.03.00.bb
similarity index 65%
rename from meta-oe/recipes-test/fwts/fwts_20.07.00.bb
rename to meta-oe/recipes-test/fwts/fwts_21.03.00.bb
index 28565eb8ca..aa7d422f7b 100644
--- a/meta-oe/recipes-test/fwts/fwts_20.07.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_21.03.00.bb
@@ -6,27 +6,27 @@ LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://src/main.c;beginline=3D1;endline=3D16;md5=3D=
31da590f3e9f3bd34dcdb9e4db568519"
=20
 SRC_URI =3D "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=3D=
${BP} \
-           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.p=
atch \
-           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch =
\
-           file://0003-Undefine-PAGE_SIZE.patch \
            file://0001-Add-correct-printf-qualifier-for-off_t.patch \
-           file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.pa=
tch \
-           file://0001-Remove-Werror-from-build.patch \
+           file://0002-Include-poll.h-instead-of-deprecated-sys-poll.h.p=
atch \
+           file://0003-Remove-Werror-from-build.patch \
+           file://0004-Define-__SWORD_TYPE-if-not-defined-by-libc.patch =
\
+           file://0005-Undefine-PAGE_SIZE.patch \
+           file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.pa=
tch \
            "
-SRC_URI[sha256sum] =3D "4a8e0211b388efbcfcb6530297e9a924d0afa2d6db58e9db=
2f031129eda6d66f"
+SRC_URI[sha256sum] =3D "c22dcba2572e4237bf2fe9ab579e195cf051d3a99b2c07ab=
58f757cae02d24fb"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|powerpc64).*-linux"
=20
-DEPENDS =3D "libpcre json-c glib-2.0 dtc bison-native libbsd"
+DEPENDS =3D "libpcre glib-2.0 dtc bison-native libbsd"
 DEPENDS_append_libc-musl =3D " libexecinfo"
=20
+# Use brokensep for now (https://github.com/ColinIanKing/fwts/issues/2)
 inherit autotools-brokensep bash-completion pkgconfig
=20
-CFLAGS +=3D "-I${STAGING_INCDIR}/json-c -Wno-error=3Dunknown-pragmas"
 LDFLAGS_append_libc-musl =3D " -lexecinfo"
=20
 FILES_${PN} +=3D "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev +=3D "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib=
*.la"
 FILES_${PN}-staticdev +=3D "${libdir}/fwts/lib*a"
-FILES_${PN}-dbg +=3D "${libdir}/fwts/.debug"
=20
+RDEPENDS_${PN} +=3D "dtc"
--=20
2.25.1

