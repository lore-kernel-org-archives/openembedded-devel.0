Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8DECE7F8DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so5834316wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7LAL7ZDGPD+hUgmHsRS+tvPZKbi8jEWMtL3SdvVLSps=;
	b=TSmF3rM8Mzp+fprZXsp512J8PxuuuX065gzGP6X2PNDJeXMn4fcB7710S5jnG/RUUP
	Vj2l+Bq5vImb4SIJFYsnXSn7MrWaTPRMZSB5UjvOPfu1VyzLFEepsEOGxDDnOE4cbRcn
	kPROAHpo3Yx5R4x7zXhj3NaxYI5zr7/oSOV18/AdhDsRU0sc8l5MVuiCYlCCvTKQazSd
	N4QPiQo8Lr10uZzNw81HPOoveHAZPnU1CzNOVMfPZPlYK1DE09kzDjefi137pN2mcwZ7
	U5a08LuONeRrlTJ59X7coZdjTp0RBnK+V83l9EUlDZfUx/t3aT+s6co9AFU/8cDUDPHR
	W0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7LAL7ZDGPD+hUgmHsRS+tvPZKbi8jEWMtL3SdvVLSps=;
	b=MtSMmIkPgMX26R0q79VqvYkFfZw6oiAz3aMAP48xDqkvZKwRfQmij3GoDUAkN/YNi1
	QbA5PTRmiDusqER95V10M89tj5GPfe6XbmPo5pMBBdFnNWv506OgGgUT7dZGPntawmFZ
	wgTdeRPSq9MNhtzQGdq3c0u7DmXpui7gLmhiKcUC/Dvc0z2GweoPdJmof9e2g2166zgv
	9ROqFLmKHNsEqqEEOA2c8WYfPlkSVNY3AQ3gk8L1LAPd4nptsTR2npZPKOidNQTpT901
	gkGclWSgdfy4NrkQA57AQ4OZ4vU0rYMGD82u1M0dbswpqombozN7DBGDhTyXi2UYwARS
	U5rw==
X-Gm-Message-State: APjAAAXac5dgZZMXd7NmObg8pGGVGokgHzwmSpifzQFAVXwFge/qg+0N
	oDORyiBuTdzgUJ5vPA8k/rmWVUqd
X-Google-Smtp-Source: APXvYqwFS92wFx0lJQwt8PSoKMKBgH7Ea93Hqvpt0q7Ll5xdcJyWUbsl/ycD3ojGVezshBnyi8B+qg==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr941113wrn.50.1575590965033;
	Thu, 05 Dec 2019 16:09:25 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:08:52 +0100
Message-Id: <20191206000912.19841-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/21] pinpoint: remove dead project
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-apps/pinpoint/pinpoint_git.bb     | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb

diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
deleted file mode 100644
index 6b2688f3e..000000000
--- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A simple presentation tool for hackers"
-DESCRIPTION = "Pinpoint is a simple presentation tool that hopes to avoid audience death \
-               by bullet point and instead encourage presentations containing beautiful \
-               images and small amounts of concise text in slides."
-SECTION = "x11/multimedia"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://pinpoint.c;beginline=6;endline=17;md5=201d438283607da393fae6aca085454c"
-
-DEPENDS = "glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
-
-inherit autotools gettext pkgconfig features_check
-
-# cogl requires opengl
-REQUIRED_DISTRO_FEATURES = "opengl"
-
-SRC_URI = "git://git.gnome.org/pinpoint"
-
-SRCREV = "80a056c57e819d0b75035424638813b0670830e1"
-PV = "0.1.4+gitr${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-RRECOMMENDS_${PN} = "gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-png"
-- 
2.21.0


