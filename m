Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C34F1112263
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7093.1775096128011006245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A9niVaVx;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096132; x=1806632132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ZDUMoTdSbXQYK0a+PaO/yQ3oGF10RnSFtdaqlxcKPs=;
  b=A9niVaVx6J0LrZ3Zr6cxGUG/mx26Ar06pEsiafgUqO4C+mINuwDwMflX
   1Ow+VHtVrSdz8nApPx0ivbTaILRWVYZojaxWA8NbpcLvJUhMptvgkl1Zn
   BsA0fEcQDWoTk1u2cI47Eb+YWy26TSHelWMuKjgtIjEQra997uOdyMzDz
   Cylh7xcxR92uy5c9N9OHBdc8KlvsBvQm8sSzYiuudKWGAu/DtC32OzsnY
   nRMTG/vXtTvSzNb6G1Uq55C1hCLigFiv56t3MFJ5CEa0yYEeFfTaOl6ta
   2RIEmBpwri4Ef27Xc1ekHxlvqPfz9FcZaeXMX9Uo5AC9nMp0q4XChzV/C
   g==;
X-CSE-ConnectionGUID: PALcGicpSOitJ1YYMI/Z0Q==
X-CSE-MsgGUID: hEfWGAvLQ46M/D4AIcmJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224161011"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224161011"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:32 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 578D31000141
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:33 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 084F9C0387B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 89F251003743;
	Thu,  2 Apr 2026 02:15:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/39] python3-anyio: upgrade 4.12.1 -> 4.13.0
Date: Thu,  2 Apr 2026 10:13:32 +0800
Message-ID: <20260402021355.1324-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Dropped support for Python 3.9
- Added a ttl parameter to the anyio.functools.lru_cache wrapper
- Widened the type annotations of file I/O streams to accept IO[bytes] instead
  of just BinaryIO
- Fixed anyio.Path not being compatible with Python 3.15 due to the removal of
  pathlib.Path.is_reserved() and the addition of pathlib.Path.__vfspath__()
- Fixed the BrokenResourceError raised by the asyncio SocketStream not having
  the original exception as its cause
- Fixed the TypeError raised when using "func" as a parameter name in
  pytest.mark.parametrize when using the pytest plugin
- Fixed the pytest plugin not running tests that had the anyio marker added
  programmatically via pytest_collection_modifyitems
- Fixed cancellation exceptions leaking from a CancelScope on asyncio when they
  are contained in an exception group alongside non-cancellation exceptions
- Fixed Condition.wait() not passing on a notification when the task is
  cancelled but already received a notification
- Fixed inverted condition in the process pool shutdown phase which would cause
  still-running pooled processes not to be terminated

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.12.1.bb => python3-anyio_4.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.12.1.bb => python3-anyio_4.13.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb b/meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb
index 40312c761a..e3e4fc9f7e 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.13.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703"
+SRC_URI[sha256sum] = "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


