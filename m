Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UMUpg-0004cV-N0
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 04:50:59 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r312XhLo016740
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2013 19:33:44 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 31 Mar 2013 19:33:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Apr 2013 10:33:37 +0800
Message-ID: <1364783617-29850-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-webserver][PATCH] modphp: use libdir instead of baselib to load module
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 02:51:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

When we change the apache2 files layout to debian style,
the ServerRoot in httpd.conf was changed to "/" from "/usr",
then the relative path to libphp5 module in 70_mod_php5.conf
will be invalid so it fails to load the module, use libdir
(absolute path) instead so it will always find the module.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index c359ff9..33dbe89 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -67,7 +67,7 @@ do_install  () {
 	install -d ${D}${sysconfdir}/apache2/modules.d
 	install -d ${D}${sysconfdir}/php/apache2-php5
 	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
-	sed -i s,lib/,${baselib}/, ${WORKDIR}/70_mod_php5.conf
+	sed -i s,lib/,${libdir}/, ${WORKDIR}/70_mod_php5.conf
 	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
 	cat ${S}/php.ini-production | \
 		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-- 
1.7.4.1



