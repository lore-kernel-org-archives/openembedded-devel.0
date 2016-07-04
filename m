Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D28F960119
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 08:07:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6487fB3016440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jul 2016 01:07:47 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Jul 2016 01:07:46 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Jul 2016 16:06:14 +0800
Message-ID: <1467619576-13899-4-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
References: <1467619576-13899-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH v2 3/5] python-mccabe: Add python-pytest-runner dependency
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
X-List-Received-Date: Mon, 04 Jul 2016 08:07:48 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python-pytest-runner dependency for python-mccabe

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
index 0958f75..ba966eb 100644
--- a/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-mccabe_0.4.0.bb
@@ -8,6 +8,9 @@ SRC_URI[sha256sum] = "9a2b12ebd876e77c72e41ebf401cc2e7c5b566649d50105ca498226886
 
 inherit pypi setuptools
 
+DEPENDS += " \
+    python-pytest-runner"
+
 RDEPENDS_${PN} += " \
     python-prettytable \
     python-cmd2 \
-- 
2.8.1


