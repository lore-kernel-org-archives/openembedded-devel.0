Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E1ACDE00E
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7010.1782378121409505217
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ruryvElZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378121; x=1813914121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7gxovpYasWDFz00sQ0RB/fg6AGSRiXIDtno0Upizotw=;
  b=ruryvElZZQ8Ynad1oGmpiKqXr0lnCxWRP8W8qoMowGGuxfDCjV6R9t9v
   DG9L1C+vZ3DwavHpN+v7JZdulMIENWlh392HZFUhn2VJurW6iokd54Ay5
   q9jG373V1mrMvy9SbOgKYyY0ISzjzXWpkcPQCmUmVE3I8E3e4DR1T3lYR
   laLYPyRQJ8+H2qUjejdhy4p4C9OVyyeSHTxIWcNSUa6whPZMfa8hkM4W/
   wjVaZqUzJaUi0BHlvsd40FA0SGI3wOfp48Xt+PrOxvAgtuDDaqdJ+LBR1
   CjDTm1AcuFrUeGLT6b6ywmChz8fQeUNih8nIJ/h5U0reQyDE59OlIdfVm
   Q==;
X-CSE-ConnectionGUID: TzA4q1h1SQi3PTygtT7AoQ==
X-CSE-MsgGUID: xQVOj8S6QVWWrRzwrSLznA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="222999864"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="222999864"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:00 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D0B08820C2D
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8A4AB1400123
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 948A41017328;
	Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/47] python3-coverage: upgrade 7.14.1 -> 7.14.3
Date: Thu, 25 Jun 2026 17:00:58 +0800
Message-ID: <20260625090127.1563-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127750

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix: some messages were being written to stdout, making coverage json -o -
  useless for capturing JSON output. Now messages are written to stderr
- Fix: CoverageData kept one SQLite connection per thread that recorded
  coverage, but never closed them when those threads terminated. On long runs
  with many short-lived threads this leaked one file descriptor per dead thread,
  eventually failing with OSError: [Errno 24] Too many open files. Connections
  belonging to terminated threads are now closed and dropped.
- Fix: when using sys.monitoring, we were assuming we could use the COVERAGE_ID
  tool id. But other tools might also assume they could use that id.
  Pre-allocated ids don't really make sense, so now we search for a usable one
  instead.
- Following the advice of cibuildwheel, we no longer distribute wheels for
  Python 3.13 free-threaded.
- Fix: the default exclusion rule now also matches function bodies whose
  closing return-type bracket is on its own line (for example, after a long ->
  dict[...] annotation that a formatter has split over multiple lines).
- Fix: On 3.13t, we incorrectly issued Couldn't import C tracer errors. We
  can't import the C tracer because in 7.14.2 we stopped shipping compiled
  wheels for 3.13t.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.14.1.bb => python3-coverage_7.14.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.14.1.bb => python3-coverage_7.14.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb
index 100b5118d7..1be553ca7b 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "30c08f7d90415aa98b3c990385dea2939b0da55f38515e5b369b83655f8523be"
+SRC_URI[sha256sum] = "1a7563a443f3d53fdeb040ec8c9f7466aed7ca3dc5891aa09d3ca3625fa4387f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


