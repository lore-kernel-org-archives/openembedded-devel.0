Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5937FEA9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 20:34:11 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so4957298ljj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3RFq4UuU3hjLVWElwj4OP2zD9torSL/uTephZtg1PH4=;
	b=sPZgSY2Mz8ldB5jghCyhd1HxoMeqtBV2bV+Z5WuQn4UnMwa1D9VbXj45ohlEgIbls7
	/n4eacs9DXJXHgXn9CQfiPN/WoSjB3QyTWronID6Q8U5Xs5InnOc3ekNPWx2eULJnivi
	GTJht78hulqCNtVkK9XMKmn0ee5dacNvbUptsWaAZczBJVt/loKmEtqNrdmMfAuRUn81
	7yfnXQxqG24PK7zEAnizAlkY2yXeqbAGCGEwRlBvQ+XguyzNDJU7W48TLA2uBGoV7bjD
	jrREth6TtUNeSHMpdp0WDPTc3p4b42kOKDTtgl1m2VrN8R1AsngEj5rHvYlXXCelgocF
	cTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3RFq4UuU3hjLVWElwj4OP2zD9torSL/uTephZtg1PH4=;
	b=EO0AWWoy0EO6jqKyGkgPGRqc2t9RdRkTWurDxhKEDVbE7mpGqyLpuVSQ6mnpsxYyfI
	24amCx7Gk8x+eyIfLkeomFrIxs8gWSEAbOyaoKYQfSBaF4+iBnb0Quo1ZSABEh+1u9pY
	vFD2qN0cPFuxCStq1bO+a8NU+xuocq4F2zbfb/7X3lZzO1n/x5g2hXcAxjYyt61ZAVlj
	jbRuuuMWVl5e5wWGd6yYVYVBWxZUhQAlPcMY2IQL0BNa8x3OEPHD/T3qOVg7COo4O7Kl
	lVQDifKjMjWfXho2v4sQE1f53mQm7qym/qQ8SWDQavCcNai+3h/VxWoU9Bj0jhLK6lxS
	kGWw==
X-Gm-Message-State: APjAAAXF0Ppt/oXFyRoFr4JihKMf+VXHr8fOuRb29ybTUodqcbncuOFt
	OXAwG2BLz+c0ZfXFo5YXTO29m72gHEU=
X-Google-Smtp-Source: APXvYqyvkbKVFJAXIbPwpvHNYStvrV0r9ykgO5rH0WAxhhQbGvKHzoELGiYK12vW3qqA3Vsx+N1yiQ==
X-Received: by 2002:a2e:8084:: with SMTP id i4mr1524360ljg.119.1568925251584; 
	Thu, 19 Sep 2019 13:34:11 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	c26sm2090618ljj.45.2019.09.19.13.34.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 13:34:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Sep 2019 22:34:06 +0200
Message-Id: <20190919203406.4665-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-oe] pcsc-lite: update to 1.8.25
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
X-List-Received-Date: Thu, 19 Sep 2019 20:34:11 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

License checksum was changed due to removed license info about remove
code (see @0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb}    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_1.8.22.bb => pcsc-lite_1.8.25.bb} (79%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
similarity index 79%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
index 10f724e6c..a87c228a8 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.25.bb
@@ -8,13 +8,12 @@ LICENSE_${PN}-dev = "BSD"
 LICENSE_${PN}-dbg = "BSD & GPLv3+"
 LICENSE_${PN}-spy = "GPLv3+"
 LICENSE_${PN}-spy-dev = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f38b3d1c7ef7fc2c8b6d20cd38efdc29"
+LIC_FILES_CHKSUM = "file://COPYING;md5=628c01ba985ecfa21677f5ee2d5202f6"
 DEPENDS = "udev"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0ec103b1ef298d0c58d6ef6b00b9cf17"
-SRC_URI[sha256sum] = "6a358f61ed3b66a7f6e1f4e794a94c7be4c81b7a58ec360c33791e8d7d9bd405"
-
+SRC_URI[md5sum] = "c20650a36062ab1689f37f3302c988f2"
+SRC_URI[sha256sum] = "d76d79edc31cf76e782b9f697420d3defbcc91778c3c650658086a1b748e8792"
 
 inherit autotools systemd pkgconfig
 
@@ -26,6 +25,10 @@ EXTRA_OECONF = " \
 
 S = "${WORKDIR}/pcsc-lite-${PV}"
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[systemd]  = ",--disable-libsystemd,systemd,"
+
 PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
 
 RRECOMMENDS_${PN} = "ccid"
@@ -36,7 +39,7 @@ FILES_${PN}-dev = "${includedir} \
                    ${libdir}/pkgconfig \
                    ${libdir}/libpcsclite.la \
                    ${libdir}/libpcsclite.so"
-                   
+
 FILES_${PN}-spy = "${bindir}/pcsc-spy \
                    ${libdir}/libpcscspy*${SOLIBS}"
 FILES_${PN}-spy-dev = "${libdir}/libpcscspy.la \
-- 
2.17.1


