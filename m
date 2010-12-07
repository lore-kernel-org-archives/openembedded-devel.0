Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jefflance01@gmail.com>) id 1PQ3OB-00016z-KG
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 20:39:53 +0100
Received: by gwj22 with SMTP id 22so260800gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 11:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SACEHzDNpdnwlOJ6SSfMJxCzhMlJhFd1h/6W4R8aXfQ=;
	b=QNiS/RR6BZkA47XPY3IFvu9nYDvNzsBXPEvzifFNPen9xhUQHR+rNGkjWV3hEJJjjk
	M8yNp2ZxT09wLTE3OWIqVzLfTPXlxdgLuIoNMandp8b5aKpGV1rc+yCycJRLTI6pd6jc
	cOfXNj7/JFJ7Y8zlZ8ZyC1LecveMAkvaCgBlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=liJWDKO8cOtqE1DlEyvY9k0WnSEU8ZUSqkPPT+8STW1C+/uR5+vTB4pJwgtoHfXDuZ
	wSymiQsq6lars6zYkxj/T7mB+ngSd9judxmpPJAKb0V6JB3dWXmb5vFvY4WVncHyHd7R
	YMUruYZPV4zeDcsKu4yBuM1tXCgXnhQeEjLOI=
Received: by 10.150.197.12 with SMTP id u12mr2512646ybf.182.1291750701294;
	Tue, 07 Dec 2010 11:38:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r41sm227713yba.16.2010.12.07.11.38.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 11:38:20 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 13:13:50 -0600
Message-Id: <1291749231-15483-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: jefflance01@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/2] matrix-gui: updating SRC rev to pick up new platforms and matrix code enhancements
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
X-List-Received-Date: Tue, 07 Dec 2010 19:39:53 -0000

* Added Matrix Enhancements:
  * Added new platforms am180x, am181x and am3517
  * add control menubar at the top of matrix-gui (HTML change not code change)
  * add descriptions to matrix applications (source code change)
  * make matrix scalable with respect to number of applications.
    * allow addtional main menu pages and allow additional sub-menu pages (source code change)

NOTE: code changes are backwards compatible with existing platform support files.

Signed-off-by: Jeff Lance <j-lance1@ti.com>
Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc    |    2 +-
 recipes/ti/matrix-gui-common_1.4.bb |    8 ++++++++
 recipes/ti/matrix-gui-e.inc         |    2 +-
 recipes/ti/matrix-gui-e_1.3.bb      |    5 +++++
 recipes/ti/matrix-gui.inc           |    2 +-
 recipes/ti/matrix-gui_1.3.bb        |    4 ++++
 6 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 recipes/ti/matrix-gui-common_1.4.bb
 create mode 100644 recipes/ti/matrix-gui-e_1.3.bb
 create mode 100644 recipes/ti/matrix-gui_1.3.bb

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index b5a368e..2d2cea3 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
new file mode 100644
index 0000000..c578a47
--- /dev/null
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -0,0 +1,8 @@
+require matrix-gui-common.inc
+
+# Use the mem_util application from am-sysinfo instead of a
+# prebuilt version in the repository.
+RRECOMMENDS_${PN} = "am-sysinfo"
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index 86f08b1..c3a9341 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
new file mode 100644
index 0000000..dd1b16b
--- /dev/null
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -0,0 +1,5 @@
+require matrix-gui-e.inc
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
+
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index a2a2721..b7678b2 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
new file mode 100644
index 0000000..53db8af
--- /dev/null
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -0,0 +1,4 @@
+require matrix-gui.inc
+
+SRCREV = "192"
+PR = "${INC_PR}.0"
-- 
1.6.3.3



