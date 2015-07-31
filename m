Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACA37648C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 06:21:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99110082"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 14:24:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V6JCTL026644
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:19:12 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 14:21:04 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:20:54 -0400
Message-ID: <1438352454-12145-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH] smartmontools: upgrade 6.2 -> 6.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jul 2015 06:21:14 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../smartmontools/{smartmontools_6.2.bb => smartmontools_6.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_6.2.bb => smartmontools_6.4.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
index fd7b1b8..4e51876 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.4.bb
@@ -24,8 +24,8 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng',
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "d44f84081a12cef79cd17f78044351fc"
-SRC_URI[sha256sum] = "486f660579bb0fb4f6b927ded7531cb1f99685c666397377761c5b04dd96065b"
+SRC_URI[md5sum] = "56812c8312fd123ed40ef65afde1049e"
+SRC_URI[sha256sum] = "eab75600c1eda9c34b13097db71138ab376f3dad8a6a4667fb4d1d081feb7a85"
 
 inherit autotools update-rc.d systemd
 
-- 
1.8.4.2


