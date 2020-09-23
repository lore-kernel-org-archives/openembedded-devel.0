Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.8732.1600850765817057637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 01:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08N8k3M4003854
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 01:46:04 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 23 Sep 2020 01:45:50 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] ippool: Remove obsolete setting in service file
Date: Wed, 23 Sep 2020 16:45:04 +0800
Message-ID: <20200923084505.29027-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

The Standard error type "syslog" is obsolete, causing a warning since systemd
version 246 [1].

Please consider using "journal" or "journal+console"

[1] https://github.com/systemd/systemd/blob/master/NEWS#L202

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-daemons/ippool/ippool/ippool.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/ippool/ippool/ippool.service b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
index e5917fc14..281ae5fd1 100644
--- a/meta-networking/recipes-daemons/ippool/ippool/ippool.service
+++ b/meta-networking/recipes-daemons/ippool/ippool/ippool.service
@@ -9,7 +9,6 @@ Type=simple
 ExecStart=@SBINDIR@/ippoold -f
 # Normal output will go to syslog, so suppress stdout.
 StandardOutput=null
-StandardError=syslog
 # ExecStop is not needed. systemd will send SIGTERM
 # and ippoold will exit status 1.
 SuccessExitStatus=1
-- 
2.26.2

