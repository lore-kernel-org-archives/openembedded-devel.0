Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SAMV5-0000OV-7F
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 15:26:55 +0100
Received: by wibhm17 with SMTP id hm17so5464949wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nzUY3CmTF3VmfQujvf76pNDDXoQvuyWWrpQollDToYU=;
	b=HyvzPwlDEZV+m9Yvb8KAAgGB5W/NiEsRP5CP7dmXbVn+0SRwf6YAAQTl6mnOQC4AlI
	xvDyjd0ghZydK8lMd1gzeI+R6Xap7LWztmu9aLvXzN/tEQp0CKaDj9lLOaiI5aVa5X3I
	eWOGm3ZIWYEw3Cqn63NiCMy0/DCvgSivS39+Kn5TkLny5ct9s5aWqx78n7DdFzeF35un
	23+Fx6UK5DoKYOVd8wrctnmUzFZb43mhc+wP3e9ratbbmAp3WI4aeoa5WD/DyYCS22/+
	mTez7bREort+vOKAuJwqTPXNh1HV4+irK1WYTnrknyahDHCHcaluetAG2S9S0Cxu86KX
	S7vQ==
Received: by 10.180.85.70 with SMTP id f6mr38871946wiz.5.1332339481504;
	Wed, 21 Mar 2012 07:18:01 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id fn2sm8095968wib.0.2012.03.21.07.18.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 07:18:01 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 15:17:31 +0100
Message-Id: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Wed, 21 Mar 2012 14:26:55 -0000

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



