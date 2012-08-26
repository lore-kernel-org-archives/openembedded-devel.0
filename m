Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T5XGk-0008Gl-Fq
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Aug 2012 09:28:26 +0200
Received: by wgbfa7 with SMTP id fa7so2134469wgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2012 00:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UcAh4rXzOXn7Y5USKLn1v1EzGljOudXi6AdXFfDsGtQ=;
	b=JEb+8Mly/shG1MwXXr1YzN/44SiTIW98B7pLiso4Q0euUF0TqEVzNhEkOQDexFL9Io
	ETzGKkzSl5nRtu16tds0upgMJawKttYushkuSYC+2GbUdyRGyzlQlbIIUmFXr7ao8aqS
	3Y3CrWy0KKKsPnBkCdh89NRR5wi/RjUw1TQ/Oaa1yiffdUyMGWLVVjxfZaoR+I4FZ/oy
	6Xhlo6HHM+lPJO2ViE6IZ1cNMHEowTTFV3aViKQ67YGohh1aO3J13NlQT85wRr/PrExX
	FA6dGHFKcgqjfjW/sc3dx/CVx8DYDP64MjEKqSAlEU0e8gbVB2P8SLR4HN9MY0Y4e4/e
	WBjQ==
Received: by 10.216.237.193 with SMTP id y43mr5451443weq.75.1345965376677;
	Sun, 26 Aug 2012 00:16:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm7614186wib.7.2012.08.26.00.16.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Aug 2012 00:16:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Aug 2012 09:16:22 +0200
Message-Id: <1345965382-13215-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-systemd][PATCH] dhcp: rename .bbappend to match oe-core version
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
X-List-Received-Date: Sun, 26 Aug 2012 07:28:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../dhcp/{dhcp_4.2.3-P2.bbappend => dhcp_4.2.4-P1.bbappend}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-systemd/meta-oe/recipes-connectivity/dhcp/{dhcp_4.2.3-P2.bbappend => dhcp_4.2.4-P1.bbappend} (92%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
similarity index 92%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
index 5fd7ccb..a18fda8 100644
--- a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-- 
1.7.12



