Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E797B7CC10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 03:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1R343YL024231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 19:04:03 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Tue, 26 Feb 2019 19:04:02 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 11:04:01 +0800
Message-ID: <1551236641-140000-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] freeradius: update radiusd.service
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
X-List-Received-Date: Wed, 27 Feb 2019 03:04:03 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Update radiusd.service that not run script /etc/raddb/certs/bootstrap
before start radiusd. The script makes a set of default certificates. It
should be only used for test purpose.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/freeradius/files/radiusd.service | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
index 899c4e4..8dae0df 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
+++ b/meta-networking/recipes-connectivity/freeradius/files/radiusd.service
@@ -6,7 +6,6 @@ After=syslog.target network.target
 Type=forking
 PIDFile=@STATEDIR@/run/radiusd/radiusd.pid
 ExecStartPre=-@BASE_BINDIR@/chown -R radiusd.radiusd @STATEDIR@/run/radiusd
-ExecStartPre=-@BASE_BINDIR@/sh -c "if [ ! -f @SYSCONFDIR@/raddb/certs/server.pem ]; then sudo -u radiusd @SYSCONFDIR@/raddb/certs/bootstrap; fi"
 ExecStartPre=@SBINDIR@/radiusd -C
 ExecStart=@SBINDIR@/radiusd -d @SYSCONFDIR@/raddb
 ExecReload=@SBINDIR@/radiusd -C
-- 
2.7.4


