Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZoEA-0004pd-D9
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 May 2012 21:06:38 +0200
Received: by werg55 with SMTP id g55so97823wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2012 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qiK2F/1hEisOl7jaqxebqAL/2lasFMjKhkBzgIZBNgo=;
	b=o/2QTwZiVBjN5IclB6WuIAVRHlvVEifXurCYyh2C+3zataxal5s4IeUqwS3kUEp9Ia
	VY3C7zgvyHVhcJhKKucBZgpMqGdSo+eeJzeI4oIxVJCq5YHzmKy8527QO/O1EFp0cCId
	oUru8E7PFn14Pjil0rbFmK/pgDexteB/JRuKsqetC9GhqCRASVr6YrcUD4eiPmu6+U12
	cfEtGE5SJ48EdZSRg67u2bxnCe62vsthUJn0EZduS0Pck0iywaCeqHN5BmMbwLlkMyzD
	Z3mpyqt9D2zlHukL5raliy7ihaekx0iSK+xcRRhEGXziq7mSlgj3e0zO0E2fOyumSZ41
	RRAA==
Received: by 10.216.214.82 with SMTP id b60mr11410741wep.38.1338404179593;
	Wed, 30 May 2012 11:56:19 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id r2sm1661992wif.7.2012.05.30.11.56.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 11:56:18 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2012 20:55:59 +0200
Message-Id: <1338404160-6968-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] tune-ppc440.inc: Add support for PowerPC 440 processor for Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Wed, 30 May 2012 19:06:38 -0000

This commit adds support for the PowerPC 440 processor for the Xilinx
Virtex-5 FXT FPGA.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/conf/machine/include/tune-ppc440.inc |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppc440.inc

diff --git a/meta/conf/machine/include/tune-ppc440.inc b/meta/conf/machine/include/tune-ppc440.inc
new file mode 100644
index 0000000..394364d
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppc440.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc440"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc440] = "Enable ppc440 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "", d)}"
+
+AVAILTUNES += "ppc440"
+TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
+TUNE_PKGARCH_tune-ppc440 = "ppc440"
+PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
+
+# glibc configure options to get 440 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-with-cpu=440", "", d)}"
-- 
1.7.9.5



