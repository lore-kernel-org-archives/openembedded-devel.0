Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 957E860C16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 02:38:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86439490"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:38:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 5F78250A9967
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 10:28:20 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:38:22 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 10:38:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 10:40:49 +0800
Message-ID: <20200317024049.31496-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 5F78250A9967.A5075
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libgphoto2: upgrade 2.5.23 -> 2.5.24
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
X-List-Received-Date: Tue, 17 Mar 2020 02:38:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.23.bb => libgphoto2_2.5.24.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.23.bb => libgphoto2_2.5.24.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
index a012c499c..9d9b0c78c 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "bf052ce815e607dc781c5b0f3c5ca5c0"
-SRC_URI[libgphoto2.sha256sum] = "d8af23364aa40fd8607f7e073df74e7ace05582f4ba13f1724d12d3c97e8852d"
+SRC_URI[libgphoto2.md5sum] = "063632d839b71698e99da0ccd19bc9f6"
+SRC_URI[libgphoto2.sha256sum] = "fd3c578769f0fa389c1e68120f224bd98477aa3d82d16b82746c1266c0d4fb31"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.20.1




