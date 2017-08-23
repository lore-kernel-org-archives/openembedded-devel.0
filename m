Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD7A0782C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 00:32:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N0W1vu003748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 17:32:01 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 22 Aug 2017 17:32:00 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <pbarker@toganlabs.com>
Date: Wed, 23 Aug 2017 08:32:45 +0800
Message-ID: <1503448365-20157-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] vim: update to 8.0.0983
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
X-List-Received-Date: Wed, 23 Aug 2017 00:32:00 -0000
Content-Type: text/plain

Fixed CVE-2017-11109 since 8.0.0707
See:
http://www.cvedetails.com/vulnerability-list/vendor_id-8218/product_id-14270/year-2017/opdos-1/VIM-VIM.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/vim/{vim-tiny_8.0.0427.bb => vim-tiny_8.0.0983.bb}  | 0
 meta-oe/recipes-support/vim/{vim_8.0.0427.bb => vim_8.0.0983.bb}        | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vim/{vim-tiny_8.0.0427.bb => vim-tiny_8.0.0983.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_8.0.0427.bb => vim_8.0.0983.bb} (98%)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.0.0427.bb b/meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_8.0.0427.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.0.0983.bb
diff --git a/meta-oe/recipes-support/vim/vim_8.0.0427.bb b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
similarity index 98%
rename from meta-oe/recipes-support/vim/vim_8.0.0427.bb
rename to meta-oe/recipes-support/vim/vim_8.0.0983.bb
index 1f86fcd..407ce5e 100644
--- a/meta-oe/recipes-support/vim/vim_8.0.0427.bb
+++ b/meta-oe/recipes-support/vim/vim_8.0.0983.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "ad4187e6fc9c8e1083a172852d958a70a689a75c"
+SRCREV = "3f9a1ff141412e9e85f7dff47d02946cb9be9228"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.7.4


