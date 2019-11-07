Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id ABC7C7F61C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:00:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,277,1569254400"; d="scan'208";a="78003459"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 19:00:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 51EEA4CE1A0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 18:51:54 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 7 Nov 2019 18:59:59 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 18:59:59 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 22:39:39 +0800
Message-ID: <1573137579-64002-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 51EEA4CE1A0A.A743B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-filesystems][PATCH] sshfs-fuse: upgrade 3.5.2 -> 3.6.0
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
X-List-Received-Date: Thu, 07 Nov 2019 11:00:03 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.5.2.bb => sshfs-fuse_3.6.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.5.2.bb => sshfs-fuse_3.6.0.bb} (88%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.6.0.bb
similarity index 88%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.6.0.bb
index b10c5c5..2515d07 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.5.2.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.6.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs"
-SRCREV = "695cd8916f0e78d28009de3ffe112b9d1a1c9e5e"
+SRCREV = "a1e5f12c530ccf59434a7d59a34a049f160b3559"
 S = "${WORKDIR}/git"
 
 inherit meson
-- 
2.7.4




