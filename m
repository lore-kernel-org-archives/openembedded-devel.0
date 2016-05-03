Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11F656FF01
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 04:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u434dMF2027130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2016 21:39:23 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 2 May 2016 21:39:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 May 2016 12:31:44 +0800
Message-ID: <1462249904-8978-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dovecot: fix QA issue and remove from blacklist
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
X-List-Received-Date: Tue, 03 May 2016 04:39:27 -0000
Content-Type: text/plain

Modify FILES_${PN} and FILES_${PN}-dev to fix QA issue and remove dovecot
from blacklist.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
index bdfd5a2..d7a7cc5 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
@@ -59,9 +59,9 @@ USERADD_PARAM_${PN} = "-r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dove
                       -r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dovenull dovenull"
 GROUPADD_PARAM_${PN} = "-f -r dovecot;-f -r dovenull"
 
+FILES_${PN} += "${libdir}/dovecot/*plugin.so \
+                ${libdir}/dovecot/libfs_compress.so \
+                ${libdir}/dovecot/libssl_iostream_openssl.so"
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
-FILES_${PN}-dev += "${libdir}/dovecot/*.so"
+FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
-
-# http://errors.yoctoproject.org/Errors/Details/35133/
-PNBLACKLIST[dovecot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
-- 
2.8.1


