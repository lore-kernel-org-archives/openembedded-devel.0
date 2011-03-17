Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0D5D-0004xA-Rb
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:17:44 +0100
Received: by bwz10 with SMTP id 10so2280734bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Je/aaPc79XSKGJhSc5AQXT37UQ2wD4vux71HV4SzNY0=;
	b=MyTZjyIqhqced1Y/9eHyA3nVK6+YFG9zXQPFNLPqvSMJg/lkMDoqBB2f2vGMno+9VT
	34rNemRFspnug1486c/jRRkSMmsfqPJuPRnbtzp16BMr3W1xGIj5QnVxzNa/TPrqP/e8
	W4Ik4ilnSAnDU6pMZkmIrYE33VczdiMu9KL0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=yDxDb4AsdpCFAM+eRlxodCCnxt6Vadqe3wPMm0U8HAnrPRuwDXA53rTrKNFcXXVRhE
	AHLUPCURCdny/2cqQ2JnJFG7O4wXzB1vMnsgMwzeXb/Ljx6z3L48kM9RtidkL97TkQeT
	keIHQU46mFD2lyhZrDZFaSSMcJgoyz3J050nY=
Received: by 10.204.120.141 with SMTP id d13mr1159134bkr.7.1300367755868;
	Thu, 17 Mar 2011 06:15:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm1361440bkc.2.2011.03.17.06.15.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 06:15:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2011 14:15:47 +0100
Message-Id: <1300367747-29308-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] e-wm: use E_WM_SYSACTIONS variable instead of hardcoded e-wm-sysactions runtime dependency
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
X-List-Received-Date: Thu, 17 Mar 2011 13:17:44 -0000

* e-wm-sysactions-shr doesn't need RPROVIDES anymore
* fixes last multiple providers notice I had
  NOTE: multiple providers are available for runtime e-wm-sysactions (e-wm, e-wm-sysactions-shr)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match e-wm-sysactions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/shr.conf                   |    1 +
 recipes/e17/e-wm_svn.bb                |    6 ++++--
 recipes/images/illume-image.bb         |    3 ++-
 recipes/shr/e-wm-sysactions-shr_git.bb |    4 +---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index be2441a..b24a392 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -115,6 +115,7 @@ IMAGE_INITSCRIPTS = "initscripts-shr"
 IPKG_VARIANT = "opkg"
 
 #Illume settings
+E_WM_SYSACTIONS = "e-wm-sysactions-shr"
 ILLUME_CONFIG = "e-wm-config-illume2-shr"
 ILLUME_THEME = "e-wm-theme-illume-gry"
 
diff --git a/recipes/e17/e-wm_svn.bb b/recipes/e17/e-wm_svn.bb
index e8f6b1e..9c22e65 100644
--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r18"
+PR = "r19"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives
@@ -91,13 +91,15 @@ PACKAGES =+ "\
   illume-keyboard-default-terminal \
 "
 
+E_WM_SYSACTIONS ?= "${PN}-sysactions"
+
 RRECOMMENDS_${PN} = "\
   ${PN}-config-default \
   ${PN}-images \
   ${PN}-icons \
   ${PN}-other \
   ${PN}-input-methods \
-  ${PN}-sysactions \
+  ${E_WM_SYSACTIONS} \
 "
 
 PACKAGE_ARCH_${PN}-config-default = "all"
diff --git a/recipes/images/illume-image.bb b/recipes/images/illume-image.bb
index e01ef27..15bed58 100644
--- a/recipes/images/illume-image.bb
+++ b/recipes/images/illume-image.bb
@@ -10,6 +10,7 @@ SPLASH = "exquisite exquisite-themes exquisite-theme-illume"
 # Default illume theme
 ILLUME_THEME ?= "e-wm-theme-illume"
 ILLUME_CONFIG ?= "e-wm-config-illume2"
+E_WM_SYSACTIONS ?= "e-wm-sysactions"
 
 # getting the base system up
 BASE_INSTALL = "\
@@ -43,7 +44,7 @@ X_INSTALL = "\
   mime-support \
   e-wm \
   e-wm-menu \
-  e-wm-sysactions \
+  ${E_WM_SYSACTIONS} \
   ${ILLUME_CONFIG} \
   ${ILLUME_THEME} \
   e-wm-config-standard \
diff --git a/recipes/shr/e-wm-sysactions-shr_git.bb b/recipes/shr/e-wm-sysactions-shr_git.bb
index 68d5b30..6f5da4c 100644
--- a/recipes/shr/e-wm-sysactions-shr_git.bb
+++ b/recipes/shr/e-wm-sysactions-shr_git.bb
@@ -3,12 +3,10 @@ SECTION = "e/utils"
 LICENSE = "MIT BSD"
 SRCREV = "bbcec18f0ebd47e4f6eea88b9b774edf7400e752"
 PV = "1.2+gitr${SRCPV}"
-PR = "r5"
+PR = "r6"
 PACKAGE_ARCH = "all"
 
-RPROVIDES_${PN} = "e-wm-sysactions"
 RCONFLICTS_${PN} = "e-wm-sysactions"
-#RREPLACES_${PN} = "e-wm-sysactions"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
 
-- 
1.7.4.1



