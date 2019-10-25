Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E49ED7F9BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 05:52:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208";a="77458598"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 13:52:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 299E74B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:44:53 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 13:52:47 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2019 13:53:01 +0800
Message-ID: <20191025055301.32606-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 299E74B6EC86.A910E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] snort: upgrade 2.9.14.1 -> 2.9.15
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
X-List-Received-Date: Fri, 25 Oct 2019 05:52:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/snort/{snort_2.9.14.1.bb => snort_2.9.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.14.1.bb => snort_2.9.15.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
index 892fe4d..fbec195 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://0001-chdeck-for-gettid-API-during-configure.patch \
 "
 
-SRC_URI[md5sum] = "009254a9797ec93321c5936b99dcd6c8"
-SRC_URI[sha256sum] = "2472989da3aace000d1ea5931ece68f8e5cc0c511e272d65182113a2481e822d"
+SRC_URI[md5sum] = "b56cadfa840f706ff67d4df0256c03eb"
+SRC_URI[sha256sum] = "bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.7.4




