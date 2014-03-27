Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id E5BE46D189
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:11:42 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to:references;
	b=V7Z6OXrzuvp1QaBgsAkVU+7UXDsB7e1UKfIOD3a/iiIgBIFQhvQNNrGQoZHW1vjSeDuOVHNq2uOU
	QTpjlkz1CiSfcTD+VtHJWRiYVUZcJfvIH9JOornwwo0uAHWNRdhv  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1395922303910980.9447659270032;
	Thu, 27 Mar 2014 05:11:43 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Mar 2014 13:10:39 +0100
Message-Id: <ae735bb086924d362978d68431cad7a010f8b188.1395921944.git.diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
In-Reply-To: <cover.1395921944.git.diego.ml@zoho.com>
References: <cover.1395921944.git.diego.ml@zoho.com>
X-ZohoMailClient: External
X-Zoho-Virus-Status: 2
Subject: [meta-oe][PATCHv3 1/3] python-zopeinterface: upgrade to version 4.1.1
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
X-List-Received-Date: Thu, 27 Mar 2014 12:11:43 -0000

Changes:
* upgraded python-zopeinterface to latest upstream
* dropped PR because of PV increase

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 ...face_3.5.1.bb => python-zopeinterface_4.1.1.bb} |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-zopeinterface_3.5.1.bb => python-zopeinterface_4.1.1.bb} (83%)

diff --git a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
similarity index 83%
rename from meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
rename to meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
index d73a5be..4151f58 100644
--- a/meta-oe/recipes-devtools/python/python-zopeinterface_3.5.1.bb
+++ b/meta-oe/recipes-devtools/python/python-zopeinterface_4.1.1.bb
@@ -3,11 +3,10 @@ SECTION = "console/network"
 
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
-PR = "r1"
 
 SRC_URI = "http://pypi.python.org/packages/source/z/zope.interface/zope.interface-${PV}.tar.gz"
-SRC_URI[md5sum] = "685fc532550abb07cca6190c9cd2b901"
-SRC_URI[sha256sum] = "b81d898532c47f73475c2d0c23580e289eed25923d007eca8e62750c0998bba0"
+SRC_URI[md5sum] = "edcd5f719c5eb2e18894c4d06e29b6c6"
+SRC_URI[sha256sum] = "91cba7b7cd7cb82f6f4e023fe77f94dc3df4ae5287fd55def2148dc232d0c7da"
 
 S = "${WORKDIR}/zope.interface-${PV}"
 
-- 
1.7.9.5



