Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr2Tl-0001y4-O0
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 09:45:57 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so93048wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 00:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qfPbiGaeEOrwUS6n3zVzPoGD/x2Q2P+63TJnK4LvgjU=;
	b=h3gvj28r2hwIgHI9eX+SKCmwCJi4KI/hYOfDMWVFV2rc9D7jwnJ7oePIcQzjomxGAf
	nnhZibcfzQBQ8UOT4uIZKIsRwqawQJ+0RPr1yp45sekR9tF0QXAeAmyOC0fFzgt4UgNL
	E2bqs/kGkwvME1S5Q5StAJ0rwZcKG0lOFZq21IZUxORYBUZhRYhSiMG9LP2DyHn/tctc
	eDfrmFilh+ZW6ajtCfnmGgitnYXAbccvlyiLwzDTyZ6HyR8tIvcWIFIYSeMyAkGj3e4f
	ooemj0mE09CUyss2cEGzTkBJ845zCjRITa28aH6OXBuCZIZfU9aW9lCANwtEqyC09QYT
	vjkQ==
Received: by 10.216.200.201 with SMTP id z51mr822433wen.0.1342510480931;
	Tue, 17 Jul 2012 00:34:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm38056786wix.6.2012.07.17.00.34.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 00:34:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 09:34:40 +0200
Message-Id: <1342510480-24412-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342510480-24412-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342510333-32367-1-git-send-email-koen@dominion.thruhere.net>
	<1342510480-24412-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] lvm2: bump PR to rebuild after libudev0 soname change to libudev1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 07:45:57 -0000

* this patch depends on http://patchwork.openembedded.org/patch/32085/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 7ac6a41..80fd458 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r0"
+INC_PR = "r1"
 
 
 S = "${WORKDIR}/LVM2.${PV}"
-- 
1.7.8.6



