Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 84E5777E79
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 07:29:38 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 40so1260062wrv.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Sep 2017 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIZkUq2Pfa3gL3D52dENQzoIHJJUY4uOeCXFVAZETbc=;
	b=lwbUEi25HL5fUqwk1ZgBrlTspwcfJtZAFyG47PDOGnRV8WJLJ4D22IGTLiOUrCRmDy
	5P6/EIqWGx2MTGWIjyJD54e+3JFjdiSlcmwScTrazU7iD0T7MilxM+vGeCHfA3rZjA/B
	vjfTUe4YlyxZ4nYYAuRbeSmH+DimUpAfmqN3x1zWZjFLM01KkbSPcz6mGkRHfCl1t9x/
	JqrZCnJi9HohAO+xZOlpSBGTxi3nvPCefi+yx1sV7wpM+NN6fUjFsmbwffAXKsx4vMsN
	pCK2X+W5brXB0PLpWoEsyU0FpexJpytFWMtIikZuK4R0KITx06kNNHeNs/MDAZztYcat
	RCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIZkUq2Pfa3gL3D52dENQzoIHJJUY4uOeCXFVAZETbc=;
	b=ZkZ88GnQxkcu4h7Qpdb5NV1kBPigUE1bdyw90FmjJ7s112i/sJpXvVSqVer/i95+Z9
	rXtWTA8v1enLDNoT/MHtn3HfbpUjlCIjHK/ZlR3LohR8sp50ZSW5s114hTMQAAxa42ME
	PUbVPWvru9pCMOm6b66lni6PuuHC0Yo7OapsUEgj2RLZb3rIc5tKcN8XklHm59N/59m9
	yiMA/1NaxhTbTxjv/5dLsoJL2PKOMTBACmSOH+MLyGAhDKfk9mJhcNTZ7LlIZiF6+AzL
	a0j6hr3g0qHyjaSAfC9zkAeSa8DP2n3ty1xAwB0q+K1MTLUiEJQwuM4GiyoxSOeNHlDC
	NM1g==
X-Gm-Message-State: AHPjjUiQ4ITIfFDhkfKJ3n3aXBKa9UKGfR95LYx12cd/4XJZuOGLZ+/6
	KDPhNBZsTvFl2NPX
X-Google-Smtp-Source: ADKCNb69VQNd5uVFM35vdjNOxdl6h25sr9iSk1Jt4ZUvj52+7MIcEZ/A/HEDpaQSepRQwttqU+Od8g==
X-Received: by 10.223.128.3 with SMTP id 3mr1684524wrk.327.1504596578945;
	Tue, 05 Sep 2017 00:29:38 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p20030046E901F2886E684C35E4EC4B89.dip0.t-ipconnect.de.
	[2003:46:e901:f288:6e68:4c35:e4ec:4b89])
	by smtp.googlemail.com with ESMTPSA id
	j62sm73151wmf.4.2017.09.05.00.29.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 00:29:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Sep 2017 09:29:19 +0200
Message-Id: <20170905072919.17654-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtbase-native: set path to mkspec for cmake properly again
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
X-List-Received-Date: Tue, 05 Sep 2017 07:29:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since update to 5.9.2 native recipes in meta-qt5-extra fail due to strange path
to mkspecs. This patch fixes this the hard way.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtbase-native_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 54a0b78..28a39ac 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -112,6 +112,10 @@ do_install() {
     fi
 
     install -m 755 ${B}/bin/qfloat16-tables ${D}${OE_QMAKE_PATH_BINS}
+
+    # since 5.9.2 something sets a very strange path to mkspec ("${_qt5Core_install_prefix}/../../../../../../../../../../usr/lib/qt5//mkspecs/linux-oe-g++")
+    # override this until somebody finds a better way
+    echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
 SRCREV = "73573fce295caef35da706a8c8c796ec18e6baf1"
-- 
2.9.4


