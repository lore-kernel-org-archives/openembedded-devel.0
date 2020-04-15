Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6848.1586915460384658510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89043949"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:50:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 922FA50A996E
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:50:57 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:51:04 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] libdvdread: upgrade 6.1.0 -> 6.1.1
Date: Wed, 15 Apr 2020 01:31:39 -0700
Message-ID: <1586939501-29659-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 922FA50A996E.A49FE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libdvdread/{libdvdread_6.1.0.bb => libdvdread_6.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.0.bb => libdvdread_6.1.1.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
index edf84b8f5..65f5b6adf 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.1.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "0f74ad333331ff9bf441e74036f540df"
-SRC_URI[sha256sum] = "501bbd7d1e7d5f2d2a0ff8d0a6ac2fbd7e5e7e0e80ef82fef818f43a30b4750c"
+SRC_URI[md5sum] = "09c7423568fb679279fd2a2bc6b10b6e"
+SRC_URI[sha256sum] = "3e357309a17c5be3731385b9eabda6b7e3fa010f46022a06f104553bf8e21796"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.17.1



