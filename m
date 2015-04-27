Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 88F3573C48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:46:03 +0000 (UTC)
Received: by wizk4 with SMTP id k4so111116026wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GAPcJitSHkta3D/r14HB/bpeKafrFUfY8BV5cZD4IB4=;
	b=aNfS+nj5cV4X8k0LQZrbLeA+O6S1mi5O3Uyz9TDVnKvZYCBJgLO66hPQhbhud+7M1R
	vdX0j/Bpq8CJV1nOY70Yv/sIaernXEOMlNKsK+x6xpHEn98B8xS5oWhUQChY+ghlRgrl
	YiKmT21JC2A5T4FDFrKtaU/egh2cvzzYzhXbY5ylAI7Sb0wbrymVeCyKFML6HzV14GHB
	cIT2G0OTvQR0y43z9mQGPmyiFeUqNXl7uI6lx2RzRCvzkV/Me9N+IQnv0EaTKaw4uXYd
	1J01DQOaNVmquizjaMr7UxwzFSEE/Sj/T3Gom+kvZDL8aXHF9g+dQgPGU0BsFA/mPS1B
	WxAw==
X-Received: by 10.180.78.65 with SMTP id z1mr23115904wiw.14.1430160365058;
	Mon, 27 Apr 2015 11:46:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	z12sm30585770wjw.39.2015.04.27.11.46.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:46:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:46:35 +0200
Message-Id: <1430160397-3334-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][fido][PATCH 1/3] libsecret: add missing dependency on intltool-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:46:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
index dca3350..06e94bd 100644
--- a/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
+++ b/meta-gnome/recipes-gnome/libsecret/libsecret_0.18.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt"
+DEPENDS = "glib-2.0 libgcrypt intltool-native"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.3.5


