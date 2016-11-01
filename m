Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4E8971B2E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA19NGBq027788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:16 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:15 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:23:01 +0800
Message-ID: <7dca69306f6608cdf84c1a2156e278ebe0954418.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477991825.git.yi.zhao@windriver.com>
References: <cover.1477991825.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 2/6] nuttcp: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 01 Nov 2016 09:23:19 -0000
Content-Type: text/plain

Set LDFLAGS explicitly for do_compile

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
index 7f666fb..9430add 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "c6e33810ccce67260f8d5d627f60e429d44f532365c58ed5673d035e2a
 S = "${WORKDIR}"
 
 do_compile () {
-    ${CC} ${CFLAGS} -o nuttcp nuttcp-${PV}.c
+    ${CC} ${CFLAGS} ${LDFLAGS} -o nuttcp nuttcp-${PV}.c
 }
 
 do_install () {
-- 
2.7.4


