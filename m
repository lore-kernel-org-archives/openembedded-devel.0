Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4PX-0008Gg-Fo
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:40:37 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id C7259683D0;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:56 +0400
Message-Id: <1239798960-3586-7-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-6-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/11] gcc-cross: add multilib overrides
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
X-List-Received-Date: Wed, 15 Apr 2009 12:40:54 -0000

---
 recipes/gcc/gcc-cross.inc         |    2 ++
 recipes/gcc/gcc-package-cross.inc |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-cross.inc b/recipes/gcc/gcc-cross.inc
index 3fa6f61..3c8438b 100644
--- a/recipes/gcc/gcc-cross.inc
+++ b/recipes/gcc/gcc-cross.inc
@@ -9,4 +9,6 @@ target_base_libdir := "${base_libdir}"
 inherit cross
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc"
+DEPENDS_multilib = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc virtual/${TARGET_SYS_MULTILIB}-libc-for-gcc"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+PROVIDES_multilib = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++ virtual/${TARGET_SYS_MULTILIB}gcc virtual/${TARGET_SYS_MULTILIB}g++"
diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
index 77da3fe..5ae1894 100644
--- a/recipes/gcc/gcc-package-cross.inc
+++ b/recipes/gcc/gcc-package-cross.inc
@@ -15,6 +15,13 @@ FILES_libgcc = "${target_base_libdir}/libgcc_s.so.1"
 
 FILES_libstdc++ = "${target_libdir}/libstdc++.so.*"
 
+PACKAGES_append_multilib = " libgcc-${ARCH_MULTILIB} libssp-${ARCH_MULTILIB} libstdc++-${ARCH_MULTILIB} libg2c-${ARCH_MULTILIB} libgfortran-${ARCH_MULTILIB}"
+FILES_libgcc-${ARCH_MULTILIB} = "${layout_base_prefix}/${LIB_MULTILIB}/libgcc_s.so.1"
+FILES_libssp-${ARCH_MULTILIB} = "${layout_exec_prefix}/${LIB_MULTILIB}/libssp.so.*"
+FILES_libstdc++-${ARCH_MULTILIB} = "${layout_exec_prefix}/${LIB_MULTILIB}/libstdc++.so.*"
+FILES_libg2c-${ARCH_MULTILIB} = "${layout_exec_prefix}/${LIB_MULTILIB}/libg2c.so.*"
+FILES_libgfortran-${ARCH_MULTILIB} = "${layout_exec_prefix}/${LIB_MULTILIB}/libgfortran.so.*"
+
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 
@@ -73,3 +80,31 @@ do_install () {
               cd $currdir
        fi
 }
+
+do_install_append_multilib () {
+	mkdir -p ${D}${base_multilibdir}
+        if [ -f ${D}${base_multilibdir}/libgcc_s.so.? ]; then
+                # Already in the right location
+                :
+        elif [ -f ${D}${prefix}/${LIB_MULTILIB}/libgcc_s.so.? ]; then
+                mv -f ${D}${prefix}/${LIB_MULTILIB}/libgcc_s.so* ${D}${base_multilibdir} || true
+        else
+                mv -f ${D}${prefix}/*/${LIB_MULTILIB}/libgcc_s.so* ${D}${base_multilibdir} || true 
+        fi
+
+        mkdir -p ${D}${multilibdir}
+
+        mv -f ${D}${prefix}/*/${LIB_MULTILIB}/libstdc++.so* ${D}${multilibdir} || true
+        mv -f ${D}${prefix}/*/${LIB_MULTILIB}/libg2c.so* ${D}${multilibdir} || true
+        mv -f ${D}${prefix}/*/${LIB_MULTILIB}/libgfortran*.so* ${D}${multilibdir} || true
+        mv -f ${D}${prefix}/*/${LIB_MULTILIB}/libssp*.so* ${D}${multilibdir} || true
+
+        # Manually run the target stripper since we won't get it run by
+        # the packaging.
+        if [ "x${OLD_INHIBIT_PACKAGE_STRIP}" != "x1" ]; then
+                ${TARGET_PREFIX}strip ${D}${multilibdir}/libstdc++.so.*
+                ${TARGET_PREFIX}strip ${D}${multilibdir}/libg2c.so.* || true
+                ${TARGET_PREFIX}strip ${D}${base_multilibdir}/libgcc_s.so.* || true
+                ${TARGET_PREFIX}strip ${D}${multilibdir}/libgfortran*.so* || true
+	fi
+}
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



