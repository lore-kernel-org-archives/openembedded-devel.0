Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D11E7F34A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 00:59:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x820xYXC001171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Sep 2019 17:59:34 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 1 Sep 2019 17:59:34 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <drew.moseley@northern.tech>
Date: Sun, 1 Sep 2019 20:59:27 -0400
Message-ID: <20190902005927.175922-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][Patch] Revert "networkmanager: Use ALTERNATIVES for resolv-conf handling."
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Sep 2019 00:59:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This reverts commit 3982dc5b1994ffcc52336b02fbd2c44db164dd82.

With this commit it creates link file /etc/resolv.conf via
update-alternatives but the target doesn't exist.

On target:

root@qemux86-64:~# ls -l /etc/resolv*
lrwxrwxrwx    1 root     root            33 Aug 27 09:17 /etc/resolv-conf.NetworkManager -> ../run/NetworkManager/resolv.conf
lrwxrwxrwx    1 root     root            34 Aug 23 03:08 /etc/resolv-conf.systemd -> ../run/systemd/resolve/resolv.conf
lrwxrwxrwx    1 root     root            31 Aug 27 09:22 /etc/resolv.conf -> /etc/resolv-conf.NetworkManager

root@qemux86-64:~# ls -l /run/NetworkManager/resolv.conf
ls: /run/NetworkManager/resolv.conf: No such file or directory

root@qemux86-64:~# cat /etc/resolv.conf
cat: can't open '/etc/resolv.conf': No such file or directory

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../networkmanager/networkmanager_1.18.2.bb          | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index b760a40c3..4149eddf0 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     curl \
 "
 
-inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc update-alternatives
+inherit gnomebase gettext systemd bash-completion vala gobject-introspection gtk-doc
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -131,16 +131,6 @@ FILES_${PN}-nmtui-doc = " \
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'NetworkManager.service NetworkManager-dispatcher.service', '', d)}"
 
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
-ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
-ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
-
 do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run
-
-    # For read-only filesystem, do not create links during bootup
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
-    fi
 }
-- 
2.20.0


