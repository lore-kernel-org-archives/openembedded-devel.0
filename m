Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFB66CA7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2013 02:34:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8P2YUjf012725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Sep 2013 19:34:31 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 24 Sep 2013 19:34:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2013 10:34:23 +0800
Message-ID: <78ece1916ca0e104d9416c26651fe02c47c11e28.1380076234.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380076234.git.hongxu.jia@windriver.com>
References: <cover.1380076234.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-webserver][PATCH 1/1] apache2: fix error messages when restart apache service
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
X-List-Received-Date: Wed, 25 Sep 2013 02:34:30 -0000
Content-Type: text/plain

There are error messages when restart apache service:

Observed Behavior
======================
root@qemu0:/etc/php# apachectl restart
AH00557: httpd: apr_sockaddr_info_get() failed for qemu0
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1. Set the 'ServerName' directive        globally to suppress this message
root@qemu0:/etc/php# /etc/init.d/apache2 restart
AH00557: httpd: apr_sockaddr_info_get() failed for qemu0
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1. Set the 'ServerName' directive        globally to suppress this message
root@qemu0:/etc/php# /etc/init.d/apache2 stop
AH00557: httpd: apr_sockaddr_info_get() failed for qemu0
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 127.0.0.1. Set the 'ServerName' directive        globally to suppress this message

Add 'ServerName localhost:80' to httpd.conf could fix this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
index 6f5dd23..c081751 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
@@ -73,6 +73,8 @@ do_install_append() {
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     # match with that is in init script
     printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+    # Set 'ServerName' to fix error messages when restart apache service
+    sed -i 's/^#ServerName www.example.com/ServerName localhost/' ${D}/${sysconfdir}/${BPN}/httpd.conf
 
     if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then 
         install -d ${D}${sysconfdir}/tmpfiles.d/
-- 
1.8.1.2


