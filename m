Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id CAC8F6FA2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:32:00 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=QslXduxEI/BTuruXAN+mIgXVbqNBaktC5ajhPFZO6nNEPr0JFrZ+54APZISIAa3jdAJB+sL8hVQy
	Kb9LWQi4B2wTXHy/AmbnWUHIiDwdnFtHaZWJpvwx5OCEyxDLhBcN  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 139584791845524.22521579587942;
	Wed, 26 Mar 2014 08:31:58 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Mar 2014 16:31:23 +0100
Message-Id: <a3add80fda66a3b3ed601cdf1143297886f9e679.1395847615.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395847615.git.diego.ml@zoho.com>
References: <cover.1395847615.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395847615.git.diego.ml@zoho.com>
References: <cover.1395847615.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCHv2 2/3] python-twisted: upgrade to version 13.2.0
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
X-List-Received-Date: Wed, 26 Mar 2014 15:32:01 -0000

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 ...-twisted_10.2.0.bb => python-twisted_13.2.0.bb} |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-twisted_10.2.0.bb => python-twisted_13.2.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
rename to meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
index d585bfa..00be867 100644
--- a/meta-oe/recipes-devtools/python/python-twisted_10.2.0.bb
+++ b/meta-oe/recipes-devtools/python/python-twisted_13.2.0.bb
@@ -6,12 +6,12 @@ SECTION = "console/network"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3159ad36d96a939fcd8f2c2c9b9d08a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
 PR = "r3"
 
-SRC_URI = "http://tmrc.mit.edu/mirror/twisted/Twisted/10.2/Twisted-${PV}.tar.bz2 "
-SRC_URI[md5sum] = "73da62c793269eade8121da336b01ba5"
-SRC_URI[sha256sum] = "562ed61c18aa72da99c23fb19c2c101d178995eb3a78ab3c09560a613e180c84"
+SRC_URI = "https://pypi.python.org/packages/source/T/Twisted/Twisted-${PV}.tar.bz2"
+SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
+SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
 
 S = "${WORKDIR}/Twisted-${PV}"
 
@@ -26,7 +26,6 @@ PACKAGES += "\
     ${PN}-zsh \
     ${PN}-test \
     ${PN}-protocols \
-    ${PN}-bin \
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -42,7 +41,6 @@ PACKAGES += "\
 
 RDEPENDS_${PN} = "python-core python-zopeinterface"
 RDEPENDS_${PN} += "\
-    ${PN}-bin \
     ${PN}-conch \
     ${PN}-lore \
     ${PN}-mail \
@@ -70,11 +68,7 @@ FILES_${PN}-protocols = " \
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



