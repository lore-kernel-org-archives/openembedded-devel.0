Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.5453.1585281255747136939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 20:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02R3sEGu013360
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 20:54:14 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Mar 2020 20:54:13 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH v2] turbostat: Fix build failure for missing kernel internal heaers and clean up
Date: Fri, 27 Mar 2020 11:54:12 +0800
Message-ID: <20200327035412.15163-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

To fix the following build failures
turbostat.c:(.text+0xc28a): undefined reference to `UL'
turbostat.c:33:10: fatal error: sys/capability.h: No such file or directory (for kernel v5.6-rc7)

- Add dependency on libcap for kernel v5.6-rc7 and later versions
- Copy internal linux/const.h used by previously added internal linux/bits.h
- Tweak linux/const.h to allow it to refer to uapi const.h, as
  linux-libc-headers purposely removes _UAPI from the locker macros of the
  headers
- Remove -I for kernel-source in EXTRA_OEMAKE, as linux-kernel-headers has
  provided enough and necessary headers
- Make do_configure depend on kernel's do_shared_workdir

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 5f6588de5..60040a47a 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -21,7 +21,7 @@ SRC_URI += "\
             "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-DEPENDS = "virtual/kernel"
+DEPENDS = "libcap"
 
 # This looks in S, so we better make sure there's
 # something in the directory.
@@ -30,25 +30,28 @@ do_populate_lic[depends] = "${PN}:do_configure"
 
 
 EXTRA_OEMAKE = '\
-                CC="${CC}" \
-		'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
+                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
                '
 
 # If we build under STAGING_KERNEL_DIR, source will not be put
 # into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
 # do_configure() is invoked so we can safely copy from it.
 #
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
 do_configure_prepend() {
 	mkdir -p ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 	cp -r ${WORKDIR}/COPYING ${S}
 }
 
 do_compile() {
 	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
+	sed -i 's#<linux/const.h>#"const.h"#' bits.h
+	sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
-- 
2.17.1

