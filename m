Return-Path: <gizero-desktop@teamware.it>
X-Greylist: delayed 1447 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 08:09:38 UTC
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it [87.12.65.168])
	by mail.openembedded.org (Postfix) with ESMTP id B04D265DDB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 08:09:38 +0000 (UTC)
Received: by gizero-desktop.tw.it (Postfix, from userid 1000)
	id 43F7AE0A26; Mon,  5 May 2014 09:45:29 +0200 (CEST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 May 2014 09:45:23 +0200
Message-Id: <1399275923-19242-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libconfig: inherit from autotools-brokensep
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
X-List-Received-Date: Mon, 05 May 2014 08:09:39 -0000

do_compile fails otherwise

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libconfig/libconfig_1.4.9.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
index c7d3cf7..22eecf8 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
 SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
-- 
1.7.9.5


