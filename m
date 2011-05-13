Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QKrll-0003CT-U9
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 14:47:02 +0200
Received: from localhost.localdomain (79.51.85.13) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C06BF017A; Fri, 13 May 2011 14:44:14 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: Stefan Schmidt <stefan@buglabs.net>
Date: Fri, 13 May 2011 14:43:07 +0200
Message-Id: <1305290588-7057-9-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305290080.2448.3.camel@gnutoo-laptop>
References: <1305290080.2448.3.camel@gnutoo-laptop>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/12] task-bug: fix do_rootfs conflict
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
X-List-Received-Date: Fri, 13 May 2011 12:47:03 -0000

Without that patch we have(at do_rootfs)
  Configuring hostap-daemon.
  Collected errors:
   * extract_archive: Cannot create symlink from ./var/run to 'volatile/run': File exists.
   * file_md5sum_alloc: Failed to open file .../rootfs/bug-image-production/etc/opkg/*.conf: No such file or directory.
   * check_data_file_clashes: Package dnsmasq-dbus wants to install file .../rootfs/bug-image-production/etc/init.d/dnsmasq
          But that file is already provided by package  * dnsmasq
   * check_data_file_clashes: Package dnsmasq-dbus wants to install file .../rootfs/bug-image-production/usr/bin/dnsmasq
          But that file is already provided by package  * dnsmasq
   * opkg_install_cmd: Cannot install package task-bug-network.
   * resolve_conffiles: Existing conffile .../rootfs/bug-image-production/etc/device_table is different from the conffile
     in the new package. The new conffile will be placed at .../rootfs/bug-image-production/etc/device_table-opkg.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/tasks/task-bug.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-bug.bb b/recipes/tasks/task-bug.bb
index 1317a6e..f81c56a 100644
--- a/recipes/tasks/task-bug.bb
+++ b/recipes/tasks/task-bug.bb
@@ -1,6 +1,6 @@
 # Copyright (C) 2011 Bug Labs, Inc
 
-PR = "r88"
+PR = "r89"
 
 ALLOW_EMPTY = "1"
 
@@ -25,7 +25,7 @@ RDEPENDS_${PN} = "${MACHINE_EXTRA_RRECOMMENDS} \
 RDEPENDS_${PN}_append_bug20 = "bug2v4l2"
 
 RDEPENDS_${PN}-network = "\
-                  dnsmasq \
+                  dnsmasq-dbus \
                   hostap-daemon \
                   iptables \
                   eject \
-- 
1.7.0.4



