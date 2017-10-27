Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 679 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Oct 2017 03:36:56 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id AAED778226
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 03:36:56 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym02.jp.fujitsu.com with smtp
	id 51d7_3565_9fed500b_1d0c_4d9d_b082_27c02b1b71b1;
	Fri, 27 Oct 2017 12:25:33 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E578AC00A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 12:25:32 +0900 (JST)
Received: from G01JPEXCHYT15.g01.fujitsu.local
	(G01JPEXCHYT15.g01.fujitsu.local [10.128.194.54])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	78FBD46E889 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 12:25:31 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT15.g01.fujitsu.local (10.128.194.54) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 12:25:16 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Oct 2017 12:25:12 +0900
Message-ID: <1509074712-5704-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] openvpn: Upgrade 2.4.3 -> 2.4.4
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
X-List-Received-Date: Fri, 27 Oct 2017 03:36:57 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-support/openvpn/{openvpn_2.4.3.bb => openvpn_2.4.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.4.3.bb => openvpn_2.4.4.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
index 90097f3..4cad998 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.4.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.4.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn@.service \
            file://openvpn-volatile.conf"
 
-SRC_URI[md5sum] = "e1929f82aff40f3d105e5f72aacff9c1"
-SRC_URI[sha256sum] = "cee3d3ca462960a50a67c0ebd186e01b6d13db70275205663695152c9aca8579"
+SRC_URI[md5sum] = "705a79d005558d94fa1e2b74e4413e97"
+SRC_URI[sha256sum] = "1ae883d9522c9fa6d189e5e4aaa058a93edd3d0b897e3c2664107c4785099fc3"
 
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.7.4



