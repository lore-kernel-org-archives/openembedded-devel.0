Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id AB2A77F7EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:08:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:08:44 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 58D8C4CE1C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 09:59:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:08:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:08:49 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:00:55 -0800
Message-ID: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 58D8C4CE1C8A.A743F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] ipmiutil: upgrade 3.0.5 -> 3.1.5
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
X-List-Received-Date: Mon, 13 Jan 2020 02:08:45 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ipmiutil/{ipmiutil_3.0.5.bb => ipmiutil_3.1.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/ipmiutil/{ipmiutil_3.0.5.bb => ipmiutil_3.1.5.bb} (92%)

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.0.5.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
similarity index 92%
rename from meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.0.5.bb
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
index 338cafd53..3e2634028 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.0.5.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.1.5.bb
@@ -22,8 +22,8 @@ PARALLEL_MAKE = ""
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
           "
-SRC_URI[md5sum] = "5feaf6a827205792e057bb4ff5c4e842"
-SRC_URI[sha256sum] = "b2d7f72535131c7832ba4be13dc33c81513fc3ee43fe797b4b52014600ecee5e"
+SRC_URI[md5sum] = "292d6df25cad678bb27e5c8cdc6748f9"
+SRC_URI[sha256sum] = "58ccdbd5755d7dd72478756715af09e9c73330dfad2b91dbf03d2ac504b301a3"
 
 inherit autotools-brokensep pkgconfig systemd
 
-- 
2.17.1




