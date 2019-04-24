Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 72BDC7D48D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:40:14 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3OAeFku017762
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:40:15 +0200
Received: from dev.vm6.ccp.siemens.com (md1wg6qc.ad001.siemens.net
	[163.242.44.88])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x3OAeEuM025564;
	Wed, 24 Apr 2019 12:40:14 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 52D0723B85;
	Wed, 24 Apr 2019 12:40:14 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Apr 2019 12:40:00 +0200
Message-Id: <20190424104000.23269-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-networking][PATCH] ntp: upgrade 4.2.8p12 -> 4.2.8p13
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
X-List-Received-Date: Wed, 24 Apr 2019 10:40:15 -0000

License has been changed due to reformatting, no new stuff added.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p12.bb => ntp_4.2.8p13.bb} (96%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
similarity index 96%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
index 289d2645b..dc18a602a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "net"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=e877a1d567a6a58996d2b66e3e387003"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4cee33257467509e498f4cd9a6a4bd53"
 
 DEPENDS = "libevent"
 
@@ -25,8 +25,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "1522d66574bae14abb2622746dad2bdc"
-SRC_URI[sha256sum] = "709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454"
+SRC_URI[md5sum] = "ea040ab9b4ca656b5229b89d6b822f13"
+SRC_URI[sha256sum] = "288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.11.0


