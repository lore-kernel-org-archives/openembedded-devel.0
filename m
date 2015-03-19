Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id B17E865CD0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2015 22:42:22 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id BF259499; Thu, 19 Mar 2015 23:42:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 76AF391;
	Thu, 19 Mar 2015 23:42:22 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Mar 2015 23:42:07 +0100
Message-Id: <1426804927-4541-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] v4l-utils: properly package libv4l-dev
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
X-List-Received-Date: Thu, 19 Mar 2015 22:42:23 -0000

libv4l-dev is missing headers, .so links and packageconfig files.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index cea97dc76f89..a5c802c090be 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -40,4 +40,6 @@ FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv
                  ${libdir}/libv4l/*-decomp"
 
 FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
-FILES_libv4l-dev += "${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
+FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
+                     ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
+                     ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.1.0


