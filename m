Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1861C7FCE3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 02:09:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81708570"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 10:09:32 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7CB744CE1CBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 10:00:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 10:09:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 Jan 2020 10:09:38 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 12 Jan 2020 22:00:58 -0800
Message-ID: <1578895261-30411-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578895261-30411-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 7CB744CE1CBB.A6C43
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] libsdl2-image: upgrade 2.0.3 -> 2.0.5
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
X-List-Received-Date: Mon, 13 Jan 2020 02:09:33 -0000
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libsdl2-image_2.0.3.bb => libsdl2-image_2.0.5.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.0.3.bb => libsdl2-image_2.0.5.bb} (80%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
similarity index 80%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
index 6deb352e6..0a346bd9e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.5.bb
@@ -2,13 +2,13 @@ SUMMARY = "Simple DirectMedia Layer image library v2"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a855a9eb5507fc556e672080c4b428ca"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=822edb694b20ff16ceef85b27f61c11f"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${PV}.tar.gz"
-SRC_URI[md5sum] = "c6baf6dfa80fa8a66853661a36a6034e"
-SRC_URI[sha256sum] = "3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368"
+SRC_URI[md5sum] = "f26f3a153360a8f09ed5220ef7b07aea"
+SRC_URI[sha256sum] = "bdd5f6e026682f7d7e1be0b6051b209da2f402a2dd8bd1c4bd9c25ad263108d0"
 
 S = "${WORKDIR}/SDL2_image-${PV}"
 
-- 
2.17.1




