Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Shv64-0006Cp-2R
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 06:03:48 +0200
Received: by pbbrq2 with SMTP id rq2so2902407pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9nw26SrtfVYCOSTRrX9eu9MeQUq3TqOrLdCeTVABqck=;
	b=WKjNRrEbxwU85WagY2fKhWdBAk9Vjd7QhU7iL6am9P4qa5MQY3g+e75XcoFuTa4qf1
	zFwRHFY3a0P5e3Tm0KijlZlQEkTj+lBhKkXxLKIw98AhGmXUKMe1YfqBqdLTrMA8Gj5z
	MDM3MZmrzAR6Zxv4cNHHI2XoaYsKgzM/tkjP2q/b7W+sF1n+ru88gSjM/iEpksmVOxtz
	omjr7NG1tV54CTrX1AlKsTkgsAIkWODO8bBduLugHF5NFkkq46nIbDTfuThzqSpn4zZW
	WItpaUMnL/SQglRHyT+sJ7BGjbmKNb4EQ0en56zYumfbhYbz41xfWtq3PQY4UyW37VLC
	jRsQ==
Received: by 10.68.218.101 with SMTP id pf5mr4748508pbc.152.1340337180711;
	Thu, 21 Jun 2012 20:53:00 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id nv6sm37636709pbc.42.2012.06.21.20.52.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 20:52:59 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 05:52:51 +0200
Message-Id: <1340337171-10384-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] networkmanager: Set SYSTEMD_PACKAGES as networkmanager-systemd.
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
X-List-Received-Date: Fri, 22 Jun 2012 04:03:48 -0000

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



