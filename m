Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.9205.1590135306031075752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 01:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04M8F1tT020077
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 22 May 2020 01:15:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 22 May 2020
 01:14:43 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] turbostat: fix the build failure for new v5.7-rc6 kernel
Date: Fri, 22 May 2020 16:14:42 +0800
Message-ID: <20200522081442.18902-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Due to the new v5.7-rc6 kernel has some modify in header
files, turbostat build failed. Now match the files.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 .../recipes-kernel/turbostat/turbostat_3.4.bb | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 60040a47a..48c72140c 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -42,16 +42,28 @@ do_configure_prepend() {
 	mkdir -p ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
-	cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
-	cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
+	if [ -f "${STAGING_KERNEL_DIR}/include/vdso/bits.h" ]; then
+		cp -r ${STAGING_KERNEL_DIR}/include/vdso/bits.h ${S}
+		cp -r ${STAGING_KERNEL_DIR}/include/vdso/const.h ${S}
+	else
+		cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
+		cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
+	fi
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 	cp -r ${WORKDIR}/COPYING ${S}
 }
 
+
 do_compile() {
 	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
-	sed -i 's#<linux/const.h>#"const.h"#' bits.h
-	sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
+	'TMPCHECK='grep "<vdso/const.h>" bits.h'' || true
+	if [ -n $TMPCHECK ]; then
+		sed -i 's#<vdso/const.h>#"const.h"#' bits.h
+		sed -i 's#<uapi/linux/const.h>#<linux/const.h>#' const.h
+	else
+		sed -i 's#<linux/const.h>#"const.h"#' bits.h
+		sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
+	fi
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
-- 
2.18.2

