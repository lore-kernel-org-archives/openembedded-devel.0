Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6174478CCC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 18:15:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w85IFDFM024651
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 11:15:13 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 11:15:13 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 14:15:08 -0400
Message-ID: <20180905181508.9960-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180905181508.9960-1-Randy.MacLeod@windriver.com>
References: <20180905181508.9960-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] vim/vim-tiny: upgrade 8.1.0172 -> 8.1.0347
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
X-List-Received-Date: Wed, 05 Sep 2018 18:15:12 -0000
Content-Type: text/plain

The license file changed because the vim format tag
on the last line of the file changed. Specify the
the license end line to avoid this problem.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../vim/{vim-tiny_8.1.0172.bb => vim-tiny_8.1.0347.bb}        | 0
 .../recipes-support/vim/{vim_8.1.0172.bb => vim_8.1.0347.bb}  | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vim/{vim-tiny_8.1.0172.bb => vim-tiny_8.1.0347.bb} (100%)
 rename meta-oe/recipes-support/vim/{vim_8.1.0172.bb => vim_8.1.0347.bb} (96%)

diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
similarity index 100%
rename from meta-oe/recipes-support/vim/vim-tiny_8.1.0172.bb
rename to meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0172.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
similarity index 96%
rename from meta-oe/recipes-support/vim/vim_8.1.0172.bb
rename to meta-oe/recipes-support/vim/vim_8.1.0347.bb
index 371fe35ee..8713d66ed 100644
--- a/meta-oe/recipes-support/vim/vim_8.1.0172.bb
+++ b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
@@ -6,13 +6,13 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
+LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
 
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "c229e54a69468722ca2449e807e90445b7479659"
+SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.17.0


