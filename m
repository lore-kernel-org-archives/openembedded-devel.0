Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72D927F8F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 09:59:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA19xVEq014509
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Nov 2019 02:59:31 -0700 (PDT)
Received: from localhost (128.224.158.241) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 1 Nov 2019 02:59:30 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Nov 2019 17:59:28 +0800
Message-ID: <20191101095928.31357-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.241]
Subject: [meta-networking][PATCH] freeradius: set CLEANBROKEN
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
X-List-Received-Date: Fri, 01 Nov 2019 09:59:30 -0000
Content-Type: text/plain

Fixed make clean error:
  NOTE: make clean
  Makefile:36: *** Missing 'Make.inc' Run './configure [options]' and retry.  Stop.
  ERROR: oe_runmake failed

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.19.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
index 8c95bbae3..31e6978d6 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
@@ -230,3 +230,5 @@ FILES_${PN} =+ "${libdir}/rlm_*.so* ${libdir}/proto_*so*"
 
 RDEPENDS_${PN} += "perl"
 RDEPENDS_${PN}-utils = "${PN} perl"
+
+CLEANBROKEN = "1"
-- 
2.17.1


