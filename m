Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA2A46D0C1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 22:36:43 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so2955371eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VE/AUJ7LM/PxYb7GOBR1SwF+w1QJ5Ko3ilaTec9rj2A=;
	b=R+vuGbzmHebwEpBD5852pO8QieU1PrxQQVagcD3DXM/s53KbNsD/slMwJdY0KDwFBw
	WuvwC7slLnKggEB/NX0MUkHjNzrwQhSt40zD0Wx0Gxp7Gfz1HS9xBKYC12NuSAXFgcrk
	fI2aD09EIQdwLzRd92Vq9nPggN2yv6MuWdZcyP1XWe/iGwVUEbn4s5DIHzijlVBuzd3g
	gnE0BTnftkHLUKtk/ik+hYewAzl8fvTQCvA5zFrH3+sKMZf2g0+wV8MZ9vAWngLOntWo
	XGQLsJfb/a2AgXu4SfBoCIDa3kfUd2hOGwudTuTOA8+bS1psmjc0eQHqA2ZSxNCuytKl
	pCOw==
X-Received: by 10.15.61.137 with SMTP id i9mr293337eex.50.1381703805106;
	Sun, 13 Oct 2013 15:36:45 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id a1sm145535666eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 15:36:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 00:36:33 +0200
Message-Id: <1381703793-5661-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
References: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/4] ben-nanonote.conf: add qvga to MACHINE_FEATURES
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
X-List-Received-Date: Sun, 13 Oct 2013 22:36:44 -0000

Used in oe-core in:
recipes-sato/gtk-engines/gtk-sato-engine_git.bb:
recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:

EXTRA_OECONF adds '--with-mode=qvga'

And remove obsolete note about kexecboot

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/ben-nanonote.conf | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index a66e996..54b49df 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -16,9 +16,4 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "320"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
 LOGO_SIZE = "qvga"
 
-##################################
-# build kexecboot kernel while
-# making sure rootfs is compatible
-##################################
-
-# require conf/machine/include/initramfs-kexecboot.inc
+MACHINE_FEATURES_append_ben-nanonote = " qvga"
-- 
1.8.1.5


