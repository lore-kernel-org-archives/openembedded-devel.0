Return-Path: <Tillmann.Severin@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5EFC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 11:30:37 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47026.1789990228885937790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 04:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=VF7zlXOq;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=717585c41=tillmann.severin@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1789990229; x=1821526229;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NJzLi6vRqaopkC7aIr2PJsGYQFjr0Sgfne9kw3Z9wc8=;
  b=VF7zlXOqGrXGcHRYZn6o1fXMlF2uquIQu7Osekawyh7JaEXN4GB7k0fH
   J/Hb7MmIlr7pRJhL2TuKKaoacCzvH6S8umsqdyaeHslUKZ9MP9bKplBcg
   qS2Y0tapeQUa7Dx4L0rq5JUmsmb+P6SoHXkxFebCq7ir9RUmwunHa0fz9
   w=;
X-CSE-ConnectionGUID: fgI+cSotSd6ZCbWahoPkfg==
X-CSE-MsgGUID: CqZVoeAcQq+ZvIEQebfwrQ==
Received: from esagw3.bmwgroup.com ([160.46.252.35]) by esa13.hc324-48.eu.iphmx.com
 with ESMTP/TLS; 21 Sep 2026 13:30:27 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw3.bmwgroup.com with
 ESMTP/TLS; 21 Sep 2026 13:30:26 +0200
Received: from smucmp21a.bmwgroup.net (HELO smucmp21a.europe.bmw.corp)
 ([10.100.172.92]) by esabb2.muc with ESMTP/TLS; 21 Sep 2026 13:30:27 +0200
Received: from clid2115459.de-cci.bmwgroup.net (10.30.85.207) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 21 Sep 2026 13:30:26 +0200
X-CSE-ConnectionGUID: LdlRpuO1RW6Oo+1BhdBSzA==
X-CSE-MsgGUID: 19wiD8RTTH+k53hgF8RNmg==
X-CSE-ConnectionGUID: wD8APjngRsSF5mpr8U2wuw==
X-CSE-MsgGUID: w2yHcryjQjWQW/jF0vlcbg==
From: Tillmann Severin <tillmann.severin@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <ross.burton@arm.com>, <peter.marko@siemens.com>, <raj.khem@gmail.com>,
	Tillmann Severin <tillmann.severin@bmw.de>
Subject: [meta-oe][PATCH] smolkit: Provide polkit instead of using DISTRO_FEATURES
Date: Mon, 21 Sep 2026 13:29:56 +0200
Message-ID: <20260921112956.1660792-1-tillmann.severin@bmw.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17b.europe.bmw.corp (2a03:1e80:a15:58f::1:4c) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 11:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130130

smolkit so far only implements a subset of polkit's features,
so this adapts the claim of the "drop-in replacement" in the recipe.
Additionally, smolkit now PROVIDES/RPROVIDES polkit, a PREFERRED_PROVIDER
is set up for polkit in meta-oe/conf/layer.conf as well.
The now obsolete features_check is removed, as we do not
use DISTRO_FEATURES any longer.

Upstream has added a new tag for version 0.3.0,
which is now also reflected in the SRC_URI.

The unnecessary line setting `S` is also removed.

Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
---
 meta-oe/conf/layer.conf                     |  5 +++++
 meta-oe/recipes-extended/smolkit/smolkit.bb | 15 +++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 1d7e6cbe57..d90d0cf737 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -60,6 +60,11 @@ PREFERRED_PROVIDER_nativesdk-coreutils = "nativesdk-coreutils"
 PREFERRED_PROVIDER_virtual/libopencl1 ?= "opencl-icd-loader"
 PREFERRED_RPROVIDER_virtual-redis ?= "redis"
 
+# We have two providers (polkit/smolkit) for polkit now, continue
+# to use smolkit as the default, as smolkit does only implements a subset
+# of features.
+PREFERRED_PROVIDER_polkit ?= "polkit"
+
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
   gpsd-machine-conf \
diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipes-extended/smolkit/smolkit.bb
index 4bd5f8d03f..4ac9ee69f7 100644
--- a/meta-oe/recipes-extended/smolkit/smolkit.bb
+++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
@@ -1,4 +1,4 @@
-SUMMARY = "low-footprint drop-in polkit replacement"
+SUMMARY = "low-footprint polkit replacement"
 HOMEPAGE = "https://github.com/bmwcarit/smolkit"
 DESCRIPTION = "\
   Service that implements a subset of polkit's D-Bus interface with a static configuration language. \
@@ -7,21 +7,20 @@ DESCRIPTION = "\
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit cmake features_check pkgconfig
+inherit cmake pkgconfig
 
 DEPENDS = "\
   rapidjson \
   sdbus-c++ \
 "
 
-CONFLICT_DISTRO_FEATURES = "polkit"
-REQUIRED_DISTRO_FEATURES = "smolkit"
+PROVIDES += "polkit"
+RPROVIDES:${PN} = "polkit"
 
-PV = "0.2+git"
+VERSION = "0.3.0"
+PV = "${VERSION}+git"
 
 SRC_URI = "\
-    git://github.com/bmwcarit/${BPN}.git;protocol=https;branch=main \
+    git://github.com/bmwcarit/${BPN}.git;protocol=https;branch=main;tag=v${VERSION} \
 "
 SRCREV = "46bbfd5c922a8d03a534398ee129ded822dfcafe"
-
-S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
-- 
2.43.0


