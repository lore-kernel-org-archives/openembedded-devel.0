Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6512B71D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAD85xXE011883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 00:05:59 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 00:05:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Nov 2017 16:04:18 +0800
Message-ID: <298cef284e6bd4767b6253c5a40e11111efb19fa.1510560146.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1510560146.git.jackie.huang@windriver.com>
References: <cover.1510560146.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] networkmanager: add consolekit only when x11 is enabled
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
X-List-Received-Date: Mon, 13 Nov 2017 08:05:58 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

consolekit depends on virtual/libx11 then it requires x11
distro feature, so add consolekit option only when x11
is in DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.4.4.bb        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index bfd2aada7..d5f456f37 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -60,7 +60,8 @@ do_compile_prepend() {
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
+       bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
 "
-- 
2.11.0


