Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7A4B60123
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:51:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u892pL6S019136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 19:51:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 19:51:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Sep 2016 10:34:56 +0800
Message-ID: <b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1473388166.git.jackie.huang@windriver.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only
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
X-List-Received-Date: Fri, 09 Sep 2016 02:51:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It builds fine except for arm now, and the do_package
and libpam issue is fixed by:
"waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 042203e..c34adcb 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
 
 # http://errors.yoctoproject.org/Errors/Details/81004/
-# before this issue it was also failing in do_package and
-# autodetecting libpam dependency
-PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
+BLACKLIST_REASON ?= ""
+BLACKLIST_REASON_arm = "BROKEN: fails to build with new binutils-2.27"
+PNBLACKLIST[samba] ?= "${BLACKLIST_REASON}"
-- 
2.8.3


