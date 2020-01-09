Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 16F797D6D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 09:11:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81538183"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 17:11:06 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F0DAE4CE1A0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 17:02:01 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 17:11:02 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 Jan 2020 17:11:12 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Jan 2020 05:16:10 -0800
Message-ID: <1578575774-86089-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578575774-86089-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: F0DAE4CE1A0C.A5935
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] gphoto2: upgrade 2.5.14 -> 2.5.23
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
X-List-Received-Date: Thu, 09 Jan 2020 09:11:06 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gphoto2/{gphoto2_2.5.14.bb => gphoto2_2.5.23.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{gphoto2_2.5.14.bb => gphoto2_2.5.23.bb} (79%)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb
similarity index 79%
rename from meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb
rename to meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb
index 75ad7f4f0..ef3100f66 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.14.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.23.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://0002-Look-for-popt-with-GP_CHECK_LIBRARY-function.patch \
 "
 
-SRC_URI[gphoto2.md5sum] = "6c6a21b5e879330cdd71ef92dce36399"
-SRC_URI[gphoto2.sha256sum] = "9302d02fb472d4936988382b7277ccdc4edaf7ede56c490278912ffd0627699c"
+SRC_URI[gphoto2.md5sum] = "0abd5ae8315109ae66bf06ac37902678"
+SRC_URI[gphoto2.sha256sum] = "df87092100e7766c9d0a4323217c91908a9c891c0d3670ebf40b76903be458d1"
 
 inherit autotools pkgconfig gettext
 
-- 
2.17.1




