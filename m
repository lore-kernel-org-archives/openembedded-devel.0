Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B548DFD7F87
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:16:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92478.1772187351578408434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YbJ0qHLl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187351; x=1803723351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+7q7AHkLzPkCifovhuyBbqE66AQpkQ3XWG3Z5fQsraM=;
  b=YbJ0qHLlRAk+KDfx6U+/MyYqXpF/zDMC58uLJ9NSuwgkrU5R29RvQGij
   reeaVslBOtUvZaTS7CsQtCSERPBAe3TymBLTlx/J3RoC6w7/kKyvvr8pY
   SyKBgg3tLfn9UsRSORyrvYNSCLf6QICzL0DRT00yNbm0wlN3qAfrdzKxG
   96Sc74qucJqe/2SaYnDOUQ8NwgAjrTSiiM4x0YBdukAwnwd86E40RBK3n
   chXexr/HB7oPrF9TLyNY4i1C2USBXh/ZprcGJ+Ou8C8g0npBxgS/58bZ4
   rkPTpuHpgdVBylBoIRUEAZiSDXoVBPNipu9/rGbVDnrGVmF37g4W1Fi5Y
   A==;
X-CSE-ConnectionGUID: 4G57zuYHSt+Ihdq+KE53dg==
X-CSE-MsgGUID: nKvOdEV+TEKDy/DUBEk7lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219940811"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219940811"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 214B81C1C716
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CBCC314042DB
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D11DA18005BF;
	Fri, 27 Feb 2026 10:15:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 52/52] yaml-cpp: upgrade 0.8.0 -> 0.9.0
Date: Fri, 27 Feb 2026 18:13:27 +0800
Message-ID: <20260227101327.1432-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124752

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Increase minimum required CMake version to 3.5, update Googletest to 1.13
- Bazel module builds
- node/convert: Enable the template specialization for std::string_view properly when the library is compiled by MSVC on Windows
- CMake: Allow to disable uninstall
- Update cmakelists to use system googletest if available
- Fix indentation of empty flow sequences
- Add option YAML_ENABLE_PIC
- fix: use C locale by default
- Use FetchContent_MakeAvailable
- fix: parse files with '\r' symbols as line ending correctly
- fix(src): avoid possible infinite loop in LoadAll()
- missing keys should throw InvalidNode, not BadConversion
- fix: prettier floating point numbers
- Optimization of merge memories

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../yaml-cpp/{yaml-cpp_0.8.0.bb => yaml-cpp_0.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/yaml-cpp/{yaml-cpp_0.8.0.bb => yaml-cpp_0.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
rename to meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
index 09db5519ea..5233c569d2 100644
--- a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.8.0.bb
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.9.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
 # yaml-cpp releases are stored as archive files in github.
 # download the exact revision of release
 SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
-SRCREV = "28f93bdec6387d42332220afa9558060c8016795"
+SRCREV = "56e3bb550c91fd7005566f19c079cb7a503223cf"
 PV .= "+git"
 
 
-- 
2.43.0


