Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F622C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:26:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.111593.1669616755190666056
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=og30PdDM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616757; i=@fujitsu.com;
	bh=TrVismOU7Ofud0/SmGaDdW6mtcMTkNjxOf+iVYJXWCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=og30PdDMnwZxuT2eFl/q7gbBRnlAlhx3HtOy5t22neNHqo0+4n/EZro16wLAJ5RhY
	 7GyQI05LWnHtPgO4PpKqNg0etQWVf1w3Zmsc5oLCqYuyMHYHJ9KNJwCWVOfgkvNoQr
	 1MVcODBUbXVLJHAaAHdkbDCSltl4eCiYUdKutKpkob1quzO3iTENStRi3oTWYZSq7P
	 fH90ecQPMD9KznCwUdPLpgIhdDt0lfYTrXsr9wTVjjqk99djs1C5i5EkBC8bObUxlo
	 zhbe6uB2eWRS7dwazzrC4FaMg2hC7aWqwDQkl4ug3pYNpEGKyt+lA4rj4FGmmp1R50
	 cSQOP8dagZm9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWbc0pCX
  ZYPJScYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNv7le2gn6uivOztRsYF3N2MXJxCAk8ZJRo
  /beMGcK5zCTR+OQhK4Szh1Hi+qUzQA4nB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICXhJbd7QxgdgsAqoSn15sYgGxeQWcJFYvnwFWIyGgIDHl4XuwXk4BZ4kZp+6CzRcCqtm2qo
  UVol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrFsQuCQE1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdC30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQJDN6VYfesOxsPL/ugdYpTkYFIS5f0Y2JIsxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ3L
  khOsCg1PbUiLTMHGEcwaQkOHiUR3sX2QGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonzcg
  QDFQmAFGWU5sGNgMX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvHxBQFN4MvNK4Da9Ajq
  CCeiITYpNIEeUJCKkpBqYGGQsZyQ9v7vphKTD87Rj0Zf0HSIjXI9zn0qfdG1nEtOhLXUsy74b
  NksKl8bzf7djOiK43JKjq3C3541dTx5o6L+wtSl4euRaL/u9KfNtf2c6xS9IqJ+utvHY85dmk
  gaeyZGHnA3Tz7IECfku0FqnJH6jqLnUXChSl//ETC32pLup0of/m/69oMA/MTRqptXBa4afd+
  7NfrZ+sqvNlLx5ezzLlbgXbzv2/Ze+7m+D0qKly+K+BXz58XfynewWh5gpSdd8JOVmJG42c33
  8dcHdg3ONnRyKU48aTJ+QOLc9fKKjMP+2QNkfzM81ojqnp0rrLPu5W9+ew0Bhko0pk6hX9OP0
  eQLn+t7yVq5eV/hHiaU4I9FQi7moOBEAx+xJjmQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1669616757!223291!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2343 invoked from network); 28 Nov 2022 06:25:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:25:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1DFB5150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 11D8D7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:25:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyperf: upgrade 2.4.1 -> 2.5.0
Date: Mon, 28 Nov 2022 14:25:22 +0800
Message-ID: <1669616722-13377-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
References: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99820

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Recognize new name of Graal-based Python as jitted
Collect specialization statistics from running benchmarks
Add support for Python 3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyperf_2.4.1.bb => python3-pyperf_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.4.1.bb => python3-pyperf_2.5.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
index cb8282566..d5eaa4f60 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.5.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "38cf5e90c56f906a8320ce82a50bfa92c902b93affd72e4dc81580115f355853"
+SRC_URI[sha256sum] = "9fd9be5b57224e68b5a5b88f7126f15b6c8667573f62a0a39faf14d6fdd13909"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.25.1


