Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.51607.1629278547381296435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17I9MP14011913
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 02:22:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17I9MPNa025083
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Aug 2021 02:22:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 18 Aug 2021 02:22:24 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 18 Aug 2021 02:22:24 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] polkit: fix CVE-2021-3560
Date: Wed, 18 Aug 2021 17:19:16 +0800
Message-ID: <20210818091916.2615-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2021-3560.

[1] https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../polkit/polkit/CVE-2021-3560.patch         | 31 +++++++++++++++++++
 .../recipes-extended/polkit/polkit_0.116.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
new file mode 100644
index 000000000..daf0b1edb
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/CVE-2021-3560.patch
@@ -0,0 +1,31 @@
+From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
+From: Jan Rybar <jrybar@redhat.com>
+Date: Wed, 2 Jun 2021 15:43:38 +0200
+Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in polkit
+
+initial values returned if error caught
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/polkit/polkitsystembusname.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembusname.c
+index 8daa12c..8ed1363 100644
+--- a/src/polkit/polkitsystembusname.c
++++ b/src/polkit/polkitsystembusname.c
+@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBusName           *system_bus
+   while (!((data.retrieved_uid && data.retrieved_pid) || data.caught_error))
+     g_main_context_iteration (tmp_context, TRUE);
+ 
++  if (data.caught_error)
++    goto out;
++
+   if (out_uid)
+     *out_uid = data.uid;
+   if (out_pid)
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
index 55d11a651..6408933ea 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
@@ -25,6 +25,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0003-make-netgroup-support-optional.patch \
+           file://CVE-2021-3560.patch \
            "
 SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
 SRC_URI[sha256sum] = "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
-- 
2.17.1

