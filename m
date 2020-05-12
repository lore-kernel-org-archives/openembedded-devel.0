Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6636.1589245989587599643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 18:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,381,1583164800"; 
   d="scan'208";a="91928751"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 09:13:07 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D12B34BCC8A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 09:13:03 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 09:13:02 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] mailcap: upgrade 2.1.48 -> 2.1.49
Date: Tue, 12 May 2020 18:13:23 +0800
Message-ID: <1589278403-92900-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D12B34BCC8A5.A5601
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

man page changed from mailcap.4 to mailcap.5

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/mailcap/{mailcap_2.1.48.bb => mailcap_2.1.49.bb} (81%)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
similarity index 81%
rename from meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
rename to meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
index 114ce4607c..ff3047f325 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.48.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.49.bb
@@ -14,12 +14,12 @@ by several applications e.g. to determine MIME types for filenames."
 SECTION = "System Environment/Base"
 
 LICENSE = "PD & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8dce08227d135cfda1f19d4c0c6689de"
 
 SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "2c26e18e912a5cf00318fcf7f8f2d747"
-SRC_URI[sha256sum] = "d7b023b237d6053bf05ff6786e0663c55c614efcc99cdf856120be13b5c29157"
+SRC_URI[md5sum] = "d5701a1a541383c0eda328f4a6518751"
+SRC_URI[sha256sum] = "f7381516bc1a937348efd1d0e14618e0a2afc5d59fe821dd248632d5601b59b5"
 
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
-- 
2.17.1



