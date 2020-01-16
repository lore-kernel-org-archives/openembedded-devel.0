Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 622047F89A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 02:15:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,323,1574092800"; d="scan'208";a="81930914"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 10:15:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 104424CE20E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 10:06:10 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 10:15:16 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 10:15:15 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 10:16:43 +0800
Message-ID: <20200116021643.21870-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 104424CE20E1.A9104
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] dhcpcd: upgrade 8.1.1 -> 8.1.5
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
X-List-Received-Date: Thu, 16 Jan 2020 02:15:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-files/0001-dhcpcd-Fix-build-error-with-musl.patch
Removed since this is included in 8.1.5.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{dhcpcd_8.1.1.bb => dhcpcd_8.1.5.bb}      |  7 ++--
 ...001-dhcpcd-Fix-build-error-with-musl.patch | 34 -------------------
 2 files changed, 3 insertions(+), 38 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_8.1.1.bb => dhcpcd_8.1.5.bb} (80%)
 delete mode 100644 meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb
similarity index 80%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb
index a5aa584f5..3349ca153 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.1.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.1.5.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
-           file://0001-dhcpcd-Fix-build-error-with-musl.patch"
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
 
-SRC_URI[md5sum] = "dc4f29a62afc53cdac311e925cfd1bc7"
-SRC_URI[sha256sum] = "485d308fe10febd36b6f936e4260e4ab34a146e4f00a9f7a5509c4377ad5ea82"
+SRC_URI[md5sum] = "57fd5dd4ff9722773ec67239db34d3b5"
+SRC_URI[sha256sum] = "c5cbe15069cef347e72d0bf7a19b0255571ee0c184c6705859a09588a50a8ebd"
 
 inherit pkgconfig autotools-brokensep
 
diff --git a/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch b/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
deleted file mode 100644
index b48b467b8..000000000
--- a/meta-networking/recipes-connectivity/dhcpcd/files/0001-dhcpcd-Fix-build-error-with-musl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Subject: [PATCH] dhcpcd: Fix build error with musl.
-
-Re-organize the header includes in if-linux.c to fix error as follows:
-In file included from if-linux.c:49:
-path/usr/include/netinet/if_ether.h:112:8: error: redefinition of 'struct ethhdr'
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- src/if-linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/if-linux.c b/src/if-linux.c
-index fd47278..bfa878b 100644
---- a/src/if-linux.c
-+++ b/src/if-linux.c
-@@ -37,6 +37,7 @@
- #include <linux/if_addr.h>
- #include <linux/if_link.h>
- #include <linux/if_packet.h>
-+#include <netinet/if_ether.h>
- #include <linux/if_tun.h>
- #include <linux/if_vlan.h>
- #include <linux/filter.h>
-@@ -46,7 +47,6 @@
- 
- #include <arpa/inet.h>
- #include <net/if.h>
--#include <netinet/if_ether.h>
- #include <netinet/in_systm.h>
- #include <netinet/in.h>
- #include <net/route.h>
--- 
-2.7.4
-
-- 
2.20.1




