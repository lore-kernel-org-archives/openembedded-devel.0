Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 322C777F38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 18:22:18 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id q24so3575419lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tZdBa388axMz0h6LWYRdIefrI0Z3E0NeOCNJaZAKQ04=;
	b=MR3jojnG0lCgIF/dsWtoEazk3xpOAfTfpyk37/zIs8J0MvE2hhyJ9wujlC+X4DBw6J
	ednykXkcFGaETXa9gOAWHpVS6Ikn6X3iRHXyVBIo0tLo4yCmwliz83uNEqqx0o0eswfA
	g1bGNmh8fBmmNrw7Zok6fepoVwK2TTJ0b6ePj5peB/NccVcLgm1rWSEGUp9IFtRcT2I/
	YyHT0o1/0BK3v7YqMadP7Tp600PMlaxg1M3ro43nSmZ3wej1OELLEVuF8f7ToBmVIX6q
	GqHRoeMJNmy1btZUjsHjH5wBIU88WSwf53y+YAmcjDWjXaKtiNbJwxNxxaO7ybZiN1Bo
	MSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tZdBa388axMz0h6LWYRdIefrI0Z3E0NeOCNJaZAKQ04=;
	b=aIWC8aWiGThb772tA4oA1AY5zHiTrd/26z2mYQzhsxcmJ7XMuqjBH+qx7TFUnBZmHb
	fXe3XfOKNZxBSMvf/6c6egCplakp+wI8S+XmYEbNs21+y0jkJMjAbX2jv/eJglaz0EbU
	mpup0YouChtJRox7lpW3SLK3zdCHfs4Si03HVSYBpxCh682xoFVrb4CDv6buS8/SkiNS
	Cf8kmdPZhtl/HV0NrDhmR4bCEfIHbxbUuzt0Q0cBngjRqRu5xjH9evfGk0bfzHNOFqmI
	6x/4DrHuaJEiz7GVceqqh3HazmdbYm7viPn4b6O2Px0nJJ/5Nx/Sinc5dlXQgSKm6hIf
	qHEA==
X-Gm-Message-State: AODbwcCZSLuSH7RHrbAI7k+9Sw84wlr37Yp8t7et5jm+ix579bBvci6b
	w8B5pFfI1CjDhQ==
X-Received: by 10.46.8.18 with SMTP id 18mr4863248lji.90.1495390939230;
	Sun, 21 May 2017 11:22:19 -0700 (PDT)
Received: from localhost.localdomain ([93.75.94.160])
	by smtp.gmail.com with ESMTPSA id u6sm2694403ljd.42.2017.05.21.11.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 May 2017 11:22:18 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 May 2017 21:21:59 +0300
Message-Id: <1495390919-25435-1-git-send-email-maryan.pricak@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libteam: Initial support
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
X-List-Received-Date: Sun, 21 May 2017 18:22:20 -0000

libteam is a library for controlling team network device.
Provides utils package for network device configuration.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 meta-oe/recipes-support/libteam/libteam_1.26.bb | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb

diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.26.bb
new file mode 100644
index 0000000..db1e4a9
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam_1.26.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Library for controlling team network device"
+HOMEPAGE = "http://www.libteam.org/"
+SECTION = "libs/network"
+
+PE = "1"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libnl libdaemon jansson"
+${PN}-utils_RDEPENDS = "bash"
+
+SRC_URI = "git://github.com/jpirko/libteam"
+SRCREV = "8c1cea00a21950089058e4e33ea1f7bf4deaddeb"
+
+SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
+SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES_${PN} = "${libdir}/libteam.so.*"
+
+PACKAGES += "${PN}dctl ${PN}-utils"
+FILES_${PN}dctl = "${libdir}/libteamdctl.so.* \
+"
+FILES_${PN}-utils = "${bindir}/bond2team \
+                     ${bindir}/teamd \
+                     ${bindir}/teamdctl \
+                     ${bindir}/teamnl \
+"
+
-- 
2.7.4


