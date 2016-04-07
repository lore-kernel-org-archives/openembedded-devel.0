Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE4160116
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 01:56:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q128so77708374iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O1FhVYr9gYj4aJyd+2Ohhpuplh/Jjfepe2rFeDZ/Bhc=;
	b=gn/+IkDLpOI+b1j0HPZiU8FqZdiORvI6pYCz2JS+64RDrrOinC7ziSXJenrIr2+hnh
	6Z4s5rf35/h2vKH2t+rMpFTPlQdcIG3tCoj7WgVzdSqJDSXVOnRb4FvUEOs+jd7O48AV
	BSC43vEKab//IZY3rSKtyPwfcvBrNJwmFiJl6gppKSmeStGcRjiURvprdXDgpQvWmF9v
	gl2L3M+u8ffIEQkODCrG8HUbEtwtYjr8/hEOure3hI1ukdHt94ij7F0TW/iOWaRuQRj8
	gTDyBRnyqXl2R71WcKUQPf2upec+66mxdxHJymMtOOpJ9HMhhBkdJ70r+MCKv5sb1okT
	4MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O1FhVYr9gYj4aJyd+2Ohhpuplh/Jjfepe2rFeDZ/Bhc=;
	b=R8Jf58lq5OIonvD3AbGpt+nVRZO2irpv/LcOhE2L/OVbTjHzDAE4rF4G4UjxIUo8tK
	juBS7ufJC3IFI9HIcq5DR51azQRphhxbOhcvExtoGejKBKfKLC7PUFBK+OOZZcwbRaKr
	OfL7tIogW7OEOjx5W2Pq2eVCwCoR+KO6TRwlAJlDZxKtuD23+Tjb+gElqHH9A+1mjKBW
	8ZhzmLeQl1cCsGrMKWvficfiBp5EV65J8tvznP1MJDzqGJU15AZn2EjPXsnYSfZrxv9r
	1Vpe4iWiK+2E5M/mbdG49HNgt1swjJ0a12QIonxlEoVkW3mbos8LuurWfIOjPBosufBo
	neSg==
X-Gm-Message-State: AD7BkJKKKTZE8iIVgEuHUD0FdYw0ICLWuf67XuLWGgKJwXtC7sGNGKyzRhxvDYipKkffYA==
X-Received: by 10.107.3.149 with SMTP id e21mr936235ioi.46.1459994174606;
	Wed, 06 Apr 2016 18:56:14 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q9sm2691117igr.7.2016.04.06.18.56.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 18:56:13 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 18:56:07 -0700
Message-Id: <1459994167-31207-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] libtinyxml2: update 2.2.0 -> 3.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 01:56:14 -0000

Also misc recipe cleanup, take license text from tinyxml2.cpp source
file instead of using the entire readme.md, and build using cmake.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../libtinyxml2/libtinyxml2_3.0.0.bb               | 15 +++++++++
 .../recipes-support/libtinyxml2/libtinyxml2_git.bb | 37 ----------------------
 2 files changed, 15 insertions(+), 37 deletions(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
 delete mode 100644 meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
new file mode 100644
index 0000000..af0b785
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_3.0.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "TinyXML-2 is a simple, small, efficient, C++ XML parser that can be easily integrating into other programs"
+HOMEPAGE = "http://www.grinninglizard.com/tinyxml2/"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://tinyxml2.cpp;endline=22;md5=c19221dbd8a66ad3090462af4c5de5e7"
+
+SRC_URI = "git://github.com/leethomason/tinyxml2.git"
+
+SRCREV = "1977a7258cc66fd4da7f1e9da05a4933646a7803"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
deleted file mode 100644
index 6ca6f7c..0000000
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "TinyXML-2 is a simple, small, efficient, C++ XML parser that can be easily integrating into other programs."
-HOMEPAGE = "http://www.grinninglizard.com/tinyxml2/"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://readme.md;md5=0033b2f8a25283414b21354670bb1334"
-SECTION = "libs"
-
-SRCREV = "d211bb13512cf4edb408e2c4badbcf4100ce0fd0"
-
-PV = "2.2.0+git${SRCPV}"
-
-SRC_URI = "git://github.com/leethomason/tinyxml2.git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_CXXFLAGS = "-I. -fPIC"
-
-do_compile() {
-    ${CXX} ${CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o tinyxml2.o tinyxml2.cpp
-    ${CXX} ${CXXFLAGS} \
-            -shared \
-            -Wl,-soname,libtinyxml2.so.${PV} \
-            -o libtinyxml2.so.${PV} \
-            ${LDFLAGS} \
-            tinyxml2.o
-}
-
-do_install() {
-    install -d ${D}${libdir}
-    install -m 0755 ${S}/libtinyxml2.so.${PV} ${D}${libdir}
-    ln -sf libtinyxml2.so.${PV} ${D}${libdir}/libtinyxml2.so
-
-    install -d ${D}${includedir}
-    install -m 0644 ${S}/tinyxml2.h ${D}${includedir}
-}
-
-BBCLASSEXTEND += "native"
-
-- 
1.9.1


