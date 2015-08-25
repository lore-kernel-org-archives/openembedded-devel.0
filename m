Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id BD45E65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 23:16:16 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so65659212pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C5I+YFoSS5AL24TCCLpxcF1LYSGh2BotuqhCZlLKKk8=;
	b=HMQsUWJlTCW4RAwV+nhcDgJStg7kJOwMAyvHZ6HZfojX1Nh53QqoyI32+/Yop2AQL4
	UMQvXMnozCTp4yGsaqQvkvgyL22C/rHct3eLp71kUYr7VU/+aN2pwm45F9HNx+nS7FzH
	FSRUG0HV6N3BespiwUwWya/YB0izf8SekPXIM027Ws5zL+k0tEHhVNGSYeyv/rCCX//o
	syeJps7BHAjOrpsLURfNBQaIxY6U9KgZtJ2JVObYGOEIvQs3M5KRLwHGasCdRlLvNO7N
	oUWOyWmAbYTNPgUyfTTmamIoqf+48LHld8BmjllBvgyr41EdBdiDD7K1/cWaOBE1+66h
	XCjA==
X-Received: by 10.66.141.109 with SMTP id rn13mr61168533pab.127.1440544576522; 
	Tue, 25 Aug 2015 16:16:16 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	kn8sm13559189pab.38.2015.08.25.16.16.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 16:16:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 16:16:09 -0700
Message-Id: <1440544569-21142-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440544569-21142-1-git-send-email-raj.khem@gmail.com>
References: <1440544569-21142-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-java][PATCH 2/2] Revert "Don't depend on a hardcoded compiler"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 23:16:19 -0000

This reverts commit 15ed9662e26ed4ac8d843fb9d2335a49a9c03088.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/cacao/cacao_1.6.1.bb               | 2 +-
 recipes-core/classpath/classpath-native_0.99.bb | 2 +-
 recipes-core/jamvm/jamvm.inc                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 14ff019..65aaf93 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-DEPENDS_class-native = "zlib-native libtool-native virtual/javac-native fastjar-native classpath-native bdwgc-native"
+DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native bdwgc-native"
 PROVIDES_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index cf297d9..02951b9 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,7 +1,7 @@
 require classpath-native.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
-DEPENDS += "virtual/javac-native"
+DEPENDS += "ecj-initial-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index bed1c5d..5893cbc 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi"
-DEPENDS_virtclass-native = "zlib-native classpath-native virtual/javac-native libffi-native"
+DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
 RDEPENDS_${PN}_virtclass-native = ""
-- 
2.1.4


