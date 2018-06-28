Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBBA74553
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 18:48:25 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 8-v6so1544046oin.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=v7OUg5Sf8SRDBASL+uH+QKRxLBwoVfbyf/nshZSq1Hc=;
	b=VdWoD1xcGAwkuZUaxKL5j7m5FSC4noN5b/Dnj567xRWac3r5NRz1lyjQJHRst2UMAJ
	AunaXUSqYex+cxVsJN4RMybQ7GVF5+rfpXKj66238XjKlyaxzTRq0+W1ZMVEOE3wa6KY
	7XxwvPVGbTN6On5gb3GiDIElrUO69Xv/EZHfDpI/KMqNva1b6CObb5tTSNf0coiPqFFN
	f3JKm/eYFoDE59T3bdLhgmZtBmHUNLtIMBg2t/VbGOqXpIOS//sCr9ccij8im203HHO8
	ztMDZR3y31j6HmzoHSE70a9UsJUiFl2FpBvJbDcfpT2BQjFkz4AclZD0rNrgGV87L5Me
	Tr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v7OUg5Sf8SRDBASL+uH+QKRxLBwoVfbyf/nshZSq1Hc=;
	b=BttsD2tTbObBkTyIfEqJHGmoBV8bAjXCn+oQimZ+u5l008pY5NTlAeAymWxZzXIUNB
	L1dWkB3wddDGGn8G8/pfBrlyLuRrEQT9/LQ45uYGUf+EmG4pky4v4XmGIBPfVskjsBgo
	RfecxAWd/72bhClNAP1xtA6SoRfleIWb8KbnAzbKlR1edfIfE65o5xUW5hexO8JckOoC
	YY6aj+Ozsl9hcpDyPL2nL3i5Z3V8g4MPt6m7jfHnAfpgzbyrzsQ30G9huuBUy4bd45Ss
	EhUhds/GQ4UR4VDuaijRJRgjOaaNakqdPtFGCPHJoLyWurO4Pi61X4T1AfORJD7Ujs9B
	Zajg==
X-Gm-Message-State: APt69E169/De1SbadjZ0q7iqbfFvKuZpXYMcNxgCy2YI51glzqqyBZSb
	9KNthWT9SNel7aXQN/vvzkw2gw==
X-Google-Smtp-Source: AAOMgpeA9h7lzu75X6SLD4L9IcTFekvbjC4yIGcLpR5FDwDscGuf/m/eSj13L+kfL4Zsajuvhw1/pg==
X-Received: by 2002:a54:4406:: with SMTP id k6-v6mr3321032oiw.34.1530211706375;
	Thu, 28 Jun 2018 11:48:26 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	p2-v6sm3495681otl.63.2018.06.28.11.48.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jun 2018 11:48:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jun 2018 11:48:17 -0700
Message-Id: <1530211698-23398-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH 1/2] protobuf: misc recipe cleanup
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
X-List-Received-Date: Thu, 28 Jun 2018 18:48:25 -0000

Re-order variables to align more closely with the OE style-guide.

Remove spurious ${bindir} from the protobuf-lite packaging rules.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-devtools/protobuf/protobuf_3.5.1.bb    | 34 +++++++++++-----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
index 1ffb79d..8cef391 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
@@ -5,32 +5,26 @@ all of its internal RPC protocols and file formats."
 HOMEPAGE = "https://github.com/google/protobuf"
 SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
-
-PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
 DEPENDS = "zlib"
-DEPENDS_append_class-target  = " protobuf-native"
-RDEPENDS_${PN}-compiler = "${PN}"
-RDEPENDS_${PN}-dev += "${PN}-compiler"
-RDEPENDS_${PN}-ptest = "bash python-protobuf"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
+DEPENDS_append_class-target = " protobuf-native"
 
+PV .= "+git${SRCPV}"
 SRCREV = "106ffc04be1abf3ff3399f54ccf149815b287dd9"
 
-PV = "3.5.1+git${SRCPV}"
-
 SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x \
-	   file://run-ptest \
-          "
+           file://run-ptest \
+"
 
-EXTRA_OECONF += " --with-protoc=echo"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig ptest
 
-S = "${WORKDIR}/git"
-TEST_SRC_DIR="examples"
-LANG_SUPPORT="cpp python"
+EXTRA_OECONF += "--with-protoc=echo"
+
+TEST_SRC_DIR = "examples"
+LANG_SUPPORT = "cpp python"
 
 do_compile_ptest() {
 	# Modify makefile to use the cross-compiler
@@ -76,8 +70,14 @@ do_install_ptest() {
 	cd "$olddir"
 }
 
+PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
+
 FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
-FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
+FILES_${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
+
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+RDEPENDS_${PN}-ptest = "bash python-protobuf"
 
 MIPS_INSTRUCTION_SET = "mips"
 
-- 
1.9.1


