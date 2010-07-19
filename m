Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oale1-0005br-S1
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 10:24:14 +0200
Received: by pwi10 with SMTP id 10so1783892pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nV0+XSxU3nU1oM8+Ez+hgR4J2j47Chn1bbHrcBH8kxg=;
	b=vLUXyu8YC4/P3LdOmRoAC8Rf9kQUA9ggGWpAyijTLt7RWDljGAdym5sydJK6RIeCLA
	UF3oo2C1pGECGnL5FU0HIkVVQ3snafaPgP7kYjr6OXELExaabIOvuUF51Pa2+2P8U+jU
	XOHWARMS7lts+neu4Jz0CufyYcbDd6Bhz16Iw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gThsXGzqAyrlwsZpOEPN3n0OyRiIL/iqe1g2bFlpr0LDuqw8Ky9oI7h5m3g2dT1OTh
	XitpQ1Y86KbHkRp2KT6iHjnvgkcFsYoaaTgc4tlF5Rpj9R1Sfzyvze/tUksBTgmK5Oab
	w3FC8x/k9Y0gDhgyuPYF2A8dl17W4PW7M/VX0=
Received: by 10.142.48.18 with SMTP id v18mr6465061wfv.102.1279527844427;
	Mon, 19 Jul 2010 01:24:04 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 33sm6157010wfd.18.2010.07.19.01.24.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 01:24:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Jul 2010 01:24:17 -0700
Message-Id: <1279527857-12295-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sane-toolchain.inc: THUMB_INTERWORK should not be defined for armv4 and add armv4 to ARM EABI supporting architectures.
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
X-List-Received-Date: Mon, 19 Jul 2010 08:24:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 6b6b170..8d9912f 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -86,7 +86,12 @@ ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"
 #    but requires more instructions (140% for 70% smaller code) so may be
 #    slower.
 
-THUMB_INTERWORK = "yes"
+# armv4 does not have thumb instruction set therefore no interworking instructions
+# so if machine is based on armv4 we dont have choice.
+
+THUMB_INTERWORK_armv4 = "no"
+THUMB_INTERWORK ?= "yes"
+
 # "yes" "no"
 #    Whether to compile with code to allow interworking between the two
 #    instruction sets.  This allows thumb code to be executed on a primarily
@@ -145,7 +150,7 @@ def detect_arm_abi (d):
 			return "oabi"
 		else:
 			return ""
-	if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:          
+	if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
 		if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d).split():
 			return "eabi"
 		return "oabi"
@@ -154,7 +159,7 @@ def detect_arm_abi (d):
 def compute_os_portion_of_target_triplet (d):
 	import bb
 	arm_eabi_supporting_arches = "armv6 armv6-novfp \
-	armv5te iwmmxt armv7a armv7 armv5teb armv4t"
+	armv5te iwmmxt armv7a armv7 armv5teb armv4t armv4"
 	ppc_spe_supporting_arches = "ppce500v2 ppce500"
 	gnu_suffix = ""
 	if bb.data.getVar('LIBC', d, 1) == "uclibc":
-- 
1.7.0.4



