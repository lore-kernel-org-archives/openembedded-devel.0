Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6717FE50
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 05:53:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47fHwL4Tn3zCL
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 06:53:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576821186;
	bh=1SGjgsaCKO0sEtAkGGyRA/Tjqg/EFxCseTWD7ySJJMw=;
	h=From:To:Subject:Date:From;
	b=CH9CfeMVntik/CkhNUzxDoFPhBUs959eT2El88OFFJ0jplHez+tpZazoBh6QWIbCd
	qUPrAh5WuheVCaZpdCjJsBy9jl5VhWejaXRdsF8WCgUg+05n22l3XiIxaRyK4FPv3Z
	0TqanpYcz3EP4U3e13n3czr6/bSxz/LguMIYg+QKcYSdlEEIRh1CfxnQzR9x6T1wjB
	4KN3xYOTqcFAdFY0Z4K1GKCYgHDujpD9pe7aMwvGofJ7p74CM/YVOck8D7+K+I9NAL
	saP1qChRCSPVgJBGtuVa0zUwvuG2+DkcsaJwQcaawEnTc2d8rN8PCuBY/FHpNXCigg
	4Y59cTVDIvp4Lu2HozlLh/mRW7/bXcEZT8fkSQQb6DH9St2hjjZzfiCvM2GazL7lxD
	pQ3329YLSfhyCsY1dCZNaXPkQnIhUixx7NLGuStEMBWcwXhSCiyVKU5LOw8oApHipl
	FEbiPayPKNdieDTMZzz6TCzLbwm0gj/Nhe8gCRx/hTbFc1reA+Ct8FO+QXuMmeb7AM
	5xfBo8We6xiz4GA0n2YoXo1/GV/4W/ZLcwr+v6FbcgVUscCs+RNnZWqpsbS+SnWD1s
	G/GyAKba0DgpvCFs25ngQHNcl1SnzX6fcW9O481CUxt5UHK/Y5kier8fLMXkVsfhiL
	vp0L6fk3PZe4SR5OLqWTpVis=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 07:53:05 +0200
Message-Id: <20191220055305.13133-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] libqmi: Upgrade 1.24.0 -> 1.24.2
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
X-List-Received-Date: Fri, 20 Dec 2019 05:53:08 -0000

This is a bugfix release on the 1.24 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.0.bb => libqmi_1.24.2.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
index 9b89e1dd8..35a58d2f1 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.2.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "4b181c0a8b933226ce3dce09565fe8f8"
-SRC_URI[sha256sum] = "aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79"
+SRC_URI[md5sum] = "e49c419112d708b5301af7ccc2c090ff"
+SRC_URI[sha256sum] = "4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


