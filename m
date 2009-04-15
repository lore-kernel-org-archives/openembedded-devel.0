Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4PX-0008Gf-Fq
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:40:46 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id D7E2D683D1;
	Wed, 15 Apr 2009 16:36:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:35:57 +0400
Message-Id: <1239798960-3586-8-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-7-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
	<1239798960-3586-7-git-send-email-khimov@altell.ru>
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
Subject: [PATCH 08/11] glibc: move get_glibc_fpu_setting to glibc.inc
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
 recipes/glibc/glibc-package.bbclass |    5 -----
 recipes/glibc/glibc.inc             |    5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/glibc/glibc-package.bbclass b/recipes/glibc/glibc-package.bbclass
index 89fbd1c..1690a30 100644
--- a/recipes/glibc/glibc-package.bbclass
+++ b/recipes/glibc/glibc-package.bbclass
@@ -58,11 +58,6 @@ DESCRIPTION_ldd = "glibc: print shared library dependencies"
 DESCRIPTION_localedef = "glibc: compile locale definition files"
 DESCRIPTION_glibc-utils = "glibc: misc utilities like iconf, local, gencat, tzselect, rpcinfo, ..."
 
-def get_glibc_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-        return "--without-fp"
-    return ""
-
 EXTRA_OECONF += "${@get_glibc_fpu_setting(bb, d)}"
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
diff --git a/recipes/glibc/glibc.inc b/recipes/glibc/glibc.inc
index c2ee531..1bdd62b 100644
--- a/recipes/glibc/glibc.inc
+++ b/recipes/glibc/glibc.inc
@@ -17,6 +17,11 @@ LEAD_SONAME = "libc.so"
 GLIBC_EXTRA_OECONF ?= ""
 INHIBIT_DEFAULT_DEPS = "1"
 
+def get_glibc_fpu_setting(bb, d):
+	if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+		return "--without-fp"
+	return ""
+
 ARM_INSTRUCTION_SET = "arm"
 
 PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



