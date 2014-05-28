Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f44.google.com (unknown [209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9DD6FB73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 03:01:01 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rq2so10385720pbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5/m9zgJwq0EMdKmyP11U3EAq5ZIA5X0/xLnNALGq340=;
	b=shxRw+OzITp8v5xhxri1MOfRB1Q9hz/GQgvx/ua57YBUOag4PVMLRE6Hlbmfbx2AMJ
	0iGPTEwWaeVejdoAE+fgJ0yr0S052bVKseEqGe8Sh5fJo+cXJNXg/AfwM6ZWqLAX97CJ
	wiptKi9XFIgt/mIRPTMSy8a/9tZRJZxPtn5M/tl8W0AGHu4+5fxb58lur3tn+R6KFMtl
	G/HGxvMPfdM3QgvLSVJuim9hjiF26dfyAFJGl46b6PwLeEYEfQ7Kvh9L/+4PFpC3Zus1
	Xp+WHKVU7JMB5pBYz32urwpj1rFIQyox26KFst7JzyeeA82mTbkX5tGoRgCfaRmnlJty
	pX4w==
X-Received: by 10.66.189.226 with SMTP id gl2mr41823400pac.65.1401246063156;
	Tue, 27 May 2014 20:01:03 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	sy2sm25665321pbc.28.2014.05.27.20.01.02 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 20:01:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 20:03:50 -0700
Message-Id: <1401246230-2992-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] lockdev: fix S!=B failure
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
X-List-Received-Date: Wed, 28 May 2014 03:01:02 -0000

From: Tim Orling <TicoTimo@gmail.com>

This package does not like being built out-of-tree.

Fixes:
[...]/lockdev/1.0.3+gitAUTOINC+16b899645d-r0/git/scripts/git-version: line 3:
NEWS: No such file or directory

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-support/lockdev/lockdev_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 919487f..023b9a7 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git"
 
 S = "${WORKDIR}/git"
 
-inherit lib_package autotools
+inherit lib_package autotools-brokensep
 
 do_configure_prepend () {
     ./scripts/git-version > VERSION
-- 
1.8.3.2


