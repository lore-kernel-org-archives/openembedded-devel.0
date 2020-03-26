Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.32667.1585210841834965636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02Q8Kena011445
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 01:20:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Mar 2020 01:20:21 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: don't download LTS content by default
Date: Thu, 26 Mar 2020 16:20:20 +0800
Message-ID: <1585210820-107410-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
Fetcher failure: Repository
git://github.com/FreeRADIUS/freeradius-server.git has LFS content,
install git-lfs on host to download (or set lfs=0 to ignore it)

upstream has file .lfsconfig to make it not download lfs files by
default, so we also don't download it by default

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
index a9c2fad..005ca47 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
@@ -13,7 +13,7 @@ LICENSE = "GPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
-SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x; \
+SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0; \
     file://freeradius \
     file://volatiles.58_radiusd \
     file://freeradius-enble-user-in-conf.patch \
-- 
2.7.4

