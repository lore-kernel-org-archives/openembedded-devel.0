Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.2758.1585704796956458387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2020 18:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,329,1580745600"; 
   d="scan'208";a="88306255"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Apr 2020 09:33:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6A151406AB15
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Apr 2020 09:22:54 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 1 Apr 2020 09:33:12 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 1 Apr 2020 09:33:19 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] libdvdread: upgrade 6.0.2 -> 6.1.0
Date: Wed, 1 Apr 2020 02:06:43 -0700
Message-ID: <1585732005-8348-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585732005-8348-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6A151406AB15.AFD44
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libdvdread/{libdvdread_6.0.2.bb => libdvdread_6.1.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.0.2.bb => libdvdread_6.1.0.bb} (71%)

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb
similarity index 71%
rename from meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb
rename to meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb
index 2ca74f6da..edf84b8f5 100644
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.0.2.bb
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.0.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${PV}.tar.bz2"
-SRC_URI[md5sum] = "49990935174bf6b2fa501e789c578135"
-SRC_URI[sha256sum] = "f91401af213b219cdde24b46c50a57f29301feb7f965678f1d7ed4632cc6feb0"
+SRC_URI[md5sum] = "0f74ad333331ff9bf441e74036f540df"
+SRC_URI[sha256sum] = "501bbd7d1e7d5f2d2a0ff8d0a6ac2fbd7e5e7e0e80ef82fef818f43a30b4750c"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.17.1



