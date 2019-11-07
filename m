Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A0B267F642
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 20:37:04 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 27CE0BE47E3; Thu,  7 Nov 2019 21:37:03 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 21:37:03 +0100
Message-Id: <20191107203703.16731-1-obi@opendreambox.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] samba: fix installation for minimal build
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
X-List-Received-Date: Thu, 07 Nov 2019 20:37:04 -0000

| chmod: cannot access '.../image/etc/sudoers.d': No such file or directory
| sed: can't read .../image/usr/bin/samba-tool: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-connectivity/samba/samba_4.10.8.bb   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
index d824eacf9e..4ab8b26c31 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
@@ -189,15 +189,17 @@ do_install_append() {
         sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
     fi
 
-    chmod 0750 ${D}${sysconfdir}/sudoers.d
+    chmod 0750 ${D}${sysconfdir}/sudoers.d || true
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
     
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba-gpupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_upgradedns 
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_spnupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_kcc
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_dnsupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+    for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc samba_dnsupdate; do
+        if [ -f "${D}${sbindir}/$f" ]; then
+            sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/$f
+        fi
+    done
+    if [ -f "${D}${bindir}/samba-tool" ]; then
+        sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+    fi
     
 }
 
-- 
2.17.1


