Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EAF6875F23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 09:46:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99074821"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Jul 2015 17:49:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6U9iCuF018040
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:44:12 +0800
Received: from localhost.localdomain (10.167.226.104) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 30 Jul 2015 17:46:03 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Jul 2015 13:45:56 -0400
Message-ID: <1438278356-8629-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.104]
Subject: [meta-oe][PATCH] iotop: upgrade 0.4.4 -> 0.6
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
X-List-Received-Date: Thu, 30 Jul 2015 09:46:11 -0000
Content-Type: text/plain

From: zhangpanpan <zhangpp-fnst@cn.fujitsu.com>

Signed-off-by: Zhang Panpan<zhangpp-fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} (83%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
similarity index 83%
rename from meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
rename to meta-oe/recipes-extended/iotop/iotop_0.6.bb
index d629245..5dcae98 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -4,14 +4,13 @@ DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
     a table of current I/O usage by processes on the system."
 HOMEPAGE = "http://guichaz.free.fr/iotop/"
 
-PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 SRC_URI = "http://guichaz.free.fr/iotop/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "cdd38b276cbf238676f5d2bcf098ba9c"
-SRC_URI[sha256sum] = "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d686483df0b0"
+SRC_URI[md5sum] = "5ef9456b26d7694abf3101a72e1e0d1d"
+SRC_URI[sha256sum] = "3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8dcef75b"
 
 inherit distutils
 
-- 
1.8.4.2


