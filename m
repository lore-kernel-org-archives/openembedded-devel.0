Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2KUP-0000ww-Pq
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2013 12:45:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2013 03:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="280620293"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Feb 2013 03:29:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:29:36 +0000
Message-Id: <64b913729d4ba822aea1bae77236f251e44ebd06.1359977333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1359977333.git.paul.eggleton@linux.intel.com>
References: <cover.1359977333.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/3] gnome-vfs: use RPROVIDES correctly
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
X-List-Received-Date: Mon, 04 Feb 2013 11:45:36 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 62d63ae..cfe7125 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -18,7 +18,7 @@ PR = "r2"
 inherit gnome
 
 # This is to provide compatibility with the gnome-vfs DBus fork
-RPROVIDES = "gnome-vfs-plugin-dbus"
+RPROVIDES_${PN} = "gnome-vfs-plugin-dbus"
 
 SRC_URI += "file://gconftool-lossage.patch \
 	    file://gnome-vfs-no-kerberos.patch;striplevel=0"
-- 
1.7.10.4



