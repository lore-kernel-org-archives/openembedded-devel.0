Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 409DC736B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 13:18:04 +0000 (UTC)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Sep 2015 15:18:00 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Sep 2015 15:18:00 +0200
Message-ID: <1441977480-44314-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][fido][PATCH] vim: add checksum
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
X-List-Received-Date: Fri, 11 Sep 2015 13:18:08 -0000
Content-Type: text/plain

This fixes this build issue:
ERROR: No checksum specified for .../downloads/vim_vim.googlecode.com_.hg._v7-4-481.tar.gz, please add at least one to the recipe:
SRC_URI[md5sum] = "797c8c3023a810bb8c11ea0a0d185855"
SRC_URI[sha256sum] = "359d5e3d8981c5047364a3fe5cf7c0928b796570f7cf74aa3ed01593942fd064"
ERROR: Function failed: Fetcher failure for URL: 'http://downloads.yoctoproject.org/mirror/sources/vim_vim.googlecode.com_.hg._v7-4-481.tar.gz;protocol=https;module=vim'. Missing SRC_URI checksum

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index afdea84..2c8e4c6 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -11,6 +11,8 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
 SRCREV = "v7-4-481"
+SRC_URI[md5sum] = "797c8c3023a810bb8c11ea0a0d185855"
+SRC_URI[sha256sum] = "359d5e3d8981c5047364a3fe5cf7c0928b796570f7cf74aa3ed01593942fd064"
 
 S = "${WORKDIR}/vim/src"
 
-- 
1.9.1


