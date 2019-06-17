Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 94A476C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 07:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45S39l4nyhz2C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 09:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560757419;
	bh=D/Y9R2WnHRHXd9Ai37l8MnbsPLjhXH56sBsSSc8D6Ac=;
	h=From:To:Subject:Date:From;
	b=N3D7KphB0uSOFVDX/+rTTy7G49e9FOMqkRJ6263atye6BT1EsHz+J9jCTAh4Dcbww
	Ry+vVJHNJdIk7rvq+zHvk4DyfF8MHDuE+vK5nzubNdIiw1a4ylxIQ+mF3AZnpnGzhF
	m5Pr9NH1E5+2Gbz5adLAccbN4dUlEmeeLWSHw+Gq3y3LxYEJCyA+neJ4pL1Ro+LoxP
	Lsn/TLJqHToasN1PlFupL1wDAj/sOghkJoAI8zFwqH/pD8ITdhRzPEI7s8GaGJtXsb
	B3/vOubpXfs2/Y8F3kVzvnKcnJ2NE74XHU2je64VNVzZaP83tN27oG/9xRVGHlGBjs
	ogUZxkxIOhcEX8MN0W0LXnWz+2RyzGJcBqDrJ9UG3nXpO6oLjebxy7a9E8nI63ljVW
	ZIm7byoGQtdk5/RiSU6Nt4TNcu1iiNnslLLwxGxeeqvQYpyqueRVro11Ulb44Yef+g
	wHlp6MjDuyQOtTdpdhaGVUCwiZH3kwjjOtk8Sj+EOsbWlTW3gcLH3keXBaaIl1hVtW
	viNjGHxi8cCWcw9CxMjRaEansRuguwfMdl2gqHzJYXYkowVMxSTO2mV6fEJg02agbW
	3Ml/vBZ7kZkO9eC9CusYG9fBn72vheaRjLok1Q8rMHBuhdJH5Fakutvj0WjzwyKMqF
	LO5hDvMP5NQ6TR31cfgL0X+E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2019 10:43:39 +0300
Message-Id: <20190617074339.13836-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-perl][PATCH] libauthen-radius-perl: Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Mon, 17 Jun 2019 07:43:39 -0000

They are now added automatically by the ptest class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index ea5bb1b0c..fb18fe2a4 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -34,6 +34,6 @@ RDEPENDS_${PN} += "\
     perl-module-io-select \
     perl-module-io-socket \
 "
-RDEPENDS_${PN}-ptest += "${PN} freeradius"
+RDEPENDS_${PN}-ptest += "freeradius"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


