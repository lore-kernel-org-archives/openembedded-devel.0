Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77A777F7B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 18:44:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xADIijmP023390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 10:44:45 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 13 Nov 2019 10:44:44 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Nov 2019 13:44:44 -0500
Message-ID: <20191113184444.3480765-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] zabbix: upgrade 4.2.8 -> 4.4.1
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
X-List-Received-Date: Wed, 13 Nov 2019 18:44:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Note that zabbix as of 4.4.0alpha3 no longer supports Jabber
(see https://support.zabbix.com/browse/ZBXNEXT-5416). That
config option has been removed from the recipe (builds output
a warning about unrecognized config options otherwise).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../zabbix/{zabbix_4.2.8.bb => zabbix_4.4.1.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_4.2.8.bb => zabbix_4.4.1.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb
index 489ab0b63..656ff0dd8 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_4.2.8.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_4.4.1.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "9a816afd4f7984a841bed64a25ba523c"
-SRC_URI[sha256sum] = "57dbc2a95a09581b5196d2abc86ee1aaf65f3c909d6b4bc53d260dc4dd69b9c6"
+SRC_URI[md5sum] = "e9df94149790f86732f18d042b70155d"
+SRC_URI[sha256sum] = "0bf74e597dd41a558305fe17a2b1ed6fe2d77044b87696a92e4227fbf315564a"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
@@ -51,7 +51,6 @@ EXTRA_OECONF = " \
     --enable-ipv6 \
     --with-net-snmp \
     --with-ldap=${STAGING_EXECPREFIXDIR} \
-    --with-jabber \
     --with-unixodbc \
     --with-ssh2 \
     --with-sqlite3 \
-- 
2.23.0


