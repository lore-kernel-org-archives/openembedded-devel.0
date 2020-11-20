Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.20309.1605843203060369711
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 19:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; 
   d="scan'208";a="101571184"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 11:33:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6EA734CE5472
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 11:33:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 11:33:21 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.8.4 -> 5.9.1
Date: Fri, 20 Nov 2020 21:14:26 +0800
Message-ID: <1605878066-35113-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6EA734CE5472.A0681
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
Removed since this is included in 5.9.1

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...setting-regarding-the-Standard-Outpu.patch | 34 -------------------
 ...trongswan_5.8.4.bb => strongswan_5.9.1.bb} |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_5.8.4.bb => strongswan_5.9.1.bb} (96%)

diff --git a/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
deleted file mode 100644
index 78adcf813..000000000
--- a/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7b1e376d7d22244feab466e9889ba77561117357 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 23 Sep 2020 16:20:22 +0800
-Subject: [PATCH] Remove obsolete setting regarding the Standard Output
-
-The Standard output type "syslog" is obsolete, causing a warning since systemd
-version 246 [1].
-
-Please consider using "journal" or "journal+console"
-
-[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
-
-Upstream-Status: Submitted [https://github.com/strongswan/strongswan/pull/181]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- init/systemd-starter/strongswan-starter.service.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/init/systemd-starter/strongswan-starter.service.in b/init/systemd-starter/strongswan-starter.service.in
-index 474284a19..6a0672352 100644
---- a/init/systemd-starter/strongswan-starter.service.in
-+++ b/init/systemd-starter/strongswan-starter.service.in
-@@ -4,7 +4,6 @@ After=syslog.target network-online.target
- 
- [Service]
- ExecStart=@SBINDIR@/@IPSEC_SCRIPT@ start --nofork
--StandardOutput=syslog
- Restart=on-abnormal
- 
- [Install]
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb
similarity index 96%
rename from meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb
index bd3e87a3f..095a93df3 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.1.bb
@@ -10,11 +10,10 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
-           file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
            "
 
-SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-SRC_URI[sha256sum] = "2d9a57e33813b62d58cba07531c4d5a35c6b823dfe9b8ff7c623b6571f02553c"
+SRC_URI[md5sum] = "1f4db969d072e120dc12d1c116a0f658"
+SRC_URI[sha256sum] = "a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1



