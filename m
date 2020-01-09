Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DDC877FC3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:12:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81538365"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 17:12:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B310749E933F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 17:03:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 17:12:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 Jan 2020 17:12:43 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 05:16:13 -0800
Message-ID: <1578575774-86089-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B310749E933F.A315A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libgphoto2: upgrade 2.5.17 -> 2.5.23
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
X-List-Received-Date: Thu, 09 Jan 2020 09:12:33 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gphoto2/{libgphoto2_2.5.17.bb => libgphoto2_2.5.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.17.bb => libgphoto2_2.5.23.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
index 623037bc3..a3bdf9cea 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.17.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.23.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "ae78e7a7936a6962c3a22b256bee1869"
-SRC_URI[libgphoto2.sha256sum] = "417464f0a313fa937e8a71cdf18a371cf01e750830195cd63ae31da0d092b555"
+SRC_URI[libgphoto2.md5sum] = "bf052ce815e607dc781c5b0f3c5ca5c0"
+SRC_URI[libgphoto2.sha256sum] = "d8af23364aa40fd8607f7e073df74e7ace05582f4ba13f1724d12d3c97e8852d"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.17.1




