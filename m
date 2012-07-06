Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Smz87-00041A-FH
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 05:22:51 +0200
Received: by ghbz2 with SMTP id z2so7673686ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9nw26SrtfVYCOSTRrX9eu9MeQUq3TqOrLdCeTVABqck=;
	b=GOHKkIJoR2YlVIOPyLdlZLRZ34bgnFBbxt6qcN7jAHwVDq29/vJREpqENSmvRs5+GZ
	+o+YWPb9iJEIGqbnvIIiRZYnDJXcEhz0/QSa2yZo9MPHIDYEPnamZUrYQ8CeDtgm7RWe
	PNoZHcMG8rSmr7h76Wc3Xz9W63Hq4+iCPD13ve9zXMape/qj50COZ3kn92tkd95YQupK
	CBaYMPnb2GEqHRbyUymo9N1rZui5T5G7bDyTNz3YHcpmr/m/YYAiXoOSk8JPo6mB79in
	TDrYpoC20sVQO2HuSxYFXycIoHWpvfab24seV6sJS6fYbpwOumWhWUWJiyt5CrBxmyBG
	DwwA==
Received: by 10.66.83.226 with SMTP id t2mr41846170pay.38.1341544300622;
	Thu, 05 Jul 2012 20:11:40 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id rs4sm20952836pbc.0.2012.07.05.20.11.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 20:11:40 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 06:52:28 +0400
Message-Id: <1341543150-25096-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
References: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded 2/4] networkmanager: Set SYSTEMD_PACKAGES as networkmanager-systemd.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 03:22:51 -0000

This commit fixes WARNING:
/tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 221dc2c..d681e0c 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -54,7 +54,7 @@ do_install_append () {
 	install -d ${D}/etc/NetworkManager/VPN
 }
 
-SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "NetworkManager.service"
 
 PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" 
-- 
1.7.9.5



