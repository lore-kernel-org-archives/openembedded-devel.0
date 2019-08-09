Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B87DF7F274
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 06:06:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,364,1559491200"; d="scan'208";a="73287424"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Aug 2019 14:06:48 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 266074CDFCF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:06:50 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 9 Aug 2019 14:06:49 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2019 14:06:07 +0800
Message-ID: <20190809060607.25725-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 266074CDFCF5.A75F6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] zabbix: upgrade 3.0.9 -> 4.2.5
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
X-List-Received-Date: Fri, 09 Aug 2019 06:06:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-The latest version needs to rely on libpcre.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../zabbix/{zabbix_3.0.9.bb => zabbix_4.2.5.bb}                     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_3.0.9.bb => zabbix_4.2.5.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
index bab5a6a..80db999 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.5.bb
@@ -19,7 +19,7 @@ HOMEPAGE = "http://www.zabbix.com/"
 SECTION = "Applications/Internet"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
-DEPENDS  = "openldap virtual/libiconv"
+DEPENDS  = "openldap virtual/libiconv libpcre"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "489d21b464277c0d412155c7e5611a8f"
-SRC_URI[sha256sum] = "4445f26c025009681c29c9b350aa6c4ee7b124ddcaf1609ae36c55997bcb8cf2"
+SRC_URI[md5sum] = "4dd3fe96a5da8598ba0caf181387a3f7"
+SRC_URI[sha256sum] = "4dba94cc8c5f1d97b596e636ff9346c3bdea59ac04a97f1236a6d5e69d72ab8c"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.7.4




