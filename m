Return-Path: <olof.johansson@axis.com>
X-Greylist: delayed 477 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Jan 2017 09:39:10 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4242C719A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2017 09:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id CB65A1813E;
	Fri, 20 Jan 2017 10:31:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id r+yhW7ahEgQA; Fri, 20 Jan 2017 10:31:12 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 12CB718136;
	Fri, 20 Jan 2017 10:31:12 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0A2D1E079;
	Fri, 20 Jan 2017 10:31:11 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5B811E077;
	Fri, 20 Jan 2017 10:31:11 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 20 Jan 2017 10:31:11 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id C9E205CA;
	Fri, 20 Jan 2017 10:31:11 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id B46BF9C09F; Fri, 20 Jan 2017 10:31:11 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Jan 2017 10:31:11 +0100
Message-Id: <1484904671-9257-1-git-send-email-olofjn@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [meta-webserver][krogoth][PATCH] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Fri, 20 Jan 2017 09:39:11 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
index b227f19..aa26cc7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index 5bea876..9459766 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
-- 
2.1.4


