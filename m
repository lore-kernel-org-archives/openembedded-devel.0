Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 5012D79585
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 13:21:26 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 024852209C0;
	Wed, 26 Sep 2018 15:21:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 15:21:15 +0200
Message-Id: <20180926132115.10455-7-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180926132115.10455-1-max+openembedded@blarg.de>
References: <20180926132115.10455-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 7/7] libmms: drop obsolete "Requires:glib-2.0" from pkg-config file
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
X-List-Received-Date: Wed, 26 Sep 2018 13:21:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
index 831394e5c..668afc8c1 100644
--- a/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
+++ b/meta-oe/recipes-multimedia/libmms/libmms_0.6.4.bb
@@ -10,3 +10,11 @@ SRC_URI[md5sum] = "d6b665b335a6360e000976e770da7691"
 SRC_URI[sha256sum] = "3c05e05aebcbfcc044d9e8c2d4646cd8359be39a3f0ba8ce4e72a9094bee704f"
 
 inherit autotools pkgconfig
+
+do_install_append() {
+    # The GLib dependency was removed in libmms 0.6.3, but the
+    # "Requires" was not removed from the pkg-config file.  Since we
+    # don't have (and don't want) the RDEPENDS on GLib, we should
+    # remove the "Requires" line.
+    sed -i '/^Requires: glib-2\.0$/d' ${D}${libdir}/pkgconfig/libmms.pc
+}
-- 
2.19.0


