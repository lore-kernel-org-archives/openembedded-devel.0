Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9654560069
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 02:03:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37832302"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Mar 2018 10:03:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id CA2A6486A78C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:03:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Thu, 15 Mar 2018 10:03:21 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Mar 2018 10:03:14 +0800
Message-ID: <1521079395-25438-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: CA2A6486A78C.A687B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] smartmontools: 6.5 -> 6.6
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
X-List-Received-Date: Thu, 15 Mar 2018 02:03:22 -0000
Content-Type: text/plain

Upgrade smartmontools from 6.5 to 6.6.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../smartmontools/{smartmontools_6.5.bb => smartmontools_6.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.5.bb => smartmontools_6.6.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
index 0970d2a..1a1767e 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.6.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "093aeec3f8f39fa9a37593c4012d3156"
-SRC_URI[sha256sum] = "89e8bb080130bc6ce148573ba5bb91bfe30236b64b1b5bbca26515d4b5c945bc"
+SRC_URI[md5sum] = "9ae2c6e7131cd2813edcc65cbe5f223f"
+SRC_URI[sha256sum] = "51f43d0fb064fccaf823bbe68cf0d317d0895ff895aa353b3339a3b316a53054"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4




