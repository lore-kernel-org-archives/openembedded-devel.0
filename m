Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 69B6B74FE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:33:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42310231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jul 2018 11:33:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 565094B5CC0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:33:41 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 17 Jul 2018 11:33:40 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Jul 2018 11:32:50 +0800
Message-ID: <20180717033250.6843-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 565094B5CC0B.AEEAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe][PATCH] numactl: 2.0.11 -> 2.0.12
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
X-List-Received-Date: Tue, 17 Jul 2018 03:33:47 -0000
Content-Type: text/plain

1.Upgrade numactl 2.0.11 to 2.0.12.

2.Modify README to README.md

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/numactl/numactl_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index b9cbcf0..57b7203 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -9,10 +9,10 @@ RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "ea3a70681c2f523fe58e1d44527f478ca76db74e"
-PV = "2.0.11+git${SRCPV}"
+SRCREV = "841253d1313b01a968c380cae4f498f20c46e5aa"
+PV = "2.0.12+git${SRCPV}"
 
 SRC_URI = "git://github.com/numactl/numactl \
     file://fix-null-pointer.patch \
-- 
2.7.4




