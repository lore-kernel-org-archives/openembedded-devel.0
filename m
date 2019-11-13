Return-Path: <denis@denix.org>
X-Greylist: delayed 514 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Nov 2019 04:23:12 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 247F47DE36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5EB2240BF4;
	Wed, 13 Nov 2019 04:14:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oMjIQk13IvRJ; Wed, 13 Nov 2019 04:14:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3743940BC0;
	Wed, 13 Nov 2019 04:14:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 55CB21742EA;
	Tue, 12 Nov 2019 23:14:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Nov 2019 23:14:37 -0500
Message-Id: <1573618477-12608-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [meta-networking][PATCH] mbedtls: upgrade 2.16.2 -> 2.16.3
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
X-List-Received-Date: Wed, 13 Nov 2019 04:23:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Mbed TLS 2.16.3 is a maintenance release of the Mbed TLS 2.16 branch, and
  provides bug fixes and minor enhancements.

https://github.com/ARMmbed/mbedtls/releases/tag/mbedtls-2.16.3

Most importantly, this fixes breakage on ARMv5TE platforms:

* Fix the build on ARMv5TE in ARM mode to not use assembly instructions that
  are only available in Thumb mode.

https://github.com/ARMmbed/mbedtls/pull/2169

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../mbedtls/{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.2.bb => mbedtls_2.16.3.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
index b0bd942..79d0dbe 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.3.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
 SECTION = "libs"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "37cdec398ae9ebdd4640df74af893c95"
-SRC_URI[sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
+SRC_URI[md5sum] = "90ce7c7a001d2514410280706b3ab1a7"
+SRC_URI[sha256sum] = "ec1bee6d82090ed6ea2690784ea4b294ab576a65d428da9fe8750f932d2da661"
 
 inherit cmake
 
-- 
2.7.4


