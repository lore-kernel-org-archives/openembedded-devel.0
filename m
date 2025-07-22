Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC8AC87FCF
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.4254.1753153986280899099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t5ASeds9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153986; x=1784689986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tRpv8JY+cAd+cgQbeTHzc7rd7pZFvycjZ6EaNfCgjmE=;
  b=t5ASeds92xRCuvJE9qsbadaUC5qnZ1xg6mnNCF7/+cPspufSgmXfZT/T
   FOuUDpzsJsXIsS7fDzEJkBz7YId8b/UulhCUHoy7plqElKBFUXvN7QhCy
   uaAtjvtH3I0Fctd1JYaYS7gL+2htozv1SM7thoMe+96IwIGb+fUVZ7f5a
   XsIxikt3WZBi+5VVoTiO/vaEZA2j6DywG4veAdvCT2UUJN0NAA4mU7Ecy
   eRYAE1lA/KfmZOkCto3i7R402Q1Pumhu1K4ilKVhjB4SBgUlibp7loTOa
   FYmjTxQFtxNv/V+iy6V81v0MZYED+qYar+iNd13RgZtcHeUDU0uX3J7iv
   Q==;
X-CSE-ConnectionGUID: m16VRRr5Qvi8AmAdGUS8Lg==
X-CSE-MsgGUID: cALrjgHxRl+XILpvkbtuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="207018605"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="207018605"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BA9C61554
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2BB861800336
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:04 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5EBCF1A008F;
	Tue, 22 Jul 2025 11:13:00 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 06/21] python3-distlib: upgrade 0.3.9 -> 0.4.0
Date: Tue, 22 Jul 2025 11:12:14 +0800
Message-ID: <20250722031245.884-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118670

Changelog:
===========
- Added tag 0.3.9 for changeset 2f9280e89d42
- Bump version.
- Locate with extras.
- Make the type of finder needed in register_finder explicit (#236)
- Add 3.13 to CI.
- Tweak test which is unsuitable for Windows on Python >= 3.13.
- Fix #238: Add build tag to wheel metadata if specified.
- Exclude Python 3.7 from ubuntu-latest in CI.
- Remove macos-12 from CI.
- Update `test_wheel.WheelTestCase.test_abi` for freethreading (#244)
- Support subdirectories in .dist-info (fixes #246) (#247)
- Skip no-longer-relevant test.
- Normalize archive paths in dist-info (#248)
- Temporarily exclude 3.13t on windows-latest.
- docs: update coverage results link (#250)
- Guard script wrapper entrypoint import with if __main__ (#242)
- Changes for 0.4.0.
- Update change log, widen exception catching in test.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-distlib_0.3.9.bb => python3-distlib_0.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-distlib_0.3.9.bb => python3-distlib_0.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb b/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb
rename to meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
index 33e79d53e3..146803a45c 100644
--- a/meta-python/recipes-devtools/python/python3-distlib_0.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-distlib_0.4.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/distlib"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6a11430d5cd6e2cd3832ee94f22ddfc"
 
-SRC_URI[sha256sum] = "a60f20dea646b8a33f3e7772f74dc0b2d0772d2837ee1342a00645c81edf9403"
+SRC_URI[sha256sum] = "feec40075be03a04501a973d81f633735b4b69f98b05450592310c0f401a4e0d"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


