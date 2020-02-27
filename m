Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 06770611CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:58:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484086"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 13:58:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id ED76F406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:48:49 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 13:58:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 13:58:44 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:13 -0800
Message-ID: <1582807398-13955-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: ED76F406AB15.A540E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] openipmi: upgrade 2.0.27 -> 2.0.28
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
X-List-Received-Date: Thu, 27 Feb 2020 05:58:35 -0000
Content-Type: text/plain

ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
removed because it is included in 2.0.28.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...emu.c-include-readline.h-from-readli.patch | 31 -------------------
 ...{openipmi_2.0.27.bb => openipmi_2.0.28.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.27.bb => openipmi_2.0.28.bb} (95%)

diff --git a/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch b/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
deleted file mode 100644
index e208de8b2..000000000
--- a/meta-networking/recipes-support/openipmi/files/ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bebfb3c24582ec4e45d79c5b52135197bf7373da Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 14 Jun 2019 14:17:34 +0800
-Subject: [PATCH] ipmi_serial_bmc_emu.c: include readline.h from readline
-
-The libedit had been removed and swithed to readline.
-We need to include readline.h from readline rather than editline.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- sample/ipmi_serial_bmc_emu.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sample/ipmi_serial_bmc_emu.c b/sample/ipmi_serial_bmc_emu.c
-index e0ae019..1b8bb9a 100644
---- a/sample/ipmi_serial_bmc_emu.c
-+++ b/sample/ipmi_serial_bmc_emu.c
-@@ -42,7 +42,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <sys/select.h>
--#include <editline/readline.h>
-+#include <readline/readline.h>
- 
- #define _GNU_SOURCE
- #include <getopt.h>
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb
similarity index 95%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb
index 126b37f11..f196eb992 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.27.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.28.bb
@@ -29,15 +29,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://openipmi-remove-host-path-from-la_LDFLAGS.patch \
            file://ipmi-init-fix-the-arguments.patch \
            file://include_sys_types.patch \
-           file://ipmi_serial_bmc_emu.c-include-readline.h-from-readli.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "d525ceaa07df5440674e7e68a6772fe7"
-SRC_URI[sha256sum] = "f3b1fafaaec2e2bac32fec5a86941ad8b8cb64543470bd6d819d7b166713d20b"
+SRC_URI[md5sum] = "ba37f08e306062ec73c7ed2a2bd4d5f4"
+SRC_URI[sha256sum] = "8e8b1de2a9a041b419133ecb21f956e999841cf2e759e973eeba9a36f8b40996"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
 
-- 
2.17.1




