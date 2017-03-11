Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 397F6778AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 04:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3A8D3182F3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OeRI7YZY1iMM
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 64C68182BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4653A1A077
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AF401A075
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 2F356747
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2B4x1ik003792
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:59:01 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2B4x1U7003776
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Mar 2017 05:59:01 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 05:58:51 +0100
Message-Id: <20170311045855.3665-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/5] meson: Update to 0.37.1
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
X-List-Received-Date: Sat, 11 Mar 2017 04:59:03 -0000

Also make it possible to actually build the native version by avoiding
the runtime dependencies.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-devtools/meson/{meson_0.36.0.bb => meson_0.37.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/meson/{meson_0.36.0.bb => meson_0.37.1.bb} (71%)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb b/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
similarity index 71%
rename from meta-oe/recipes-devtools/meson/meson_0.36.0.bb
rename to meta-oe/recipes-devtools/meson/meson_0.37.1.bb
index 9349fcbbc..a83af77b3 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.37.1.bb
@@ -6,13 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/mesonbuild/meson.git"
 
-SRCREV = "4e3073f90a7b4f225ce7d89034d61cd978399eba"
-PV = "0.36.0"
+SRCREV = "3d4bfdcb22314ea7db45a5b075f8b2a9c1498aab"
 
 S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-RDEPENDS_${PN} = "ninja python3-core python3-modules"
+RDEPENDS_${PN}_class-target = "ninja python3-core python3-modules"
 
 BBCLASSEXTEND = "native"
-- 
2.12.0


