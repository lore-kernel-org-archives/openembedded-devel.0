Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id E19DB6F92C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:11:50 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=M3pWRYOrqX96i4Kys9M2YI4kUelrZay0TobG/5Zag3DM9XnHHVroSZtxqT8tTOoVTEruKo2ubMKR
	2aqH3ZBBU6aA4Jdgmf9aapvp8E8WHhHKkek7iV3s6bj/IDIxar6m  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395922311120296.2029442218652;
	Thu, 27 Mar 2014 05:11:51 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 13:10:40 +0100
Message-Id: <d20045321fd1650e15c7f0620138bcc24b27db2a.1395921944.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCHv3 2/3] python-twisted: upgrade to version 13.2.0
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
X-List-Received-Date: Thu, 27 Mar 2014 12:11:51 -0000

Changes:
* upgraded python-twisted to latest upstream
* dropped PR because of PV increase
* updated LICENSE checksum because new contributors have been added to the file
* dropped bin package because resulting package was empty:
  - file _c_urlarg has been removed with this commit:
    https://twistedmatrix.com/trac/changeset/31167/trunk/twisted/protocols
  - file cBanana was not packaged even in previous version, upstream removed it ages ago.
    https://twistedmatrix.com/trac/changeset/19014/trunk/twisted/spread
* the newly introduced zsh completion file has been added to the zsh package

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 ...-twisted_10.2.0.bb => python-twisted_13.2.0.bb} |   17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-twisted_10.2.0.bb => python-twisted_13.2.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
rename to meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
index d585bfa..80d64a0 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -6,12 +6,11 @@ SECTION = "console/network"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a"
-PR = "r3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
 
-SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5"
-SRC_URI[sha256sum] = "562ed61c18aa72da99c23fb19c2c101d178995eb3a78ab3c09560a613e180c84"
+SRC_URI = "https://pypi.python.org/packages/source/T/Twisted/Twisted-${PV}.tar.bz2"
+SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
+SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
 
 S = "${WORKDIR}/Twisted-${PV}"
 
@@ -26,7 +25,6 @@ PACKAGES += "\
     ${PN}-zsh \
     ${PN}-test \
     ${PN}-protocols \
-    ${PN}-bin \
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -42,7 +40,6 @@ PACKAGES += "\
 
 RDEPENDS_${PN} = "python-core python-zopeinterface"
 RDEPENDS_${PN} += "\
-    ${PN}-bin \
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -70,11 +67,7 @@ FILES_${PN}-protocols = " \
 FILES_${PN}-zsh = " \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
     ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
-"
-
-FILES_${PN}-bin = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/_c_urlarg.so \
-    ${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/cBanana.so \
+    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
 "
 
 FILES_${PN}-conch = " \
-- 
1.7.9.5



