Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7820.1608016943545937835
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:22:09 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D2DF14CE601C
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 15:22:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:22:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] zabbix: CVE-2020-15803 Security Advisory
Date: Tue, 15 Dec 2020 15:22:03 +0800
Message-ID: <1608016923-21617-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D2DF14CE601C.A43FF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-15803

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../zabbix/zabbix/CVE-2020-15803.patch        | 36 +++++++++++++++++++
 .../zabbix/zabbix_4.4.6.bb                    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
new file mode 100644
index 000000000..2eec4bf32
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
@@ -0,0 +1,36 @@
+From 4943334fd9bf7dffd49f9e86251ad40b3efe2135 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Fri, 11 Dec 2020 17:02:20 +0900
+Subject: [PATCH] Fix bug for CVE-2020-15803
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ frontends/php/include/classes/html/CIFrame.php | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/frontends/php/include/classes/html/CIFrame.php b/frontends/php/include/classes/html/CIFrame.php
+index 32220cd..70f2ab5 100644
+--- a/frontends/php/include/classes/html/CIFrame.php
++++ b/frontends/php/include/classes/html/CIFrame.php
+@@ -29,6 +29,7 @@ class CIFrame extends CTag {
+ 		$this->setHeight($height);
+ 		$this->setScrolling($scrolling);
+ 		$this->setId($id);
++		$this->setSandbox();
+ 	}
+ 
+ 	public function setSrc($value = null) {
+@@ -69,4 +70,10 @@ class CIFrame extends CTag {
+ 		$this->setAttribute('scrolling', $value);
+ 		return $this;
+ 	}
++
++	private function setSandbox() {
++		if (ZBX_IFRAME_SANDBOX !== false) {
++			$this->setAttribute('sandbox', ZBX_IFRAME_SANDBOX);
++		}
++	}
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
index 0e0ddd577..98a31879c 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
@@ -26,6 +26,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
+    file://CVE-2020-15803.patch \
 "
 
 SRC_URI[md5sum] = "e666539220be93b1af38e40f5fbb1f79"
-- 
2.25.1



