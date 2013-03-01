Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UBMOB-0000VA-0M
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Mar 2013 10:36:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r219K4pe024778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Mar 2013 01:20:04 -0800 (PST)
Received: from pek-usp-11.wrs.com (128.224.163.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Fri, 1 Mar 2013 01:20:03 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Mar 2013 17:19:59 +0800
Message-ID: <1362129599-19779-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: [meta-webserver][PATCH] modphp5: use ${baselib} instead of hardcoded "lib"
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
X-List-Received-Date: Fri, 01 Mar 2013 09:36:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

[ CQID: WIND00405358 ]

The hardcoded lib path will cause apache2 fail to start on
the target with other baselib like lib64.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 3302936..c359ff9 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -67,6 +67,7 @@ do_install  () {
 	install -d ${D}${sysconfdir}/apache2/modules.d
 	install -d ${D}${sysconfdir}/php/apache2-php5
 	install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
+	sed -i s,lib/,${baselib}/, ${WORKDIR}/70_mod_php5.conf
 	install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
 	cat ${S}/php.ini-production | \
 		sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-- 
1.7.4.1



