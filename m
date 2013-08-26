Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 09BC660990
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 09:28:13 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 26 Aug 2013 11:28:12 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 3C5F428B66D;
	Mon, 26 Aug 2013 11:28:12 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Aug 2013 11:28:10 +0200
Message-ID: <1377509290-44995-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe] [PATCH] ser2net: new package, Serial to network proxy
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
X-List-Received-Date: Mon, 26 Aug 2013 09:28:15 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

The ser2net daemon allows telnet and tcp sessions to be established
with a unit's serial ports.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
new file mode 100644
index 0000000..e83b530
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_2.9.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A serial to network proxy"
+SECTION = "console/network"
+HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://INSTALL;md5=0659eb117294c490ae3853facd7a6ddd"
+
+PR = "r0"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "80011ac0e60bbdcb65f1d7a86251e3f3"
+SRC_URI[sha256sum] = "fdee1e69903cf409bdc6f32403a566cbc6006aa9e2a4d6f8f12b90dfd5ca0d0e"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native"
-- 
1.7.10.4


