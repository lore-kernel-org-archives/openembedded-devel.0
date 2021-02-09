Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.7839.1612860874895768604
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 00:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1198sAfs027281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Feb 2021 00:54:16 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 00:54:15 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 9 Feb 2021 00:54:15 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH V2] ndpi: fix autoconf-2.71 compatibility
Date: Tue, 9 Feb 2021 00:54:15 -0800
Message-ID: <20210209085415.74712-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CAMKF1soca2eHtfmMNkQ2LXBjaEVoN67zMXv=pn7WoXZ4jfsfzA@mail.gmail.com>
References: <CAMKF1soca2eHtfmMNkQ2LXBjaEVoN67zMXv=pn7WoXZ4jfsfzA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While DEBUG_BUILD != 1, Yocto adds option _FORTIFY_SOURCE to CPP and CC [1],
since _FORTIFY_SOURCE requires -O1 or higher, if no -O1 or higher then
results in a compiler warning.

The configure.ac of ndpi uses macro AC_PROG_CC to test toolchain, since
CPPFLAGS does not have the option -O<level> [1], while building with autoconf
2.71+, the toolchain test will report a warning.

The configure.ac of ndpi uses macro AC_LANG_WERROR to treat the warning as
error. Then it broke the build
...
|configure: error: C preprocessor "i686-wrs-linux-gcc -E --sysroot=tmp-glibc/
work/core2-32-wrs-linux/ndpi/3.4-r0/recipe-sysroot  -m32 -march=core2
-mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security" fails sanity check
...

The SELECTED_OPTIMIZATION contains option -O<level>, add SELECTED_OPTIMIZATION
to CPPFLAGS to could fix the issue

[1] The definition of CPP and CC and XXXFLAGS in bitbake.conf
[snip]
export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
...
export CFLAGS = "${TARGET_CFLAGS}"
TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
...
export CPPFLAGS = "${TARGET_CPPFLAGS}"
TARGET_CPPFLAGS = ""
[snip]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/ntopng/ndpi_3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
index 1e4153779..22e4d8e9a 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
@@ -17,6 +17,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
 
+CPPFLAGS += "${SELECTED_OPTIMIZATION}"
+
 do_configure_prepend() {
     ${S}/autogen.sh
 }
-- 
2.29.2

