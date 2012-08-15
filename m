Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1T1mMF-0002Yn-A5
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Aug 2012 00:46:35 +0200
Received: by ggmq1 with SMTP id q1so2547915ggm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=ihdUJ041QkdqHGHs0z7+S1qm9GzN+tmNUYZwhP9bJqQ=;
	b=MA6Pz03MpryE/mx7dtzlaXrpgoZ0b910XXkccH82dfMo+0sH+tptMAU+lq2TFpIyFS
	d+TItQoTcWaHNNGL8s4P17YQT7ORFab/pbdw70KhxeHbG5q1+Ffrv2RNhP/Hy0NdfW4S
	5jW1Dz3Q+1Vi/DC0Tn+UkQtJMUt1TnxnQaGoGDjIL41PSzRdIauvivpgkXT5Nn8c8BuZ
	8C4HLkbIrLmrttBh1JY21oxWsWeuNn9u5ZofxeT+UfYdyy4f4LBxf8COs+gKwgmliovX
	2ojOt1aPVMzlISWvXqGfzakGPB16gT2NmL+NsUIjB7LbLDFGZstrFH/jecid+CPyDF2K
	d5ow==
Received: by 10.236.165.35 with SMTP id d23mr21067164yhl.127.1345070078318;
	Wed, 15 Aug 2012 15:34:38 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id d66sm5196971yhe.1.2012.08.15.15.34.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 15:34:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Aug 2012 19:34:19 -0300
Message-Id: <1345070059-29702-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][for-denzil][PATCH] libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
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
X-List-Received-Date: Wed, 15 Aug 2012 22:46:35 -0000

The libxaw recipe generate a binary package for each soname of libxaw
(currently libxaw6-6 and libxaw-7-7) but no libxaw so libxaw-dev
cannot depends on it.

Reported-by: Daiane Angolini <daiane.angolini@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
index 89338d9..88863a7 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
@@ -5,6 +5,7 @@ DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp pr
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
+PR = "r1"
 
 SRC_URI[md5sum] = "f1ea52debce7a18cc26b21647a00ad8b"
 SRC_URI[sha256sum] = "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba22066d48bf3239ee1bdd"
@@ -24,4 +25,7 @@ FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
 FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
 FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
 
+# Avoid dependency on libxaw as it is not build
+RDEPENDS_${PN}-dev = ""
+
 XORG_PN = "libXaw"
-- 
1.7.2.5



