Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.6299.1615366254370106726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 00:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12A8olIT012141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 00:50:52 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 10 Mar 2021 00:50:46 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 10 Mar 2021 00:50:45 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] netkit-telnet: Update SRC_URI
Date: Wed, 10 Mar 2021 16:50:44 +0800
Message-ID: <20210310085044.43504-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: netkit-telnet-0.17-r0 do_fetch: Failed to fetch URL http://ftp.linux.org.uk/pub/linux/Networking/netkit/netkit-telnet-0.17.tar.gz, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 08dd532b6..c05d0fd6c 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://telnet/telnet.cc;beginline=2;endline=3;md5=780868e7b566313e70cb701560ca95ef"
 
-SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-telnet/netkit-telnet_${PV}.orig.tar.gz \
            file://To-aviod-buffer-overflow-in-telnet.patch \
            file://Warning-fix-in-the-step-of-install.patch \
            file://telnet-xinetd \
-- 
2.29.2

