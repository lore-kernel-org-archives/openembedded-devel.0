Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7227E9A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TWks6CnDz2M
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560964438;
	bh=5sitymNK5QvwxigSArna4KJMACsABQ+AJwUJEXndNEY=;
	h=From:To:Subject:Date:From;
	b=HhqiboM6TfGQCb4/GhtEBRjQ9yzzYHCdnSSG4+lm6fPGAeParQC+jBQ3v5RAiHBwq
	pjPGlUE1pw9oiOTyxo+/yuAiDDXNaz/LDDVU5B8atVWg8oi5P80fU0dBlgjjV5nsDv
	108xL4T3kNrh3+gRk7uyKtxSVSHCaJk71gwr8e98sl40K38OUF0bJhA0huDNWXUIOM
	4H5GiKBXnjtLpcWa9msBMkm30T8izUf6wzvb+O/zUnk72ByWJBefD7GD+hwVSa3qix
	lSriG/a3NGqIWKa4e+JQlSf+JS/fGGigSznL0RXjkND+Pxk3yLA34pVV49/ul4Ifyw
	yQjo2llLMxf4IUyIB34H5E4AagcOUG+9MHwOehbZ9NGxR3k1g2DX6Z3A/QF83YTgsa
	q6I6UgJeoYjYpnHJbo+t5j55ojnGNouL0whMu3n+StSFaSxByfmOdwkb8Kmg/ww52E
	1t3ksmgbRlf7K5uRQQNu1rOy1MWg+qpk3LeKHod1ua2ZpKCC0N5L4vyAXCpY+t+EJi
	0cHE3ayl7Kvei43pWRAJ6SUF/enf2a4ri1AqKN4APdQ7zOkfMT9MFRG28YINS4sUz1
	VVexAzrdjVnuk1HxhFTu4G0tW/JwKTQSb9WWJtgGyct35mRWriHrQ7lCtOFmCF2+5l
	TDMfKU2BxyZYwpV2p5DrqnTI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jun 2019 20:13:57 +0300
Message-Id: <20190619171357.4306-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] gpsd: Force using python-scons-native for now
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
X-List-Received-Date: Wed, 19 Jun 2019 17:13:58 -0000

SConstruct in gpsd does not yet support Python 3.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index 131e84961..7752e76b5 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-replacement-native pps-tools"
 PROVIDES = "virtual/gpsd"
 
+# SConstruct in gpsd does not yet support Python 3
+DEPENDS += "python-scons-native"
+DEPENDS_remove = "python3-scons-native"
+
 EXTRANATIVEPATH += "chrpath-native"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-- 
2.17.1


