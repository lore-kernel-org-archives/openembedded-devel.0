Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F005978406
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:48:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9mY50009058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Aug 2017 02:48:38 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 25 Aug 2017 00:19:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Aug 2017 03:19:25 -0400
Message-ID: <1503645565-147503-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libreport: fix typo of SRC_URI
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
X-List-Received-Date: Fri, 25 Aug 2017 09:48:39 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
index 459f0f2..ee9a84c 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 
-SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}}-%{PV}.tar.gz"
+SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}-${PV}.tar.gz"
 SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch \
             file://0003-without-build-plugins.patch \
-- 
2.8.1


