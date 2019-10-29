Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5F057FBBD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 10:30:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,243,1569254400"; d="scan'208";a="77635149"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 18:30:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7EF644B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:22:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 18:30:42 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Oct 2019 02:25:02 +0800
Message-ID: <1572373502-15453-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7EF644B6EC6D.AA262
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH v2] dhcpcd: upgrade 8.0.2 -> 8.1.1
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
X-List-Received-Date: Tue, 29 Oct 2019 10:30:47 -0000
Content-Type: text/plain

1) Add 0001-dhcpcd-Fix-build-error-with-musl.patch to fix musl build error.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb}    |  9 ++++--
 .../0001-dhcpcd-Fix-build-error-with-musl.patch    | 33 ++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.0.2.bb => dhcpcd_8.1.1.bb} (79%)
 create mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
similarity index 79%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
index 79d1dad..55ee452 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.2.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
@@ -11,8 +11,13 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
-SRC_URI[md5sum] = "c0375a1f725f1c191b43af60e4f7175b"
-SRC_URI[sha256sum] = "33a26ad561546cd2cfe1e6de6352a85df72b41c37def8c7eb00e90e57c627a5c"
+
+SRC_URI_append_libc-musl = " \
+    file://0001-dhcpcd-Fix-build-error-with-musl.patch \
+"
+
+SRC_URI[md5sum] = "dc4f29a62afc53cdac311e925cfd1bc7"
+SRC_URI[sha256sum] = "485d308fe10febd36b6f936e4260e4ab34a146e4f00a9f7a5509c4377ad5ea82"
 
 inherit pkgconfig autotools-brokensep
 
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
new file mode 100644
index 0000000..daca881
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
@@ -0,0 +1,33 @@
+Subject: [PATCH] dhcpcd: Fix build error with musl.
+
+Error as follows:
+In file included from if-linux.c:49:
+path/usr/include/netinet/if_ether.h:112:8: error: redefinition of 'struct ethhdr'
+
+When build with musl, define _NETINET_IF_ETHER_H and include <net/if_arp.h>.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ src/if-linux.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/if-linux.c b/src/if-linux.c
+index fd47278..35c5dba 100644
+--- a/src/if-linux.c
++++ b/src/if-linux.c
+@@ -46,6 +46,12 @@
+ 
+ #include <arpa/inet.h>
+ #include <net/if.h>
++
++#if !(__UCLIBC__ || __GLIBC__)
++#define _NETINET_IF_ETHER_H
++#include <net/if_arp.h>
++#endif
++
+ #include <netinet/if_ether.h>
+ #include <netinet/in_systm.h>
+ #include <netinet/in.h>
+-- 
+2.7.4
+
-- 
2.7.4




