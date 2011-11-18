Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RRJ9W-0006JX-Pb
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 08:46:27 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAI7Zsw0014619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 01:35:57 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7ZsNQ004747
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:05:54 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 18 Nov 2011 13:05:54 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7Zsri015104;
	Fri, 18 Nov 2011 13:05:54 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RRIzJ-0002U4-UL;
	Fri, 18 Nov 2011 13:05:53 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 13:05:49 +0530
Message-ID: <1321601749-9419-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 3/3] libgles-omap3.inc : Fix for library linking isssue with graphics SDK
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
X-List-Received-Date: Fri, 18 Nov 2011 07:46:27 -0000
Content-Type: text/plain

* This is the fix for the issue seen with opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target.
* With Graphics SDK release 04.04.00.02 onwards, there are 2 versions of the library libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For Xorg driver).In presence of libsrv_um_dri.so , the links created under /usr/lib were all by default linking to libsrv_um_dri.so only. Due to this 3D demos were failing.
* This fix makes sure that only one appropriate version of the library libsrv_um.so is present on target and hence links created will now be proper.

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index f6b94b0..119f74c 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -38,6 +38,18 @@ do_configure() {
 		chmod 0644 $i
 	done 
 
+	# The below for loop is the fix for the issue seen with opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target. 
+	# With Graphics SDK release 04.04.00.02, there are 2 versions of the library libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For Xorg driver). 
+	# In presence of libsrv_um_dri.so , the links created under /usr/lib were all by default linking to libsrv_um_dri.so only. Due to this 3D demos were failing. 
+	# Now this fix makes sure that only one appropriate version of the library libsrv_um.so is present on target and hence links created will now be proper.
+
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



