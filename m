Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1107B7C33F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Jun 2019 01:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x541qoHr030784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2019 18:53:00 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 3 Jun 2019 18:52:39 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>,
	<open.source@oleksandr-kravchuk.com>
Date: Tue, 4 Jun 2019 09:52:37 +0800
Message-ID: <1559613157-28527-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-networking][PATCH] python-ldap: add python-pyasn1 and python-pyasn1-modules as runtime dependencies
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
X-List-Received-Date: Tue, 04 Jun 2019 01:53:21 -0000
Content-Type: text/plain

According to Doc/requirements.txt, this package needs python-pyasn1 and
python-pyasn1-modules as runtime dependencies.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
index d10f11b..af8961e 100644
--- a/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/meta-networking/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -26,4 +26,6 @@ do_configure_prepend() {
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-pyasn1 \
+    ${PYTHON_PN}-pyasn1-modules \
 "
-- 
2.7.4


