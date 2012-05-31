Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZyxM-0001q1-K3
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 08:34:00 +0200
Received: by werg55 with SMTP id g55so399315wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 23:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=klwf8vaeemIP5yqLVh7OxwcITsKDqrkxsGlBERdu9cg=;
	b=chvTx5J61RrcgZ4lAedGBSyrT8J4xzEERqlqHGKVs05QAe+LgY5k2jlm4DTEEUxFSg
	u2Jlbdr1H9fRubRZokAiZiP264dQ6SMUJWnDYNJ8SfWBROmS2YFyAHc/uYo+Tb8GxU8+
	0wdb8EYMlL5vZzTut99+iP7zQVNYOduWivFCOfhEoYLlDOudvLmP2efxCA6KxiDV6SOp
	KG4aHBMUyjNznyajiRqxDzeNU1PpNNmFtM9VIWyW7mvaunSeBPXO3q1tAeaBlqFQ/98+
	fQaZDZYYn2FIQqsLUr4huDdqgov5CNX3qa6JNQp2J7xfG6MJomOF12hk4lvuymBMxYxZ
	+H6g==
Received: by 10.216.208.221 with SMTP id q71mr12431751weo.174.1338445421264;
	Wed, 30 May 2012 23:23:41 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id r2sm3208116wif.7.2012.05.30.23.23.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 23:23:38 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 08:23:11 +0200
Message-Id: <1338445392-39723-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] tune-ppc440.inc: Update support for the PowerPC 440 processor in the Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Thu, 31 May 2012 06:34:00 -0000

This commit updates support for the PowerPC 440 processor in the Xilinx
Virtex-5 FXT FPGA.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index f77f628..394364d 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -4,11 +4,11 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc440] = "Enable ppc440 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", "${PPCPKGARCH}", d)}"
 
-TARGET_FPU = "soft"
 AVAILTUNES += "ppc440"
-TUNE_FEATURES_tune-ppc440 = "m32 ppc440"
-PACKAGE_EXTRA_ARCHS_tune-ppc440 = "ppc440"
+TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
+TUNE_PKGARCH_tune-ppc440 = "ppc440"
+PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
 
-#MACHINEOVERRIDES .= "ppc440"
+# glibc configure options to get 440 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-with-cpu=440", "", d)}"
-- 
1.7.9.5



