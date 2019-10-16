Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D66C07F352
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71F0A18442
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:52 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2vygyJ9T7iTB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id C81301843F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B27A81A073
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A69241A06F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id 9A4DB4E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGkpWm025595
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGkpFs025594
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Oct 2019 18:46:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:46:49 +0200
Message-Id: <20191016164650.25544-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][warrior][PATCH 1/2] jsoncpp: add native BBCLASSEXTEND
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
X-List-Received-Date: Wed, 16 Oct 2019 16:46:52 -0000
Content-Transfer-Encoding: 8bit

From: Pavel Modilaynen <pavelmn@axis.com>

Extend to native builds, this is useful for unit tests.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
index 88e332032..97fc6c73b 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.8.4.bb
@@ -19,3 +19,5 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DJSONCPP_WITH_TESTS=OFF"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


