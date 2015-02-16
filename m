Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4893673555
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 21:55:48 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id h11so28827580wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HMPDMikoBba6Xe8NFAu5nN4kmNygcWunvplU50cjroM=;
	b=lbeqKVRQq77bS32fuYUDMoS19wBch0RRiCTGJm9vNmamtbT8/MqWoPt3aUK61Jw3oO
	D//YhGByXTVeF5hsKObDGikZ+6+VE5zK8P3+f09xBNtRA7bdbmx8/WE6tsIwpCpC5OM6
	nMGRuSRHKx3KTM/yq5PAhAqw5pxdvckE6lKO4Cqpl3dvedpMGELCoQMJm57dHg0++w9M
	qWwup0HqKrBc98pFSlMU/Usf2VxMITOzUJsbg5rAiXJEuExRB/qT9isgmU4B8+NaszjF
	Jl55MGOCw8Ebm2+4aXscWhzRcDZHFo4kAK8uKFFA5LLhExqaiX9U6Hpa2WI8u5BiljGI
	gRcQ==
X-Received: by 10.180.107.198 with SMTP id he6mr5955608wib.21.1424123749827;
	Mon, 16 Feb 2015 13:55:49 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id p1sm365956wib.23.2015.02.16.13.55.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 13:55:49 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2015 22:55:29 +0100
Message-Id: <1424123733-16696-3-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
References: <1424123733-16696-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-java][PATCH 2/7] licence: add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 16 Feb 2015 21:55:49 -0000

While at it change the LICENSE string to the oe one if applicable.
e.g. AL-2.0 -> Apache-2.0

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/jakarta-commons/commons-cli_1.1.bb          | 1 +
 recipes-core/jakarta-commons/commons-codec_1.3.bb        | 1 +
 recipes-core/jakarta-commons/commons-discovery_0.4.bb    | 1 +
 recipes-core/jakarta-commons/commons-el_1.0.bb           | 3 ++-
 recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb | 1 +
 recipes-core/jakarta-commons/commons-httpclient_3.1.bb   | 1 +
 recipes-core/jakarta-commons/commons-io_1.4.bb           | 1 +
 recipes-core/jakarta-commons/commons-lang_2.4.bb         | 1 +
 recipes-core/jakarta-commons/commons-logging_1.1.1.bb    | 1 -
 recipes-core/jakarta-commons/commons-pool_1.4.bb         | 1 +
 recipes-core/jakarta-commons/jakarta-commons.inc         | 2 ++
 recipes-core/jakarta-libs/poi_3.0.bb                     | 3 ++-
 recipes-core/junit/junit4_4.3.1.bb                       | 3 ++-
 recipes-core/servlet-api/jsp2.0_5.5.26.bb                | 3 ++-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb            | 3 ++-
 recipes-core/xml-commons/jaxme_0.5.2.bb                  | 4 ++--
 recipes-core/xml-commons/xom_1.1.bb                      | 3 ++-
 recipes-core/xml-commons/xpp2_2.1.10.bb                  | 2 +-
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb               | 1 +
 recipes-extended/hsqldb/hsqldb_1.8.0.10.bb               | 3 ++-
 20 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/recipes-core/jakarta-commons/commons-cli_1.1.bb b/recipes-core/jakarta-commons/commons-cli_1.1.bb
index cb51765..52dc0ce 100644
--- a/recipes-core/jakarta-commons/commons-cli_1.1.bb
+++ b/recipes-core/jakarta-commons/commons-cli_1.1.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a944942e1496af1886903d274dedb13"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-codec_1.3.bb b/recipes-core/jakarta-commons/commons-codec_1.3.bb
index 3a7ddd4..0377168 100644
--- a/recipes-core/jakarta-commons/commons-codec_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-codec_1.3.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://src/java/org/apache/commons/codec/BinaryDecoder.java;endline=15;md5=c08c3e117b4fc42b50c1f621fdcecc5f"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-discovery_0.4.bb b/recipes-core/jakarta-commons/commons-discovery_0.4.bb
index 75db064..08c2462 100644
--- a/recipes-core/jakarta-commons/commons-discovery_0.4.bb
+++ b/recipes-core/jakarta-commons/commons-discovery_0.4.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-el_1.0.bb b/recipes-core/jakarta-commons/commons-el_1.0.bb
index 5821473..1446edd 100644
--- a/recipes-core/jakarta-commons/commons-el_1.0.bb
+++ b/recipes-core/jakarta-commons/commons-el_1.0.bb
@@ -1,5 +1,6 @@
 require jakarta-commons.inc
