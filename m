Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11EFC61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:04 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7621.1787731803758482697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pSPdKtgn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731804; x=1819267804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yBdZnx/iHnAVaO8NKtSqNO8esYTOYdZv92PaV1MahOk=;
  b=pSPdKtgnJd8OTK6WUOQOPE8ZES5f41vOqfeaybHuP7snVjIZjBRykboV
   /fQh0OLmyuOwqylVvrVauOONEM3i4FQ42fJAm5RCXgyMDzrYCHDTYgE1K
   +O3KYe5nRMbcUqll3SC0OWWJhPxzSFoRy6N5+UGOOKhNiEdFr5/b7T3ho
   +9yDsPClIdgZpdK90d8gowlNFu10yi88fD019akry0PF/nWMYbMP61Wsw
   glT9+dP79CaIuZgiTmnVdNC/r/3XLJW4whg86TRdsSwH+c4ksdcRT9AR6
   fYGEUGTYAqamk9swbjdJRmW1KRxxnoNqsvsp/D7xT0JNCk50cb/dEWTda
   Q==;
X-CSE-ConnectionGUID: omezTYgeS3KhTeuBR1rUbQ==
X-CSE-MsgGUID: gbi1KHNlQJ6BgLIcVRztGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238886809"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="238886809"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:10:02 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2490D1C000E3
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:02 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C91FAC00343
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D996C1407683;
	Wed, 26 Aug 2026 08:09:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/23] python3-ruff: upgrade 0.16.3 -> 0.16.4
Date: Wed, 26 Aug 2026 16:09:22 +0800
Message-ID: <20260826080926.989-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129511

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/python3-ruff-crates.inc       | 8 ++++++++
 .../{python3-ruff_0.16.3.bb => python3-ruff_0.16.4.bb}    | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruff_0.16.3.bb => python3-ruff_0.16.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-ruff-crates.inc b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
index b5835d4ce2..4491d6e3bf 100644
--- a/meta-python/recipes-devtools/python/python3-ruff-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-ruff-crates.inc
@@ -20,6 +20,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.10 \
     crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/approx/0.5.1 \
+    crate://crates.io/ar_archive_writer/0.5.3 \
     crate://crates.io/arc-swap/1.9.2 \
     crate://crates.io/argfile/1.0.0 \
     crate://crates.io/arrayvec/0.7.8 \
@@ -237,6 +238,7 @@ SRC_URI += " \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/objc2/0.6.3 \
     crate://crates.io/objc2-encode/4.1.0 \
+    crate://crates.io/object/0.39.1 \
     crate://crates.io/once_cell/1.21.4 \
     crate://crates.io/once_cell_polyfill/1.70.1 \
     crate://crates.io/oorandom/11.1.5 \
@@ -284,6 +286,7 @@ SRC_URI += " \
     crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro-utils/0.10.0 \
     crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/psm/0.1.32 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
@@ -353,6 +356,7 @@ SRC_URI += " \
     crate://crates.io/snapbox/1.0.0 \
     crate://crates.io/snapbox-macros/1.0.0 \
     crate://crates.io/stable_deref_trait/1.2.0 \
+    crate://crates.io/stacker/0.1.25 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/statrs/0.18.0 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
@@ -523,6 +527,7 @@ SRC_URI[anstyle-svg-0.1.11.sha256sum] = "26b9ec8c976eada1b0f9747a3d7cc4eae3bef10
 SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
+SRC_URI[ar_archive_writer-0.5.3.sha256sum] = "73cd58deff2140a0a8eae87e417bd01db68a33e148aa93d1e8cd837e55e312b6"
 SRC_URI[arc-swap-1.9.2.sha256sum] = "c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b"
 SRC_URI[argfile-1.0.0.sha256sum] = "99489a733dea0d2930bfa59c243146a8513ce7b0991b9d006647687cc61f53e7"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
@@ -740,6 +745,7 @@ SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed04
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[objc2-0.6.3.sha256sum] = "b7c2599ce0ec54857b29ce62166b0ed9b4f6f1a70ccc9a71165b6154caca8c05"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
+SRC_URI[object-0.39.1.sha256sum] = "2e5a6c098c7a3b6547378093f5cc30bc54fd361ce711e05293a5cc589562739b"
 SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
 SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
 SRC_URI[oorandom-11.1.5.sha256sum] = "d6790f58c7ff633d8771f42965289203411a5e5c68388703c06e14f24770b41e"
@@ -787,6 +793,7 @@ SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054
 SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro-utils-0.10.0.sha256sum] = "eeaf08a13de400bc215877b5bdc088f241b12eb42f0a548d3390dc1c56bb7071"
 SRC_URI[proc-macro2-1.0.107.sha256sum] = "985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[psm-0.1.32.sha256sum] = "4dcd034599e63b970727f70d79e02d62390a4a84f7c6b827c27c46d5ac3fa622"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
@@ -856,6 +863,7 @@ SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017
 SRC_URI[snapbox-1.0.0.sha256sum] = "71d70a71b68054cbe88708f77abfc4bd2daf75028f8f55f4f1cff63565df89ea"
 SRC_URI[snapbox-macros-1.0.0.sha256sum] = "d248cef42e1456ab2f7149c0376985351b7d849ea9ad2a957bf15ddfebf1fdf9"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
+SRC_URI[stacker-0.1.25.sha256sum] = "707f49d46706bacf8a2b00d51dace3f9de527c13eec3778f570c411f89e69967"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[statrs-0.18.0.sha256sum] = "2a3fe7c28c6512e766b0874335db33c94ad7b8f9054228ae1c2abd47ce7d335e"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb b/meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb
rename to meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb
index 0106ca6fa4..8afbb76183 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.16.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e679ca4f742cbfa29ab6a499529c2d39"
 
 DEPENDS += "python3-maturin-native"
 
-SRC_URI[sha256sum] = "e76d33a347661a84b5be6d043d0347fdc745dfdcf825a8f4fed64b5e26eebdf2"
+SRC_URI[sha256sum] = "13171aa9d9af2240ee3504e639de73122c67e74036de5ba2e1d01422cd17e3dc"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates
 
-- 
2.43.0


