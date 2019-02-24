Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id D21EC7C92D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 06:23:25 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i130so3019005pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2019 22:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7kX2+uvpG507qki6vTSmWknfoFrSH5OoE0nUJZDBshE=;
	b=VQVxZ446FK8p54+bY0HrZuVUsUagUowea9CfcgQ3yTZiXNLHqMQSa5dhFghhZYls2A
	mXxb4+X5t6ai7Zf6rU6Cfs4KmR+8cb8DRmoRN8P8twoRuYucymPxJEVynRend1MfVnN8
	7qkR18U1WAPVRWM9enGJyAVCAbfbtJJvJwugKdqY4YO9+f/RMK0chgVDUKWhrVUa6/N9
	cdLBPpvWuuk45sr6aqvaeySk+RZYG4Zd43ysqLOqJbpn2YPd22dnnIm/by8s4j5XfKJF
	5SCYtJ3QVtggAnWrHjP1zqR+ayC5kEniv4ZGIZ0WCQYI9druH5iJRyviL2eKHgLrL3n1
	euww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7kX2+uvpG507qki6vTSmWknfoFrSH5OoE0nUJZDBshE=;
	b=YxsRBo134Cmj1YqgrjCa+bvgEwTaIgS8g5Ms9F109mVlNDHl8HtWRwUdX4aSQXLgH6
	QdVeM3RV/pIg6953FmmGPHurpdMyFIvbII3BElLzSLoNnf/YeBoBVo8W9zZm+JshpQwb
	8jgRIwIiOKUm6Upws2917ccMy9S6I0w2mZr/qDVUC7WhiiOqFaNNAOGG25uM1iK1+e3R
	GPAjI3id1bwYQt0UcfgwaoP7kvREC4di//tJhZQHQInrhNI9nv5V4eH0hYIbgxW3B4KJ
	XCmZpkfhD/DiKCnJC/eOvlYov+RhwMh68cnTcrf4WK7CJ/B/E81up6W2aSLmNRdqinag
	vxZg==
X-Gm-Message-State: AHQUAuZ4RtfnvPTPRVPLjh4sqH/sUyXspruKwDYmchE+aDkdxeipEWWI
	nFf1naubY5N2KoEEi6mtxqH4YuPVxHtOwg==
X-Google-Smtp-Source: AHgI3IaYmJbZkbrM0wKIykuYTKlN4rkjjfSmPQj5umdY5aEh3UeBM1ORIjdaO2zOAWop+s8S66X6dQ==
X-Received: by 2002:a65:6397:: with SMTP id h23mr11365932pgv.347.1550989406612;
	Sat, 23 Feb 2019 22:23:26 -0800 (PST)
Received: from localhost.localdomain ([128.242.105.20])
	by smtp.gmail.com with ESMTPSA id
	z1sm10011315pfi.155.2019.02.23.22.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Feb 2019 22:23:25 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Feb 2019 06:23:19 +0000
Message-Id: <1550989399-20227-1-git-send-email-tuanha@viosoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mscgen: add version 0.20
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
X-List-Received-Date: Sun, 24 Feb 2019 06:23:26 -0000

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/mscgen/mscgen_0.20.bb

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
new file mode 100644
index 0000000..6ead015
--- /dev/null
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Mscgen is a small program that parses Message Sequence Chart descriptions and produces PNG, SVG, EPS or server side image maps (ismaps) as the output."
+HOMEPAGE = "http://www.mcternan.me.uk/mscgen/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
+
+SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${PN}-src-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
+SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
+
+DEPENDS = "gd "
+
+inherit autotools gettext
+
+do_configure_prepend() {
+	sed -i "s#AC_PATH_PROG(GDLIB_CONFIG,gdlib-config)#AC_PATH_PROG([GDLIB_CONFIG],[gdlib-config], ,[${STAGING_BINDIR_CROSS}])#" ${S}/configure.ac
+}
-- 
2.7.4


