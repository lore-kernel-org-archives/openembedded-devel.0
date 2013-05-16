Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ucw7g-0003A3-33
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 13:13:26 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2013 03:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,683,1363158000"; d="scan'208";a="314562817"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.131])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2013 03:55:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2013 11:55:01 +0100
Message-Id: <1368701701-1918-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] collectd: fix build failure with libnotify in sysroot
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
X-List-Received-Date: Thu, 16 May 2013 11:13:42 -0000

If libnotify is in the sysroot, collectd will try to use it and then
fail at do_compile because gtk/gtk.h can't be found. Since this is
functionality that's not likely to be needed in the embedded context as
far as collectd goes, just disable it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index a508840..8641530 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -26,6 +26,7 @@ EXTRA_OECONF = " \
                 ${FPLAYOUT} \
                 --disable-perl --with-libperl=no --with-perl-bindings=no \
                 --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
+                --disable-notify_desktop \
 "
 
 do_install_append() {
-- 
1.8.1.2



