Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.17004.1615085930180063603
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 18:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1272wixI011682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 6 Mar 2021 18:58:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 6 Mar 2021 18:58:33 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sat, 6 Mar 2021 18:58:33 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] zabbix: upgrade 4.4.6 -> 5.2.5
Date: Sat, 6 Mar 2021 21:58:27 -0500
Message-ID: <20210307025827.137764-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210307025827.137764-1-Randy.MacLeod@windriver.com>
References: <20210307025827.137764-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Drop CVE patch that is not needed for 5.2.5. Add Upstream-Status: tag
for the configure patch which specifies the kernel version.
Specify the recipe specific sysroot path to avoid:
   QA Issue: ... [configure-unsafe]
for libpcre and iconv.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../zabbix/zabbix/0001-Fix-configure.ac.patch |  2 ++
 .../zabbix/zabbix/CVE-2020-15803.patch        | 36 -------------------
 .../{zabbix_4.4.6.bb => zabbix_5.2.5.bb}      | 10 +++---
 3 files changed, 7 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.4.6.bb => zabbix_5.2.5.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
index af14a1a56..97339d3ff 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/0001-Fix-configure.ac.patch
@@ -1,5 +1,7 @@
 uname can not get version of kernel correctly while cross compile
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
deleted file mode 100644
index 2eec4bf32..000000000
--- a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2020-15803.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4943334fd9bf7dffd49f9e86251ad40b3efe2135 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Fri, 11 Dec 2020 17:02:20 +0900
-Subject: [PATCH] Fix bug for CVE-2020-15803
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- frontends/php/include/classes/html/CIFrame.php | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/frontends/php/include/classes/html/CIFrame.php b/frontends/php/include/classes/html/CIFrame.php
-index 32220cd..70f2ab5 100644
---- a/frontends/php/include/classes/html/CIFrame.php
-+++ b/frontends/php/include/classes/html/CIFrame.php
-@@ -29,6 +29,7 @@ class CIFrame extends CTag {
- 		$this->setHeight($height);
- 		$this->setScrolling($scrolling);
- 		$this->setId($id);
-+		$this->setSandbox();
- 	}
- 
- 	public function setSrc($value = null) {
-@@ -69,4 +70,10 @@ class CIFrame extends CTag {
- 		$this->setAttribute('scrolling', $value);
- 		return $this;
- 	}
-+
-+	private function setSandbox() {
-+		if (ZBX_IFRAME_SANDBOX !== false) {
-+			$this->setAttribute('sandbox', ZBX_IFRAME_SANDBOX);
-+		}
-+	}
- }
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
index 98a31879c..2bbfec9dc 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.5.bb
@@ -23,14 +23,13 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
-    file://CVE-2020-15803.patch \
 "
 
-SRC_URI[md5sum] = "e666539220be93b1af38e40f5fbb1f79"
-SRC_URI[sha256sum] = "22bb28e667424ad4688f47732853f4241df0e78a7607727b043d704ba726ae0e"
+SRC_URI[md5sum] = "e90822716c5c241890f6fed1588b5451"
+SRC_URI[sha256sum] = "ce0d9745a8b9154e87d6906edd0fce7b7ec298acd34a0543ea53d1a5f2f14bc5"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
@@ -58,7 +57,8 @@ EXTRA_OECONF = " \
     --with-zlib \
     --with-libpthread \
     --with-libevent \
-    --with-libpcre \
+    --with-libpcre=${STAGING_EXECPREFIXDIR} \
+    --with-iconv=${STAGING_EXECPREFIXDIR} \
 "
 CFLAGS_append = " -lldap -llber -pthread"
 
-- 
2.27.0

