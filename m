Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 204BA7F050
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 18:00:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8AI09bF008671
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 11:00:09 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 11:00:08 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2019 11:00:08 -0700
Message-ID: <20190910180008.9460-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] openhpi: control snmp-bc ptest generation
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
X-List-Received-Date: Tue, 10 Sep 2019 18:00:08 -0000
Content-Type: text/plain

Do not try to compile ptests for snmp-bc if it is not in PACKGECONFIG.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index e3a0c2e..8a92f10 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -85,6 +85,21 @@ do_install_append () {
 do_compile_ptest () {
     for x in `find ${B} -name Makefile -exec grep -l buildtest-TESTS {} \;`; do
         dir=`dirname ${x}`
+        case $dir in
+            *cpp/t)      ;;
+            *snmp_bc/t)  if ${@bb.utils.contains('PACKAGECONFIG','snmp-bc','true','false',d)}
+                         then
+                           oe_runmake -C ${dir} buildtest-TESTS
+                         fi
+                         ;;
+            *)           oe_runmake -C ${dir} buildtest-TESTS ;;
+        esac
+    done
+}
+
+ack_do_compile_ptest () {
+    for x in `find ${B} -name Makefile -exec grep -l buildtest-TESTS {} \;`; do
+        dir=`dirname ${x}`
         upper=`dirname ${dir}`
         if [ `basename ${upper}` != "cpp" ]; then
             oe_runmake -C ${dir} buildtest-TESTS
-- 
2.7.4


