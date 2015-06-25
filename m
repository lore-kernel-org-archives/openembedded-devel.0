Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7A34F6E6CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:00:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97724521"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Jun 2015 10:04:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5P1x8o1025010
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:59:08 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Jun 2015 10:00:45 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Jun 2015 10:00:18 +0800
Message-ID: <1435197618-1621-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435197618-1621-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-oe][PATCH 2/2] libndp: add new recipe
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
X-List-Received-Date: Thu, 25 Jun 2015 02:00:46 -0000
Content-Type: text/plain

Library for Neighbor Discovery Protocol.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
new file mode 100644
index 0000000..355cd75
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Library for Neighbor Discovery Protocol"
+HOMEPAGE = "http://libndp.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "git://github.com/jpirko/libndp.git"
+S = "${WORKDIR}/git"
+SRCREV = "5c348445478b0b022a4276eff1d625224f2dd32c"
+SRC_URI[md5sum] = "d591dc6bec5bf6d23ced2f5041046cff"
+SRC_URI[sha256sum] = "1be25cabf84d16279a1bcbb300f463fd8933db787fb73e3e406b8bff31210967"
+
+inherit autotools
-- 
1.8.4.2


