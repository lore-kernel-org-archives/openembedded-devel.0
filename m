Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 138036D7A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 06:32:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j187so1654980wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w3Sdq05WU3uwo5M3P7Op2qfanX2U7YqEohCiITU4ByY=;
	b=FjUCORzbwwecqLMh+plo0PKrq9xMGwCwGU2BtJPJNEQPCZdaRFiJugBFtLvvhLFHXy
	yBop5o4x4jT8FHlJAib0wk/ri1iYnkdZtNFdcxsDxsytkQfQ/s0xNFfKJ7mQ5eVCfi+0
	ehhtRaCEJ7uB9zhSd/Nr8mayMs1CUArzsJ/GZR65/Rbkk1qS2+b+24+vrsW9eSGoWp5b
	uQ58TPi8PSVJk2Oc9Au0MpaRewA7omfU45LYFgUMgUkpe2I7MTM2rS+Dgw7hwKVUFoYZ
	o16YD08Q6fiuLffocEWTjhm5OdVvSn2Gg5I6GT4ENovVO8F3aOUixJ+CO1+ZODMRdydQ
	1N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w3Sdq05WU3uwo5M3P7Op2qfanX2U7YqEohCiITU4ByY=;
	b=fJsN8vTiwNX2bZv3FNBh4Nj7BFfgMcWbjYb5vzbCtuvPSUbD6HWZqD+dv8fAp0QpG3
	LxHtqGI+3Tvft1Qxze1vgIkrxViD3s6dZROqpZFH5fHSfVsA5vwEUvqJCxZz8GyYTgG4
	qljvIbd/z+2tPaOdj2syYLdGBLCOAk93a26BPeJfP6VtuHzJOdCBUPr2RuygB+qawb7A
	lpRma8vfdJFlNVG86cevZ9bqNuXMVrsCXQVt2Z4c3Te0nMHZw4UtkUtr2bXZJIhtluBS
	QpCL+ujqTDR4w53XNn9P1CsXG6KCAv8o2zthTcSTul9bFavwLdIUiUMPiftVtGoUHIpg
	Le9A==
X-Gm-Message-State: APjAAAVquhUQkTvyzX3jA2eDOa0Q7Zz5MpI7u2TX7cLWjK7l85B+9loD
	bKMLhN7z93dUk5fiTyMw2KofdG7aVxY=
X-Google-Smtp-Source: APXvYqy7Bkrrv38GQp8DmJ0BkK/WzFcuA6jz6kva82+an4eCrqj80io5IcEAGNVKu2ZA2A7XqiAqPA==
X-Received: by 2002:a1c:f504:: with SMTP id t4mr1585074wmh.121.1557297122448; 
	Tue, 07 May 2019 23:32:02 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0B31751CB5D2150A46C45C.dip0.t-ipconnect.de.
	[2003:f0:7f0b:3175:1cb5:d215:a46:c45c])
	by smtp.gmail.com with ESMTPSA id
	k206sm5637499wmk.16.2019.05.07.23.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 23:32:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 08:31:51 +0200
Message-Id: <20190508063154.10299-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] xfce4-session: get rid of machine-host
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
X-List-Received-Date: Wed, 08 May 2019 06:32:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OE-Core's base-file does add hostname to hosts since:

commit 31e6d08f20a804fccb958e19045d8f9e9806071a
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Tue Jan 8 17:12:52 2019 +0800

    netbase/base-files: move /etc/hosts from netbase to base-files

    Move /etc/hosts to base-files, and also add entry to it according
    to hostname setting. This fixes the problem of commands like
    `hostname -f' failing due to lack of such entry.

    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/conf/layer.conf                       |  4 ----
 .../recipes-xfce/xfce4-session/machine-host.bb  | 17 -----------------
 .../xfce4-session/xfce4-session_4.13.1.bb       |  2 --
 3 files changed, 23 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/machine-host.bb

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index fd7f9b541..da07f8e16 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -20,7 +20,3 @@ LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
 LAYERSERIES_COMPAT_xfce-layer = "thud warrior"
-
-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-  xfce4-session->machine-host \
-"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb b/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
deleted file mode 100644
index c79197445..000000000
--- a/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Meta package adding machine name to known hosts"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-ALLOW_EMPTY_${PN} = "1"
-
-LOCALHOSTMACHINE = "127.0.0.1    ${MACHINE}"
-
-# on some machines starting applications as xfce4-terminal take ages without
-# machine name in hosts
-pkg_postinst_${PN} () {
-if ! grep -q '${LOCALHOSTMACHINE}' $D/etc/hosts ; then
-    echo '${LOCALHOSTMACHINE}' >> $D/etc/hosts
-fi
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
index b11aaa4fe..f09af5b79 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.13.1.bb
@@ -30,5 +30,3 @@ FILES_${PN} += " \
 FILES_${PN} += " \
     ${libdir}/xfce4/session/splash-engines/*.la \
 "
-
-RDEPENDS_${PN} += "machine-host"
-- 
2.20.1


