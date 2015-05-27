Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 424957422D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:49:33 +0000 (UTC)
Received: by wifw1 with SMTP id w1so17047191wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RS1oxsN2Z5CgEBA18ISx0mrPhlAlt+Go/4s5nvog88A=;
	b=zJ2WLS/I3/MVLhrxltDtR4aoUYlHaBSZ78iSd4xFHqIdz4DCqlENmanyA+YG2VbGMx
	B4LtQdxQMlAyioAfUK3bgxHucilnDOCYJp1yAP2TDZb5+uZPFj42xwrTwy7z0wOq6CIq
	YuwVwfgT7wn2fG+OGkGEe7QX6DCMaX9Ec4eCtQ7WWjHnbHAwkN+FuSfcC/ZKgpqEP0P0
	RdwgtYJx+7ezgrhJ0P6cCLCc3pbQntDdoji8ZQPJIGvlUh8t0ozlbloiwhcC2MjgS1E0
	GkPsaGn1spM9i2Wpj5NnFxKMio3UaP6ZNDaQDV1DiDFISaWAQ8B5iCh3CvjNEcyClZKJ
	R0VA==
X-Received: by 10.180.105.129 with SMTP id gm1mr25200408wib.51.1432723774656; 
	Wed, 27 May 2015 03:49:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id hn7sm3030824wib.5.2015.05.27.03.49.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 May 2015 03:49:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 May 2015 12:49:49 +0200
Message-Id: <1432723789-27056-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
Subject: [meta-gnome][PATCH] pinpoint: use clutter-gst-3.0
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
X-List-Received-Date: Wed, 27 May 2015 10:49:34 -0000

* clutter-gst-1.0 was removed from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
index 2b85ff4..80fdbf7 100644
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
 
-DEPENDS = "gnome-common glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-1.0"
+DEPENDS = "gnome-common glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0"
 
 inherit autotools gettext pkgconfig
 
-- 
2.4.1


