Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa8ji-0003bC-Ug
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 19:00:35 +0200
Received: by wibhm14 with SMTP id hm14so1015076wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a6TimHjmHaTU9KeUIWhQ7yAdWO2LuF1nMiujAcAiADo=;
	b=QtR4pktlHvg3Nydw2w29XOsd1vcdIkPfTaIof2FKsg6AfmPqog1kA5nnc+pGtEymuS
	8q/DDNnGOgayQpkPr+l4OMoVG7kCpIpeqkySp2zSKqs05baCwN6qXDnbgQHI2uuqBn8k
	Nbv5ccXR5F+VZO02lnE4ALNH/0uAkxMn7+kEeQFQCCO4II84AtkU0ApI4pnkwa27c7sL
	X6NdMJ0SvE57NlbO3VOIn8lL04Lzp2nu25ZQaTEtiLq2NhPlRpfWFq4tUb/nG/4NdHkN
	uWSy97tDmdz+UQ7CpOEI1E3kaLogofvNse2Kny+yC3RhvIjTOjuOdgLBbPn02G65qMVW
	v4bg==
Received: by 10.216.198.19 with SMTP id u19mr350658wen.203.1338483014889;
	Thu, 31 May 2012 09:50:14 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id ez4sm4670831wid.3.2012.05.31.09.50.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 09:50:13 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 18:50:01 +0200
Message-Id: <1338483003-14850-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 1/2] tune-ppc440: Indicate no floating point support.
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
X-List-Received-Date: Thu, 31 May 2012 17:00:35 -0000

* PACKAGE_EXTRA_ARCHS_tune-ppc440: Indicate no floating point support by
  adding -nf suffix.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index 33d6cac..371fdf9 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -8,6 +8,6 @@ TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "",
 AVAILTUNES += "ppc440"
 TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
 TUNE_PKGARCH_tune-ppc440 = "ppc440"
-PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc440"
+PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
 
 #MACHINEOVERRIDES .= "ppc440"
-- 
1.7.9.5



