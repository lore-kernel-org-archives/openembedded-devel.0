Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFBD2785E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Mar 2018 02:15:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2E2FBDg002038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 19:15:11 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 13 Mar 2018 19:14:31 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Mar 2018 19:15:10 -0700
Message-ID: <20180314021510.175365-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] hostapd: not compatible with openssl-no-weak-ciphers
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
X-List-Received-Date: Wed, 14 Mar 2018 02:15:11 -0000
Content-Type: text/plain

Use CONFLICT_DISTRO_FEATURES to not build if des is not supported.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
index c3a1ead..54c9e79 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://${B}/README;md5=8aa4e8c78b59b12016c4cb2d0a8db350"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
-inherit update-rc.d systemd
+inherit update-rc.d systemd distro_features_check
+
+CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
+
 INITSCRIPT_NAME = "hostapd"
 
 SYSTEMD_SERVICE_${PN} = "hostapd.service"
-- 
2.7.4


