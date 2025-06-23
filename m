Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B56EC8300F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13709.1750662713074935053
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mWoA4ZQz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662713; x=1782198713;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tz/Y4NEzi1YaPTuN/ulaFMGz09/9FUA5JFQXqRESvK4=;
  b=mWoA4ZQzV3cRcIImJ3LzmiT2JYWw6fgIzDN5SB+UGHMpu6X/Q/bH4qHb
   GXVvblWMOeEkf+doLinsiRBu6og3EjbTtRLv4C8d75fhie8kBFveR5bAp
   hr7tT7qLletWZspAam0Tdpde8LIHS7I2YGjj7+EipUYnaK48MS2V2FWHP
   Z4jcW4dhpRXZbywNBf4Hj1b/CsLiUAOrHtbk84vtin/GG/LYpLsZ3yZNb
   JbRDdFE3IwoMnt46Dbuwg5sM7sVgZNmMZHguWYlDCip2C3loHy7zTlbxb
   +5+LIfsDbH5p/d5tfLgenJAwe4RnTtUh9LqF7KDtDy1uP0i7RxnR1bqBx
   A==;
X-CSE-ConnectionGUID: ICmZaEEbRaug6G07dQDC2g==
X-CSE-MsgGUID: 5oBYGrAMSyOZBm6uTYECGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182501860"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182501860"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E467C13DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CED42D4E07
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 505841A0073;
	Mon, 23 Jun 2025 15:11:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 05/30] libcpr: upgrade 1.11.0 -> 1.12.0
Date: Mon, 23 Jun 2025 15:11:12 +0800
Message-ID: <20250623071138.402-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
- Updated supported versions for 1.11.0
- Add FreeBSD package/port mention into README
- Fixed grammatical issues and corrected spelling errors in README.md
- Refactored timeout.h: added template ctr and removed redundant ctrs
- fix no-revoke.
- Resolve CURLOPT_SSL_OPTIONS issues
- fix: remove duplicate call in Session::prepareCommonDownload()
- Update To The Latest Clang-Tidy Version
- Enhance: Use unordered_map for CURL error mapping
- Public cpr::Session::GetSharedPtrFromThis
- Replace ubuntu:22.04 and ubuntu:23.04 with ubuntu:latest
- [BUG] Fix cpr::ssl:KeyBlob: Copy blob to curl
- Added handling no_proxy override through Proxies
- fix: let bad-host-tests pass when there is DNS error redirection
- Removed 1.9.x from the supported versions
- Replaced the secureStringClear mechanism with a SecureString class
- Clang-Tidy And cppcheck Fixes
- Getter function for Session::header_ to enable the user to read back all headers set and delete select ones
- Status code int32_t -> long
- Fix windows static library build parameter in CMakeLists.txt
- Fix Seg-fault when setting proxy username + password
- Add Session::RemoveContent()
- Cookie expires date is now only 100 days in the future
- add curl's ANY and ANSAFE authorization options
- Fixed memory leak in threadpool
- Add enforced HTTP/3
- Update README.md to add Bazel extension instructions
- feat: Use CMAKE_MSVC_RUNTIME_LIBRARY for runtime selection in MSVC
- Update CMakeLists.txt project version for 1.11.2 release
- Add std::to_string functionality for ErrorCode to ease human meaningful logging
- Make cpr::async and HTTP (Get, Post, Put, etc.) callbacks cancelable
- Refactor AsyncWrapper to make it safer
- Do Not Check For Sanitizers If They Are Not Enabled
- Fix usage for TLS v1.3 cipher
- Changed LowSpeed to use std::chrono
- Better OpenSSL headers include based on headers version.
- Ensure cpr::LowSpeed properties are cased to long for curl
- Implemented cpr::BodyView.
- Add primary_ip primary_port to Response
- Bump stefanzweifel/git-auto-commit-action from 5 to 6
- Load all certs in a CaBuffer
- WIP CURL 8.13 Support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcpr/{libcpr_1.11.0.bb => libcpr_1.12.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libcpr/{libcpr_1.11.0.bb => libcpr_1.12.0.bb} (90%)

diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb b/meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb
similarity index 90%
rename from meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
rename to meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb
index 03cd877901..58da899081 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.12.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
 
 DEPENDS = "curl openssl"
 
-SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.11.x"
-SRCREV = "bb01c8db702fb41e5497aee9c0559ddf4bf13749"
+SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=master"
+SRCREV = "da40186618909b1a7363d4e4495aa899c6e0eb75"
 
 
 inherit cmake
-- 
2.43.0


