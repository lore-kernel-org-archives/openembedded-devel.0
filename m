Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6E160557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:15:31 +0000 (UTC)
Received: by qkep139 with SMTP id p139so34336388qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=HYZXOOgwyigxmUFu+tRPY8zVbytgZ9B8eLmoBaYTngU=;
	b=NR+WL99jb0BJrcaeEzSVt+GUQ1Ls4Kh8/kK8VvRSebpUWDKq9lHz0Yn0asKr6+FLLn
	lXF0dJYABE274EQAwvXD5w+rm+xx5cUnCoVRARbW+3kIsHGRnptbOeWIt0rskQ51FMHr
	0UmPCTiqbJG7GM2v+lL19uJbxZ1u6rlVdSCtviD0H0KtulF2Vw+j6Yh19znH0ooCc3Uu
	bjYpVqnvIc+OmZZGndvFcTSA05RidgZiyMgaE546/xMtI0x1td0Aj6DqICN9QPVj40OS
	w5RaXslA92dIbQqtzAjbYA4CvHA+699JO3dVk8mipwAUQwopSdFKs0VOezPaCz+UvngZ
	Kh8w==
X-Received: by 10.55.215.144 with SMTP id t16mr18846262qkt.107.1440173731427; 
	Fri, 21 Aug 2015 09:15:31 -0700 (PDT)
Received: from thuvia.localdomain
	(pool-108-44-118-114.ronkva.east.verizon.net. [108.44.118.114])
	by smtp.gmail.com with ESMTPSA id 77sm4605257qhw.4.2015.08.21.09.15.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 09:15:29 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Aug 2015 12:15:24 -0400
Message-Id: <1440173724-22038-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] vim: Move SRC_URI from Google Code to github.
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
X-List-Received-Date: Fri, 21 Aug 2015 16:15:35 -0000

I chose the rev that matched the existing recipe version.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index afdea84..2ece53b 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -6,13 +6,13 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
 
-SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
+SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
-SRCREV = "v7-4-481"
+SRCREV = "861d80a671747e6535c83356bcffcf80a72f543b"
 
-S = "${WORKDIR}/vim/src"
+S = "${WORKDIR}/git/src"
 
 VIMDIR = "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
-- 
2.1.0


