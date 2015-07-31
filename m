Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7DCA77653C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 03:46:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105260"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:50:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3im8s018170
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:44:48 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:46:39 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:46:20 +0800
Message-ID: <1438314380-3834-8-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314380-3834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 8/8] twm: upgrade 1.0.8 -> 1.0.9
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
X-List-Received-Date: Fri, 31 Jul 2015 03:46:42 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-app/{twm_1.0.8.bb => twm_1.0.9.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{twm_1.0.8.bb => twm_1.0.9.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb
rename to meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb
index 3574ba9..41c804b 100644
--- a/meta-oe/recipes-graphics/xorg-app/twm_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xorg-app/twm_1.0.9.bb
@@ -5,9 +5,8 @@ DEPENDS += " libxext libxt libxmu bison-native"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c6d42ef60e8166aa26606524c0b9586"
 
-
-SRC_URI[md5sum] = "4b28317d4a9f7ca61bef8462e132bd4c"
-SRC_URI[sha256sum] = "7660352353d632127ff50390991706aa660b28a4ada816c2582ac02720722e44"
+SRC_URI[md5sum] = "59a6f076cdacb5f6945dac809bcf4906"
+SRC_URI[sha256sum] = "c575167ac33edf3bd1592f1bedfe0559debb128ed5fb4873c1278e3be166310a"
 
 FILES_${PN} += "${datadir}/X11/twm/system.twmrc"
 ALTERNATIVE_NAME = "x-window-manager"
-- 
1.8.4.2


