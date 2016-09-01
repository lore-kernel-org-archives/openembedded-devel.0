Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 68E1B73D27
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 07:23:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10501412"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2016 15:23:22 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 64F4E403C86F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 15:23:22 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 1 Sep 2016 15:23:21 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 03:23:19 -0400
Message-ID: <1472714599-2081-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 64F4E403C86F.A5292
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] smartmontools: 6.4 -> 6.5
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
X-List-Received-Date: Thu, 01 Sep 2016 07:23:22 -0000
Content-Type: text/plain

Upgrade smartmontools from 6.4 to 6.5.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../smartmontools/{smartmontools_6.4.bb => smartmontools_6.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.4.bb => smartmontools_6.5.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
index 86e6d9e..e4ca028 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.5.bb
@@ -24,8 +24,8 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "56812c8312fd123ed40ef65afde1049e"
-SRC_URI[sha256sum] = "eab75600c1eda9c34b13097db71138ab376f3dad8a6a4667fb4d1d081feb7a85"
+SRC_URI[md5sum] = "093aeec3f8f39fa9a37593c4012d3156"
+SRC_URI[sha256sum] = "89e8bb080130bc6ce148573ba5bb91bfe30236b64b1b5bbca26515d4b5c945bc"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4




