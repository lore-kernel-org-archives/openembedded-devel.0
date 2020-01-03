Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id BDF527FBFD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:29:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,390,1571673600"; d="scan'208";a="81266647"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jan 2020 16:29:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EB19B406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 16:20:20 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 3 Jan 2020 16:29:16 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 3 Jan 2020 16:29:19 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Jan 2020 04:57:30 -0800
Message-ID: <1578056252-94410-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578056252-94410-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578056252-94410-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EB19B406AB15.A33AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] smartmontools: upgrade 7.0 -> 7.1
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
X-List-Received-Date: Fri, 03 Jan 2020 08:29:21 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{smartmontools_7.0.bb => smartmontools_7.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_7.0.bb => smartmontools_7.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb
index d98456654..b401272d2 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.0.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "b2a80e4789af23d67dfe1e88a997abbf"
-SRC_URI[sha256sum] = "e5e1ac2786bc87fdbd6f92d0ee751b799fbb3e1a09c0a6a379f9eb64b3e8f61c"
+SRC_URI[md5sum] = "430cd5f64caa4524018b536e5ecd9c29"
+SRC_URI[sha256sum] = "3f734d2c99deb1e4af62b25d944c6252de70ca64d766c4c7294545a2e659b846"
 
 inherit autotools update-rc.d systemd
 
-- 
2.17.1




