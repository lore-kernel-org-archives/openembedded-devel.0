Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id AFA5A6EAFA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:45:06 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id um1so5734888pbc.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UQeSlTOlk7HbqNAV3eawlAH1hM/XSg8b0dIQerDelNg=;
	b=kXA1otcfaaMRoyg5R0j0jbDJVzAWlwklO2yXm3Zu/RUEHtobR6tDo5YkSpMwUIOJ5y
	GnzB3Txk/5lFJYHswkrRlL+VXbYDT632Vg7cju+Hkf4f0XA54aI7rvHKZ/smY7kgL5I2
	cqpMQKmLbpWe98MSUH6zIr+TF3uSF3EAyAeQ6ykV23k8zXaRu/k49UDw129Ogx75DtkX
	9M2D22lCGEyfB4A2iz7kSvZqLoK1K7cl75j6F3WYQY6NBXuvr5IPZF5xbEzaHVBOR1et
	abPtzT/vzw2RfrS8k+jaD7187CvpObcbXCJ+XNWoGnUeQt0t3WQIR7Wj26rJMkGRPvGM
	2Tng==
X-Received: by 10.68.189.5 with SMTP id ge5mr21338635pbc.42.1393195506958;
	Sun, 23 Feb 2014 14:45:06 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	os1sm104596239pac.20.2014.02.23.14.45.04 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 14:45:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 14:46:41 -0800
Message-Id: <1393195601-18485-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] xbmc: branch name is case sensitive
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
X-List-Received-Date: Sun, 23 Feb 2014 22:45:09 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 2316fb7..f438a2d 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -11,7 +11,7 @@ SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
 PV = "11.0+gitr${SRCPV}"
 PR = "r14"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden \
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Eden \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
            file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
            file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
-- 
1.8.3.2


