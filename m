Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id DA87B78439
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 05:02:17 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id f5-v6so11257071plj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 22:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IqpT1KnLMEknZFJZYJSo7dkQX5koJX/+BgQ/NCORJRc=;
	b=i5d5sylRc+smUKJxj1+1uuHqTUNQTRuL7HaMyroDHqabJ1rNgfH2CPZl/zyQJ0W0Pz
	1dOT6/N857Romd9N9vaCZP2D/VyNmZKtFg2THYs6+A1ONUmNr2491alXqYnbx2sLTpSt
	O+092p1zEAIissCSHsvt2H+kNalPTjQ611QRMzYy8iUeOSpfHQeDiABzaCHbGvxKRW0J
	IEWm90tyh4d4+k7fmMfZDGYrU/9mI8SnzbFPRT+b8kUqI+1/yQDV6g2oTFZvjxy6DxWV
	K1oYMU1OrfGSNAEznQD1K50Ff2kua64BdsHUzwVSi6dwK2yzTQT9DIUOTnXO0B6xi+dX
	wLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IqpT1KnLMEknZFJZYJSo7dkQX5koJX/+BgQ/NCORJRc=;
	b=m9eZCr8Z8A106z9CsvgR9wnygL8CkxtxYG9acAoFbHLsqVzUR5zJin+GXhNOiV5kPU
	VjYaewBiyEAxLnF6uGlBBbu+7azIW6JUbtA104hXQjm4fljEqUtY3DUksWQK/Yv6B1un
	QDSMLw6f4i3PE6I7m8ghajiD6Nl3BR21E4RDFp08bg+qJQ79Qcu/kuu0tQAG77Xb7Kbq
	3mD4mYLMKf5WdMWtdXt8s9vFMdpCyHZybfuomnV0ihGUOVBWBHWTheoRCCgmqHL/Px0o
	CREPLKzXwX112MsoPn7mS+oWuZuZE8pC3R/npTp9rQSnVhFw4SHvcQLRzI3RajVS/asw
	5syw==
X-Gm-Message-State: AElRT7FIHb/erh2qE9BE4kEP7K2fc7xEb5C2DST/yTFvrKfVKwZs/U1V
	7TR+t6UOnT2pZWOyAB2oo9nNkw==
X-Google-Smtp-Source: AG47ELuWLchSr2fD8b7gYU6CKDPLnqiu9FN+DPrDd+QLBVQqZSRQtXeVLe2blsa63laIA4d0aEPafQ==
X-Received: by 2002:a17:902:a60d:: with SMTP id
	u13-v6mr20506410plq.161.1522040538019; 
	Sun, 25 Mar 2018 22:02:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p14sm24254813pgu.44.2018.03.25.22.02.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Mar 2018 22:02:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 22:02:10 -0700
Message-Id: <20180326050210.43570-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-oe][PATCH] tslib: Upgrade to 1.15 release
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
X-List-Received-Date: Mon, 26 Mar 2018 05:02:17 -0000

License changed from LGPL-2.0 to LGPL-2.1
see

https://github.com/kergoth/tslib/commit/2c15c34f2720d4bc2f73d85b02fa355542fea5bf#diff-7116ef0705885343c9e1b2171a06be0e

Package additional test tools into test package

This version works well on arm64 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tslib/{tslib_1.1.bb => tslib_1.15.bb}                 | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/tslib/{tslib_1.1.bb => tslib_1.15.bb} (77%)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
similarity index 77%
rename from meta-oe/recipes-graphics/tslib/tslib_1.1.bb
rename to meta-oe/recipes-graphics/tslib/tslib_1.15.bb
index e7c48ff6c..e87b411a8 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.15.bb
@@ -8,15 +8,14 @@ HOMEPAGE = "http://tslib.org/"
 AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
 SECTION = "base"
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
            file://ts.conf \
            file://tslib.sh \
 "
-
-SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
-SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c"
+SRC_URI[md5sum] = "9ff36788c9ab76a10b58422227b9629e"
+SRC_URI[sha256sum] = "7ce48807cab655076d71a1ceef3ed0ab8a25df98074981d4a8fd1477ee5f710c"
 
 UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
 
@@ -38,10 +37,11 @@ do_install_append() {
 #RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
 RPROVIDES_tslib-conf = "libts-0.0-conf"
 
-PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
+PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate tslib-uinput"
 DEBIAN_NOAUTONAME_tslib-conf = "1"
 DEBIAN_NOAUTONAME_tslib-tests = "1"
 DEBIAN_NOAUTONAME_tslib-calibrate = "1"
+DEBIAN_NOAUTONAME_tslib-uinput = "1"
 
 RDEPENDS_${PN} = "tslib-conf"
 RRECOMMENDS_${PN} = "pointercal"
@@ -50,4 +50,7 @@ FILES_${PN}-dev += "${libdir}/ts/*.la"
 FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
 FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
 FILES_tslib-calibrate += "${bindir}/ts_calibrate"
-FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"
+FILES_tslib-uinput += "${bindir}/ts_uinput"
+
+FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_print_mt \
+                     ${bindir}/ts_test ${bindir}/ts_test_mt ${bindir}/ts_verify ${bindir}/ts_finddev"
-- 
2.16.2


