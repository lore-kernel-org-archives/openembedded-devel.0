Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8306023B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNlv62mHz4n
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:46:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317980;
	bh=UbLm3dsWRLOlRoEJxa/Qd4e5RgI+IwA2xF/9YjOLkb8=;
	h=From:To:Subject:Date:From;
	b=EZndghws5DGxSOXXGI1xa1uyzEDtjVpGyW189AyyuTSVJMrqSC63tVGVaT9unwOCh
	FSopi6GsQFAaRKLtUYh3qWZHgNWEMMZ7Z7axM+tye6nlSS/+/TFC5Q25Gw5Kn3XEve
	SYdW/uKK2ImaKkhJoH4ggA3wSu3f8LvoKAO3eWwSdWww5vXD/iysglgxUZrx4SAgQs
	x7i1APxuZzGlenQmcz++ta6oxm7s+8cm4Q8ySEFERlzOGCBsZO3cMlQqKFPi8xjULd
	//vCMgH5cDYUfIz505k1F6mQWTIBWe2C9RRtvTTpkmog3P0+7tYNOewOJ5+B5aPE0x
	talgXm5W1SsPQc4mim5G65RV5LlvJfO96gFHpKbL+q6VJBh3RsTGLxtJqw6HsQr55b
	+TKonWj7igxanQZfe7qNpbuf9jB4VfrYCRAkLHyjHbnc+zR7wA+VlezCl9cDLLA+Qb
	MzAGQgYLjWQoUPUumR/rN5vFtQoeMrvQ6eSbxlgDzVulizbBiII1k6Y0RFZKVjsH1M
	tQVxCC7SZUa+14puo0pgn2D1gvBz8TKk+7b64rAU03WMuanPuIS+YgutNa8eCSqxbt
	z1PX5Mn8mXd9xNnHDu/eAwj3tNeCDEkaGkqYBIw0TqiIj8Gc+Lf3UyAA2tgH4GYUyA
	3ubfDo2Z0IjukVQ4YNMdWLl4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:46:17 +0200
Message-Id: <20200221204617.13912-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] libqmi: Upgrade 1.22.2 -> 1.22.6
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
X-List-Received-Date: Fri, 21 Feb 2020 20:46:19 -0000

Upgrade on the 1.22 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libqmi/{libqmi_1.22.2.bb => libqmi_1.22.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.22.2.bb => libqmi_1.22.6.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
index da13286b4..af56061fa 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.6.bb
@@ -14,8 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "3fd831c1b0de4a4432be628432a960ff"
-SRC_URI[sha256sum] = "f1f1e514a89b1dcba05cf7274895e7301a2da4c947b7c2f17acb84fc74038227"
+SRC_URI[md5sum] = "bea205242b438d3540b523fed245746f"
+SRC_URI[sha256sum] = "755bbea2a330ac16d56678fbcdd09201ddb14779059ecc895edfac388551d5de"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1


