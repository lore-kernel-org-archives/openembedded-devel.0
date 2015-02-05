Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1A95A60169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 01:22:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57140511"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Feb 2015 09:19:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t151LqUt027329
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Feb 2015 09:21:52 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 5 Feb 2015 09:22:38 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Feb 2015 09:17:49 +0800
Message-ID: <1423099069-12700-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2] php: update to 5.5.21 to fix some bugs
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
X-List-Received-Date: Thu, 05 Feb 2015 01:22:39 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_5.5.20.bb => php_5.5.21.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_5.5.20.bb => php_5.5.21.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.21.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_5.5.20.bb
rename to meta-oe/recipes-devtools/php/php_5.5.21.bb
index 1c0557f..31ef1f2 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.21.bb
@@ -29,8 +29,8 @@ SRC_URI_append_class-target += " \
             file://70_mod_php5.conf \
           "
 
-SRC_URI[md5sum] = "9dfc1d4d2b44fb7e2b4ee9651d032203"
-SRC_URI[sha256sum] = "f28a150d1cd8991bd1a41dce4fdff4e343d1dbe01a48b9b44bea74532ce0391a"
+SRC_URI[md5sum] = "8fe631ac52a3df9d6429faad81cf2562"
+SRC_URI[sha256sum] = "62e9429975c4ca5d7067a5052d5388fbf2ac8c51eeee581d59b04cc5a8da83fe"
 
 S = "${WORKDIR}/php-${PV}"
 
@@ -233,4 +233,3 @@ MODPHP_OLDPACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'modphp',
 RPROVIDES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RREPLACES_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
 RCONFLICTS_${PN}-modphp = "${MODPHP_OLDPACKAGE}"
-
-- 
1.9.1


