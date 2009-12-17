Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NLDq3-0003j8-3m
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 11:44:10 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 27EC0B94006;
	Thu, 17 Dec 2009 11:42:19 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NLDoJ-0005Xv-0h; Thu, 17 Dec 2009 11:42:19 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2009 11:42:10 +0100
Message-Id: <1261046530-21258-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.6.5.6
In-Reply-To: <200912161526.36033.holger+oe@freyther.de>
References: <200912161526.36033.holger+oe@freyther.de>
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] openvpn: remove dependency on kernel module
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
X-List-Received-Date: Thu, 17 Dec 2009 10:44:10 -0000

Fix image creation when tun module is compiled into kernel by using
RRECOMMENDS instead of RDEPENDS for kernel-module-tun.

Use INC_PR.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---

This version also uses INC_PR and RRECOMMENDS_${PN} as suggested by Otavio
Salvador and Phil Blundell, respectively.

Thanks,
Johan


 recipes/openvpn/openvpn.inc              |    4 +++-
 recipes/openvpn/openvpn_1.5.0.bb         |    2 +-
 recipes/openvpn/openvpn_1.6.0.bb         |    2 +-
 recipes/openvpn/openvpn_2.0.2.bb         |    2 +-
 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb |    2 ++
 recipes/openvpn/openvpn_2.0.9+2.1rc20.bb |    2 ++
 recipes/openvpn/openvpn_2.0.9.bb         |    2 +-
 recipes/openvpn/openvpn_2.0.bb           |    2 +-
 8 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/recipes/openvpn/openvpn.inc b/recipes/openvpn/openvpn.inc
index 70cdf4c..97f3de7 100644
--- a/recipes/openvpn/openvpn.inc
+++ b/recipes/openvpn/openvpn.inc
@@ -4,7 +4,9 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
 DEPENDS = "lzo openssl"
-RDEPENDS = "kernel-module-tun"
+RRECOMMENDS_${PN} = "kernel-module-tun"
+
+INC_PR = "r3"
 
 SRC_URI = "http://openvpn.net/release/openvpn-${PV}.tar.gz \
 	file://openvpn"
diff --git a/recipes/openvpn/openvpn_1.5.0.bb b/recipes/openvpn/openvpn_1.5.0.bb
index 12cebf5..beaa92c 100644
--- a/recipes/openvpn/openvpn_1.5.0.bb
+++ b/recipes/openvpn/openvpn_1.5.0.bb
@@ -1,3 +1,3 @@
 require openvpn.inc
 
-PR = "r3"
+PR = "${INC_PR}.1"
diff --git a/recipes/openvpn/openvpn_1.6.0.bb b/recipes/openvpn/openvpn_1.6.0.bb
index 5bb4a28..878a722 100644
--- a/recipes/openvpn/openvpn_1.6.0.bb
+++ b/recipes/openvpn/openvpn_1.6.0.bb
@@ -1,3 +1,3 @@
 require openvpn.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
diff --git a/recipes/openvpn/openvpn_2.0.2.bb b/recipes/openvpn/openvpn_2.0.2.bb
index bb22dc9..878a722 100644
--- a/recipes/openvpn/openvpn_2.0.2.bb
+++ b/recipes/openvpn/openvpn_2.0.2.bb
@@ -1,3 +1,3 @@
 require openvpn.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
diff --git a/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
index 9375cd6..01ce08b 100644
--- a/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
+++ b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
@@ -1,5 +1,7 @@
 require openvpn.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://openvpn.net/release/openvpn-2.1_rc19.tar.gz \
 	   file://openvpn"
 
diff --git a/recipes/openvpn/openvpn_2.0.9+2.1rc20.bb b/recipes/openvpn/openvpn_2.0.9+2.1rc20.bb
index f671e15..d2bb3c0 100644
--- a/recipes/openvpn/openvpn_2.0.9+2.1rc20.bb
+++ b/recipes/openvpn/openvpn_2.0.9+2.1rc20.bb
@@ -1,5 +1,7 @@
 require openvpn.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://openvpn.net/release/openvpn-2.1_rc20.tar.gz \
 	   file://openvpn"
 
diff --git a/recipes/openvpn/openvpn_2.0.9.bb b/recipes/openvpn/openvpn_2.0.9.bb
index 5bb4a28..878a722 100644
--- a/recipes/openvpn/openvpn_2.0.9.bb
+++ b/recipes/openvpn/openvpn_2.0.9.bb
@@ -1,3 +1,3 @@
 require openvpn.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
diff --git a/recipes/openvpn/openvpn_2.0.bb b/recipes/openvpn/openvpn_2.0.bb
index bb22dc9..878a722 100644
--- a/recipes/openvpn/openvpn_2.0.bb
+++ b/recipes/openvpn/openvpn_2.0.bb
@@ -1,3 +1,3 @@
 require openvpn.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
-- 
1.6.5.6



