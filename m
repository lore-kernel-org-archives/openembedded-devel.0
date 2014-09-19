Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2FC71477
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 10:38:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8JAc9g4019699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:38:10 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 03:38:09 -0700
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <Bruce.Ashfield@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 18:33:38 +0800
Message-ID: <1411122818-121055-4-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
References: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] enable i40e driver for intel-x86 BSP
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 10:38:10 -0000
Content-Type: text/plain

From: fupan li <fupan.li@windriver.com>

Signed-off-by: fupan li <fupan.li@windriver.com>
Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 meta/cfg/kernel-cache/features/i40e/i40e.cfg | 3 +++
 meta/cfg/kernel-cache/features/i40e/i40e.scc | 4 ++++
 2 files changed, 7 insertions(+)
 create mode 100644 meta/cfg/kernel-cache/features/i40e/i40e.cfg
 create mode 100644 meta/cfg/kernel-cache/features/i40e/i40e.scc

diff --git a/meta/cfg/kernel-cache/features/i40e/i40e.cfg b/meta/cfg/kernel-cache/features/i40e/i40e.cfg
new file mode 100644
index 0000000..e1368d5
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/i40e/i40e.cfg
@@ -0,0 +1,3 @@
+CONFIG_I40E=m
+CONFIG_I40E_DCB=y
+CONFIG_I40EVF=m
diff --git a/meta/cfg/kernel-cache/features/i40e/i40e.scc b/meta/cfg/kernel-cache/features/i40e/i40e.scc
new file mode 100644
index 0000000..c42b1a6
--- /dev/null
+++ b/meta/cfg/kernel-cache/features/i40e/i40e.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Intel Ethernet Controller XL710/X710 Family support"
+define KFEATURE_COMPATIBILITY board
+
+kconf hardware i40e.cfg
-- 
1.8.1.2


