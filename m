Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 933CC6C736
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 02:27:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB22RZs3013307
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Dec 2013 18:27:35 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 1 Dec 2013 18:27:34 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Dec 2013 10:27:36 +0800
Message-ID: <1385951256-5645-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] proftpd: use /bin/false as the login shell
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
X-List-Received-Date: Mon, 02 Dec 2013 02:27:36 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Use /bin/false as the login shell, just like what Ubuntu does,
otherwise there might be secure issue.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 6537b77..0006a2a 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -62,6 +62,7 @@ INITSCRIPT_PARAM = "defaults 85 15"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
-USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
+USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/ftp --no-create-home \
+                       --shell /bin/false ${FTPUSER}"
 
 FILES_${PN} += "/home/${FTPUSER}"
-- 
1.7.10.4


