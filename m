Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7xhy-0000yK-A1
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 00:29:46 +0200
Received: by iye7 with SMTP id 7so3193548iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 15:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=bQ8KyPmumeeVm5/wCm0w26rRdAN5WsZWdLzGVK8UCcI=;
	b=C2zat+9Z4pRO6S8MyVt2B51CV8vbE2UM9DlVJm2dSHNPkwOMZcbqXURwlFQCyM3txT
	MY0Vfsz35nve2gjYA2bw8NnGqHQr9m2+x9YP97T2vOKokxLdwyqwGnmRhsD4N1l33/Nv
	8P2L9rdO7+zUc7J3/kIzFrloYf0QJ956emF04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZFwxrzI86Dg6tdh4ncvPLpEJh7KrT9X3hTvAjy3DPejull/v3NIjTMW3Tf8ml16c7F
	KDPMSbKWnJm1cmBb69lXtlpAXRmZkXCC1JF3Fhv2PsZCmeTEy/HGGucQyKv1CnS1Ap4L
	oIOHuYRXADTNB4vVFEEJtcsZwXYj72BSxUK4M=
Received: by 10.43.56.205 with SMTP id wd13mr2365289icb.135.1302215257248;
	Thu, 07 Apr 2011 15:27:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d9sm1414101ibb.2.2011.04.07.15.27.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 15:27:36 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 15:27:29 -0700
Message-Id: <1302215249-29913-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gcc-4.5.inc: Compile gcc runtime stuff always in ARM mode for arm
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
X-List-Received-Date: Thu, 07 Apr 2011 22:29:46 -0000

From: Khem Raj <raj.khem@gmail.com>

Some distros e.g. SHR uses thumb1 for armv4t and armv5t
so we need to make sure that in such cases libgcc is compiled
in ARM mode

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index b510650..519a1e7 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -1,4 +1,5 @@
 require recipes-devtools/gcc/gcc-common.inc
+ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
@@ -14,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRCREV = "170880"
 PV = "4.5"
-INC_PR = "r34"
+INC_PR = "r35"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
-- 
1.7.4.1



