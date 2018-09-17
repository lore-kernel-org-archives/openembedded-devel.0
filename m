Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60AB6796A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:57:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HFvot4016078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:57:50 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:57:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:22 +0800
Message-ID: <5ed8db754e1c9bcc847fef8394964fde46b9e770.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/19] v4l-utils: split one dpg package
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
X-List-Received-Date: Mon, 17 Sep 2018 15:57:49 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index 57cfb13..3bcbed8 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -31,7 +31,9 @@ EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/ud
 
 VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
 
-PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dbg libv4l-dev"
+PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev"
+
+RPROVIDES_${PN}-dbg += "libv4l-dbg"
 
 FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
 
@@ -46,7 +48,6 @@ FILES_libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv
                  ${libdir}/libdvbv5*${SOLIBS} \
                  ${libdir}/libv4l/*-decomp"
 
-FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
                      ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-- 
2.7.4


