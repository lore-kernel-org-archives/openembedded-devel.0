Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OsWAC-0007KT-GW
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:30:49 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OsW9Y-0004Wr-Pd from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 00:30:09 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 6 Sep 2010 09:30:06 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 13:28:32 +0600
Message-Id: <1283758112-15445-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 06 Sep 2010 07:30:07.0022 (UTC)
	FILETIME=[545084E0:01CB4D95]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V2] sip-native: Convert to new style staging, remove do_stage()
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
X-List-Received-Date: Mon, 06 Sep 2010 07:30:49 -0000

* Convert do_stage to do_install
* Inherit recipe with python-dir for PYTHON_SITEPACKAGES_DIR variable
* Replace ${STAGING_BINDIR_NATIVE} with ${D}${bindir}
* Replace ${STAGING_PYDIR}/site-packages with ${D}${PYTHON_SITEPACKAGES_DIR}
* Set NATIVE_INSTALL_WORKS = "1"
* Bump PR from "ml0" to "ml1"

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sip/sip-native_4.7.9.bb |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/recipes/sip/sip-native_4.7.9.bb b/recipes/sip/sip-native_4.7.9.bb
index 106c81e..09d9056 100644
--- a/recipes/sip/sip-native_4.7.9.bb
+++ b/recipes/sip/sip-native_4.7.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 SECTION = "devel"
 PRIORITY = "optional"
 LICENSE = "GPL"
-PR = "ml0"
+PR = "ml1"
 
 SRC_URI = "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-${PV}.tar.gz"
 SRC_URI[md5sum] = "597d7ff7edb42a18421c806ffd18a136"
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf4
 
 S = "${WORKDIR}/sip-${PV}/sipgen"
 
-inherit qt4x11 native
+inherit qt4x11 native python-dir
 
 EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
 
@@ -24,12 +24,13 @@ export STAGING_INCDIR
 do_configure_prepend() {
         cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
 }
-do_stage() {
-        install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
+do_install() {
+        install -d ${D}${bindir}
+        install -m 0755 sip ${D}${bindir}/sip
         cd ${WORKDIR}/sip-${PV} && python configure.py
-        install -d ${STAGING_PYDIR}/site-packages
-        install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        install -m 0755 sip*.py ${D}${PYTHON_SITEPACKAGES_DIR}
 }
 
 DEFAULT_PREFERENCE = "-1"
-
+NATIVE_INSTALL_WORKS = "1"
-- 
1.6.3.3



