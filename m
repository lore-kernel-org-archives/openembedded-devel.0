Return-Path: <net147@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 730CB60991
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2013 06:18:05 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 6so9760589pdd.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2013 23:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bc0Z/xdj71V5GWfg4LyhU2ADz/gBK6R8Atc5mmhqRm0=;
	b=Biwm7DA8Z3hEQost+hTkjJgIjVtMB8/GnmhD9pIK4ip6vqN141jA9nEfRGDvW9L5az
	pbwcSQpDufuyHj9ukm/5aBx0S8oxWkwbdWwIZ/IXQPQ26OT6nPEcoOtIoJ8UfPM9cM34
	ajTou7uf7ls4kfYsSFMWhGdbkNgtMnRXLtIJ4DN2JyeORarOalRh5XDjzw5KtSkerJbQ
	ZblPJhhLLp1QWKjrhYMCdCrFybBdOnqJRSSOnRnI8+FbTdmV2QVmMcE8WihtVyqufWTY
	XWZPd6yWuD0+jc/l8t5vPrgPsNTWsdFePO4JQG7Zisfl5yBtc65uz6nsy2Eg+vCMxumE
	jeLw==
X-Received: by 10.66.139.8 with SMTP id qu8mr2609196pab.132.1369894686512;
	Wed, 29 May 2013 23:18:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	un15sm41586075pab.7.2013.05.29.23.18.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 23:18:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 May 2013 16:31:43 +1000
Message-Id: <1369895503-13935-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH] xterm: update to 293
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
X-List-Received-Date: Thu, 30 May 2013 06:18:05 -0000

License copyright years was updated from 1999-2010,2011 to
1999-2012,2013.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/{xterm_277.bb => xterm_293.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_277.bb => xterm_293.bb} (73%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
similarity index 73%
rename from meta-oe/recipes-graphics/xorg-app/xterm_277.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_293.bb
index c56be09..20e88f1 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_293.bb
@@ -2,11 +2,11 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 DESCRIPTION = "xterm is the standard terminal emulator for the X Window System."
 DEPENDS = "libxaw xproto xextproto libxext libxau libxpm ncurses"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=71d7532e485b8d325906bd751617e2a4"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=33;md5=3aaef904421576f75ce2ee32af88c375"
 
 SRC_URI = "ftp://invisible-island.net/xterm/${PN}-${PV}.tgz"
-SRC_URI[md5sum] = "c0de5c2f7b3a50244c5cdd53dcab1de5"
-SRC_URI[sha256sum] = "6cd38606e4179a874220f33dfd41063f93cd1c717aa26c742beb7adea3c1471e"
+SRC_URI[md5sum] = "f9dc37486d5f1e550b6dc2e26a8a0439"
+SRC_URI[sha256sum] = "64e9c41137eac4277d0cfe04312b12dc5d11224f49fc999ff7f6b9597bf55b7b"
 
 EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
-- 
1.8.3


