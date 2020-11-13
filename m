Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.14801.1605232833940623689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,473,1596470400"; 
   d="scan'208";a="101311951"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 10:00:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 529C44CE4BA3
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:00:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 10:00:11 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-filesystems] [PATCH] sshfs-fuse: upgrade 3.7.0 -> 3.7.1
Date: Fri, 13 Nov 2020 22:00:03 +0800
Message-ID: <1605276003-25340-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 529C44CE4BA3.A0E92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.0.bb => sshfs-fuse_3.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.0.bb => sshfs-fuse_3.7.1.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.0.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.0.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb
index 47c9a64aa..1db328465 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.0.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs"
-SRCREV = "a7e1038203c856cc7e052d439d1da49fe131339f"
+SRCREV = "8059e2ce630dd2b984f7a6c44a2b5291b0fe2abc"
 S = "${WORKDIR}/git"
 
 inherit meson ptest
-- 
2.25.1



