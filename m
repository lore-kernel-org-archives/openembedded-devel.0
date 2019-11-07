Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA6A7F9B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:42:35 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 31469BE47EE; Thu,  7 Nov 2019 21:42:34 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:42:34 +0100
Message-Id: <20191107204234.17053-2-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191107204234.17053-1-obi@opendreambox.org>
References: <20191107204234.17053-1-obi@opendreambox.org>
Subject: [meta-networking][PATCH 2/2] autofs: install sysvinit script manually if systemd is enabled
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
X-List-Received-Date: Thu, 07 Nov 2019 20:42:36 -0000

Update-rc.d complains if no sysvinit script is present. This happens
in hybrid systemd/sysvinit builds, because autofs does not install
the init script if configured with '--with-systemd'.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
index 4f61562731..54f0b99915 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.6.bb
@@ -79,6 +79,11 @@ do_install_append () {
     if [ -d ${D}${localstatedir}/run ]; then
         rmdir ${D}${localstatedir}/run
     fi
+    # On hybrid systemd/sysvinit builds, we need to install the sysvinit script by hand.
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d -m 755 ${D}${INIT_D_DIR}
+        install -m 755 ${S}/samples/rc.autofs ${D}${INIT_D_DIR}/autofs
+    fi
 }
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
-- 
2.17.1


