Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TGQy7-0004I0-IJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2012 10:58:15 +0200
Received: from localhost.localdomain (public-gprs367906.centertel.pl
	[37.47.68.99])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DC4A7D22DB;
	Tue, 25 Sep 2012 10:45:31 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2012 10:45:18 +0200
Message-Id: <1348562718-30708-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lvm2: added missing dependency on udev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 08:58:15 -0000

checking for UDEV... no
configure: error: Package requirements (libudev >= 143) were not met:

No package 'libudev' found

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/lvm2/lvm2.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 7ac6a41..b357fd9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,5 +1,6 @@
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
+DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-- 
1.7.10.4



