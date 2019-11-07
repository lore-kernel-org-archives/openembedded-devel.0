Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Nov 2019 20:20:13 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id ABB6B745BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:20:13 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id A2B94BE4811; Thu,  7 Nov 2019 21:10:36 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:10:36 +0100
Message-Id: <20191107201036.16008-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] haveged: Fix missing initscript when both systemd and sysvinit are enabled
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
X-List-Received-Date: Thu, 07 Nov 2019 20:20:14 -0000

Haveged's makefile installs either one or the other.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
index 0189e19c09..a2f0d07f24 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.6.bb
@@ -35,6 +35,12 @@ do_install_append() {
     # The exit status is 143 when the service is stopped
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         sed -i '/ExecStart/a SuccessExitStatus=143' ${D}${systemd_system_unitdir}/haveged.service
+        # Hybrid systemd-sysvinit distros must install the initscript manually
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+            install -d ${D}${INIT_D_DIR}
+            sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat >${D}${INIT_D_DIR}/haveged
+            chmod 755 ${D}${INIT_D_DIR}/haveged
+        fi
     fi
 }
 
-- 
2.17.1


