Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7E55C7EB0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 12:33:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45dNtm5PR5z3t
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 14:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562070784;
	bh=Xyghpm2h1tuwyTTYR8BioD4nmwFv4hkSLKFp/ugGy3U=;
	h=From:To:Subject:Date:From;
	b=FdsVHRXM/dOxwQiTKYgA2frAHHUuDse8no1MgG+dNQrgP3l/d16ofCdWGzy5dTq2J
	Ewm81jaAaoq3P5swJrZ/za1meo6LiNVbbZfuJ52nOuszp6XeYL3UF3t2fC80skGM1k
	iiORJPzzU+pK6CFkh5O7V/Vkn1TGJdp0QocTzNTxvF7GeG3yAW3jQzI8N5q4hfIJyf
	nm2C1jwF4KMlTo1n5DT7OInXZ4sUe4v7rYUT3r9PIJdKOnj+7h1hO08P5rhy1bjxum
	j7RsEiRYmQplKBe8mAo9vi1vqO/k/FHd9ChorIvQtIZyyROqu/jWUdC0ig4LH/bQN+
	lpZjcfK5V1ctAzyA2cNXdbn9IzyAI609dxEur6Xvy+CZm3xfw7GlVCs56GK0YK31RW
	CyFRKcqghpOTjHX8KFABl8fbscy0XgCjTub9UR0va77DOhp+kmX5d8YcTaUg9QfEbh
	RBM7AvxbCuoJnlmG8XbnA4RwAzCpx18/cx5mX6Udabvs+S1WDfbBncbkMKkOo0A5to
	I/FUohwYilbQnAawRlZyVJ1Zv4dMlysnda0O0t9wTsKcTbmJV0GgxVfj2zFJI9l1HO
	t/ijhGAVuEVk04W1jhTaLyOkRHCsKaiCnTyNP5X8tOuM+rD5T5UFyL2qGEaRYj8y1P
	qzM8WG1HY4lIp6UZRTqYDzh0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 15:33:04 +0300
Message-Id: <20190702123304.7357-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] packagegroup-meta-networking-connectivity: Correct a DISTRO_FEATURES check
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
X-List-Received-Date: Tue, 02 Jul 2019 12:33:05 -0000

bluez5 is backfilled since it means "not bluez4".
bluetooth is what actually indicates bluetooth support.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index bbc5e1299..29ce51b23 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -37,7 +37,7 @@ RDEPENDS_packagegroup-meta-networking-connectivity = "\
     mbedtls relayd snort dhcpcd rdate vlan vpnc \
     inetutils wolfssl lftp miniupnpd networkmanager \
     networkmanager-openvpn rdist nanomsg python-networkmanager \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluez5 x11", "blueman", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "samba", "", d)} \
     "
-- 
2.17.1


