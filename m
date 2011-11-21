Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RSSdC-0008Tj-Ml
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 13:05:51 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pALBxKxi016687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 05:59:22 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pALBxJhF003821
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:29:19 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 Nov 2011 17:29:19 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pALBxJam027638;
	Mon, 21 Nov 2011 17:29:19 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RSSWt-00040P-6S;
	Mon, 21 Nov 2011 17:29:19 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Nov 2011 17:29:15 +0530
Message-ID: <1321876755-15355-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 2/2] libgles-omap3.inc : Fix for library linking isssue with graphics SDK
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
X-List-Received-Date: Mon, 21 Nov 2011 12:05:51 -0000
Content-Type: text/plain

* This is the fix for the issue seen with opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target.
* With Graphics SDK release 04.04.00.02 onwards, there are 2 versions of the library libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For Xorg driver).In presence of libsrv_um_dri.so , the links created under /usr/lib were all by default linking to libsrv_um_dri.so only. Due to this 3D demos were failing.
* This fix makes sure that only one appropriate version of the library libsrv_um.so is present on target and hence links created will now be proper.

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 0b46818..24203b5 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -38,6 +38,17 @@ do_configure() {
 		chmod 0644 $i
 	done 
 
+	# The below for loop is the fix for the issue seen with opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target. 
+	# With Graphics SDK release 04.04.00.02, there are 2 versions of the library libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For Xorg driver). 
+	# In presence of libsrv_um_dri.so , the links created under /usr/lib were all by default linking to libsrv_um_dri.so only. Due to this 3D demos were failing. 
+	# Now this fix makes sure that only one appropriate version of the library libsrv_um.so is present on target and hence links created will now be proper.
+	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do
+		if [ "$drifile" != "" ] ; then
+			dir=$(dirname ${drifile})
+			rm -rf ${dir}/libsrv_um_dri.so
+		fi
+	done
+
 	# Attempt to create proper library softlinks
 	for sofile in $(find ${S} -name "lib*Open*.so") $(find ${S} -name "lib*srv*.so") $(find ${S} -name "lib*gl*.so") $(find ${S} -name "libpvr*.so") $(find ${S} -name "lib*GL*.so"); do
 		if [ "$(readlink -n ${sofile})" = "" ] ; then
-- 
1.7.1