-
+LICENSE = "Apache-1.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9147d939b3f3f97692e4441bf20bd1cd"
 PR = "${INC_PR}.1"
 
 DESCRIPTION = "Implementation of the JSP2.0 Expression Language API"
diff --git a/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb b/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
index 3954363..dab7996 100644
--- a/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
+++ b/recipes-core/jakarta-commons/commons-fileupload_1.2.1.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
index 4f6b1af..dffa9a0 100644
--- a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
+++ b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=369b6d7c5a954dcc3f2e7ac3323507c3"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-io_1.4.bb b/recipes-core/jakarta-commons/commons-io_1.4.bb
index f4308d2..f1dbc88 100644
--- a/recipes-core/jakarta-commons/commons-io_1.4.bb
+++ b/recipes-core/jakarta-commons/commons-io_1.4.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fd707e76aa29b6984fbe80629ec55f78"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-lang_2.4.bb b/recipes-core/jakarta-commons/commons-lang_2.4.bb
index 60c6346..48cc291 100644
--- a/recipes-core/jakarta-commons/commons-lang_2.4.bb
+++ b/recipes-core/jakarta-commons/commons-lang_2.4.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
index b04c812..b3b508a 100644
--- a/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
+++ b/recipes-core/jakarta-commons/commons-logging_1.1.1.bb
@@ -3,7 +3,6 @@ require jakarta-commons.inc
 PR = "${INC_PR}.1"
 
 DESCRIPTION = "Java Internet protocol suite library"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
 SRC_URI = "http://archive.apache.org/dist/commons/logging/source/${BP}-src.tar.gz"
 
diff --git a/recipes-core/jakarta-commons/commons-pool_1.4.bb b/recipes-core/jakarta-commons/commons-pool_1.4.bb
index d5b6def..cacbde7 100644
--- a/recipes-core/jakarta-commons/commons-pool_1.4.bb
+++ b/recipes-core/jakarta-commons/commons-pool_1.4.bb
@@ -1,4 +1,5 @@
 require jakarta-commons.inc
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 PR = "${INC_PR}.1"
 
diff --git a/recipes-core/jakarta-commons/jakarta-commons.inc b/recipes-core/jakarta-commons/jakarta-commons.inc
index bd85610..5968164 100644
--- a/recipes-core/jakarta-commons/jakarta-commons.inc
+++ b/recipes-core/jakarta-commons/jakarta-commons.inc
@@ -1,5 +1,7 @@
 AUTHOR = "Apache Software Foundation"
 LICENSE = "Apache-2.0"
+#add the common md5sum and overwrite in bb file if changed
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d273d63619c9aeaf15cdaf76422c4f87"
 
 INC_PR = "r0"
 
diff --git a/recipes-core/jakarta-libs/poi_3.0.bb b/recipes-core/jakarta-libs/poi_3.0.bb
index 6adcf2c..f9178f2 100644
--- a/recipes-core/jakarta-libs/poi_3.0.bb
+++ b/recipes-core/jakarta-libs/poi_3.0.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Java library for manipulating various file formats based upon Microsoft's OLE 2 Compound Document"
-LICENSE = "AL2.0"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 AUTHOR = "Apache Software Foundation"
 
 SRC_URI = "http://archive.apache.org/dist/jakarta/poi/release/src/${BPN}-src-${PV}-FINAL-20070503.tar.gz"
