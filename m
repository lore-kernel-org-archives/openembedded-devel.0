Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6521.1619751956586987786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 20:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13U35t64029036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 20:05:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 29 Apr 2021 20:05:54 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 29 Apr 2021 20:05:54 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] tk: adapt to potential pseudo changes
Date: Fri, 30 Apr 2021 11:05:38 +0800
Message-ID: <20210430030538.44606-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

It failed as below when rerun do_install for tk:
 $ bitbake tk
 $ bitbake tk -f -cinstall
 [snip]
 | NOTE: make -j 48 DESTDIR=/build/tmp/work/cortexa53-wrs-linux/tk/8.6.10-r0/image install
 | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 | Check logfile: /build/tmp/work/cortexa53-wrs-linux/tk/8.6.10-r0/pseudo//pseudo.log
 | Aborted (core dumped)

By default the S is ${WORKDIR}/${BPN}-${PV}, but after unpack,
the tk source [1] unpacked to ${WORKDIR}/${BPN}${PV} and all the
files under ${WORKDIR}/${BPN}${PV} are acutally the source files.

But the the main Makefile.in is under ${WORKDIR}/${BPN}${PV}/unix
for tk, so there is below logic in tk recipe:
S = "${WORKDIR}/${BPN}${PV}/unix"

To adapt the potential pseudo changes, there is a general logic to
exclude ${S} from pseudo database in base.bbclass [2] by default.
That's to say, just the dir ${WORKDIR}/${BPN}${PV}/unix is excluded
from the pseudo database for tk.

But it's not enough for tk, we need to exclude the actual source dir
${WORKDIR}/${BPN}${PV} from pseudo database specifically to fix the
above do_install failure.

[1] https://downloads.sourceforge.net/tcl/tk8.6.0-src.tar.gz
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
index b564e1260..34fca8189 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.10.bb
@@ -28,6 +28,8 @@ SRC_URI[sha256sum] = "63df418a859d0a463347f95ded5cd88a3dd3aaa1ceecaeee362194bc30
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
+
 # Short version format: "8.6"
 VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
-- 
2.17.1

