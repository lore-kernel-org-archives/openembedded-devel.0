Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SW6At-0001zS-K4
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 15:27:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 May 2012 06:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154887336"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2012 06:16:44 -0700
Received: from localhost.localdomain (unknown [10.237.105.40])
	by linux.intel.com (Postfix) with ESMTP id 5AABF2C8001;
	Sun, 20 May 2012 06:16:44 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2012 16:17:32 +0300
Message-Id: <6b907017a92c4178980b18fbe2fef47cbd2b1a34.1337519599.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH 1/1] sudo: fixed wrong `chmod` path
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
X-List-Received-Date: Sun, 20 May 2012 13:27:55 -0000

Placed $D between braces ${D} to be correctly expanded to the
workdir path, instead of a path relative to host rootfs.
Currently, bitbake sudo fails on host systems where sudo is not
installed.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/recipes-extended/sudo/sudo_1.8.4p4.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
index 2315322..20c4a14 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.4p4.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            file://libtool.patch \
@@ -24,6 +24,6 @@ do_install_append () {
 		fi
 	done
 
-	chmod 4111 $D/usr/bin/sudo
-	chmod 0440 $D/etc/sudoers
+	chmod 4111 ${D}/usr/bin/sudo
+	chmod 0440 ${D}/etc/sudoers
 }
-- 
1.7.10



