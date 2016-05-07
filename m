Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8DB731C5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 May 2016 09:03:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4793YFP026716
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 May 2016 02:03:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 May 2016 02:03:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 7 May 2016 05:03:31 -0400
Message-ID: <1462611811-15593-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1462603608.git.hongxu.jia@windriver.com>
References: <cover.1462603608.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: koen.kooi@linaro.org
Subject: [meta-oe][PATCH] efibootmgr: sync with upstream while efivar upgraded to 0.23
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
X-List-Received-Date: Sat, 07 May 2016 09:03:37 -0000
Content-Type: text/plain

Sync with upstream to have the following fix:
...
commit 53aa9cdf7f0746f91f39521d020b024103041384
Author: Peter Jones <pjones@redhat.com>
Date:   Thu Mar 3 09:50:03 2016 -0500

    Explicitly pass a mode to efi_set_variable() in all cases.

    We'll have to do this for efivar-0.24 .

    Signed-off-by: Peter Jones <pjones@redhat.com>
...

It failed compile failure:
...
efibootmgr.c: In function 'make_boot_var':
efibootmgr.c:305:7: error: too few arguments to function 'efi_set_variable'
  rc = efi_set_variable(boot->guid, boot->name, boot->data,
       ^
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index d80c89f..0dee582 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -10,7 +10,7 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "eb6e36c9064eae256cd60df24a977e3abd87fd16"
+SRCREV = "75d25807ba81cb724964c989012611272c8f1f5d"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 
-- 
2.8.1