diff --git a/recipes-core/junit/junit4_4.3.1.bb b/recipes-core/junit/junit4_4.3.1.bb
index 6b4d158..1cb8674 100644
--- a/recipes-core/junit/junit4_4.3.1.bb
+++ b/recipes-core/junit/junit4_4.3.1.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "JUnit is a testing framework for Java"
-LICENSE = "CPL"
+LICENSE = "CPL-1.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/CPL-1.0;md5=5295cd12fc5acc87bf1cf754455a1c56"
 AUTHOR = "junit.org"
 HOMEPAGE = "http://www.junit.org"
 
diff --git a/recipes-core/servlet-api/jsp2.0_5.5.26.bb b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
index ca94f08..e831501 100644
--- a/recipes-core/servlet-api/jsp2.0_5.5.26.bb
+++ b/recipes-core/servlet-api/jsp2.0_5.5.26.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Java Server Page (JSP) API 2.0 (from Tomcat 5.5)"
-LICENSE = "AL2.0"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 AUTHOR = "Apache Software Foundation"
 
 SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-5/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
diff --git a/recipes-core/servlet-api/servlet2.4_5.5.26.bb b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
index ee80e5e..b34b23d 100644
--- a/recipes-core/servlet-api/servlet2.4_5.5.26.bb
+++ b/recipes-core/servlet-api/servlet2.4_5.5.26.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Servlet API 2.4 (from Tomcat 5.5)"
-LICENSE = "AL2.0"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 AUTHOR = "Apache Software Foundation"
 
 SRC_URI = "http://archive.apache.org/dist/tomcat/tomcat-5/v${PV}/src/apache-tomcat-${PV}-src.tar.gz"
diff --git a/recipes-core/xml-commons/jaxme_0.5.2.bb b/recipes-core/xml-commons/jaxme_0.5.2.bb
index 65b406e..b4ec750 100644
--- a/recipes-core/xml-commons/jaxme_0.5.2.bb
+++ b/recipes-core/xml-commons/jaxme_0.5.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Implementation of the JAXB API"
-LICENSE = "AL2.0"
-
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 AUTHOR = "Apache Software Foundation"
 HOMEPAGE = "http://ws.apache.org/jaxme"
 
diff --git a/recipes-core/xml-commons/xom_1.1.bb b/recipes-core/xml-commons/xom_1.1.bb
index 56701b2..7405dab 100644
--- a/recipes-core/xml-commons/xom_1.1.bb
+++ b/recipes-core/xml-commons/xom_1.1.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Tree-based API for processing XML with Java"
-LICENSE = "LGPL"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=456080cf80cd56d4d58118c1d10d824f"
 
 HOMEPAGE = "http://xom.nu"
 
diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
index 54d69f4..d3baca4 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Streaming pull XML parser for java"
 LICENSE = "BSD-like"
-
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d40c660a53e36a103a35c170d38d0ef6"
 HOMEPAGE = "http://www.extreme.indiana.edu/xgws/xsoap/xpp/"
 
 SRC_URI = "http://www.extreme.indiana.edu/xgws/xsoap/xpp/download/PullParser2/PullParser2.1.10.tgz"
diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index b87cccd..bedb8a9 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "Streaming pull XML parser for Java (3rd edition)"
 LICENSE = "BSD-like"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=35235e1ea47db355da0627f8d93e3a6c"
 
 HOMEPAGE = "http://www.extreme.indiana.edu/xgws/xsoap/xpp/mxp1"
 
diff --git a/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb b/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
index ff4908a..139d3ae 100644
--- a/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
+++ b/recipes-extended/hsqldb/hsqldb_1.8.0.10.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Lightweight 100% Java SQL Database Engine"
 # BSD-like
 LICENSE = "HypersonicSQL"
-
+LIC_FILES_CHKSUM = "file://doc/hypersonic_lic.txt;md5=778452795343df6f459b725185966888"
+LIC_FILES_CHKSUM = "file://doc/hsqldb_lic.txt;md5=beb9a0581941064345aba5de7e519d53"
 AUTHOR = "HSQLDB Development Group"
 HOMEPAGE = "http://hsqldb.org"
 
-- 
1.9.3


