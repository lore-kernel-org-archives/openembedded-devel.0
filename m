Return-Path: <alistair23@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A34C7C4F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 06:08:00 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id e5so1193889plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 22:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jE8tXSEeAMC5s0FPVQ8e773EN8nP/taM7vCS5TAySF4=;
	b=EddyhJi0xMQa+RGzYAoSV4Sg9BcqL4tag4SXWk7vq2QQGUDtmgCF20WzsmpjbAb1Q2
	JWjRJw8ThkI2DhWHr+EG2BONcCbMRJ+BcMQcG+iksx+6+xEjzIxf+QgwLBj8NaOM3a4a
	nJBdv0SAyoVPspx+opMp0sQkpGGXuvvr6cSFhTADoRj4aCXSMZOAfjdBlP8B6P/K7GEN
	XpWuDuQrXU4iks75/hnuz7aNWbNcvo8CiCzIXYlx73+0BnIGOcZ4VOOtocJc2j1KiL3A
	wIsujw6mwOaLTNtJmOxVG82gCF9gAEYJQWwQRB24m1kIoHWnH4NNWa6gyHObqQpNunso
	2L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jE8tXSEeAMC5s0FPVQ8e773EN8nP/taM7vCS5TAySF4=;
	b=L0DF2RSFp/cDXLtuPkF6x+0p5gBr1Q1ujhZEqI/nfH4LJ8ompckRDEChqy/JWZk7HT
	q2gZJ/OOM/d2Z3cPGLhYZ9ZdMzNm37brzjQDiPLl75njiCCv3UxaKXkPGQNV/xD73ktW
	uw/ri6K8BCzfa8owtnrOlZsRy+nWIZv4Euls0G6e3qua4JZDpKpKTS5djUKNmTzD3+EG
	UYYaXDIZfJpT9az0+b+/ucbLGh8V3m5Y40n6G0lb/Z8jDLNUsFSTTDunpd2bkQtkfXEE
	pVL1QGiDpgEJpMkLLhoev++/M/HxrJEZheoQXeb02dccKesQEL5PwX58VM7BlBJQN1tN
	EogQ==
X-Gm-Message-State: AHQUAuZLLIoxFSn4IKhTXJanHCd6ZqliLFYrpVllVPYMd3+Ip2QLRowS
	CBAqUyQobJlKjB3tpcpyP+GcvuuR
X-Google-Smtp-Source: AHgI3IZEC8OaYhKy1A0u2p9ElR/NJBKItgMyomrOgtT3FphfTad7nA7EKP+dd9/y0qu+1Zurcz9+dg==
X-Received: by 2002:a17:902:28aa:: with SMTP id
	f39mr20968949plb.297.1549606081277; 
	Thu, 07 Feb 2019 22:08:01 -0800 (PST)
Received: from alistairs-fedora-xps14z.alistair23.me
	([2601:646:8e00:dca:3867:a4d:995f:259d])
	by smtp.gmail.com with ESMTPSA id
	e11sm1030562pgv.14.2019.02.07.22.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 22:08:00 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair@alistair23.me>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 22:07:58 -0800
Message-Id: <20190208060758.6171-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] vncx11: Fix dev package do_rootfs failure
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
X-List-Received-Date: Fri, 08 Feb 2019 06:08:00 -0000
Content-Transfer-Encoding: 8bit

When building the dev package I see these errors:
Collected errors:
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/rfbproto.h
        But that file is already provided by package  * libvncserver-dev
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/rfb.h
        But that file is already provided by package  * libvncserver-dev
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/rfbregion.h
        But that file is already provided by package  * libvncserver-dev
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/rfbconfig.h
        But that file is already provided by package  * libvncserver-dev
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/keysym.h
        But that file is already provided by package  * libvncserver-dev
 * check_data_file_clashes: Package x11vnc-dev wants to install file /home/alistair/oe-master/build/tmp-glibc/wor
k/sopine_a64-oe-linux/core-image-weston/1.0-r0/rootfs/usr/include/rfb/rfbclient.h
        But that file is already provided by package  * libvncserver-dev

as both libvncserver and x11vnx try to install the same files let's just
remove them from x11vnc.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index b047bc462..774d2c9cb 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -32,3 +32,7 @@ do_prepare_sources () {
     sed -i -e '/^# libtool.m4/q' ${S}/acinclude.m4
 }
 do_patch[postfuncs] += "do_prepare_sources"
+
+do_install_append() {
+    rm -rf ${D}/usr/include/rfb
+}
-- 
2.20.1


