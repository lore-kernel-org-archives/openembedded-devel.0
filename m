Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TWoWm-0005LH-4b
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2012 14:21:44 +0100
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 4FB3F2543428;
	Fri,  9 Nov 2012 13:15:56 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=xiaoyu.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>)
	id 1TWoJO-0002Bo-VB; Fri, 09 Nov 2012 14:07:55 +0100
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Nov 2012 14:07:53 +0100
Message-Id: <1352466473-8387-1-git-send-email-holger+oe@freyther.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Subject: [meta-oe][meta-systemd][PATCH] systemd: Make the main systemd files proper CONFFILES
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
X-List-Received-Date: Fri, 09 Nov 2012 13:21:44 -0000

From: Holger Hans Peter Freyther <holger@moiji-mobile.com>

Allow a user to edit the main systemd configuration files and have
them not overwritten at the next upgrade of it.
---
 meta-systemd/recipes-core/systemd/systemd_git.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 6deda82..bfd1b30 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r9"
+PR = "r10"
 
 inherit useradd pkgconfig autotools perlnative
 
@@ -126,6 +126,11 @@ FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
 
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
-- 
1.7.10.4



