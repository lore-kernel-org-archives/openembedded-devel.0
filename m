Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4Pu-0008H7-N3
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:41:13 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id BFF4C683CF;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:55 +0400
Message-Id: <1239798960-3586-6-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-5-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/11] gcc-cross-intermediate: add multilib overrides
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
 recipes/gcc/gcc-cross-intermediate.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
index 4746140..5d8ac98 100644
--- a/recipes/gcc/gcc-cross-intermediate.inc
+++ b/recipes/gcc/gcc-cross-intermediate.inc
@@ -1,6 +1,8 @@
 DEPENDS = "virtual/${TARGET_PREFIX}binutils"
 DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
+DEPENDS_multilib = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-initial virtual/${TARGET_SYS_MULTILIB}-libc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
+PROVIDES_multilib = "virtual/${TARGET_PREFIX}gcc-intermediate virtual/${TARGET_SYS_MULTILIB}-gcc-intermediate"
 PACKAGES = ""
 
 # This is intended to be a -very- basic config
@@ -16,6 +18,8 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${layout_prefix} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${@get_gcc_fpu_setting(bb, d)}"
 
+EXTRA_OECONF_append_multilib = " --enable-multilib"
+
 do_stage_append () {
 	# get rid of dummy libc.so
 	if [ -z "`file ${STAGING_DIR_TARGET}${layout_libdir}/libc.so | grep "ASCII C program text"`" ]; then
@@ -26,3 +30,7 @@ do_stage_append () {
 do_install () {
 	:
 }
+
+do_install_multilib () {
+	:
+}
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



