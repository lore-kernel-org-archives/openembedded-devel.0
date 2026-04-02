Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3E11112270
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7231.1775096151260007282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DSS00kE4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096151; x=1806632151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lHl+JHKm0FdsTbWmpxSphKSJZGMtrhse/P++WkmpZT8=;
  b=DSS00kE4K2vlqPAK7PaimnuO6nM+zUj9Ga5ED95Zqg/8KLMJWWgHrQqx
   13swbR+4hlgFnnNCsgSkx3fDkIaz+bszcml8TIH8E46iX+JyB88vvRHE8
   zRqjbocy+YWhuq5fEtKGRN4Q2MGJlkKyxmaB7u+f+fUleHyKVtlsCuJyw
   yzvEkQpxjT9IFQgqKmZmqWZ/rDI5F/UNjBFXRAqSo3FGWAvwFLifZ9/y/
   7I8kg2des5Ru/jcg0WXiZ6gnMyWFQeCWt73Uxl96uTo0VaaLQ988XsRMn
   AG5TvY7Fymk3gaAXOpe3XCY7pP8NMT9jrbDGhTHm07C4bn3jP81Jqk4la
   Q==;
X-CSE-ConnectionGUID: mkt0AyW2T0arvkwNrl2hkg==
X-CSE-MsgGUID: OqB8+MiQQQeiULK66hofNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214501904"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214501904"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:50 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C3FAAC00347
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:49 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7E41D14003ED
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2BF3F1003740;
	Thu,  2 Apr 2026 02:15:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/39] python3-gunicorn: upgrade 25.1.0 -> 25.3.0
Date: Thu,  2 Apr 2026 10:13:42 +0800
Message-ID: <20260402021355.1324-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125942

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
==========
- HTTP/2 ASGI Body Duplication: Fix request body being received twice in HTTP/2
  ASGI requests, causing JSON parsing errors with "Extra data" messages (#3558)
- ASGI Chunked EOF Handling: Add finish() method to callback parser to handle
  chunked encoding edge case where connection closes before final CRLF after
  zero-chunk
- HTTP/2 Documentation: Fix http_protocols examples to use comma-separated
  string instead of list syntax (#3561)
- Chunked Encoding: Reject chunk extensions containing bare CR bytes per RFC
  9112 (#3556)
- Request Line Limit: Fix --limit-request-line 0 to mean unlimited as
  documented, instead of using default maximum. Works with both Python and fast
  C parser. (#3563)
- uWSGI Async Workers: Fix InvalidUWSGIHeader: incomplete header error when
  using gevent or gthread workers with uwsgi protocol behind nginx.
- FileWrapper Iterator Protocol: Add __iter__ and __next__ methods to
  FileWrapper for full PEP 3333 compliance. Previously only supported old-style
  __getitem__ iteration which broke code explicitly using iter() or next().

Security =============
- ASGI Parser Header Validation: Add security checks per RFC 9110/9112:
- Reject duplicate Content-Length headers
- Reject requests with both Content-Length and Transfer-Encoding
- Reject chunked transfer encoding in HTTP/1.0
- Reject stacked chunked encoding
- Validate Transfer-Encoding values
- Strict chunk size validation

Changes ==========
- Fast HTTP Parser: Update to gunicorn_h1c >= 0.6.3 for asgi_headers property
  and InvalidChunkExtension validation for bare CR rejection
- ASGI PROXY Protocol: Add PROXY protocol v1/v2 support to callback parser
- Docker Images: Update to Python 3.14

New Features ============
- Fast HTTP Parser (gunicorn_h1c 0.6.0): Integrate new exception types and
  limit parameters from gunicorn_h1c 0.6.0 for both WSGI and ASGI workers
- Requires gunicorn_h1c >= 0.6.0 for http_parser='fast'
- Falls back to Python parser in auto mode if version not met
- Proper HTTP status codes for limit errors (414, 431)

Performance ============
- ASGI HTTP Parser Optimizations: Improve ASGI worker HTTP parsing performance
- Callback-based parsing with direct bytearray buffer operations
- Use bytearray.find() directly instead of converting to bytes first
- Use index-based iteration for header parsing instead of list.pop(0) (O(1) vs
  O(n))

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gunicorn_25.1.0.bb => python3-gunicorn_25.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_25.1.0.bb => python3-gunicorn_25.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
index a8b06786ae..cf41feae70 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_25.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_25.3.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dc9171ccd8fcbd7827c850148b3ca98"
 
-SRC_URI[sha256sum] = "1426611d959fa77e7de89f8c0f32eed6aa03ee735f98c01efba3e281b1c47616"
+SRC_URI[sha256sum] = "f74e1b2f9f76f6cd1ca01198968bd2dd65830edc24b6e8e4d78de8320e2fe889"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


