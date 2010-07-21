Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Obi0z-0003s5-W6
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 00:43:51 +0200
Received: by pvg13 with SMTP id 13so3128737pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 15:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=1sXcLnp9Maer/Yjx1J+o11cPnB7tzLP+hwgkP8MNGlo=;
	b=I5hIiHFZFO+sCDoVDNiMUIVskMVPWP3dQ3QQKmvMmhf0QAeBdhVb2NbKM36hZmiOaN
	8zYnpOMze/VrgowwBwBme5clv7g3xIBYBUrVAfg3v/K++MKs0qdM2xSAVBMojStXzqaK
	orzI5Qh7qyF51Ox0FhFtRrdP8aD4e6svclXKA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gqYGP2ZEUZsNwxnjcSBZpveIMFHnWWXKtqty5masdvc6tCD9Rez6J6QXzFw+vMxXCf
	vyavn168HRvp3F7H4NrFUAucbsn1rI8o0O40f6tThlBDihYD30Ak9Af+ZX+fnOd3c0sH
	FuGtirP8uZ6EhDJmtI/UhoNtc44wC4OJ3p6fY=
Received: by 10.142.162.4 with SMTP id k4mr1073149wfe.138.1279752217515;
	Wed, 21 Jul 2010 15:43:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k25sm20177198rvb.4.2010.07.21.15.43.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 15:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 15:44:01 -0700
Message-Id: <1279752241-21656-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] distro: Add new feature to indicate thumb-interworking.
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
X-List-Received-Date: Wed, 21 Jul 2010 22:43:51 -0000

* This would be used to decide if we can use BX in return
  instructions in uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/angstrom.inc |    3 +++
 conf/distro/include/kaeilos.inc  |    3 +++
 conf/distro/include/slugos.inc   |    9 +++++++++
 conf/distro/minimal-uclibc.conf  |    1 +
 conf/distro/minimal.conf         |    1 +
 recipes/uclibc/uclibc-config.inc |    6 ++----
 6 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index f13cc22..3ba94fa 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -204,3 +204,6 @@ DISTRO_FEATURES = "largefile ipv4 ipv6 nfs smbfs wifi ppp alsa bluetooth ext2 vf
 
 # Use-like features
 DISTRO_FEATURES += "tk"
+
+# Add thumb-interwork to feature list if selected machine supports it.
+DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index bdc4aad..edbad69 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -214,3 +214,6 @@ DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbga
 
 # Use-like features
 DISTRO_FEATURES += "tk"
+
+# Add thumb-interwork to feature list if selected machine supports it.
+DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
index 807d45d..8d53ffc 100644
--- a/conf/distro/include/slugos.inc
+++ b/conf/distro/include/slugos.inc
@@ -23,9 +23,18 @@ DISTRO_VERSION ?= "${SLUGOS_VERSION}${DISTRO_REVISION}-${DISTRO_TYPE}"
 # DISTRO_FEED ?= "${SLUGOS_VERSION}-${DISTRO_TYPE}"
 DISTRO_FEED ?= "unstable"
 
+THUMB_INTERWORK = "yes"
+# "yes" "no"
+#    Whether to compile with code to allow interworking between the two
+#    instruction sets.  This allows thumb code to be executed on a primarily
+#    arm system and vice versa.  It is strongly recommended that DISTROs not
+#    turn this off - the actual cost is very small.
 # We want images supporting the following features (for task-base)
 DISTRO_FEATURES = "nfs smbfs wifi ppp alsa bluetooth ext2 vfat irda pcmcia usbgadget usbhost pci"
 
+# Add thumb-interwork to feature list if selected machine supports it.
+DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
+
 IMAGE_BASENAME = "${@['slugos${SITEINFO_ENDIANESS}', 'ucslugc'][bb.data.getVar('TARGET_OS', d, 1) == 'linux-uclibc']}"
 
 # The following need not be set, the defaults should be adequate
diff --git a/conf/distro/minimal-uclibc.conf b/conf/distro/minimal-uclibc.conf
index 44805cf..287d6de 100644
--- a/conf/distro/minimal-uclibc.conf
+++ b/conf/distro/minimal-uclibc.conf
@@ -44,3 +44,4 @@ DISTRO_FEATURES += "pam"
 DISTRO_FEATURES += "largefile"
 # glib-2.0 nneds ipv6 and there is no knob to control it
 DISTRO_FEATURES += "ipv4 ipv6"
+DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 9a08130..5fbbc33 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -33,6 +33,7 @@ DISTRO_FEATURES += "eabi"
 # or higher
 
 DISTRO_FEATURES += "mplt"
+DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK', d, 1) == "yes"]}'
 
 #############################################################################
 # LIBRARY NAMES
diff --git a/recipes/uclibc/uclibc-config.inc b/recipes/uclibc/uclibc-config.inc
index 5a6fbe8..ef4385e 100644
--- a/recipes/uclibc/uclibc-config.inc
+++ b/recipes/uclibc/uclibc-config.inc
@@ -94,10 +94,8 @@ def uclibc_cfg(feature, features, tokens, cnf, rem):
 # Map distro and machine features to config settings
 def features_to_uclibc_settings(d):
 	cnf, rem = ([], [])
-	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
-	if bb.data.getVar('THUMB_INTERWORKING', d, 1) == "yes":
-		distro_features += "thumb-interworking"
-	#machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True).split()
+	#machine_features = bb.data.getVar('MACHINE_FEATURES', d, True).split()
 	uclibc_cfg('ipv4',      distro_features, 'UCLIBC_HAS_IPV4', cnf, rem)
 	uclibc_cfg('ipv6',      distro_features, 'UCLIBC_HAS_IPV6', cnf, rem)
 	uclibc_cfg('largefile', distro_features, 'UCLIBC_HAS_LFS', cnf, rem)
-- 
1.7.0.4



