Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F530FD7F7B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92463.1772187304550549350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i85tYN+5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187305; x=1803723305;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1+JgeG7FXe3gabG9wg7HQ7HJSOXo0TfOalMbXYWm4zI=;
  b=i85tYN+5bYUWxOz1t/HgdRK/gWma/EoftXs49qnhNFuxld7R7cDPkZc/
   TZQH6U+I7aate9bHkjDw7TgD5GZPihQB0CYyDhmdSCqeYRAK7qxeaQaLe
   MqeFEX6ODACk3J/W9qd50tHj/FTuL2lGAUbmUO6f4mdWx/1DAuEgUB7B0
   PbR67sHTQCYyTcyUlmqLec148Nld0qR79iFLZfbRnG10GmN3HHywYPyna
   gbutMbay2hMmqVTlxOd0THO3zIqP/CI0Zo+NCmJvgk/TDEdA3w6XuzWeq
   qKTjx6ypoE+yb0oFi49UcnoAd9YTSQco/yUi1rzfTSxmPsENmQvXl9aey
   A==;
X-CSE-ConnectionGUID: SIUSWp1xSTuMzIBcS2lAtg==
X-CSE-MsgGUID: NYjbPvmNRUa94JdaqV8xjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="235523470"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="235523470"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 171DF1002B9B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C09451400138
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id DAB6518005A1;
	Fri, 27 Feb 2026 10:14:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/52] python3-responses: upgrade 0.25.8 -> 0.26.0
Date: Fri, 27 Feb 2026 18:13:06 +0800
Message-ID: <20260227101327.1432-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124731

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* When using 'assert_all_requests_are_fired=True', assertions about
  unfired requests are now raised even when an exception occurs in the context manager or
  decorated function. Previously, these assertions were suppressed when exceptions occurred.
  This new behavior provides valuable debugging context about which mocked requests were
  or weren't called.
* Consider the 'Retry-After' header when handling retries

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.25.8.bb => python3-responses_0.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.8.bb => python3-responses_0.26.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.8.bb b/meta-python/recipes-devtools/python/python3-responses_0.26.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.8.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.26.0.bb
index 2370a88843..4d1884225d 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.8.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.26.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9374d047a575c8f781b94454db5cab590b6029505f488d12899ddb10a4af1cf4"
+SRC_URI[sha256sum] = "c7f6923e6343ef3682816ba421c006626777893cb0d5e1434f674b649bac9eb4"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


