Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.8939.1600850797402848614
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N8kGF7007132
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 01:46:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 01:46:05 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] strongswan: Remove obsolete setting regarding the Standard Output
Date: Wed, 23 Sep 2020 16:45:05 +0800
Message-ID: <20200923084505.29027-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200923084505.29027-1-mingli.yu@windriver.com>
References: <20200923084505.29027-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The Standard output type "syslog" is obsolete, causing a warning since systemd
version 246 [1].

Please consider using "journal" or "journal+console"

[1] https://github.com/systemd/systemd/blob/master/NEWS#L202

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...setting-regarding-the-Standard-Outpu.patch | 34 +++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch

diff --git a/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
new file mode 100644
index 000000000..78adcf813
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
@@ -0,0 +1,34 @@
+From 7b1e376d7d22244feab466e9889ba77561117357 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 23 Sep 2020 16:20:22 +0800
+Subject: [PATCH] Remove obsolete setting regarding the Standard Output
+
+The Standard output type "syslog" is obsolete, causing a warning since systemd
+version 246 [1].
+
+Please consider using "journal" or "journal+console"
+
+[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
+
+Upstream-Status: Submitted [https://github.com/strongswan/strongswan/pull/181]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ init/systemd-starter/strongswan-starter.service.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/init/systemd-starter/strongswan-starter.service.in b/init/systemd-starter/strongswan-starter.service.in
+index 474284a19..6a0672352 100644
+--- a/init/systemd-starter/strongswan-starter.service.in
++++ b/init/systemd-starter/strongswan-starter.service.in
+@@ -4,7 +4,6 @@ After=syslog.target network-online.target
+ 
+ [Service]
+ ExecStart=@SBINDIR@/@IPSEC_SCRIPT@ start --nofork
+-StandardOutput=syslog
+ Restart=on-abnormal
+ 
+ [Install]
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 0a2733195..8a8809243 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -10,6 +10,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
+           file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.26.2

