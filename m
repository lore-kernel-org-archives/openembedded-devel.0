Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE4047EAEC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2019 09:22:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x649MPWC027966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jul 2019 02:22:35 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Jul 2019 02:22:15 -0700
From: Liwei Song <liwei.song@windriver.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Jul 2019 05:20:55 -0400
Message-ID: <1562232055-238768-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pm-graph: package the pm-graph files
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
X-List-Received-Date: Thu, 04 Jul 2019 09:22:45 -0000
Content-Type: text/plain

package /usr/lib/pm-grap and /bin/* files created by pm-graph
to aviod "Files were installed but not shipped in any package"
error.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
index de2d46dcafef..393e8c83573b 100644
--- a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
@@ -17,3 +17,8 @@ do_install() {
 }
 
 RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
+
+FILES_${PN} = "${nonarch_libdir}/pm-graph \
+               ${bindir}/sleepgraph \
+               ${bindir}/bootgraph \
+"
-- 
2.7.4


