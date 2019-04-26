Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id C211E7DCD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0431407DA;
	Fri, 26 Apr 2019 20:58:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 152iSgtV9m5a; Fri, 26 Apr 2019 20:58:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6FB340024;
	Fri, 26 Apr 2019 20:58:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 104F016E5E7;
	Fri, 26 Apr 2019 16:58:33 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2019 16:58:31 -0400
Message-Id: <1556312311-9218-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] v4l-utils: upgrade 1.16.0 -> 1.16.5
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
X-List-Received-Date: Fri, 26 Apr 2019 20:58:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Includes about 6 months of bug fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../v4l2apps/{v4l-utils_1.16.0.bb => v4l-utils_1.16.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.16.0.bb => v4l-utils_1.16.5.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb
rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb
index bcead00..4154468 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.16.5.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
            file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
            "
-SRC_URI[md5sum] = "21a6ec3605a1c3114c8ccb70a963c871"
-SRC_URI[sha256sum] = "f1b425584284bac378b76331c0671dc890bd7af49c03e8a6cc0c70e57eea0bad"
+SRC_URI[md5sum] = "de272817133c0dca000a78a5c8c8ec8b"
+SRC_URI[sha256sum] = "ed80242510385017a1dc566e17a285a77222bb301f5bc19386badfcc2c19df1b"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev"
 
-- 
2.7.4


