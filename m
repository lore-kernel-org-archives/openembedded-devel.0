Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2C346FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 12:10:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u71CAVdp018724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Aug 2016 05:10:31 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 1 Aug 2016 05:10:30 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Aug 2016 08:10:29 -0400
Message-ID: <1470053429-93999-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] grubby: fix no GNU_HASH warning
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
X-List-Received-Date: Mon, 01 Aug 2016 12:10:32 -0000
Content-Type: text/plain

- Let recipe's LDFLAGS work in Makefile.

- Pass option '-e' to Makefile, let environment
  CFLAGS append to the one in Makefile.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index dc6cc62..1a9f68d 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -25,7 +25,7 @@ RDEPENDS_${PN} += "dracut"
 
 inherit autotools-brokensep ptest
 
-EXTRA_OEMAKE = "'CC=${CC}'"
+EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}'"
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}
-- 
2.8.1


