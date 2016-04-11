Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBAD731C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 06:46:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3B6kPN8031980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 23:46:25 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Apr 2016 23:46:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Apr 2016 14:39:46 +0800
Message-ID: <1460356786-15153-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] icedtea7-native: backport patch of jaxb to fix NullPointerException
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
X-List-Received-Date: Mon, 11 Apr 2016 06:46:25 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch of jaxb from

https://java.net/projects/jaxb/sources/v2/revision/1864898

to fix NullPointerException.

See https://java.net/jira/browse/JAXB-860 as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 recipes-core/icedtea/icedtea7-native.inc            |  3 +++
 .../jaxws_fix_NullPointerException.patch            | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/jaxws_fix_NullPointerException.patch

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index cb6b5d3..0ffe5d5 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -33,6 +33,7 @@ SRC_URI = " \
   ${ICEDTEA_PATCHES} \
   ${OPENJDK_PATCHES} \
   file://allow-headless-build.patch;striplevel=0 \
+  file://jaxws_fix_NullPointerException.patch;apply=no \
   "
 
 S = "${WORKDIR}/${ICEDTEA}"
@@ -154,6 +155,8 @@ do_configure_append() {
 	done
 	${POST_CONFIGURE_CLEAN_X11}
 	oe_runmake patch-boot
+
+	patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
 }
 
 EXTRA_OEMAKE = ' \
diff --git a/recipes-core/icedtea/openjdk-7-03b147/jaxws_fix_NullPointerException.patch b/recipes-core/icedtea/openjdk-7-03b147/jaxws_fix_NullPointerException.patch
new file mode 100644
index 0000000..ba47036
--- /dev/null
+++ b/recipes-core/icedtea/openjdk-7-03b147/jaxws_fix_NullPointerException.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Backport [https://java.net/projects/jaxb/sources/v2/revision/1864898]
+
+Backport patch of jaxb to fix NullPointerException issue.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/openjdk/jaxws/sources/jaxws_src/src/com/sun/xml/internal/bind/v2/runtime/ClassBeanInfoImpl.java b/openjdk/jaxws/sources/jaxws_src/src/com/sun/xml/internal/bind/v2/runtime/ClassBeanInfoImpl.java
+index dc88d45..cc4f6e9 100644
+--- a/openjdk/jaxws/sources/jaxws_src/src/com/sun/xml/internal/bind/v2/runtime/ClassBeanInfoImpl.java
++++ b/openjdk/jaxws/sources/jaxws_src/src/com/sun/xml/internal/bind/v2/runtime/ClassBeanInfoImpl.java
+@@ -187,7 +187,9 @@ public final class ClassBeanInfoImpl<BeanT> extends JaxBeanInfo<BeanT> implement
+     private void checkOverrideProperties(Property p) {
+         ClassBeanInfoImpl bi = this;
+         while ((bi = bi.superClazz) != null) {
+-            for (Property superProperty : bi.properties) {
++            Property[] props = bi.properties;
++            if (props == null) break;
++            for (Property superProperty : props) {
+                 if (superProperty == null) break;
+                 String spName = superProperty.getFieldName();
+                 if ((spName != null) && (spName.equals(p.getFieldName()))) {
-- 
2.6.1


