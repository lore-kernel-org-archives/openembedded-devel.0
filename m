Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 64CA17D169
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 05:13:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,303,1549900800"; d="scan'208";a="58358415"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Apr 2019 13:13:52 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 85D5B4CD7914
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:13:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 3 Apr 2019 13:13:56 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Mar 2019 14:58:10 +0800
Message-ID: <1553237890-37534-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 85D5B4CD7914.AC374
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] Fix build error for armeb.
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
X-List-Received-Date: Wed, 03 Apr 2019 05:13:52 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.12.bb b/meta-oe/recipes-benchmark/fio/fio_3.12.bb
index 2deb42d..e85e7c7 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.12.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.12.bb
@@ -16,6 +16,7 @@ RDEPENDS_${PN} = "python bash"
 PACKAGECONFIG_NUMA = "numa"
 # ARM does not currently support NUMA
 PACKAGECONFIG_NUMA_arm = ""
+PACKAGECONFIG_NUMA_armeb = ""
 
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
-- 
2.7.4




