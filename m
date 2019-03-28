Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3966C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 02:24:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2S2OxIK009851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 19:24:59 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 19:24:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Mar 2019 10:16:07 +0800
Message-ID: <1553739367-15518-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: set CVE_VERSION
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
X-List-Received-Date: Thu, 28 Mar 2019 02:24:58 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
index e29c527..e27a4ae 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb
@@ -35,6 +35,7 @@ SRC_URI[md5sum] = "3b729d89eb441150e146780c4138481b"
 SRC_URI[sha256sum] = "5a6e2284a53de5702d3dc2be3b9339c963f9b5397d3fbbc53beb249380a781f5"
 
 CVE_PRODUCT = "kerberos"
+CVE_VERSION = "5-${PV}"
 
 S = "${WORKDIR}/${BP}/src"
 
-- 
2.7.4


