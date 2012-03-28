Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCiEa-0005O8-SH
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 04:03:37 +0200
Received: by pbcum15 with SMTP id um15so968710pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iwLpNwdvMe+31J1Fd+oJm0ooTDB4G4ZwjdkHXrVvo74=;
	b=GymOnsQM6cvUmjXsiCOjICcVG56OVzki5F3oNQtnuHOF3GR5uaNob7zmcpz3GtOR5S
	kEXaqJepQxFj1ajSgKfFrpsXczcJ+mMaVpcJSsEEGDWjk+FQmMx9MHItW0rYZ06olH0W
	uf/qZLrYj6k9myjw2xm+t61EZxOTznxFcMV7ApBH/F0FshmeKLaovDhwcZGW7J+Oiz0l
	c6gwHWokwXcCnsU8BQR/cZCkjQ+eXmDeAUGe4uyxmY7ZFMv7Gw6H3XDyiZ8K3QfeUIov
	Rb/0XR3qRG9CzM9svMn/7iORdQDE1dkQ9lgIWJLdKmtoyXDC5nNLdWSls3caopjfCnoL
	RmkQ==
Received: by 10.68.191.69 with SMTP id gw5mr52327969pbc.141.1332899674585;
	Tue, 27 Mar 2012 18:54:34 -0700 (PDT)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id o2sm1545200pbb.45.2012.03.27.18.54.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 18:54:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 18:54:22 -0700
Message-Id: <1332899662-28335-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.1
Subject: [toolchain-layer][PATCH 2/2 V2] gcc-4.5: Fix meta-toolchain builds with gcc 4.5
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
X-List-Received-Date: Wed, 28 Mar 2012 02:03:37 -0000

Correct a typo

Make license parsable by license manage

Fixes messages like

WARNING: libgcc-nativesdk: No generic license file exists for: RUNTIME
in any provider
WARNING: libgcc-nativesdk: No generic license file exists for: LIBRARY
in any provider
WARNING: libgcc-nativesdk: No generic license file exists for: EXCEPTION
in any provider
NOTE: package libgcc-nativesdk-4.5-r48+svnr184907: task do_populate_lic:
Succeeded

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc   |    4 ++--
 .../recipes-devtools/gcc/gcc-cross-canadian_4.5.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
index b23b322..ee4a434 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-4.5.inc
@@ -4,7 +4,7 @@ ARM_INSTRUCTION_SET = "arm"
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
 
-LICENSE="GCC RUNTIME LIBRARY EXCEPTION & GPLv2 & GPLv3 & LGPLv2.1 & LGPLv3"
+LICENSE="GPL-3.0-with-GCC-exception & GPLv2 & GPLv3 & LGPLv2.1 & LGPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 PV = "4.5"
-PR = "r47"
+PR = "r48"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
index 97e1a2b..0afc907 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.5.bb
@@ -11,7 +11,7 @@ RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
-SYSTEMLIB. = "/usr/lib/"
+SYSTEMLIBS1 = "/usr/lib/"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
 		--disable-libgomp --disable-libmudflap \
-- 
1.7.9.1



