Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3433C60034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:20 +0000 (UTC)
Received: by wggv3 with SMTP id v3so27019886wgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=1CsoRVa3LnARINMkdtfBAO9k/jvgdxAMMuxJaSFqrTE=;
	b=vCuJU+vuIc5pq0rj87pGOuAuYuFYWoukF2mdtp0VJXqdD4uy9nvGLkQuJ06unGsnSn
	s5oaOejPC2gcVh+gZWT7GQ36qe4OwPSZSpJwPC/AYOV6FNNXHrSaVfHO7ABv/8MB9qIs
	MCuCtzH2e87wv+bAxFcRPhHb8Yyb9QSb9zCIQODmAYYC/n8BKlgu4oO5RC4ccoHMeEE6
	FNYWyMChWRQqKJ6qrmRwKg4NPXGHKCRmD1IKUwUGK/JGV4jCmXmikiS5fuTw2wO2MA4e
	xP4IkqXNjN+v7BbYf9pmbnDFXgHWKOYLZaeG3HVPuQuo1PEPs2Ufr2vJ6nXv1yyeJZJH
	kmIQ==
X-Received: by 10.180.82.40 with SMTP id f8mr115865672wiy.60.1426462461641;
	Sun, 15 Mar 2015 16:34:21 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:29 +0100
Message-Id: <1426462419-10173-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 20/30] xfce4-fsguard-plugin: update to 1.0.2
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-fsguard-plugin_1.0.1.bb => xfce4-fsguard-plugin_1.0.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.0.1.bb => xfce4-fsguard-plugin_1.0.2.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb
index 1446115..0f9199d 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "9c179371475e2837004cc208026e30c1"
-SRC_URI[sha256sum] = "fffb7ee09769ec0b991b8752b848578e6434a675a939c5588f0728c2ef33aab7"
+SRC_URI[md5sum] = "db7741d1827e428b005e94d25e2ec00a"
+SRC_URI[sha256sum] = "a2c8d59386ae3d23cf6bdd06a1cdd7a1b9473cf6f38ae106600b194c601040ae"
-- 
1.9.3


