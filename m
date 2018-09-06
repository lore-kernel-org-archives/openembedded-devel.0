Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id BB28B796C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 17:22:31 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id h69-v6so5624642pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8WCeVTuLiGN6zPsWLsSZ8VxQ9aVz7ABgBmtj9evYEwY=;
	b=HLRrAzlDVDRzsG+cwg1fyQzVoCmEG2yQCDvgC1aF/1J5H8HB8hL0xgzOfkLwcoaM7G
	xHfTXMUOIESYqvvAqQ8OIvXKOhVSo0CTg60TQyv/KgHEEmqrsTv2F8/d3Z6sk66JzlMT
	TvZ4axE2qhqZURzZ33amkH1826BDD0lPZf3NGWPgy0AT34t07GP8mntkWPEpApUEcJHB
	3JRlwCPUf8oCYK8UuBOws5fzukjfOABXQdBk5Y0/6F011dsP0KhVIqwVfC3S/7csWBnP
	ExetZHMdQbgSLwn5uY9LxvV1nAfgoM7+4QVXH8uehpB5B1RjqY5+C0IMJPSv66f2RzPW
	h7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8WCeVTuLiGN6zPsWLsSZ8VxQ9aVz7ABgBmtj9evYEwY=;
	b=ndmygtADcDXzIeNvbyzfTAeVX0v8Y4aK3LlG8YusLRdWAZ9PUtnymSP79ptiIKxgty
	nqZglNQhDdn73bFgVs+0joTR6+dLSoMw1L3jpZQWO/saoxdIr9f0jLBuxGoOf8AdN9Zm
	BiJ7+FAKfxwNEjwIDhV15jJf97oaxfHv2cHwpcT8pYpa+nIEGnvk9ba7FkWZ0s7bILun
	2Seg8z6qDR28Q4nm9vGlWXPFir68OW3DJ7sSUG1svoKpR8O3epETIIG/AxkIsZRXmSkR
	LsSJE6udDINDD7vWATwqtRSdcK+qtHMQ9var0I/Z/8odZn5yBukOsmGTIkimp81PQbY/
	nRag==
X-Gm-Message-State: APzg51BN8tua/HUIFfwIzOM2ipnXBffTyF7Ie5Ad/gbnksnDQ1r2XXFt
	gasLALX8pTzXx6QAhpYh+YCpGWxn
X-Google-Smtp-Source: ANB0Vdbn1XecRRR/Oe5DRBNfbhIiBnjUvQEUa+QAsk8CS5ziVkNYd+eXcPC19VcTq3DGhCn60IDQCg==
X-Received: by 2002:a63:4306:: with SMTP id
	q6-v6mr3922311pga.181.1536254552581; 
	Thu, 06 Sep 2018 10:22:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	22-v6sm8319828pfl.126.2018.09.06.10.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 10:22:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2018 10:22:04 -0700
Message-Id: <20180906172210.42551-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180906172210.42551-1-raj.khem@gmail.com>
References: <20180906172210.42551-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/17] synergy: Upgrade to 1.10.1-release
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
X-List-Received-Date: Thu, 06 Sep 2018 17:22:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/synergy/synergy_git.bb    | 27 ++++++-------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index 68f0387ba9..f5518bd8c1 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -1,35 +1,24 @@
 SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
 HOMEPAGE = "http://synergy-project.org"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ba51ca68e055566aade24662f9eb41"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=54c1fc8d8bb6776ae501acfb1585e9d6"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 SECTION = "x11/utils"
 
 DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
-do_unpack_extra[depends] = "unzip-native:do_populate_sysroot"
 
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/symless/synergy.git;protocol=http"
+SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
 
-# Version 1.8.8-stable
-SRCREV ?= "c30301e23424db1125664da17deb8c3aa6aec52d"
-PV = "1.8.8+${SRCPV}"
+# Version 1.10.1-stable
+SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"
+PV = "1.10.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 inherit cmake distro_features_check
 
-do_unpack_extra() {
-    cd ${S}/ext
-    for file in *.zip; do
-        fname="${file##*/}"
-        unzip $file -d ${fname%.*}
-    done
-}
-addtask unpack_extra after do_unpack before do_patch
-
-do_install() {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
-}
+EXTRA_OECMAKE += "-DSYNERGY_BUILD_LEGACY_GUI=OFF"
+
+FILES_${PN} += "${datadir}/icons/hicolor"
-- 
2.18.0


