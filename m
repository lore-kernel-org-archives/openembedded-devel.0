Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E853D61081
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:27:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488782"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:27:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 4AB4650A997A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:17:56 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:27:43 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:27:51 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:54 -0800
Message-ID: <1583236320-114088-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 4AB4650A997A.A34D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] gtkwave: upgrade 3.3.103 -> 3.3.104
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
X-List-Received-Date: Tue, 03 Mar 2020 05:27:50 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.103.bb => gtkwave_3.3.104.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.103.bb => gtkwave_3.3.104.bb} (85%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
similarity index 85%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
index fec3c7ce1..6c06c30aa 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "5a9a5913f9a02a333b2b23626f153fd7"
-SRC_URI[sha256sum] = "c325abf7cf26c53309a67c0ecaaf196774fa982a717a102c599ac8a516eeeaf7"
+SRC_URI[md5sum] = "23879689ecf7e2cdd2cd5a91c5c601da"
+SRC_URI[sha256sum] = "d20dd1a9307b908439c68122a9f81d3ff434a6bfa5439f0cb01398fec650894f"
 
 inherit pkgconfig autotools gettext texinfo mime mime-xdg
 DEPENDS += "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-- 
2.17.1




