Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 87F817771B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 00:04:37 +0000 (UTC)
Received: by p910.zcs.saftware.de (Postfix, from userid 1000)
	id 60127AD003E7; Fri, 23 Dec 2016 01:04:36 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2016 01:04:36 +0100
Message-Id: <1482451476-17405-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1482451476-17405-1-git-send-email-obi@opendreambox.org>
References: <1482451476-17405-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 2/2] samba: conditionalize sed call for onnode
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
X-List-Received-Date: Fri, 23 Dec 2016 00:04:39 -0000

| sed: can't read .../4.4.5-r0/image/usr/bin/onnode: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 2acdbec..69cd87c 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -150,7 +150,9 @@ do_install_append() {
     done
 
     # fix file-rdeps qa warning
-    sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
+    if [ -f ${D}${bindir}/onnode ]; then
+        sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
+    fi
 
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
-- 
2.7.4


