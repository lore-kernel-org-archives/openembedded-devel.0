Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id E00567458B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:58:14 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id c9-v6so7879592pgf.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DdvFypMR/pWZGLoVCcmqHhyimCTD1ktrxQos2+Re9yE=;
	b=eW+EXyfMFilGJSGHrRNLwyMOjKhz/+cor/TIyajag7SJRT3NbsdjW2+8NX6EzXHReL
	cKCDKX0UAY+ZpoC/+ECLGlbZ7zqlDmkn6WFnHzhO9bA/cTFYVM34RZk2ldCkgNlaLw0q
	rM+vpi+bO/OgndeL0Sa5rGsaxhDOlfEtt/opkETWELNF+Nf2okrVAG/IszlYRDmyXFas
	7xGh+1IuaV4Klz7VzDrP8rl7upoD4gq5k/cDDsiAL9hirVZU4EOzTCgtFXG2w2TtFyc0
	RTOugweJMRKqvIY3dChF916NzW5QZg+kd3ke2z0fV782AudYCYtduAzac9Mb/bmlRcVL
	moRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DdvFypMR/pWZGLoVCcmqHhyimCTD1ktrxQos2+Re9yE=;
	b=IFm9HhR6NlS9UbpPwBybbcA0shyqV8/aRcQT3P4IKLIoiKX8sEeA7w98DXpnztqxvo
	+UutfJP6lsu5pnEpYVSAqXnxoQvVn5TQ3wGCgO3M67u1Rsne93BSwt9dJmJbVnHdjwI1
	embsp1AiCqZSHUMamW0qeMWYODFkinNAFYgoYygDqaig9C0GtCds6AFyos26dDTK+k13
	fFE/EIqYW3OsGDFFAnHGeV4YhZCh+IRxM+mzyJG2hikNXQDmWLIt5Qd3bDsI2RjQaqM+
	Q6ynyiXlndneNZ+T4W/eFT5Z4Cuz+t0tj48LH+a2tswxw8eZQnrDJt41T4c239bMZVDF
	2cYg==
X-Gm-Message-State: ALKqPwdQxzzNAJNpyesG0J0SgSERT/UokAGkPQZjM4bqFRTHV+q+peEx
	UopspPv/LrrOz7aiWqHwGjn5tQ==
X-Google-Smtp-Source: ADUXVKLRXhWhXP/U6GSOTWFlhISmp244FkWdyrq9yMOTWjG2ON5T7oQBChx0ca6Sng1qVxIaIBViNw==
X-Received: by 2002:a63:a702:: with SMTP id
	d2-v6mr7833777pgf.246.1527829095140; 
	Thu, 31 May 2018 21:58:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q68-v6sm67909762pfb.182.2018.05.31.21.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 May 2018 21:58:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2018 21:58:13 -0700
Message-Id: <20180601045815.15819-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/3] fwts: Upgrade to V18.05.00
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
X-List-Received-Date: Fri, 01 Jun 2018 04:58:15 -0000

drop backported patches and fix build with gcc8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-correct-printf-qualifier-for-off_t.patch | 21 ++++----
 ...l.h-instead-of-deprecated-sys-poll.h.patch | 12 ++---
 .../fwts/0001-Remove-Werror-from-build.patch  | 52 ++++++++++++++++++
 ...t-logical-operand-warning-with-clang.patch | 21 ++++----
 ...defined-format-for-printing-uint64_t.patch | 53 -------------------
 ...-__SWORD_TYPE-if-not-defined-by-libc.patch | 10 ++--
 .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch   | 10 ++--
 ..._t-to-fix-pointer-to-int-cast-issues.patch | 52 +++++++++---------
 meta-oe/recipes-test/fwts/fwts_git.bb         |  8 +--
 9 files changed, 116 insertions(+), 123 deletions(-)
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
 delete mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
