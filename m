Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 99090605A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 22:24:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a32so63546pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Djr7bchmR3sXD3EmGc/djsh54Vlr3ysoNDNvrWUt8Fo=;
	b=V+TgAa1PdoHUjh/KCtTGWAj/0zZp+d1kIDCaWfaoNlc6QdTv3R6keYN/G2mGjEtSn1
	amri4GYyUB0hBQCeVjWMi5YyJboWQGJ3f/+hh5fC0F/eIwaBoOT7NtM+O4hX4g6+80Mf
	nVEhOONpzZ4lc3yhwx2cAE1DSmT0cytZS0VryquXQa6EpF+GH1Yb1P5Gp9/fAxYpUMtz
	h7O7gX6RYWE0lcRdd7TDYBHbF3QtmqmtzdG0HNZeJmkzW/J34svEsgg+v5+XII89alWK
	9XDQFKcUO5OlXoj9QjN3ndV17iKRBPgoaF+WHl1XyLqnTThQytf0+c2b07Z2e07+871o
	M/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Djr7bchmR3sXD3EmGc/djsh54Vlr3ysoNDNvrWUt8Fo=;
	b=Je+/uw+6sihTEYoz70j4VojV6KekjXo4Qf4NfU/Sypbrkw3HG/TMNY7di6fsKwqgRS
	yAXsKOxixOjhFevKr30+5WUQHM5Ktoh5A7kj7cfFQW5bzV2RPQnTcF2wVjtoxeu0txZp
	mHpJYQ7TckLvBUaAkZ558SZlO5b4YqnKjtpPDOekID8iQM+ErzDhD+eauIgu0vHvBENg
	19WuHyks0Oz98gfJv4SEqYWPcOlXnDaG4qq9IQ/WpEoYfdu40RULIaBx+fhFucYytzCj
	RT+CgFj5alOv7QEIBiMFqBZmGgskVRDyWINz1N++c3evLVhhU+f1derX9JOxW+AZGGRK
	hRog==
X-Gm-Message-State: ANhLgQ08RAwHagCAwgQEpGPtvyz/deLG+HVSsNyHoE2PB75eESlZs1NX
	WZz2xJWQMwVRObWMyDaMe87aQEH3IL4=
X-Google-Smtp-Source: ADFU+vsWLpxNYy/KRS1qWOWfQCyALAYEr9OI+xp9TVewJQnwSU1A1KrMameVbLuvrKGfkyNdLV5ywg==
X-Received: by 2002:a63:8ec9:: with SMTP id k192mr6840374pge.293.1584570288900;
	Wed, 18 Mar 2020 15:24:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id j4sm53604pfg.133.2020.03.18.15.24.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 15:24:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 15:24:59 -0700
Message-Id: <20200318222500.3249882-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libyui-ncurses: Fix multilib build
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
X-List-Received-Date: Wed, 18 Mar 2020 22:24:48 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
index dae5c342de..1a376a4697 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.52.0.bb
@@ -25,8 +25,10 @@ do_configure_prepend () {
     git checkout bootstrap.sh
     sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" bootstrap.sh
     ./bootstrap.sh
-    mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
-    cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
+    if [ -e ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so ]; then
+        mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
+        cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
+    fi
     cd -
     sed -i -e "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
     sed -i -e "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
-- 
2.25.2


