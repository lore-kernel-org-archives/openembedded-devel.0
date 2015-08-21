Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4F560557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:59:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99886554"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2015 18:02:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7L9xZrV000850
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 17:59:35 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 21 Aug 2015 17:59:39 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 17:59:58 +0800
Message-ID: <1440151198-47613-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] openwsman: modified SRC_URI to git
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
X-List-Received-Date: Fri, 21 Aug 2015 09:59:41 -0000
Content-Type: text/plain

not use github archives anymore, they are regenerated from time to time with different checksums.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
index 67cd618..0c6543d 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.0.bb
@@ -12,12 +12,14 @@ SECTION = "Applications/System"
 
 DEPENDS = "curl libxml2 openssl libpam"
 
-SRC_URI = "https://github.com/Openwsman/openwsman/archive/v${PV}.tar.gz \
+SRCREV = "f523bf1390c7ea23946bb9159978a4d7c198f1ba"
+PV = "2.6.0"
+
+SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service"
 
-SRC_URI[md5sum] = "824834a86040b98b03f3fc0f7f62e853"
-SRC_URI[sha256sum] = "449b4972dc7700918f8f674047f0a1a9c19eeee3f4ce82f47890dddfa56e823f"
+S = "${WORKDIR}/git"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
-- 
1.8.4.2


