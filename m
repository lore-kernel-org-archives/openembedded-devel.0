Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8958277F9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 19:17:18 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id h4so9101783lfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rAlXpOC78Srp1UqNg5CuyFlZeIet550zJ4acQ6+diAA=;
	b=g6qOZD29yNWCQt5yoogJybGbbgCy+gh1dvX1DqgfrYA0JfgUliij24oR4LPqhF4xxY
	7SN3wfe6m8Gn77BobPdF1HAUYtd+qQa7zMt6cyiV9RZDOdWNARv3fcjjbKlyhsdcg4Qn
	vd6IDdUSvRou+75wAhIj2bpqc5RmDdbbQ+83Y5FLrDD6J4SKT/UplYVJfz/n+p702csF
	UzQcFzVvFxfHLy9TDidqlfEsxeN7jt6ijhlIbLxVYNMcG/SOm8WbPee0a0+ntjXf3fFe
	BvZXIE8KuMEKUjYVSTQKGkm+55IqoZxei2PWdgJYY4fPcLp5YAwuJz8PRaq+gWrwy3t9
	97eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rAlXpOC78Srp1UqNg5CuyFlZeIet550zJ4acQ6+diAA=;
	b=J19CGO0BuCTrfFxW640dFzq1zYwI7BI8CeyHB0Vz5OwZdzydnJzywtywceC7JlQa9r
	FUQL0WGp8oaWny9TFpsIw9BglV9FfPKnvqfDqsQxw27ecQ1A+3c9+BMjP2MUUYn+G0MQ
	hETV6kxDvWeHLWOah0BZLoGCSHwAjTtGdPnFvBM+FxkA6N3JqDS4kELXUtKrECRnB5Lc
	hH5gho9c4N4hkdc3qop9YF8qivd4X7/r/pfsi6e6pI5ZiybWFpJ6sBmZMlvAuoyKt9JI
	an8zdS4r2NXZA+ZGqgv2IkI1/E9YHTRxkZ0ilFZaDbhhqf/W/P5QMbJa0e+Fx5eoVQ3Z
	LPcw==
X-Gm-Message-State: AODbwcAQjmkvx9GjWHZw9ctIVonDUESZGsBAt7HBrTd4ncoa6wmkjQUG
	iH5kIa3r7AbIDQ==
X-Received: by 10.25.22.209 with SMTP id 78mr7808709lfw.17.1495567039862;
	Tue, 23 May 2017 12:17:19 -0700 (PDT)
Received: from localhost.localdomain ([93.75.94.160])
	by smtp.gmail.com with ESMTPSA id w69sm329679lff.45.2017.05.23.12.17.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 May 2017 12:17:19 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 May 2017 22:17:11 +0300
Message-Id: <1495567031-12494-1-git-send-email-maryan.pricak@gmail.com>
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
X-List-Received-Date: Tue, 23 May 2017 19:17:21 -0000

libteam is a library for controlling team network device.
Provides utils package for network device configuration.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 meta-oe/recipes-support/libteam/libteam_1.26.bb | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb

diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.26.bb
new file mode 100644
index 0000000..f4a4572
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam_1.26.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Library for controlling team network device"
+HOMEPAGE = "http://www.libteam.org/"
+SECTION = "libs/network"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libnl libdaemon jansson"
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
+PACKAGES += "${PN}-dctl ${PN}-utils"
+FILES_${PN}-dctl = "${libdir}/libteamdctl.so.* \
+"
+FILES_${PN}-utils = "${bindir}/bond2team \
+                     ${bindir}/teamd \
+                     ${bindir}/teamdctl \
+                     ${bindir}/teamnl \
+"
+
+RDEPENDS_${PN}-utils = "bash"
+
-- 
2.7.4


