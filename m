Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4064.1586310929691087613
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 18:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,357,1580745600"; 
   d="scan'208";a="88652718"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Apr 2020 09:55:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 15E3B49DF146
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2020 09:45:04 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 8 Apr 2020 09:55:26 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Apr 2020 09:55:33 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [PATCH 1/2] [oe] [meta-networking][PATCH] libnetfilter-conntrack: upgrade 1.0.7 -> 1.0.8
Date: Wed, 8 Apr 2020 02:02:50 -0700
Message-ID: <1586336571-19263-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 15E3B49DF146.A481F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ter-conntrack_1.0.7.bb => libnetfilter-conntrack_1.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-conntrack_1.0.7.bb => libnetfilter-conntrack_1.0.8.bb} (80%)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
similarity index 80%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
index 5c8150156..cd8943393 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.7.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.8.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 
 SRC_URI = "https://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2"
-SRC_URI[md5sum] = "013d182c2df716fcb5eb2a1fb7febd1f"
-SRC_URI[sha256sum] = "33685351e29dff93cc21f5344b6e628e41e32b9f9e567f4bec0478eb41f989b6"
+SRC_URI[md5sum] = "3121b55acf97322db830da75d8407cba"
+SRC_URI[sha256sum] = "0cd13be008923528687af6c6b860f35392d49251c04ee0648282d36b1faec1cf"
 
 S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
 
-- 
2.17.1



