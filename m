Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id CECC96FA1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:39 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so6489680wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uA+yKdPIt4ke6Ys6yemuDmdn0OGeqvPI3XKmsw6pl14=;
	b=scMwtbGjPETLwyJCAenK+J7MsBvKYxDc+Oi8YCvP1d4gsN7Ffz5W4bduicy9OoSKwn
	NnHOQhIt0f27m105w9Btwzm4QAwrZ4BGXRGJGxZ1/qfe18xHRKRSI6cxP4nLqvwFwRGt
	4/bapDGOXO6bsdR2+SMdOEvMDxOgcQcDvLtngN8rwpV6c+jZdqyRwOrq38F1cGb4AHxO
	X9BSBmwxBu5hsHZb6FP8EyeiVRZ59tyzKmXPdf2ug144uMyGRq7rT57dyeCeqezTum7D
	/yIbvwI56NFT+7FDYI7BI1l0TnyZHUhUqKnSYZarn4gugs6v6Z9C5WXBJj7Xi4xYWaHu
	j8ug==
X-Received: by 10.194.104.197 with SMTP id gg5mr24366050wjb.26.1396372540419; 
	Tue, 01 Apr 2014 10:15:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm41855159eev.28.2014.04.01.10.15.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:53 +0200
Message-Id: <1396372434-10710-45-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 45/46] libbonoboui: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
index fbbe806..5db8a3f 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-inherit gnome pkgconfig gtk-doc
+inherit gnomebase pkgconfig gtk-doc
 
 PR = "r2"
 
-- 
1.9.1


