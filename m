Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tdz0o-0006fj-Iu
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2012 08:58:24 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5F735D2218;
	Thu, 29 Nov 2012 08:44:18 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2012 08:43:58 +0100
Message-Id: <1354175038-16001-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] xfsprogs: updated to 3.1.8, added gnu-configize
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
X-List-Received-Date: Thu, 29 Nov 2012 07:58:24 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../remove-install-as-user.patch                                  | 0
 .../xfsprogs/{xfsprogs_3.1.7.bb => xfsprogs_3.1.8.bb}             | 8 +++++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/xfsprogs/{xfsprogs-3.1.7 => xfsprogs-3.1.8}/remove-install-as-user.patch (100%)
 rename meta-oe/recipes-support/xfsprogs/{xfsprogs_3.1.7.bb => xfsprogs_3.1.8.bb} (86%)

diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/remove-install-as-user.patch
similarity index 100%
rename from meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.7/remove-install-as-user.patch
rename to meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/remove-install-as-user.patch
diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
similarity index 86%
rename from meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
rename to meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
index 3bc4897..f83561d 100644
--- a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.7.bb
+++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
@@ -5,13 +5,14 @@ LICENSE = "GPLv2"
 LICENSE_libhandle = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=dbdb5f4329b7e7145de650e9ecd4ac2a"
 DEPENDS = "util-linux"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
 	file://remove-install-as-user.patch \
 "
-SRC_URI[md5sum] = "049cf9873794ea49d0bb3f12d45748a4"
-SRC_URI[sha256sum] = "e150914210ac5fd29c098ef0fd94bdec51d2fb231cf9faa765c16ec6d75c8eaa"
+
+SRC_URI[md5sum] = "f70b2e7200d4c29f0af1cf70e7be1db6"
+SRC_URI[sha256sum] = "74409e2e3748074999df25c00f722621659a0bd3607e677f0bcc4373b8c93eab"
 
 inherit autotools
 
@@ -26,6 +27,7 @@ FILES_libhandle = "${base_libdir}/libhandle${SOLIBS}"
 EXTRA_OECONF = "--enable-gettext=no"
 do_configure () {
 	export DEBUG="-DNDEBUG"
+	gnu-configize --force
 	oe_runconf
 }
 
-- 
1.8.0



