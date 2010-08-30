Received: from mail.infocentr.ru ([78.108.66.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1Oq7XI-0004Eo-Qi
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:48:46 +0200
Received: from localhost.localdomain (unknown [192.168.62.150])
	by mail.infocentr.ru (Postfix) with ESMTP id 68D84B00178A;
	Mon, 30 Aug 2010 22:48:11 +0600 (YEKST)
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 22:47:59 +0600
Message-Id: <1283186879-971-4-git-send-email-norguhtar@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1283186879-971-3-git-send-email-norguhtar@gmail.com>
References: <1283186879-971-1-git-send-email-norguhtar@gmail.com>
	<1283186879-971-2-git-send-email-norguhtar@gmail.com>
	<1283186879-971-3-git-send-email-norguhtar@gmail.com>
X-SA-Exim-Connect-IP: 78.108.66.4
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 4/4] change upstart-0.3.11.bb to compatible with new upstart.inc
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
X-List-Received-Date: Mon, 30 Aug 2010 16:48:46 -0000

* bump PR
* add to SRC_URI example-jobs for upstart-sysvcompat and rc init scripts
* add USE_VT and SYSVINIT_ENABLED_GETTYS with default value, similary as in sysvinit recipe
* add checksum for example-jobs

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
---
 recipes/upstart/upstart_0.3.11.bb |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/recipes/upstart/upstart_0.3.11.bb b/recipes/upstart/upstart_0.3.11.bb
index c4db01b..a0bd17e 100644
--- a/recipes/upstart/upstart_0.3.11.bb
+++ b/recipes/upstart/upstart_0.3.11.bb
@@ -1,11 +1,18 @@
 require upstart.inc
 
-SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2 \
+SRC_URI = "http://upstart.ubuntu.com/download/0.3/upstart-${PV}.tar.bz2;name=upstart \
+    http://upstart.ubuntu.com/download/example-jobs/0.3/example-jobs-${PV}.tar.gz;name=compat \
+    file://init/rcS-default file://init/rc file://init/rcS \
 "
 
 RRECOMMENDS_${PN} = "libupstart upstart-sysvcompat"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI[md5sum] = "a9e475e1458c876add0441d9d4cfe9c0"
-SRC_URI[sha256sum] = "d4f7fff9112049eab318518719735d0ac66ff558ed91c2d7c7c41124de2832b6"
+USE_VT ?= "1"
+SYSVINIT_ENABLED_GETTYS ?= "1"
+
+SRC_URI[upstart.md5sum] = "a9e475e1458c876add0441d9d4cfe9c0" 
+SRC_URI[upstart.sha256sum] = "d4f7fff9112049eab318518719735d0ac66ff558ed91c2d7c7c41124de2832b6"
+SRC_URI[compat.md5sum] = "22d66ef8bc9d167eb822bbfecb584107"
+SRC_URI[compat.sha256sum] = "f53fae7258fcf67cb29d344e53e1548171e4781af11ff4ba92b8b81caab3c315"
-- 
1.6.0.6



