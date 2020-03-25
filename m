Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.25921.1585177495201188825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 16:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=po6ucPZ0;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 5434560044;
	Thu, 26 Mar 2020 00:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585177492;
	bh=LtHx+HS8Aa7UOJtJG+u+R7IuohSVRetfOn8HfWOHTM8=;
	h=From:To:Cc:Subject:Date:From;
	b=po6ucPZ0dPnfY2x3CmMJ738RCdl6g+MQOnmscFDE9X9DlC0Yp5Btz5aaq/IuYY90D
	 7ZdjFBnchyyFKQa1JqK5KEXtJWlbXugc3RFIsT6iBQdPJ8OOLk8tXUj7jH2klSFwSb
	 n2qjGxyY1ETFifVc7jCoeniT9ebSQ1n1byC9LZ6Q5jLksJUNZ1/I3/k0ijYv4Xms0m
	 EP79FCzXLu5oty7/ypl6MozlIoeJth5kiM9XHAQr8Ov8kAI0qthXmYqW07VI1CH+Jc
	 cJb7Yu4ESAb6kqGEqJqtnZ6EFL8TEUVpo3/9SE3b2bJoTRqAVw81rMjG+NkeStUAk6
	 LukZ09/hjXrrg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] fuse-exfat: fix upstream check URL
Date: Thu, 26 Mar 2020 00:04:48 +0100
Message-Id: <1585177488-4212-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
index 5720430..be2415f 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.3.0.bb
@@ -9,6 +9,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/relan/exfat/releases/download/v${PV}/${BP}.tar.gz"
 
+UPSTREAM_CHECK_URI = "https://github.com/relan/exfat/releases"
+
 DEPENDS = "fuse virtual/libc"
 RRECOMMENDS_${PN} = "util-linux-mount"
 
-- 
2.7.4

