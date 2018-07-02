Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2547600A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 08:50:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w628oi0K029711
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Jul 2018 01:50:45 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 2 Jul 2018 01:50:44 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Jul 2018 01:50:44 -0700
Message-ID: <20180702085044.99437-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: Upgrade to 1.16.1
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
X-List-Received-Date: Mon, 02 Jul 2018 08:50:44 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Update LIC_FILES_CHKSUM as license file NOTICE
update copyright years to 2018

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../krb5/{krb5_1.16.bb => krb5_1.16.1.bb}                   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.16.bb => krb5_1.16.1.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb
index 6eedd2a22..11748cbd0 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.1.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=59b8da652f07186b44782a8454574f30"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=7f95bc3d8d0351aa481d56d5e9de20c3"
 DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
@@ -31,8 +31,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "23c5e9f07642db4a67f7a5b6168b1319"
-SRC_URI[sha256sum] = "faeb125f83b0fb4cdb2f99f088140631bb47d975982de0956d18c85842969e08"
+SRC_URI[md5sum] = "848e9b80d6aaaa798e3f3df24b83c407"
+SRC_URI[sha256sum] = "214ffe394e3ad0c730564074ec44f1da119159d94281bbec541dc29168d21117"
 
 CVE_PRODUCT = "kerberos"
 
-- 
2.17.1


