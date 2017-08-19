Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C311178531
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 06:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7J6dSPs010140
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 23:39:28 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 18 Aug 2017 23:39:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 19 Aug 2017 14:28:34 +0800
Message-ID: <20170819062834.4404-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] openvpn: 2.4.2 -> 2.4.3
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
X-List-Received-Date: Sat, 19 Aug 2017 06:39:27 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade openvpn from 2.4.2 to 2.4.3.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-support/openvpn/{openvpn_2.4.2.bb => openvpn_2.4.3.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.2.bb => openvpn_2.4.3.bb} (92%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb
similarity index 92%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb
index ae72671..90097f3 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb
@@ -7,13 +7,13 @@ DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '
 
 inherit autotools systemd
 
-SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
+SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "0714019e109a043e858278c9e2ca18e0"
-SRC_URI[sha256sum] = "b24740c9d44a81eaf2befc4846d51445a520104321e32aaf0c135ed2e098a624"
+SRC_URI[md5sum] = "e1929f82aff40f3d105e5f72aacff9c1"
+SRC_URI[sha256sum] = "cee3d3ca462960a50a67c0ebd186e01b6d13db70275205663695152c9aca8579"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.10.1


