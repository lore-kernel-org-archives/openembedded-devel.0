Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2156AD01
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 05:49:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0L5npab005069
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:49:51 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 20 Jan 2015 21:49:50 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 13:49:49 +0800
Message-ID: <1421819389-8134-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] apache2: fix a typos
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
X-List-Received-Date: Wed, 21 Jan 2015 05:49:58 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

fix a typos to remove a warning:
    systemd[1]: [/lib/systemd/system/apache2.service:2] Unknown lvalue
    'Decription' in section 'Unit'

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/files/apache2.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
index f4bcf9e..9b5548c 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2.service
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -1,5 +1,5 @@
 [Unit]
-Decription=The Apache HTTP Server
+Description=The Apache HTTP Server
 After=network.target remote-fs.target nss-lookup.target
 
 [Service]
-- 
2.1.0


