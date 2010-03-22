Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NtfXi-0002y4-TP
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 12:11:41 +0100
Received: (qmail 14352 invoked by uid 813007); 22 Mar 2010 11:08:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Mar 2010 11:08:29 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 12:06:56 +0100
Message-Id: <1269256016-13155-11-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH][STABLE] shadow: use u-a on binaries that conflict with util-linux-ng
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
X-List-Received-Date: Mon, 22 Mar 2010 11:11:43 -0000

From: Koen Kooi <koen@openembedded.org>

---
 recipes/shadow/shadow.inc |   27 +++++++++++++++++++++------
 1 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 5e3d2f2..30bd92f 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,7 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r10"
+INC_PR = "r13"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -79,16 +79,30 @@ do_install_append() {
   sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
   sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
 
-  mv ${D}${bindir}/passwd ${D}${bindir}/passwd.${PN}
+  install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
+  for i in passwd chfn newgrp chsh ; do
+    mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
+  done
+
   mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
+  mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
+  mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
+  mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
 
   # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
   install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
+
 }
 
 pkg_postinst_${PN} () {
-    update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 100
-    update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 100
+    update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
+    update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
+    update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
+    update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
+    update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
+    update-alternatives --install ${base_bindir}/login login login.${PN} 200
+    update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
+    update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
     if [ "x$D" != "x" ]; then
         exit 1
     fi  
@@ -97,6 +111,7 @@ pkg_postinst_${PN} () {
 }
 
 pkg_prerm_${PN} () {
-    update-alternatives --remove passwd passwd.${PN}
-    update-alternatives --remove chpasswd chpasswd.${PN}
+    for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
+        update-alternatives --remove $i $i.${PN}
+    done
 }
-- 
1.7.0.2





