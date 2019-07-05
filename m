Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E46297EB49
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2019 01:45:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x651j3as023608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 18:45:03 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Jul 2019 18:45:03 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, saini
	<naveen.kumar.saini@intel.com>
Date: Thu, 4 Jul 2019 21:43:43 -0400
Message-ID: <1562291023-261126-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] pm-graph: package the pm-graph files
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
X-List-Received-Date: Fri, 05 Jul 2019 01:45:07 -0000
Content-Type: text/plain

package /usr/lib/pm-grap and /bin/* files created by pm-graph
to aviod "Files were installed but not shipped in any package"
error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
index ea12e054d3ab..00301298309e 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
@@ -18,3 +18,6 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
+
+FILES_${PN} += "${nonarch_libdir}/pm-graph \
+"
-- 
2.7.4


