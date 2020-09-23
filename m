Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4999.1600831572736587424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2020 20:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N3PnwA029027
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2020 20:25:59 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 20:25:38 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] smartmontools: Remove obsolete setting regarding the Standard Output
Date: Wed, 23 Sep 2020 11:24:54 +0800
Message-ID: <20200923032454.30728-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The Standard output type "syslog" is obsolete, causing a warning since systemd
version 246 [1].

Please consider using "journal" or "journal+console"

[1] https://github.com/systemd/systemd/blob/master/NEWS#L202

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-extended/smartmontools/files/smartd.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/smartmontools/files/smartd.service b/meta-oe/recipes-extended/smartmontools/files/smartd.service
index f3db946c8..e90a7c4de 100644
--- a/meta-oe/recipes-extended/smartmontools/files/smartd.service
+++ b/meta-oe/recipes-extended/smartmontools/files/smartd.service
@@ -6,7 +6,6 @@ After=syslog.target
 EnvironmentFile=-@SYSCONFDIR@/smartmontools
 ExecStart=@SBINDIR@/smartd -n $smart_opts
 ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
-StandardOutput=syslog
 
 [Install]
 WantedBy=multi-user.target
-- 
2.17.1

