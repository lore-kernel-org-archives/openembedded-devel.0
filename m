Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIfxl-0003Xf-QP
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 14:55:28 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 03C56D20D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 14:38:33 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Mar 2013 14:38:28 +0100
Message-Id: <1363873108-2848-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] openldap: do not strip during install
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
X-List-Received-Date: Thu, 21 Mar 2013 13:55:29 -0000

Before:
WARNING: File '/usr/lib/openldap/slapd' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapsearch' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapmodify' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapdelete' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapmodrdn' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldappasswd' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapwhoami' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapcompare' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapexop' from openldap was already stripped, this will prevent future debugging!
WARNING: File '/usr/bin/ldapurl' from openldap was already stripped, this will prevent future debugging!

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch | 2 +-
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
index 9d7640c..2992b70 100644
--- a/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/install-strip.patch
@@ -8,7 +8,7 @@
  	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)
  
 -LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
-+LTINSTALL = STRIPPROG="@STRIP@" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
++LTINSTALL = STRIPPROG="" $(LIBTOOL) --mode=install $(top_srcdir)/contrib/ldapc++/install-sh -c
  LTFINISH = $(LIBTOOL) --mode=finish
  
  # Misc UNIX commands used in build environment
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 319c50d..1c6c32f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://initscript"
 SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
 SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
 
+PR = "r1"
 # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
 # installing .so and executables, this fails in cross compilation
 # environments
-- 
1.8.1.2



