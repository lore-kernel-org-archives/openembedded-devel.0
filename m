Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tikpd-0000Gg-P3
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 12:50:35 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so262289bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=6Qd1U6U1dGApf7L3QTwNwL8OWWx1IFsHM2FWKuQCNeI=;
	b=Te0bYctKr99ClILlIn/xtcJ+DwikwAtFpBDMyUuOuYJ0W7qcYgr7NVphRbpTQUTGmN
	igsJMqGDpW4EDUTJj9daDtcVu63nFcQbhJ/Ro5AfDbLziPkKmuJtZTENg8ge6SwipC2c
	LhdXk9a0d8lfKMv38J5HnHsB3vpc9TN5fOo1cKN5SbUAl4Yl6DKMLxt8RSYQrmIVpgKw
	kZzAouNSG9QgSvfTFFCrJjK+0Do6fNU/1kiGbeyE1PB9AAfB6iq8fYDb0N6gvfKorJze
	RyfkN0dnVi0uICcZvK5D51J1Np6zJGozMExG/f6uD80WUIshUoCjWhpbGZeSrEARYyQb
	YSew==
Received: by 10.204.4.81 with SMTP id 17mr383826bkq.137.1355312160299;
	Wed, 12 Dec 2012 03:36:00 -0800 (PST)
Received: from localhost.localdomain (p4FDF1E51.dip.t-dialin.net.
	[79.223.30.81])
	by mx.google.com with ESMTPS id e22sm19861411bke.14.2012.12.12.03.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 03:35:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2012 12:35:46 +0100
Message-Id: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Wed, 12 Dec 2012 11:50:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix error for do_rootfs:
| Collected errors:
|  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-fr wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/fr/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-locale-fr
|  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-locale-fr.
|  * check_data_file_clashes: Package gvfs-locale-en-gb wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/en_GB/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-gdu-volume-monitor-locale-en-gb
|  * opkg_install_cmd: Cannot install package gvfs-locale-en-gb.
|  * check_data_file_clashes: Package gvfs-gdu-volume-monitor-locale-de wants to install file /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce4-full-image/1.0-r0/rootfs/usr/share/locale/de/LC_MESSAGES/gvfs.mo
| 	But that file is already provided by package  * gvfs-locale-de
|  * opkg_install_cmd: Cannot install package gvfs-gdu-volume-monitor-locale-de.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gvfs/gvfs-gdu-volume-monitor_1.8.2.bb          |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
index fe5af46..3754e60 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs-gdu-volume-monitor_1.8.2.bb
@@ -20,6 +20,7 @@ do_install_append() {
 	rm -rf ${D}${datadir}/glib-2.0
 	rm -rf ${D}${datadir}/GConf
 	rm -f ${D}${datadir}/dbus-1/services/gvfs-*
+	rm -rf ${D}${datadir}/locale
 	rm -f ${D}${libexecdir}/gvfsd*
 	rm -f ${D}${libexecdir}/gvfs-fuse-daemon
 	rm -f ${D}${libexecdir}/gvfs-gphoto2-volume-monitor
-- 
1.7.4.4