index 192e05f1cb..c2d679aabc 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Add-correct-printf-qualifier-for-off_t.patch
@@ -1,18 +1,19 @@
-From 232daf5fca6fb52cced5e810f2601fe1a71b96d8 Mon Sep 17 00:00:00 2001
+From 613e5cfe7751068062cc92f83870e436669fc0a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:49:50 -0700
-Subject: [PATCH 1/3] Add correct printf qualifier for off_t
+Subject: [PATCH] Add correct printf qualifier for off_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/bios/ebda_region/ebda_region.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/bios/ebda_region/ebda_region.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: git/src/bios/ebda_region/ebda_region.c
-===================================================================
---- git.orig/src/bios/ebda_region/ebda_region.c
-+++ git/src/bios/ebda_region/ebda_region.c
-@@ -83,9 +83,9 @@ static int ebda_test1(fwts_framework *fw
+diff --git a/src/bios/ebda_region/ebda_region.c b/src/bios/ebda_region/ebda_region.c
+index 16c39357..ad6d635c 100644
+--- a/src/bios/ebda_region/ebda_region.c
++++ b/src/bios/ebda_region/ebda_region.c
+@@ -83,9 +83,9 @@ static int ebda_test1(fwts_framework *fw)
  	if ((entry != NULL) &&
  	    (entry->type == FWTS_MEMORY_MAP_RESERVED ||
  	     entry->type == FWTS_MEMORY_MAP_ACPI)) {
@@ -24,7 +25,7 @@ Index: git/src/bios/ebda_region/ebda_region.c
  			(entry->end_address - entry->start_address) / 1024,
  			memory_map_name,
  			entry->start_address,
-@@ -93,8 +93,8 @@ static int ebda_test1(fwts_framework *fw
+@@ -93,8 +93,8 @@ static int ebda_test1(fwts_framework *fw)
  	} else
  		fwts_failed(fw, LOG_LEVEL_MEDIUM,
  			"EBDAMappedNotReserved",
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
index 8ad0789361..4baefe4a4c 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
@@ -1,18 +1,19 @@
-From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
+From ed988c27efde5355c3ba9d0de8a14a4a40f798cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:25:09 -0700
-Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
+Subject: [PATCH] Include poll.h instead of deprecated sys/poll.h
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/lib/src/fwts_ipmi.c   | 3 ++-
  src/lib/src/fwts_pipeio.c | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
-index cbb27611..70d11cfa 100644
+index a4c8a511..e298969e 100644
 --- a/src/lib/src/fwts_ipmi.c
 +++ b/src/lib/src/fwts_ipmi.c
 @@ -18,10 +18,11 @@
@@ -29,7 +30,7 @@ index cbb27611..70d11cfa 100644
  #include <linux/ipmi.h>
  
 diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
-index fd719640..bdc5b2ea 100644
+index 3b3cfaff..289564d1 100644
 --- a/src/lib/src/fwts_pipeio.c
 +++ b/src/lib/src/fwts_pipeio.c
 @@ -30,9 +30,9 @@
@@ -43,6 +44,3 @@ index fd719640..bdc5b2ea 100644
  #include <sys/types.h>
  #include <sys/wait.h>
  #include <errno.h>
--- 
-2.13.0
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
new file mode 100644
index 0000000000..611ccc8fc8
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
@@ -0,0 +1,52 @@
+From 475979cf5c1af978f4e8409666365ec75b3320ea Mon Sep 17 00:00:00 2001
+From: Benjamin Berg <bberg@redhat.com>
+Date: Mon, 21 Aug 2017 10:34:40 +0200
+Subject: [PATCH] Remove -Werror from build
+
+Upstream-Status: Pending
+
+---
+ src/Makefile.am           | 2 +-
+ src/lib/src/Makefile.am   | 2 +-
+ src/utilities/Makefile.am | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 4daa9e8f..873f23eb 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -14,7 +14,7 @@ AM_CPPFLAGS = \
+ 	`pkg-config --silence-errors --cflags json` \
+ 	`pkg-config --silence-errors --cflags json-c` \
+ 	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
+-	-Wall -Werror -Wextra
++	-Wall -Wextra
+ 
+ bin_PROGRAMS = fwts
+ 
+diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
+index fa232451..082403a2 100644
+--- a/src/lib/src/Makefile.am
++++ b/src/lib/src/Makefile.am
+@@ -24,7 +24,7 @@ AM_CPPFLAGS = \
+ 	`pkg-config --silence-errors --cflags json-c`	\
+ 	`pkg-config --cflags glib-2.0 gio-2.0` 		\
+ 	-DDATAROOTDIR=\"$(datarootdir)\"		\
+-	-Wall -Werror -Wextra
++	-Wall -Wextra
+ 
+ pkglib_LTLIBRARIES = libfwts.la
+ 
+diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
+index aa37de55..4d5297cc 100644
+--- a/src/utilities/Makefile.am
++++ b/src/utilities/Makefile.am
+@@ -16,7 +16,7 @@
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
+ #
+ 
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
++AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
+ 	`pkg-config --silence-errors --cflags json` \
+ 	`pkg-config --silence-errors --cflags json-c`
+ 
diff --git a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
index a3cc1ff8e5..ae3665b4d0 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
@@ -1,9 +1,10 @@
-From 953cff93c85d3cfd5cbcac56e14443dc5f6e5fbd Mon Sep 17 00:00:00 2001
+From 5bd05ad8569880985ddf6d4c06ed927d388c297f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Oct 2016 01:57:16 +0000
 Subject: [PATCH] ignore constant-logical-operand warning with clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/dmi/dmicheck/dmicheck.c            | 3 +++
  src/lib/src/fwts_acpi_tables.c         | 5 +++++
@@ -11,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 13 insertions(+)
 
 diff --git a/src/dmi/dmicheck/dmicheck.c b/src/dmi/dmicheck/dmicheck.c
-index ecd98223..7fca4a64 100644
+index 3cca9db9..60fb758f 100644
 --- a/src/dmi/dmicheck/dmicheck.c
 +++ b/src/dmi/dmicheck/dmicheck.c
-@@ -209,6 +209,8 @@ static const char *uuid_patterns[] = {
+@@ -211,6 +211,8 @@ static const char *uuid_patterns[] = {
  	"0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
  	NULL,
  };
@@ -23,19 +24,19 @@ index ecd98223..7fca4a64 100644
  
  static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
  	{ "Invalid",		FWTS_SMBIOS_CHASSIS_INVALID },
-@@ -245,6 +247,7 @@ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
- 	{ "Convertible",	FWTS_SMBIOS_CHASSIS_CONVERTIBLE },
- 	{ "Detachable",		FWTS_SMBIOS_CHASSIS_DETACHABLE },
+@@ -251,6 +253,7 @@ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
+ 	{ "Mini PC",		FWTS_SMBIOS_CHASSIS_MINI_PC },
+ 	{ "Stick PC",		FWTS_SMBIOS_CHASSIS_STICK_PC },
  };
 +#pragma clang diagnostic pop
  
  /* Remapping table from buggy version numbers to correct values */
  static const fwts_dmi_version dmi_versions[] = {
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index 30b4060e..d5339bf7 100644
+index c7ba59be..bdd224aa 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -394,10 +394,14 @@ static int fwts_acpi_handle_fadt(
+@@ -393,10 +393,14 @@ static int fwts_acpi_handle_fadt(
  	/* Determine FACS addr and load it.
  	 * Will ignore the missing FACS in the hardware-reduced mode.
  	 */
@@ -50,7 +51,7 @@ index 30b4060e..d5339bf7 100644
  	if (result != FWTS_OK) {
  		if ((result == FWTS_NULL_POINTER) &&
  				fwts_acpi_is_reduced_hardware(fadt)) {
-@@ -416,6 +420,7 @@ static int fwts_acpi_handle_fadt(
+@@ -415,6 +419,7 @@ static int fwts_acpi_handle_fadt(
  		return FWTS_ERROR;
  	}
  	return FWTS_OK;
@@ -59,7 +60,7 @@ index 30b4060e..d5339bf7 100644
  
  /*
 diff --git a/src/uefi/uefirtauthvar/uefirtauthvar.c b/src/uefi/uefirtauthvar/uefirtauthvar.c
-index cdfd7aa3..001e8cc8 100644
+index c2031741..7a33d19d 100644
 --- a/src/uefi/uefirtauthvar/uefirtauthvar.c
 +++ b/src/uefi/uefirtauthvar/uefirtauthvar.c
 @@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_framework *fw)
diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch b/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
deleted file mode 100644
index 35ce883a2a..0000000000
--- a/meta-oe/recipes-test/fwts/fwts/0002-Add-C99-defined-format-for-printing-uint64_t.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 25f18b9ac37960dc12a3b648a5c866bd56ef2cbe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jun 2017 16:50:23 -0700
-Subject: [PATCH 2/3] Add C99 defined format for printing uint64_t
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/opal/reserv_mem.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/opal/reserv_mem.c b/src/opal/reserv_mem.c
-index eeec2947..f0672e05 100644
---- a/src/opal/reserv_mem.c
-+++ b/src/opal/reserv_mem.c
-@@ -185,7 +185,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
- 		regions[j].start = (uint64_t)be64toh(ranges[2 * j]);
- 		regions[j].len = (uint64_t)be64toh(ranges[2 * j + 1]);
- 		fwts_log_info(fw, "Region name %80s"
--			" start: 0x%08lx, len: 0x%08lx\n",
-+			" start: 0x%08" PRIx64 ", len: 0x%08" PRIx64 "\n",
- 			regions[j].name, regions[j].start, regions[j].len);
- 	}
- 
-@@ -248,7 +248,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
- 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
- 					"ImageSizeMismatch",
- 					"Mismatch in homer-image size, "
--					"expected: 0x%lx, actual: 0x%lx",
-+					"expected: 0x%" PRIx64 ", actual: 0x%" PRIx64 "",
- 					configstruct.homer, regions[j].len);
- 				ok = false;
- 			} else
-@@ -261,7 +261,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
- 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
- 					"ImageSizeMismatch",
- 					"Mismatch in slw-image size, "
--					"expected: 0x%lx, actual: 0x%lx",
-+					"expected: 0x%" PRIx64 ", actual: 0x%" PRIx64 "",
- 					configstruct.slw, regions[j].len);
- 				ok = false;
- 			} else
-@@ -274,7 +274,7 @@ static int reserv_mem_limits_test(fwts_framework *fw)
- 				fwts_failed(fw, LOG_LEVEL_MEDIUM,
- 					"ImageSizeMismatch",
- 					"Mismatch in occ-common-area size, "
--					"expected: 0x%lx, actual: 0x%lx",
-+					"expected: 0x%" PRIx64", actual: 0x%" PRIx64"",
- 					configstruct.occ_common,
- 					regions[j].len);
- 				ok = false;
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
index 3b83ca57c8..b45e46a3d9 100644
--- a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
@@ -1,7 +1,7 @@
-From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
+From 1112e51d240a206bdcf253878ef1f4963b92da8a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:37:20 -0700
-Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
+Subject: [PATCH] Define __SWORD_TYPE if not defined by libc
 
 __SWORD_TYPE is internal to glibc, therefore
 check and define it if needed e.g. on musl
@@ -9,12 +9,13 @@ check and define it if needed e.g. on musl
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/lib/src/fwts_uefi.c | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
-index 1f9d31fa..2d925f8d 100644
+index 544145fa..460b0b77 100644
 --- a/src/lib/src/fwts_uefi.c
 +++ b/src/lib/src/fwts_uefi.c
 @@ -59,6 +59,10 @@ typedef struct {
@@ -28,6 +29,3 @@ index 1f9d31fa..2d925f8d 100644
  /* File system magic numbers */
  #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
  #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
--- 
-2.13.0
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
index f84fbffd88..1d8c620efa 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
@@ -1,7 +1,7 @@
-From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
+From 244e9551ab9bbc1dfa91d19cd472ef254a94ae41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Jun 2017 07:39:28 -0700
-Subject: [PATCH 3/3] Undefine PAGE_SIZE
+Subject: [PATCH] Undefine PAGE_SIZE
 
 musl defines PAGE_SIZE and build complains
 of multiple definitions
@@ -9,12 +9,13 @@ of multiple definitions
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/lib/src/fwts_acpi_tables.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index 1d4fc705..71023ad2 100644
+index bdd224aa..58e982a6 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
 @@ -42,6 +42,7 @@
@@ -25,6 +26,3 @@ index 1d4fc705..71023ad2 100644
  #define PAGE_SIZE	(4096)
  
  static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
--- 
-2.13.0
-
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch b/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
index 3cd3fbbc1b..bebbfa4ad1 100644
--- a/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch
@@ -1,13 +1,14 @@
-From d0d76820efe51dd404d381fc4c46544008e757dd Mon Sep 17 00:00:00 2001
+From 1848b8f8b9be500046ca5d632789a068d6151815 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 8 Jun 2017 16:50:59 -0700
-Subject: [PATCH 3/3] use intptr_t to fix pointer-to-int-cast issues
+Subject: [PATCH] use intptr_t to fix pointer-to-int-cast issues
 
 uintptr_t is guaranteed to be wide enough that
 converting a void* to uintptr_t and back again
 will yield the original pointer value
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/lib/src/fwts_acpi_tables.c | 4 ++--
  src/lib/src/fwts_mmap.c        | 2 +-
@@ -15,19 +16,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
-index 832f8d66..d0006529 100644
+index 58e982a6..6522032f 100644
 --- a/src/lib/src/fwts_acpi_tables.c
 +++ b/src/lib/src/fwts_acpi_tables.c
-@@ -150,7 +150,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
- 	fwts_acpi_table_rsdp *rsdp = NULL;
- 	*rsdp_len = 0;
+@@ -156,7 +156,7 @@ static fwts_acpi_table_rsdp *fwts_acpi_get_rsdp(fwts_framework *fw, void *addr,
+ 		return NULL;
+ 	}
  
 -	if ((mem = fwts_mmap((off_t)addr, sizeof(fwts_acpi_table_rsdp))) == FWTS_MAP_FAILED)
 +	if ((mem = fwts_mmap((uintptr_t)addr, sizeof(fwts_acpi_table_rsdp))) == FWTS_MAP_FAILED)
  		return NULL;
  
- 	if (fwts_safe_memread(mem, sizeof(fwts_acpi_table_rsdp)) != FWTS_OK) {
-@@ -456,7 +456,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
+ 	if (fwts_safe_memcpy(rsdp, mem, sizeof(fwts_acpi_table_rsdp)) != FWTS_OK) {
+@@ -455,7 +455,7 @@ static int fwts_acpi_load_tables_from_firmware(fwts_framework *fw)
  	if ((rsdp = fwts_acpi_get_rsdp(fw, rsdp_addr, &rsdp_len)) == NULL)
  		return FWTS_ERROR;
  
@@ -37,7 +38,7 @@ index 832f8d66..d0006529 100644
  	/* Load any tables from XSDT if it's valid */
  	if (rsdp->xsdt_address) {
 diff --git a/src/lib/src/fwts_mmap.c b/src/lib/src/fwts_mmap.c
-index a09f688e..9fe6329a 100644
+index e28abf87..2180b2cc 100644
 --- a/src/lib/src/fwts_mmap.c
 +++ b/src/lib/src/fwts_mmap.c
 @@ -81,7 +81,7 @@ int fwts_munmap(void *mem, const size_t size)
@@ -50,27 +51,24 @@ index a09f688e..9fe6329a 100644
  	if (munmap((void *)((uint8_t *)mem - offset), size + offset) < 0)
  		return FWTS_ERROR;
 diff --git a/src/lib/src/fwts_smbios.c b/src/lib/src/fwts_smbios.c
-index 8d0ea39b..63b4bf25 100644
+index e5b3c774..c8134926 100644
 --- a/src/lib/src/fwts_smbios.c
 +++ b/src/lib/src/fwts_smbios.c
-@@ -54,7 +54,7 @@ static void *fwts_smbios_find_entry_uefi(fwts_framework *fw, fwts_smbios_entry *
- 	if ((addr = fwts_scan_efi_systab("SMBIOS")) != NULL) {
+@@ -55,7 +55,7 @@ static void *fwts_smbios_find_entry_uefi(fwts_framework *fw, fwts_smbios_entry *
  		fwts_smbios_entry *mapped_entry;
+ 		const size_t size = sizeof(fwts_smbios_entry);
  
--		if ((mapped_entry = fwts_mmap((off_t)addr, sizeof(fwts_smbios_entry))) != FWTS_MAP_FAILED) {
-+		if ((mapped_entry = fwts_mmap((uintptr_t)addr, sizeof(fwts_smbios_entry))) != FWTS_MAP_FAILED) {
- 			*entry = *mapped_entry;
- 			(void)fwts_munmap(mapped_entry, sizeof(fwts_smbios_entry));
- 			*type  = FWTS_SMBIOS;
-@@ -84,7 +84,7 @@ static void *fwts_smbios30_find_entry_uefi(fwts_framework *fw, fwts_smbios30_ent
- 	if ((addr = fwts_scan_efi_systab("SMBIOS3")) != NULL) {
+-		if ((mapped_entry = fwts_mmap((off_t)addr, size)) != FWTS_MAP_FAILED) {
++		if ((mapped_entry = fwts_mmap((uintptr_t)addr, size)) != FWTS_MAP_FAILED) {
+ 			if (fwts_safe_memcpy(entry, mapped_entry, size) == FWTS_OK) {
+ 				(void)fwts_munmap(mapped_entry, size);
+ 				*type  = FWTS_SMBIOS;
+@@ -91,7 +91,7 @@ static void *fwts_smbios30_find_entry_uefi(fwts_framework *fw, fwts_smbios30_ent
  		fwts_smbios30_entry *mapped_entry;
+ 		const size_t size = sizeof(fwts_smbios30_entry);
  
--		if ((mapped_entry = fwts_mmap((off_t)addr, sizeof(fwts_smbios30_entry))) != FWTS_MAP_FAILED) {
-+		if ((mapped_entry = fwts_mmap((uintptr_t)addr, sizeof(fwts_smbios30_entry))) != FWTS_MAP_FAILED) {
- 			*entry = *mapped_entry;
- 			(void)fwts_munmap(mapped_entry, sizeof(fwts_smbios30_entry));
- 			return addr;
--- 
-2.13.1
-
+-		if ((mapped_entry = fwts_mmap((off_t)addr, size)) != FWTS_MAP_FAILED) {
++		if ((mapped_entry = fwts_mmap((uintptr_t)addr, size)) != FWTS_MAP_FAILED) {
+ 			if (fwts_safe_memread(mapped_entry, size) == FWTS_OK) {
+ 				*entry = *mapped_entry;
+ 				(void)fwts_munmap(mapped_entry, size);
diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 87a23af19f..defe31ddff 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,17 +5,17 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "17.03.00+git${SRCPV}"
+PV = "18.05.00+git${SRCPV}"
 
-SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
+SRCREV = "b0ec7aa2ef743d113fd8c5e57c0ca3d5edd86f0e"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
            file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
            file://0003-Undefine-PAGE_SIZE.patch \
            file://0001-Add-correct-printf-qualifier-for-off_t.patch \
-           file://0002-Add-C99-defined-format-for-printing-uint64_t.patch \
            file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
+           file://0001-Remove-Werror-from-build.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -25,7 +25,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 DEPENDS = "libpcre json-c glib-2.0 dtc"
 DEPENDS_append_libc-musl = " libexecinfo"
 
-inherit autotools pkgconfig
+inherit autotools bash-completion pkgconfig
 
 CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
 LDFLAGS_append_libc-musl = " -lexecinfo"
-- 
2.17.1


