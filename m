Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSV96-0005gn-UD
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2012 16:51:29 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2012 08:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,667,1344236400"; d="scan'208";a="239506783"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.101])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2012 08:37:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Oct 2012 15:37:22 +0000
Message-Id: <8ea80933fc1ca89aa44456a1afa24be69140829b.1351438401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/4] Remove PRIORITY
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
X-List-Received-Date: Sun, 28 Oct 2012 15:51:29 -0000

We don't set this field in recipes anymore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |    1 -
 .../hostapd/hostap-daemon_1.0.bb                   |    1 -
 .../sshfs-fuse/sshfs-fuse_2.4.bb                   |    1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index ae8ebca..aca2f97 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -1,7 +1,6 @@
 DESCRIPTION = "GNU Radio"
 URL = "http://gnuradio.org"
 SECTION =  "apps"
-PRIORITY = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
index 0ae0b70..310e8aa 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -1,6 +1,5 @@
 HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
-PRIORITY = "optional"
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://README;md5=4d709ce0f9c84b87d148e16731f647e1"
 DEPENDS = "libnl openssl"
diff --git a/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb b/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb
index 83d5c87..f550f71 100644
--- a/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb
+++ b/meta-oe/recipes-connectivity/sshfs-fuse/sshfs-fuse_2.4.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "This is a filesystem client based on the SSH File Transfer Protoc
 AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
 HOMEPAGE = "http://fuse.sourceforge.net/sshfs.html"
 SECTION = "console/network"
-PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = "glib-2.0 fuse"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
1.7.9.5



