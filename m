Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5FDCDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7020.1782378144014515135
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bvCci+H7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378144; x=1813914144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNqcJ2hNGtZpIm4UFCGOV0cok9u+wlS/5KXz65z6uI0=;
  b=bvCci+H7P7l8NPkPiaN4baqJGuyCBDDIuGNAVf/HxQEUNALfCAVWQnQ2
   h+Jn7mMqbiUParAS/RPyTBhoUADMhcpUU3LN+/i45WDuUkdYhNxrM56zq
   h+NkzOOjU0ONwwjb/FCpzl6JiLq4mJnAjeR2FYOlGIQzcSHbg6IQjLSGX
   tFyQkxoZzFjQ+dg0T8qcWMsgVdp1OY8alOclV31egyfN6byj7yjsMcznc
   LA9gyui/4DgYhXW9HlS4mxarAyHV02XIDWlBl/bUlFMYN2N4zr6U047OS
   4lzSIEgv9yRhIhy1uSZfxXHNdLxDhFQDDCaQR18strQgKXGVhDWOpU3fp
   g==;
X-CSE-ConnectionGUID: tlEVxceMQ+mh/KKYiXoVVg==
X-CSE-MsgGUID: T+p7iHngTkaJkOZIkH+fag==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244743163"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="244743163"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:22 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5F763C00414
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 168C08267A5
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 080F71017325;
	Thu, 25 Jun 2026 09:02:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/47] python3-pyro5: upgrade 5.16 -> 5.17
Date: Thu, 25 Jun 2026 17:01:12 +0800
Message-ID: <20260625090127.1563-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127764

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix exception leaks
- MsgpackSerializer.loadsCall: honor ext_hook (symmetric with loads)
- Fixed slow locate_ns() on Windows: skipped reverse DNS lookup of 127.0.1.1 which caused 5+ second delays due to DNS timeout.
- Fixed exception leaks in message handling
- Fixed GC issue with daemon property
- Fixed thread race condition in nameserver remove()
- Fixed possible resource leaks in client
- Fixed IPv6 NAT port parse error in server
- Fixed crash related to None environment variable handling
- Fixed a deadlock scenario when using multiple proxies with different daemon connections
- Improved logging performance by avoiding eager string formatting
- Gracefully handle unreachable network in ip address resolution fallback
- Fixed potential socket leak from broadcast discovery when nameserver is unreachable
- Added extra message protocol validation for robustness
- Fixed nameserver metadata lookup returning incorrect results for None values
- Fix msgpack serializer loadsCall to make sure custom arguments get properly deserialized
- Various documentation and spelling corrections

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyro5_5.16.bb => python3-pyro5_5.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-pyro5/{python3-pyro5_5.16.bb => python3-pyro5_5.17.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb
rename to meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
index 63fb533920..c16257beae 100644
--- a/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.16.bb
+++ b/meta-python/recipes-connectivity/python-pyro5/python3-pyro5_5.17.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c9ccd5f4ca5d0f5057c0e690a0153d"
 
-SRC_URI[sha256sum] = "d40418ed2acee0d9093daf5023ed0b0cb485a6b62342934adb9e801956f5738b"
+SRC_URI[sha256sum] = "cfac69638d80943aff9cc5f1466755dd0fef8aed0bb4bda41b5eb045818ce6fc"
 
 PYPI_PACKAGE = "pyro5"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


