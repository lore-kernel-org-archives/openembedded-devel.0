Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 9D49071ADA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 01:20:17 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym01.jp.fujitsu.com with smtp
	id 27d3_e291_62724181_98d6_40ab_96e3_ba571e2c382e;
	Fri, 02 Jun 2017 10:20:15 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BD8BAC0145
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:20:14 +0900 (JST)
Received: from G01JPEXCHKW16.g01.fujitsu.local
	(G01JPEXCHKW16.g01.fujitsu.local [10.0.194.55])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	6AFBDBD67A3 for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:20:13 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW16.g01.fujitsu.local (10.0.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 10:20:12 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Jun 2017 10:21:30 +0900
Message-ID: <1496366490-28223-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] openvpn: Upgrade 2.3.9 -> 2.4.2
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
X-List-Received-Date: Fri, 02 Jun 2017 01:20:18 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-support/openvpn/{openvpn_2.3.9.bb => openvpn_2.4.2.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.3.9.bb => openvpn_2.4.2.bb} (93%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
similarity index 93%
rename from meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
index db510de..ae72671 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.3.9.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "http://openvpn.sourceforge.net"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5aac200199fde47501876cba7263cb0c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9b64491ec98eb6c6493ac5e4118f107"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/openvpn-${PV}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "265755044ae88f9249d509f6d061f7e5"
-SRC_URI[sha256sum] = "2c12fe9ea641ac1291e70322cc500641c84e5903dd4f40bf2eda7e9f209b2f9c"
+SRC_URI[md5sum] = "0714019e109a043e858278c9e2ca18e0"
+SRC_URI[sha256sum] = "b24740c9d44a81eaf2befc4846d51445a520104321e32aaf0c135ed2e098a624"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.9.1


