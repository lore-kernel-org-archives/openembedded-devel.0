Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39C3560589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 23:41:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6JNf5Xs012558
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 16:41:06 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 16:41:04 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 16:41:04 -0700
Message-ID: <1468971664-18146-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] proftpd: start at boot time
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
X-List-Received-Date: Tue, 19 Jul 2016 23:41:07 -0000
Content-Type: text/plain

Add information to proftpd.service so that it will
be started at boot time.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-daemons/proftpd/files/proftpd.service  |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd.service b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
index ba97f8e..3e26d7f 100644
--- a/meta-networking/recipes-daemons/proftpd/files/proftpd.service
+++ b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
@@ -1,7 +1,11 @@
 [Unit]
 Description=proftpd Daemon
+After=network.target
 
 [Service]
 Type=forking
-ExecStart=-@SBINDIR@/proftpd -c @SYSCONFDIR@/proftpd.conf
-StandardError=syslog
+ExecStart=@SBINDIR@/proftpd -c @SYSCONFDIR@/proftpd.conf
+
+[Install]
+WantedBy=default.target
+
-- 
1.7.9.5


