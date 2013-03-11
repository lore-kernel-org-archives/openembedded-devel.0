Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UF0id-0000kh-DE
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 12:16:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2B9dmYA003693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 02:39:48 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 02:39:48 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Mar 2013 17:39:42 +0800
Message-ID: <1362994782-12371-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: wfan@windriver.com
Subject: [PATCH] meta-selinux: Add LAYERVERSION and LAYERDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:16:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add LAYERVERSION and LAYERDEPENDS to layer.conf

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 conf/layer.conf |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index ca0aefa..ca1bb46 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -9,3 +9,8 @@ BBFILE_COLLECTIONS += "selinux"
 BBFILE_PATTERN_selinux := "^${LAYERDIR}/"
 BBFILE_PRIORITY_selinux = "5"
 
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_selinux = "1"
+
+LAYERDEPENDS_selinux = "core"
-- 
1.7.10.4



