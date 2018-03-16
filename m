Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44108788CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 09:00:22 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g13-v6so3253880lfe.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bXbeJpX3qE2g2APpyXHW4Df1nQYXKUwo/iu/GhExKnA=;
	b=cz0VO0tPRcPteIiF45KBrj/vvyGGhxiDnC6g6auzV4qhZeqswToXvDNPv38ur8fsKU
	wCQutICM+pRyHvViFNGYicMbxSmFEZFa0Ftp1Pk8TpbG705Gsyezym7Ohz6EgyRaXB1Z
	QFf4wr71pEcMEhwKXLWTPy4JZ+/BKfcaOIHD06AEhrzP9jeFYwUaB54zwX0P8L8Vgw+i
	x+s5f97OyxOOFuGnmYazWA51aHLMKrACRn1TEqU2u1TkiY9XSuy3+ggNsEdJzZvcbDIE
	K0uYHgUpw2zWaB/cKTbMgv/O+axY4EUiwkvKaLqXgxFh3gBZstc5gNJbJQmfBFvOeF9H
	uCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXbeJpX3qE2g2APpyXHW4Df1nQYXKUwo/iu/GhExKnA=;
	b=Gvl0+ZcagqNTFSYzjBg4FIRlcNE4KLcsQYKucaWSS+QbDIJQ93DHD30YdBYf26H6aC
	a+ow9i5L+cYcrvO0t9HQiAQBze5irKcFsX+GRjpLfC7013Ho4iT8n4rsZ2RXvi0agkjB
	M9EVMrRq8QiRtzvLZnhbluR+2u7m/X+Ivb+1kMT2iMR/trt87XzsD1/8S4M02lGUDdCd
	dditUMcW2iYGaypkaR7TPlzK9tkypIGPkFXDqonmssU/hC7ZVqG2TS8Tx1Phs+qDu/2Y
	ozhdFH4TeUPw6D/VFN/4qtqF4BCpqWA3MlbILNzmdWZE6EJBBknBpgZON6oJFYL3jFnV
	ahJA==
X-Gm-Message-State: AElRT7Gg1QshK/brm0YFdRicFxvxsMmqg2E0OCoPGbbKqDXCgwDIl8HH
	vGGbklyRCv2ytVchT8DHZHR1ZA==
X-Google-Smtp-Source: AG47ELtoNts7OaUfkshIYysSZsGmz4RhcCYGPWWj0gY/U9yZywR4NXhqF3Ed4hO2QwySpSnnWASyGA==
X-Received: by 10.46.62.8 with SMTP id l8mr771127lja.66.1521190821755;
	Fri, 16 Mar 2018 02:00:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.nomovok.info (auth.nomovok.info.
	[83.150.126.21]) by smtp.gmail.com with ESMTPSA id
	e8-v6sm314447lfc.88.2018.03.16.02.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Mar 2018 02:00:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Fri, 16 Mar 2018 10:00:09 +0100
Message-Id: <1521190809-26444-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-qt5] [PATCH] qtwayland: handle examples, tests PACKAGECONFIG
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
X-List-Received-Date: Fri, 16 Mar 2018 09:00:22 -0000

From: Ming Liu <liu.ming50@gmail.com>

The examples and tests parts of qtwayland are enabled by default even
they are not passed by QT_BUILD_PARTS, so we need special logic set
in qtwayland to explicitly disable them if they are not being chosen
in PACKAGECONFIG.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 91ffcd7..aece932 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -35,6 +35,9 @@ PACKAGECONFIG[wayland-brcm] = "-feature-wayland-brcm,-no-feature-wayland-brcm,vi
 PACKAGECONFIG[drm-egl-server] = "-feature-drm-egl-server,-no-feature-drm-egl-server,libdrm virtual/egl"
 PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature-libhybris-egl-server,libhybris"
 
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'examples', '', 'QT_BUILD_PARTS-=examples', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'tests', '', 'QT_BUILD_PARTS-=tests', d)}"
+
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 SRCREV = "db36bc0d9ccae21e84cd54be3e18ae539542eadc"
-- 
2.7.4


