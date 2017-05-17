Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5421971C3D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 02:50:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18945281"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 May 2017 10:50:24 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A8DBE47C6527
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 10:50:24 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 17 May 2017 10:50:24 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 May 2017 10:50:25 +0800
Message-ID: <1494989425-25411-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: A8DBE47C6527.A95C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] ifenslave: 2.7 -> 2.9
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
X-List-Received-Date: Wed, 17 May 2017 02:50:28 -0000
Content-Type: text/plain

1) Upgrade ifenslave from 2.7 to 2.9.
2) License checksum changed,since the copyright's Format were changed.

Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../recipes-support/ifenslave/{ifenslave_2.7.bb => ifenslave_2.9.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_2.7.bb => ifenslave_2.9.bb} (86%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
similarity index 86%
rename from meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
index 5028921..ea28b34 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.9.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bon
 SECTION = "net"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=6807ba81c0744ab50d735c94628c3f64"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=acc89812938cf9ad6b1debc37cea0253"
 
-SRCREV = "400c490d52acb31f1064e1bf4fc9fcaf3791888f"
+
+SRCREV = "42bfbb9beb924672ca86b86e9679ac3d6b87d992"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ifenslave.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4




