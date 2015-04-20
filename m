Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 75E7E6AC24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 06:31:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90925171"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Apr 2015 14:27:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3K6UJvs031707
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:30:19 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 20 Apr 2015 14:31:32 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Apr 2015 14:31:30 +0800
Message-ID: <1429511490-48968-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][PATCH v2] pcsc-lite_1.8.6: Modified the license for libpcscspy.
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
X-List-Received-Date: Mon, 20 Apr 2015 06:31:34 -0000
Content-Type: text/plain

Because the license of libpcscspy.c is GPLv3+.
So modified the license of pcsc-lite-dev.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
index 5a58389..393a06f 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bb
@@ -1,6 +1,7 @@
 SUMMARY = "PC/SC Lite smart card framework and applications"
 HOMEPAGE = "http://pcsclite.alioth.debian.org/"
-LICENSE = "BSD"
+LICENSE = "BSD & GPLv3+"
+LICENSE_${PN}-dev = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a39d325b7d9cf2f07826a5154b16500c"
 DEPENDS = "udev"
 
-- 
1.8.4.2


