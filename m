Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA406077F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 11:28:42 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so2680249pdi.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VPZ1p+QvSWa6YdvF4KwnWVYjcdLeLHWpcSpbBwItKdg=;
	b=k49yUGNzuWWsUCG5w5SbK34VFEuU1ZvkFLwVyx70oxEP5+C4zaDwuYrx7Ao5cWtSK9
	m1+36AlQtyZDAwtXI//sgZBg+T4ohSJwyitVHL+SxVaJumQ/mj9m0YKmzo4DOhk9kZU1
	QHWvbkaUFoGPFxYmJtQTp5EJXD3h5+AWbBy1hEF42X/jIohnGL9tuMSH0gp1aowGQYtg
	hwZ09GJPgLFw7Y2eqamLZ/j0NrZULhSR3IvO9W9kL1l4casGT48zTYA5GD9fk2ut8SS+
	Kq4ZdBd12Zk9PMX5Um13mEZZzDogj11Ui7PWp8Npo8385NvmzKXLxfncKUfyQSvuoAr9
	onMg==
X-Received: by 10.69.8.65 with SMTP id di1mr5112254pbd.32.1373110123093;
	Sat, 06 Jul 2013 04:28:43 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	jf4sm11876757pbb.19.2013.07.06.04.28.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 04:28:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:44:17 +1000
Message-Id: <1373111057-1183-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] networkmanager: remove /var/run from package
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
X-List-Received-Date: Sat, 06 Jul 2013 11:28:42 -0000

The /var/run/NetworkManager directory is created by the daemon on
startup if it doesn't exist. The /var/run directory is already
created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 07f0c28..70bda27 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -58,6 +58,9 @@ do_install_append () {
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
     install -d ${D}${sysconfdir}/NetworkManager/VPN
+
+    rm -rf "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
-- 
1.8.3.2


