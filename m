Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D89DB6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id F32E111A030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MWDJ8jCM52P6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 3EAC311A00E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ABB31A063
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FFB01A060
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 12DB67A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1HLa7Wt006321
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:36:07 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1HLa7L5006320
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2017 22:36:07 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 22:36:07 +0100
Message-Id: <20170217213607.6278-1-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
X-TM-AS-GCONF: 00
Subject: [meta-webserver][PATCH] apache2: Correct the SRC_URI
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
X-List-Received-Date: Fri, 17 Feb 2017 21:36:10 -0000

The change to use ${APACHE_MIRROR} in the SRC_URI in dfbe6cf214 did
not take into account that ${APACHE_MIRROR} already contains "/dist".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
index fc84872..99717d2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
index b3a2dfd..60f6fb9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-SRC_URI = "${APACHE_MIRROR}/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
-- 
2.9.0


