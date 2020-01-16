Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 48D0E7F9A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:58:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,325,1574092800"; d="scan'208";a="81959282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Jan 2020 15:58:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7378B4CE20FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 15:49:51 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 16 Jan 2020 15:58:58 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 16 Jan 2020 15:58:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jan 2020 16:00:26 +0800
Message-ID: <20200116080026.31070-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 7378B4CE20FF.AA6B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] libmicrohttpd: upgrade 0.9.68 -> 0.9.69
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
X-List-Received-Date: Thu, 16 Jan 2020 07:58:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libmicrohttpd_0.9.68.bb => libmicrohttpd_0.9.69.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.68.bb => libmicrohttpd_0.9.69.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.69.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.69.bb
index f5569de9f..4daeaf75b 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.68.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.69.bb
@@ -8,8 +8,8 @@ DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "1c3ca3bf92dfc680538b4186c58a9bd0"
-SRC_URI[sha256sum] = "c5716e2a2899abc9e16c8fa7a1a58da88f81aca96a0b7e68a5d4d89e21610b61"
+SRC_URI[md5sum] = "3ce03db1f10007517cecf05e040069af"
+SRC_URI[sha256sum] = "fb9b6b148b787493e637d3083588711e65cbcb726fa02cee2cd543c5de27e37e"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.20.1




