Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.3800.1614756783576061592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 23:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1237WuSC018654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Mar 2021 23:33:01 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 2 Mar 2021 23:32:57 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 2 Mar 2021 23:32:56 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][PATCH 2/2] xfsprogs: 5.9.0 -> 5.10.0
Date: Wed, 3 Mar 2021 15:32:52 +0800
Message-ID: <20210303073252.31386-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303073252.31386-1-kai.kang@windriver.com>
References: <20210303073252.31386-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfsprogs from 5.9.0 to 5.10.0

* add build dependency libinih

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfsprogs/{xfsprogs_5.9.0.bb => xfsprogs_5.10.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.9.0.bb => xfsprogs_5.10.0.bb} (95%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb
similarity index 95%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb
index 48d15cca9..509dbd620 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.9.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.10.0.bb
@@ -12,12 +12,12 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
            file://0001-support-usrmerge.patch \
            "
-SRC_URI[sha256sum] = "bc5c805596bc609a18dc1f1b4ed6a2821dba9f47408ec00e7799ceea1b2097f1"
+SRC_URI[sha256sum] = "e04017e46d43e4d54b9a560fd7cea922520f8f6ef882404969d20cd4e5c790e9"
 inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
 
-DEPENDS += "util-linux"
+DEPENDS += "util-linux libinih"
 
 RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
 
-- 
2.17.1

