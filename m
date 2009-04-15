Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4Q3-0008HD-IV
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:41:14 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id DF5DE683D2;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:58 +0400
Message-Id: <1239798960-3586-9-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-8-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
	<1239798960-3586-7-git-send-email-khimov@altell.ru>
	<1239798960-3586-8-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/11] glibc: add initial-multilib
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
X-List-Received-Date: Wed, 15 Apr 2009 12:41:48 -0000

---
 recipes/glibc/glibc-initial-multilib_2.6.1.bb |    7 +++++++
 recipes/glibc/glibc-initial.inc               |    6 ++++--
 recipes/glibc/glibc-multilib.inc              |    9 +++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 recipes/glibc/glibc-initial-multilib_2.6.1.bb
 create mode 100644 recipes/glibc/glibc-multilib.inc

diff --git a/recipes/glibc/glibc-initial-multilib_2.6.1.bb b/recipes/glibc/glibc-initial-multilib_2.6.1.bb
new file mode 100644
index 0000000..bd09fdb
--- /dev/null
+++ b/recipes/glibc/glibc-initial-multilib_2.6.1.bb
@@ -0,0 +1,7 @@
+require glibc_${PV}.bb
+require glibc-initial.inc
+require glibc-multilib.inc
+
+do_configure_prepend () {
+	unset CFLAGS
+}
diff --git a/recipes/glibc/glibc-initial.inc b/recipes/glibc/glibc-initial.inc
index 5528cf8..306e0a0 100644
--- a/recipes/glibc/glibc-initial.inc
+++ b/recipes/glibc/glibc-initial.inc
@@ -1,6 +1,7 @@
 SECTION = "libs"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
-PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
+GLIBC_PREFIX ?= "${TARGET_PREFIX}"
+DEPENDS = "virtual/${GLIBC_PREFIX}gcc-initial linux-libc-headers"
+PROVIDES = "virtual/${GLIBC_PREFIX}libc-initial"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.4', '${FILE_DIRNAME}/glibc-${PV}', '${FILE_DIRNAME}/glibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
 
 PACKAGES = ""
@@ -33,6 +34,7 @@ do_compile () {
 do_stage () {
 	oe_runmake cross-compiling=yes install_root=${STAGING_DIR_HOST} \
 	includedir='${layout_includedir}' prefix='${layout_prefix}' \
+	libdir='${layout_libdir}' slibdir='${layout_base_libdir}' \
 	install-bootstrap-headers=yes install-headers
 
 	oe_runmake csu/subdir_lib
diff --git a/recipes/glibc/glibc-multilib.inc b/recipes/glibc/glibc-multilib.inc
new file mode 100644
index 0000000..910e9ee
--- /dev/null
+++ b/recipes/glibc/glibc-multilib.inc
@@ -0,0 +1,9 @@
+CC += "${CFLAGS_MULTILIB}"
+TARGET_SYS = "${TARGET_SYS_MULTILIB}"
+HOST_SYS = "${TARGET_SYS_MULTILIB}"
+TARGET_PREFIX = "${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}-"
+GLIBC_PREFIX = "${TARGET_SYS_MULTILIB}-"
+layout_libdir="${layout_exec_prefix}/${LIB_MULTILIB}"
+layout_includedir="${layout_exec_prefix}/include/${TARGET_SYS_MULTILIB}"
+layout_base_libdir="${layout_base_prefix}/${LIB_MULTILIB}"
+layout_libexecdir="${layout_libdir}"
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



