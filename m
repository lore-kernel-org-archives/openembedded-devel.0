Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78AE8731A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Dec 2015 07:56:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBP7uajR028311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 23:56:36 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 23:56:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Dec 2015 15:56:29 +0800
Message-ID: <2a5e2f7a01bb9d5ae34f7d683c047fa64ab8e691.1451029460.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1451029460.git.jackie.huang@windriver.com>
References: <cover.1451029460.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 09/15] openjdk: postinst cleanup
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
X-List-Received-Date: Fri, 25 Dec 2015 07:56:35 -0000
Content-Type: text/plain

From: Amy Fong <amy.fong@windriver.com>

Some of the postinst rules results in a build error because "ERR" is in
the first line.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-postinst.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-postinst.inc b/recipes-core/openjdk/openjdk-postinst.inc
index 4985d56..be88714 100644
--- a/recipes-core/openjdk/openjdk-postinst.inc
+++ b/recipes-core/openjdk/openjdk-postinst.inc
@@ -1,6 +1,9 @@
 # handles all postinst action for openjdk
 
+# some of the former results in a build error because "ERR" is in the first line.
+
 pkg_postinst_${JDKPN}-vm-shark () {
+    true
     if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-shark.*/d" -e "s|\(^\-server*\)|\-shark KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     else
@@ -9,6 +12,7 @@ pkg_postinst_${JDKPN}-vm-shark () {
 }
 
 pkg_prerm_${JDKPN}-vm-shark () {
+    true
     sed -i -e "/^\-shark.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
@@ -19,6 +23,7 @@ pkg_prerm_${JDKPN}-vm-shark () {
 }
 
 pkg_postinst_${JDKPN}-vm-cacao () {
+    true
     if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-cacao.*/d" -e "s|\(^\-server*\)|\-cacao KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     else
@@ -27,6 +32,7 @@ pkg_postinst_${JDKPN}-vm-cacao () {
 }
 
 pkg_prerm_${JDKPN}-vm-cacao () {
+    true
     sed -i -e "/^\-cacao.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
@@ -37,6 +43,7 @@ pkg_prerm_${JDKPN}-vm-cacao () {
 }
 
 pkg_postinst_${JDKPN}-vm-jamvm () {
+    true
     if grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && ! grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         sed -i -e "/\-jamvm.*/d" -e "s|\(^\-server*\)|\-jamvm KNOWN\n\1|" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     else
@@ -45,6 +52,7 @@ pkg_postinst_${JDKPN}-vm-jamvm () {
 }
 
 pkg_prerm_${JDKPN}-vm-jamvm () {
+    true
     sed -i -e "/^\-jamvm.*/d" -e "/^$/d" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
@@ -55,6 +63,7 @@ pkg_prerm_${JDKPN}-vm-jamvm () {
 }
 
 pkg_postinst_${JDKPN}-vm-zero () {
+    true
     if grep -q "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg && grep -q "\-server ERROR" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
         sed -i -e "/${FIRST_KNOWN}/d" -e "/^$/d" $D/${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
@@ -65,6 +74,7 @@ pkg_postinst_${JDKPN}-vm-zero () {
 }
 
 pkg_prerm_${JDKPN}-vm-zero () {
+    true
     sed -i -e "/^\-server.*/\-server ERROR" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg
     if grep -q "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg; then
         FIRST_KNOWN=`grep "KNOWN" ${JDK_HOME}/jre/lib/${JDK_ARCH}/jvm.cfg | head -n 1`
@@ -72,6 +82,10 @@ pkg_prerm_${JDKPN}-vm-zero () {
     fi
 }
 
+pkg_postinst_${JDKPN}-jre () {
+    ln -s ${JDK_HOME}/jre  $D/${libdir}/jvm/jre
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_${JDKPN}-jre = "java keytool"
-- 
1.9.1


