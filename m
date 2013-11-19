Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6F9A6D840
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 21:50:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAJLolj6003203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Nov 2013 13:50:47 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 13:50:47 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Nov 2013 15:50:37 -0600
Message-ID: <1384897838-11066-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [meta-networking][PATCH 2/3] proftpd: Convert proftpd group to system scope
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 21:50:46 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

Proftpd is meant to be a system user, not a normal user of the
system so lets pass the correct parameters to the system.
Just add --system param when creating ftp group.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 6571b9c..29c3097 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -60,7 +60,7 @@ INITSCRIPT_NAME = "proftpd"
 INITSCRIPT_PARAM = "defaults 85 15"
 
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "${FTPGROUP}"
+GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
 USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
 
 FILES_${PN} += "/home/${FTPUSER}"
-- 
1.8.1.2.545.g2f19ada


