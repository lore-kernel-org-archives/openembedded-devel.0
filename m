Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8337874E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w637LqLx017997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:52 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:51 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:26 +0800
Message-ID: <1530602486-4522-8-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 8/8] networkmanager-openvpn: upgrade 1.2.8 -> 1.2.10
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:51 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...workmanager-openvpn_1.2.8.bb => networkmanager-openvpn_1.2.10.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.2.8.bb => networkmanager-openvpn_1.2.10.bb} (87%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb
similarity index 87%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb
index 1b604ad..9159fcb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.10.bb
@@ -9,8 +9,9 @@ DEPENDS = "dbus dbus-glib networkmanager openvpn intltool-native glib-2.0-native
 inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
-SRC_URI[md5sum] = "9f325be386aa906ff9b0b7c0bdf2a59a"
-SRC_URI[sha256sum] = "3e0b4007f248d96df4b8eb5d0f937536044af7053debbbf525e67c9bc5d30654"
+
+SRC_URI[md5sum] = "f118226ed2bfbacfd64ac4d1e0bd0383"
+SRC_URI[sha256sum] = "ac86a7a539d78df90095676e9183f2d422fb93dbfe4b3afef22f81825d303d61"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.7.4


