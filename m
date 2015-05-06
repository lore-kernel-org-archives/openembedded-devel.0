Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB6D73EC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 16:11:20 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so128861860wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=dLKU0mXGkafXGL/B8gAnEekUCqksHP2CETfKX7+0Fyc=;
	b=HD5ry3Hw+XOXRB6/MYNkdP65weTziOxCr4t+mjEHOTE9NBzrUI3Q7II10fkLlz5/13
	BlA+W0JwYzLbj/pLw15zRz62QAD55E33dT50gB4VjHI0/XMOHdJ8A4NPlEtVSW46koik
	niNPd4I9wEzXxNIaxtw0ukRacotLAFD6UX5Zga+IT4XAqEkRpNqXIDcoxqkAEr0AxBqX
	8C2X2xqZnMdJvSE1BAaflMGO8bokfoMjx3rQWk2eDRanrsKaFYtMRm3F/G4ncR1BSS7t
	R7QdSZ9Pyk689+J7fbjNn7Vh/QdChSpBQVOQdpWXsr6r+9+p2+wwC1YbqTtrbh7BowN5
	uDfw==
X-Received: by 10.194.179.2 with SMTP id dc2mr54050580wjc.120.1430928681605;
	Wed, 06 May 2015 09:11:21 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id k9sm2846567wia.6.2015.05.06.09.11.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 09:11:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2015 18:10:41 +0200
Message-Id: <1430928646-2007-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] xfce4-power-manager: update to 1.4.4
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
X-List-Received-Date: Wed, 06 May 2015 16:11:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-power-manager_1.4.3.bb => xfce4-power-manager_1.4.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.3.bb => xfce4-power-manager_1.4.4.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index 496b3fd..623b2ed 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -10,8 +10,8 @@ inherit xfce
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel"
 
-SRC_URI[md5sum] = "caa17bfd96c0879e7bcc7432896fad52"
-SRC_URI[sha256sum] = "018e11dd315745f582d70108b6071d37fb94854fde70961e17325bc19c4e2011"
+SRC_URI[md5sum] = "e7d00548e58bf19229e727818184c1e0"
+SRC_URI[sha256sum] = "c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
-- 
1.9.3


