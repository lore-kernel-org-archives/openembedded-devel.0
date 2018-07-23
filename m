Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 231D46FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 02:28:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6N2SZS7020242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Jul 2018 19:28:35 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 22 Jul 2018 19:28:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>, <rasmus.villemoes@prevas.dk>
Date: Mon, 23 Jul 2018 10:38:46 +0800
Message-ID: <1532313526-4782-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vim/vim-tiny: fix multiple .bb files provide xxd
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
X-List-Received-Date: Mon, 23 Jul 2018 02:28:37 -0000
Content-Type: text/plain

Since the following commit applied:
...
commit 34988c5319b08a14a145d82ed1057468f22632f9
Author: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Date:   Wed Jul 18 10:14:51 2018 +0200

    vim: provide xxd
...

And vim-tiny recipe contains vim reicpe, it caused both of
them provides xxd. Add `${PN}' prefix to it.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/vim/vim_8.1.0172.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_8.1.0172.bb b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
index b188c15..fd2afbc 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0172.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0172.bb
@@ -112,4 +112,4 @@ ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
 
-PROVIDES += "xxd"
+PROVIDES += "${PN}-xxd"
-- 
2.7.4


