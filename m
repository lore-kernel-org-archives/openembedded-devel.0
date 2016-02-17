Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0226D60291
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 22:07:39 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b205so175391980wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2016 14:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=HuAmbhK7drH3FqOsxOFqTNzPDeWBka2RVieUXMljOQs=;
	b=Eq9hakxDEhZ7OGrmNsRf+d6tkJdVhJ4vYG90Wtc3SC+FfBzUYCD7xBebR50SUUlQy9
	K5y17BYyfmniEXTh1McZAlDJ449Scr35n8Qxw1vyqCA7TOjMQqYqCNUcvoEeNm6VhzvX
	C9n2OlySCllhqjouaVuVcnZ53ReWy3p7Q6MMjD07v9xqZxG6r+HqGMZpKWRSQBJYmPVr
	nqXDhoDduWkcpfp0hLve6Bss+CDU7DJUK8uZYzWHvlXsLASaPdnl8Xa1IjynEOUZq3q+
	+MYgcm+Pvjl+6cGe9aALPxz0p4JrI4emYMNmGfeV3o9+HZcQpg2J8AnzEr6Vq5ghS3DH
	/SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=HuAmbhK7drH3FqOsxOFqTNzPDeWBka2RVieUXMljOQs=;
	b=Sj9v1mBrVK6hl15cCFjFzrZAhvPgMFo7FIR5IKP1M1/Dbmg5ERx8sKVwhYb/6mGpZ9
	CYdk4lYVa3Np9ajWLitvN3ulzLvCSydNk762sqAGh1qg6pbOm4JB4l+wxCYGxYYxzbfb
	AdVyFwv2Hpanh24+O9otkASQy9iD+0Fy8Vstp6Qp/cNkYsOUv1km8C+izSksiCoVQ2q0
	/ffPBFf9/l0OUvr6lEn0U2seMeE14/4ujltsH7SIBG/Uq/Y5v2CBq5XaIEbgn6DKa0Ez
	qf1GZBeAImOXprynXff1XrgrRvuoSdpS0X6/p2Xu0oi/nSN2FzfW6wOs0i1O63w+vjOK
	pU+A==
X-Gm-Message-State: AG10YOT7yr1mmYafH7UtkvvgrTBacchHguW64g/q9VQ7D1p+yhoZjLApzWqEWgjYLpm18g==
X-Received: by 10.194.71.70 with SMTP id s6mr4110280wju.1.1455746859755;
	Wed, 17 Feb 2016 14:07:39 -0800 (PST)
Received: from localhost.localdomain (p5B0A38F8.dip0.t-ipconnect.de.
	[91.10.56.248]) by smtp.googlemail.com with ESMTPSA id
	lz5sm3517678wjb.5.2016.02.17.14.07.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Feb 2016 14:07:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Feb 2016 23:07:26 +0100
Message-Id: <1455746846-30648-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] xfce4-xkb-plugin: update to 0.7.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 22:07:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/{xfce4-xkb-plugin_0.7.0.bb => xfce4-xkb-plugin_0.7.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.7.0.bb => xfce4-xkb-plugin_0.7.1.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb
index 22ead2a..2fa1634 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.7.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "7fbc3d8c84d6662d819dd1803f0fee34"
-SRC_URI[sha256sum] = "28367c309863581ae4de529b35bdedf5a1c918096a9a2e6e771554cba7bf5a6a"
+SRC_URI[md5sum] = "2f68e0d53baf68ecc1a7165ad33c26a9"
+SRC_URI[sha256sum] = "61fe2e33fe99939d5d06a682e94e40e05ef844c930ad612154090d158b2ce681"
 
 DEPENDS += "libxklavier libwnck librsvg garcon"
 
-- 
2.5.0


