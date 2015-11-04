Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id A7BA777115
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:30 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so54571837wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=DLZh/KCR5avAnwghvfdnDH+zIwCfz6c9eECccvddxJc=;
	b=XsbchIBWwCgM3GlVmrsTUBtolrHJbSDtRv4aEpFaVQZMQxF9Iu0duodTur5sayghvH
	xsJV7JYOHtouCGmL7WoI3v3GV5Tg1q6OP4W6ca3p7l6gGSpigLR6JPpGllnumjuxyGKn
	lpzegWmhTYLLlNfc0SgsB2mtkMY5azFLUkYxhz4F/Id5XPTQxi+/gu/jkaEjfXJr5LCE
	PMgXYXvA0Ef7XElO/d/KX/z5rn6EyFjRSQIAdKx3qYE31EHjlftz1Q/rw/1SXO4UmupU
	iwSktkelSKCfnVwP91EjUP4Q/DOC/XyYm/8/VKqvhmsb2dt0Hd4yCChFDZa8AoRXmfOr
	kipw==
X-Received: by 10.28.6.70 with SMTP id 67mr6773028wmg.54.1446680670787;
	Wed, 04 Nov 2015 15:44:30 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:56 +0100
Message-Id: <1446680640-31722-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 14/18] xfce4-whiskermenu-plugin: update to 1.5.1
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...kermenu-plugin_git.bb => xfce4-whiskermenu-plugin_1.5.1.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_git.bb => xfce4-whiskermenu-plugin_1.5.1.bb} (54%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb
similarity index 54%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb
index 6af38de..22b8762 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.1.bb
@@ -5,10 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI = " \
-    git://git.xfce.org/panel-plugins/xfce4-whiskermenu-plugin \
-"
-
-SRCREV = "2d3c03eacd78051d2ef8ee3b6a4e2bff4753680e"
-PV = "1.5.0+gitr${SRCPV}"
-S = "${WORKDIR}/git"
+SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
+SRC_URI[md5sum] = "4886fca2b485dae0e6a64c78f9dca94e"
+SRC_URI[sha256sum] = "1c7650562322867513370ab575536b67aa3712329bb60a0c91a0a70e23a8945a"
-- 
2.1.0


