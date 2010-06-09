Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OMRL8-0001Fw-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 21:53:33 +0200
Received: from localhost.localdomain (openvpn.altell.local [192.168.1.13])
	by mail.altell.local (Postfix) with ESMTP id A4A0E681E3;
	Wed,  9 Jun 2010 23:28:31 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 23:48:31 +0400
Message-Id: <1276112911-30633-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-Altell-MailScanner-ID: A4A0E681E3.2FE43
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] shadow: added new package shadow-group. Fix for build with uclibc.
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
X-List-Received-Date: Wed, 09 Jun 2010 19:53:33 -0000

From: Vladimir Sorokin <sorokin@altell.ru>

shadow-group contains utilities (sg, newgrp, gpasswd) for groups manipulating,
useful when you only need things not provided by busybox.

Signed-off-by: Vladimir Sorokin <sorokin@altell.ru>
Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/shadow/shadow.inc |   32 +++++++++++++++++++++++++++++---
 1 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 460930b..97a2e19 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -13,7 +13,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
 
-INC_PR = "r14"
+INC_PR = "r15"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -42,8 +42,23 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
 "
 
+EXTRA_OECONF_linux-uclibc += "\
+    --disable-account-tools-setuid \
+    --disable-shadowgrp \
+    --without-audit \
+    --without-selinux \
+    --without-libcrack \
+    --without-nscd \
+    ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
+"
+
 CFLAGS += "-I../include"
 
+PACKAGES =+ "${PN}-group"
+RDEPENDS_${PN} += "${PN}-group"
+
+FILES_${PN}-group = "${bindir}/gpasswd ${bindir}/newgrp.shadow ${bindir}/sg"
+
 do_configure_prepend () {
     export CONFIG_SITE="${CONFIG_SITE} ${B}/cachedpaths"
     cat <<END >${B}/cachedpaths
@@ -107,7 +122,6 @@ pkg_postinst_${PN} () {
     update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
     update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
     update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
-    update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
     update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
     update-alternatives --install ${base_bindir}/login login login.${PN} 200
     update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
@@ -120,7 +134,19 @@ pkg_postinst_${PN} () {
 }
 
 pkg_prerm_${PN} () {
-    for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
+    for i in passwd chpasswd chfn chsh login vipw vigr ; do
+        update-alternatives --remove $i $i.${PN}
+    done
+}
+
+pkg_postinst_${PN}-group () {
+   touch /etc/login.defs
+   update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
+}
+
+pkg_prerm_${PN}-group () {
+    for i in newgrp ; do
         update-alternatives --remove $i $i.${PN}
     done
 }
+
-- 
1.6.4.2



