Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A6BD171F1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 08:31:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1P8VZ4A003913
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 00:31:35 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 25 Feb 2015 00:31:35 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Feb 2015 16:31:33 +0800
Message-ID: <1424853093-6107-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lksctp: adjust the shipping of the major version shared library files
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
X-List-Received-Date: Wed, 25 Feb 2015 08:31:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

not ship the major version shared library files in the dev packages,
and ship it into a package which is shipping the full version shared
library files.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
index 1651eb8..4cc955f 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -43,17 +43,17 @@ SOLIBMAJORVERSION="1"
 PACKAGES =+ "${PN}-withsctp ${PN}-utils"
 
 FILES_${PN} = " \
+    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
     ${libdir}/libsctp.so.${SOLIBVERSION} \
 "
 
 FILES_${PN}-withsctp = " \
+    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
     ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBVERSION} \
 "
 
 FILES_${PN}-dev += " \
-    ${libdir}/libsctp.so.${SOLIBMAJORVERSION} \
     ${libdir}/libsctp.so \
-    ${libdir}/lksctp-tools/libwithsctp.so.${SOLIBMAJORVERSION} \
     ${libdir}/lksctp-tools/libwithsctp.so \
     ${datadir}/lksctp-tools/*.c \
     ${datadir}/lksctp-tools/*.h \
-- 
2.1.0


