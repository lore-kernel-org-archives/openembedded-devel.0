Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFD857F695
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 08:25:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBD8PGbt009645
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 00:25:16 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 13 Dec 2019 00:25:03 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Dec 2019 16:25:02 +0800
Message-ID: <1576225502-180394-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: fix wrong shebang for python3
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
X-List-Received-Date: Fri, 13 Dec 2019 08:25:15 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix wrong shebang "#!/usr/bin/env python3/"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.10.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
index 1ad5d55..9eaa134 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
@@ -194,11 +194,11 @@ do_install_append() {
     
     for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc samba_dnsupdate; do
         if [ -f "${D}${sbindir}/$f" ]; then
-            sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/$f
+            sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${sbindir}/$f
         fi
     done
     if [ -f "${D}${bindir}/samba-tool" ]; then
-        sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+        sed -i -e 's,${PYTHON},/usr/bin/env python3,g' ${D}${bindir}/samba-tool
     fi
     
 }
-- 
2.7.4


