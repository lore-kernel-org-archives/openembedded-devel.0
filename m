Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5D66660962
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 09:52:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98815255"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jul 2015 17:56:33 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6O9p4oO021292
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 17:51:04 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 24 Jul 2015 17:52:53 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Jul 2015 17:52:46 +0800
Message-ID: <1437731566-7363-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] opensc: upgrade 0.14.0 -> 0.15.0
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
X-List-Received-Date: Fri, 24 Jul 2015 09:53:00 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/opensc/{opensc_0.14.0.bb => opensc_0.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.14.0.bb => opensc_0.15.0.bb} (89%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.14.0.bb b/meta-oe/recipes-support/opensc/opensc_0.15.0.bb
similarity index 89%
rename from meta-oe/recipes-support/opensc/opensc_0.14.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.15.0.bb
index 87ea2ad..a11b3d8 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.14.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.15.0.bb
@@ -11,8 +11,8 @@ SECTION = "System Environment/Libraries"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
 
-SRC_URI[md5sum] = "1ee31dc2e89860458fd984e0cac9795e"
-SRC_URI[sha256sum] = "ffe8bcc704f2ab9a05c6781bc815f00eaf75cba0a1bd21e3142b9194a7bed5c9"
+SRC_URI[md5sum] = "f266024e5a9630821ffa0ac14f72e369"
+SRC_URI[sha256sum] = "8f8f8cf52e0252334e4dfdccca829b876a3de6340deb772aa0bfe0c0cc10eaf5"
 
 S = "${WORKDIR}/OpenSC-${PV}"
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
-- 
1.8.4.2


