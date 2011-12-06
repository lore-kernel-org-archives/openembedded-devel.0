Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RXp9Q-0006eO-CC
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 08:09:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB672S0i008652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2011 23:02:29 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 5 Dec 2011 23:02:28 -0800
Message-ID: <2a20136f9c98ed273197836930d8f6bf932b7c06.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323141676.git.xiaofeng.yan@windriver.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 14:28:39 +0800
Date: Tue, 6 Dec 2011 14:58:02 +0800
To: <openembedded-devel@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH 01/10] qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Dec 2011 07:09:16 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

dbus-x11 could be not needed by an image without x11.
So I modified this bb file to enable dbus-x11 when x11 is in DISTRO_FEATURES and disable \
dbus-x11 without x11 feature.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index ebf957a..deaf3a5 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 
-PR = "r22"
+PR = "r23"
 
 SRC_URI = "file://distcc.sh \
            file://anjuta-remote-run \
@@ -37,7 +37,7 @@ pkg_postinst_${PN} () {
         sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
 }
 
-RDEPENDS_${PN} = "distcc dbus-x11 task-core-nfs-server oprofileui-server rsync bash"
+RDEPENDS_${PN} = "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}  task-core-nfs-server oprofileui-server rsync bash"
 
 inherit update-rc.d allarch
 
-- 
1.7.0.4



