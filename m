Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NAhwY-0006mG-2X for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 11:39:25 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 3395B140B0;
	Wed, 18 Nov 2009 11:37:58 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 11:37:49 +0100
Message-Id: <1258540671-652-2-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1258540671-652-1-git-send-email-zlo@zlo.nu>
References: <1258540671-652-1-git-send-email-zlo@zlo.nu>
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marc Olzheim <marc@iphion.nl>
Subject: [PATCH 1/3] Move to INC_PR.
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
X-List-Received-Date: Wed, 18 Nov 2009 10:39:25 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 recipes/iproute2/iproute2.inc       |    2 ++
 recipes/iproute2/iproute2_2.6.18.bb |    4 ++--
 recipes/iproute2/iproute2_2.6.20.bb |    3 ++-
 recipes/iproute2/iproute2_2.6.22.bb |    3 ++-
 recipes/iproute2/iproute2_2.6.29.bb |    2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/recipes/iproute2/iproute2.inc b/recipes/iproute2/iproute2.inc
index 8c8519f..2a887a2 100644
--- a/recipes/iproute2/iproute2.inc
+++ b/recipes/iproute2/iproute2.inc
@@ -9,6 +9,8 @@ SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}-${DATE}.tar.gz"
 
 S = "${WORKDIR}/iproute2-${PV}-${DATE}"
 
+INC_PR = "r3"
+
 inherit update-alternatives
 
 EXTRA_OEMAKE = "CC='${CC}' \
diff --git a/recipes/iproute2/iproute2_2.6.18.bb b/recipes/iproute2/iproute2_2.6.18.bb
index d442a09..cbe8f6e 100644
--- a/recipes/iproute2/iproute2_2.6.18.bb
+++ b/recipes/iproute2/iproute2_2.6.18.bb
@@ -1,7 +1,7 @@
-PR = "r3"
-
 require iproute2.inc
 
+PR = "${INC_PR}"
+
 SRC_URI += "file://iproute2-2.6.15_no_strip.diff;patch=1;pnum=0 \
             file://new-flex-fix.patch;patch=1"
 
diff --git a/recipes/iproute2/iproute2_2.6.20.bb b/recipes/iproute2/iproute2_2.6.20.bb
index e72dfcc..2dea62e 100644
--- a/recipes/iproute2/iproute2_2.6.20.bb
+++ b/recipes/iproute2/iproute2_2.6.20.bb
@@ -1,6 +1,7 @@
 require iproute2.inc
 
-PR = "r2"
+PR = "${INC_PR}"
+
 DATE = "070313"
 
 SRC_URI_append = " file://new-flex-fix.patch;patch=1 \
diff --git a/recipes/iproute2/iproute2_2.6.22.bb b/recipes/iproute2/iproute2_2.6.22.bb
index 1ee0ce7..6d06f64 100644
--- a/recipes/iproute2/iproute2_2.6.22.bb
+++ b/recipes/iproute2/iproute2_2.6.22.bb
@@ -1,6 +1,7 @@
 require iproute2.inc
 
-PR = "r1"
+PR = "${INC_PR}"
+
 DATE = "070710"
 
 SRC_URI_append = " file://new-flex-fix.patch;patch=1 \
diff --git a/recipes/iproute2/iproute2_2.6.29.bb b/recipes/iproute2/iproute2_2.6.29.bb
index d02573a..47ea720 100644
--- a/recipes/iproute2/iproute2_2.6.29.bb
+++ b/recipes/iproute2/iproute2_2.6.29.bb
@@ -1,6 +1,6 @@
 require iproute2.inc
 
-PR = "r1"
+PR = "${INC_PR}"
 
 SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
 	   file://new-flex-fix.patch;patch=1 \
-- 
1.6.3.3



