Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8431A65DB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:20:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7L9KkSP023601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 02:20:46 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 02:20:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Aug 2014 05:20:43 -0400
Message-ID: <1408612843-22017-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lmbench: remove debianutils from RDEPENDS and add perl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Aug 2014 09:20:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- I don't see any evdidence that lmbench needs debianutils to run:
  debianutils provides:
    run-parts, tempfile, savelog, which, ischroot,
    add-shell, installkernel, remove-shell
  but none of them is used by lmbench scripts and I tested it work
  fine without debianutils, so remove debianutils from RDEPENDS

- Some scripts in lmbench are perl scripts, so add
  RDEPENDS on perl (no addtional perl module is needed).

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 38e0d2e..0586d72 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -74,5 +74,5 @@ pkg_postinst_${PN} () {
     fi
 }
 
-RDEPENDS_${PN} = "debianutils"
+RDEPENDS_${PN} = "perl"
 FILES_${PN} += "${datadir}/lmbench ${libdir}/lmbench"
-- 
2.0.0


