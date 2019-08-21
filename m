Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD1F6D494
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 12:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46D6ds0wqDz3P
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 14:38:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566391105;
	bh=k7/6wapQNDmX8/e/MqiZ10D5drtzoa6NcvI6Ufrm28E=;
	h=From:To:Subject:Date:From;
	b=sOYLEvoGPkZlPFKClSGVI4pLyC2vYENRMYyx3M73mxj4fX/YsSvDkfHXUt7OpPkkX
	IMReQiB3eMl1WO3wgZLp01LGEltEysel8wpVqNJMXsHD+JpUAwe26cPaRpoX7Eb7zn
	lucgc9pgavGVYtdK2jvH6dqlM7V4yMUwgabf7K3+WohAkH5DWV4lwPb+RviDInbWT4
	H1FEcoLC5c+PVWWHfTbSevcWwBE1KAAJM3T7PohI9w4AWlJ0vIRUhysaVrBrSVWL+R
	HGtHU7gI7BbmrbsZkdXwNgzDwvENLVD4W7p14EesdgLBS1OBAiGM9QeiIwlaUjAHsw
	+dGjiOsCpf6qx1KGlFZcs59/aDoF6OjCn9I22CG+qry3Pe95+WNqZp91btExfGk9UA
	esR74qG9y2lWo67ly6Y0nTMNkO6IhLAOnr7X9hP2h9ZWBixdXDuWyewt03n4BahB75
	EvZEY1zNlSH0pRZcsDIGJHDTNpicVFvIb+SMIg8AP/ac8LWd6VHVzBJefXNX5l/edm
	bHGtDNRfI2JfOguDGIp8cc+Jh7p6HsMDrDXiq8hhYB2cQ1Yw2N2K9NwXSG33GhxoDV
	ZbLDrg2MiJ+9WxgFt9d9VkctyBXGHzJJuzV3FRycHDTKulCl14p4DPjBr32qMpNJc4
	CCbNiLg3IKaFvktSG3DXYGNQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 15:38:24 +0300
Message-Id: <20190821123824.17831-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Wed, 21 Aug 2019 12:38:25 -0000

Remove a generated file with always changing hash from LIC_FILES_CHKSUM.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.0.bb => networkmanager_1.18.2.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
index 9ce2d961d..b760a40c3 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
@@ -5,7 +5,6 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=233931303ef80eded167add1f60a50c1 \
 "
 
 DEPENDS = " \
@@ -31,8 +30,8 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-SRC_URI[md5sum] = "c8c27116a8083bab5d5fcca0d03e988a"
-SRC_URI[sha256sum] = "c6e8df25e5a3c7309bc17664be8971689314884cdd08afdd6b0847d29d2a8ba6"
+SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
+SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
 
 UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/NetworkManager/1.16/"
 UPSTREAM_CHECK_REGEX = "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar.xz"
-- 
2.17.1


