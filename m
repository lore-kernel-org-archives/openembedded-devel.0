Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 532 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Aug 2017 11:32:49 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BB7C778675
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B0D872F1FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id r4-2D-DRiyGh
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:58 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 1C1242EAE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 083141E083
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:58 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F15581E081
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:57 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id E5CAD25B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:57 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7GBNvsq006901
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:23:57 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7GBNuI0006900
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Aug 2017 13:23:56 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Aug 2017 13:23:51 +0200
Message-Id: <20170816112351.6854-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] start-stop-daemon: Only create a link in ${base_sbindir} if necessary
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
X-List-Received-Date: Wed, 16 Aug 2017 11:32:50 -0000

If usrmerge is enabled in DISTRO_FEATURES, then ${base_sbindir} and
${sbindir} are set to the same path and the symbolic link from
${base_sbindir}/start-stop-daemon to ${sbindir}/start-stop-daemon can
(and should) not be created.
---
 .../recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
index 5ee4472cd..cc2727b75 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.17.25.bb
@@ -31,6 +31,8 @@ do_install_append () {
 
     # support for buggy init.d scripts that refer to an alternative
     # explicit path to start-stop-daemon
-    mkdir -p ${D}/sbin/
-    ln -sf /usr/sbin/start-stop-daemon ${D}/sbin/start-stop-daemon
+    if [ "${base_sbindir}" != "${sbindir}" ]; then
+        mkdir -p ${D}${base_sbindir}
+        ln -sf ${sbindir}/start-stop-daemon ${D}${base_sbindir}/start-stop-daemon
+    fi
 }
-- 
2.12.0


