Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAhSJ-00087r-38
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:49:27 +0100
Received: by wibhj13 with SMTP id hj13so591054wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1a2hS0kW+tgC2qQ+rnajaAYF7EoW67rfcx4WI8u2BIk=;
	b=irA6TCcLrrjQvOprk/dp/hY5ERCpMB+d8+Eh5snBdiZKsuSGvGrU/denzaLReYwMoI
	4w2AVUfiQ5sWRvXN5UAJWag4sfLF0p1zhd4u7ClvKdUP1/9KbtnW327tShzyyDDyIFG/
	MS/uXEZpF3CPrw693tA6St+UgmP32vhfggkvQburbSbTI1SGlwvj08SrkWxl7nN0x+sV
	jN3Ywnnu0z7B2lctKZewq4QR9AE7jAV4guvocs2WqGi+bJVs72+t9cyxm2dI4ebY9fyA
	ALNBen1lxXyQobqLJ/Z8fVlcQ9XrzRQIypZ9SKMnsvUX3llCznVsycRVH/Qi1pAva3jO
	NLmw==
Received: by 10.216.133.96 with SMTP id p74mr4595314wei.30.1332420032401;
	Thu, 22 Mar 2012 05:40:32 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id o2sm8351974wiv.11.2012.03.22.05.40.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 05:40:31 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Mar 2012 13:40:14 +0100
Message-Id: <1332420014-3653-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 12:49:27 -0000

* Allow Poky users to test and use meta-kde.
* Allow Users with an use case that excludes meta-oe to test and use meta-kde.

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
deleted file mode 100644
index bd7b495..0000000
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "shared library for GIF images"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
-PR = "r2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
-
-inherit autotools
-
-DEPENDS = "libsm"
-
-PACKAGES += "${PN}-utils"
-FILES_${PN} = "${libdir}/libgif.so.*"
-FILES_${PN}-utils = "${bindir}"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "7125644155ae6ad33dbc9fc15a14735f"
-SRC_URI[sha256sum] = "e1c1ced9c5bc8f93ef0faf0a8c7717abf784d10a7b270d2285e8e1f3b93f2bed"
-- 
1.7.5.4



