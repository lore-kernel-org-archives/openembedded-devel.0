Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B96BF605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2019 22:09:52 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id b5so3706795iti.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Feb 2019 14:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FPCOVu3cRJiscl3x+Isa8sy00Fr7Q+P39jY2OgkqpKE=;
	b=GyycQicm+4p9AmWl8gVQEn3/Szl6gy0Si0PmlQsaVKqNWQ6XKmjnIEbz57/fg6qx9X
	6a4c+Y6jetE7ODe5LIiBAFVjlwFQWXUPQy6Tnqg/9wi9A6xnPJErQG6J4u6g2Z6t3Pax
	qWRaZunanLmOsElKh9OD2TSAuHMCZDtUFvfGeiWbAd8blos4js3M3iFO/NCaA9DpdLhC
	P1veQKqZy4US29yMdq/k5eiMi9N/PLpBUGWprJbPZyph2QDrMteb4pkUoCP/zYoanz0R
	V4feoLMRYgnIDKZ/YQ7KKUoUxLZndY9CrakTIj8TNn4P1iK7SoeOpee9/qdAgVYTyKaH
	rbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FPCOVu3cRJiscl3x+Isa8sy00Fr7Q+P39jY2OgkqpKE=;
	b=D0gV0MvkOlJyaR6J/poTcrR6G0ij849MFmUAhp3huG7Zxik10aXjU0i0ZLb1hiabca
	M2kgoFFXnHoIIeLS0Q64okC760y2DZ8xkfF3sVK3xgfPv454sXMU5OFx1dCaDyAqGKJ1
	Rcj4wX/TvUC5aP4c+WGeu/5go3TM1RzdqtF7jaUoQ8j+JGgDxz/k4T5I3pdw0OJqCrpD
	AXga9UKBTP1bhnZze8Ju4biHSHo74ostlpRxCiMW0WxidTBeoNyjUD97ZMXD3igR2nvy
	aPxRBGUOlLFVowD2el74qaMatbLaUwOCilnfH8UMzde46+cFHp3PmZuHxPTIiFmEHGOz
	R0kg==
X-Gm-Message-State: AHQUAuYVtB3dZeL+bB1U0UNmJ/AkofKXGlX9toBlrTtfygNPXuhMKE6O
	OMyfYhdxB8kMI/0+Wc/vZaW83DPt
X-Google-Smtp-Source: AHgI3IZrOvPMDQoOWwoUIhINQpgqKeNCC/ln9wPjiKnBW/AiNj0qONiTjeIc4e+0au8yz1P+/e08KQ==
X-Received: by 2002:a5e:c90d:: with SMTP id z13mr904757iol.117.1549318193394; 
	Mon, 04 Feb 2019 14:09:53 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id y38sm665155ita.18.2019.02.04.14.09.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 14:09:52 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Feb 2019 17:09:45 -0500
Message-Id: <20190204220945.27243-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: support building compact profiles
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
X-List-Received-Date: Mon, 04 Feb 2019 22:09:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 3 +++
 recipes-core/openjdk/openjre-8_172b11.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index d04b0d3..bc52638 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -1,6 +1,8 @@
 JDK_HOME = "${libdir_jvm}/openjdk-8"
 JRE_HOME = "${libdir_jvm}/openjre-8"
 
+JRE_PROFILE ?= "j2re-image"
+
 DEPENDS = "\
     openjdk-8-native zip-native ant-native libxslt \
     krb5 libffi fontconfig freetype \
@@ -105,6 +107,7 @@ EXTRA_OEMAKE_append = '\
     MAKE_VERBOSE=y VERBOSE=-s LOG_LEVEL=trace \
     QUIETLY= \
     images \
+    profiles \
 '
 
 python remove_debuglink() {
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index e9b930b..3dc799c 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -8,7 +8,7 @@ require openjdk-8-cross.inc
 do_install() {
     rm -rf ${D}${JRE_HOME}
     mkdir -p ${D}${JRE_HOME}
-    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    cp -rp ${B}/images/${JRE_PROFILE}/* ${D}${JRE_HOME}
     chown -R root:root ${D}${JRE_HOME}
     install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
     find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
-- 
2.20.1


