Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1R21mN-0004l9-Jt
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 16:10:03 +0200
Received: by wyf19 with SMTP id 19so1542742wyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nSf40xig6pjuDnInPRctLxmpZLHzjnHmrXIYUUUBHqQ=;
	b=lxCYX+Y5n4kxBZUw1JTcxC65sne4LxzZcVFb9A8tC1ELV/MBg6CetsOJyezxHMnCKO
	vKCsuYcTc64AS80N7eDu7bhxslSpvanCCtgU9UKSUwHUMy60kcYG3Pyo0fxjFYtjTng4
	bJZArdSY2aHLOwVRUGHhmdan+umJtz0B4taNQ=
Received: by 10.216.138.142 with SMTP id a14mr1979271wej.63.1315577095948;
	Fri, 09 Sep 2011 07:04:55 -0700 (PDT)
Received: from localhost.localdomain
	(host86-135-215-249.range86-135.btcentralplus.com [86.135.215.249])
	by mx.google.com with ESMTPS id fa3sm7649984wbb.3.2011.09.09.07.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 07:04:55 -0700 (PDT)
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2011 16:04:33 +0100
Message-Id: <1315580673-4654-1-git-send-email-errordeveloper@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH] zeromq: Added common recipe and fixed SRC_URIs
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
X-List-Received-Date: Fri, 09 Sep 2011 14:10:03 -0000

 When a version becomes older they move it to
 /historic/ directory, hence SRC_URIs are needed
 for older versions.

Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
---
 recipes/zeromq/zeromq.inc      |   20 ++++++++++++++++++++
 recipes/zeromq/zeromq_2.1.6.bb |   15 ++-------------
 recipes/zeromq/zeromq_2.1.7.bb |    8 ++++++++
 recipes/zeromq/zeromq_2.1.9.bb |    6 ++++++
 4 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 recipes/zeromq/zeromq.inc
 create mode 100644 recipes/zeromq/zeromq_2.1.7.bb
 create mode 100644 recipes/zeromq/zeromq_2.1.9.bb

diff --git a/recipes/zeromq/zeromq.inc b/recipes/zeromq/zeromq.inc
new file mode 100644
index 0000000..3fbd7aa
--- /dev/null
+++ b/recipes/zeromq/zeromq.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
+HOMEPAGE = "http://www.zeromq.org"
+LICENSE = "LGPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=66ea8704398d7996daeacd2fbd2b9dbd"
+
+INC_PR = "r0"
+
+DEPENDS += "util-linux-ng"
+
+## All current releases are kept here:
+SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
+## obsolete release are being move to:
+#SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
+## Perhaps we should use git tags instead.
+
+inherit autotools
+
+do_configure_prepend() {
+	./autogen.sh
+}
diff --git a/recipes/zeromq/zeromq_2.1.6.bb b/recipes/zeromq/zeromq_2.1.6.bb
index c03d9dd..8b06571 100644
--- a/recipes/zeromq/zeromq_2.1.6.bb
+++ b/recipes/zeromq/zeromq_2.1.6.bb
@@ -1,19 +1,8 @@
-DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like a concurrency framework"
-HOMEPAGE = "http://www.zeromq.org"
-LICENSE = "LGPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=66ea8704398d7996daeacd2fbd2b9dbd"
+require zeromq.inc
 
 PR = "r0"
 
-DEPENDS += "util-linux-ng"
-
-SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz"
-
-inherit autotools
-
-do_configure_prepend() {
-	./autogen.sh
-}
+SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "77b9ca20e8f2426874022080f41d7b0b"
 SRC_URI[sha256sum] = "a1bbb352a9dbf34b18a3999b22a8db2d51e4a52508d098528d771811533f9fd0"
diff --git a/recipes/zeromq/zeromq_2.1.7.bb b/recipes/zeromq/zeromq_2.1.7.bb
new file mode 100644
index 0000000..1be6002
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.7.bb
@@ -0,0 +1,8 @@
+require zeromq.inc
+
+PR = "r0"
+
+SRC_URI = "http://download.zeromq.org/historic/zeromq-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7d3120f8a8fb913a7e55c57c6eb024f3"
+SRC_URI[sha256sum] = "2a1416d0a3ea55ae17d43417fd9bd193412cc9101e144bc8d3bd19fe36816e0d"
diff --git a/recipes/zeromq/zeromq_2.1.9.bb b/recipes/zeromq/zeromq_2.1.9.bb
new file mode 100644
index 0000000..7028891
--- /dev/null
+++ b/recipes/zeromq/zeromq_2.1.9.bb
@@ -0,0 +1,6 @@
+require zeromq.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "94c5e0262a79c5f82bc0b178c1f8a33d"
+SRC_URI[sha256sum] = "f3542f756687e622beef3a75c8e027fe2d95d4654350cbca4c070ffc58d9ace0"
-- 
1.7.3.4



