Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7F6C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3289.1787132163833569779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=khwudvcl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132167; x=1818668167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZXXCeqVNGBCiPsPM/mkAsHQ0RTGX9S1tHzxMhIhHAY=;
  b=khwudvclrM17bnYl9JqUPkAr3qtbmBsS586A4rSgbOvASDYQG/Du3/V2
   +2kdN5jZ949P0FJd3mjy1RNa7+m+yK/i5xuUYACt2UqQmy9StYwnaQdUV
   rn+/OS1rMD90j2zxLXPvxdOAXb2VPv4Q9Bt09iXwf1JLPBMeKe9LcT0rZ
   HvrVuHcDqGuahsetgMYMK29zs1c3UT2WQrMwFYG+6asyY9jdmwRarZA7Y
   LJS1oE2OuF0D9HQasvF95FEkunsSH7h9vyClCDNXzFzbf0qv91RLUGwHS
   dHawktXjJb7hZfbNUs7AgxIrZilkXiiuwCrh02UlqMSiK1Ue62y696h0w
   w==;
X-CSE-ConnectionGUID: qMOqhQc4TGO3jtqKNOZaEA==
X-CSE-MsgGUID: MvBx8umLQAWy45/CUtmldQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507829"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507829"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:06 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2F4291C1C71A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DBD9E181AEA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E9DB41801C11;
	Wed, 19 Aug 2026 09:35:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/70] python3-coverage: upgrade 7.15.3 -> 7.15.4
Date: Wed, 19 Aug 2026 17:34:28 +0800
Message-ID: <20260819093514.1101-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129294

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: in the HTML report, a source file name containing a double quote (legal
  on POSIX) wasn't escaped where it's dropped into the href of the index and
  prev/next links, so it could close the attribute early and inject markup. Page
  URLs are now escaped.
- Fix: the LCOV report wrote file names and other fields into its line-oriented
  records without neutralizing control characters. A measured file whose name
  contained a newline (legal on POSIX) could forge extra records, inflating the
  coverage seen by tools that read the report. Control characters in a field are
  now replaced.
- Wheels are now provided for Python 3.15.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.15.3.bb => python3-coverage_7.15.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.15.3.bb => python3-coverage_7.15.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb
index b74fd1db58..822fefbd50 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "ae7ea5a4614acf399ef0483c4cb34f8f8f01df848d8fcbe7d3ce0865733f1c4d"
+SRC_URI[sha256sum] = "0548198fff07ccf4faf469520bce1c2eceb1ce3e62891921138dec10907f9d00"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


