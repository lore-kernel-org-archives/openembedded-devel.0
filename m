Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57CDC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 14:45:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.11890.1639406755980322106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 06:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xXnvGCQp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639406753; i=@fujitsu.com;
	bh=dOn5+TtygrBAi08PuRTMrsf6GYGbdfSMmKs1tuLDby4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xXnvGCQp1pKOxki1Gm9McBUEPvyc6mWNlsGeNZCJnpRgEFFI+UhP+2y3FfRPT5Mdx
	 93moximBknFhTAfw3dKr64xYvgQfKC5jKt1nZslnba/Pp24pzch5xib9MqxatqshAy
	 rhMHUcdB/6shXDNgEmV0r4TBAmYleqL+9qlcjPWNCR6SGUw2Is/fox5pAGXs4ldWY3
	 hxVfK9TZ+LFXG5wZ/g4cP6lZtaofOCbBtFrxpmIHu1SMw4yKRND9xErNUgeiqfu6bi
	 GY4nak3dDRemGcKQDErBsWDGdTG2SMj4dLVkjmLkWAB4firN3pO1DaRVJIZX4m5dka
	 xrachA9NvltYQ==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id B4/F5-13695-1AC57B16;
 Mon, 13 Dec 2021 14:45:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSXdhzPZ
  Eg/mNnBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXyi+sBcuFK+Y3r2VvYOwW7GLk4hASeMIo
  cXleJwuEc4FJ4tj2N0wQzglGiRkLZgA5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hK9F7bwwhiswioSsxctZYNxOYVcJJobF4FVi8hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Q
  KqRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkarpKLM9IyS3MTMHF1DAwN
  dQ0NTXWNdQ0tLvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwLBMKWY+voNx
  St9PvUOMkhxMSqK8wazbE4X4kvJTKjMSizPii0pzUosPMcpwcChJ8J4JB8oJFqWmp1akZeYAY
  wQmLcHBoyTC+yESKM1bXJCYW5yZDpE6xagoJc7rHQ2UEABJZJTmwbXB4vISo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHe/1FAU3gy80rgpr8CWswEtJixcjPI4pJEhJRUA5OjS4u6XdSeqBy
  171Glru2RVbordsioJNrpiNZxKAm8PqLhcv+xyJVDtvfZFlzK98iLUE9SZu5rqlx+T+5330Td
  cxe9f6hbGtQordgbbvDeI2HBHuuZ18x5CneudbJVLfJ/+GC32PLDy/8tOr9qCVtfff+kYo66M
  y/s1hgwpK7evS79Zdchb4kOLufzjwoN1N9Zv3gi9kHoKIvpvGUOz9u6VB5flz7mxM8yb3rCzM
  BJno5nXutqf8q96Gnx3ut8ztGJx24zTtG6rKpffkbxaL9m4p8lfwSql3lUnZr/9XbR5Kl3V70
  wk2p4+MjCY7/zUms108ea/Ku3LJzbp29jKHDpUtnHs0a1m0UUzkmq9iixFGckGmoxFxUnAgAj
  pFe8RgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1639406752!15666!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29116 invoked from network); 13 Dec 2021 14:45:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 14:45:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A69AE100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:45:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9882610033A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 14:45:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 14:45:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.18.1 -> 2.9.19
Date: Mon, 13 Dec 2021 22:45:31 +0800
Message-ID: <1639406733-28016-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 14:45:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94330

changelog:
=========

* src/snort.c :
  Fixed an issue where verdict will be applied onto next session when timeout
  occurs in some scenarios.

* rc/file-process/file_service.c :
  Removed an excessively flooding log.

* src/dynamic-preprocessors/modbus/modbus_decode.c :
  Fixed possible integer overflow.

* src/fpcreate.c :
  Added fix to GCC compiled snort to use AC-BNFA-Q search-method when Intel-cpm
  is enabled.

* src/generators.h
  src/preprocessors/Stream6/snort_stream_tcp.c :
  Added fix to not to drop packets when window size is 0 by TCP normalizer
  and Added new alert with GID 129 and SID 21 when such packets are seen.

* src/dynamic-preprocessors/appid/detector_plugins/detector_imap.c
  src/dynamic-preprocessors/appid/detector_plugins/detector_pop3.c :
  Added support for Appid to detect login success and failure for IMAP and POP3
  protocols.

* src/dynamic-preprocessors/reputation/reputation_config.c
  src/dynamic-preprocessors/reputation/spp_reputation.c
  src/dynamic-preprocessors/reputation/spp_reputation.h
  src/pkt_tracer.c
  src/snort.c
  src/util.c :
  Fixed terminology to be bias-free in log/error messages.

* src/snort.c :
  Fixed a potential race condition.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../snort/{snort_2.9.18.1.bb => snort_2.9.19.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.18.1.bb => snort_2.9.19.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
index 1e2495406e..9c479d2200 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.18.1.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.19.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa"
+SRC_URI[sha256sum] = "b12fc6db72afb58987a2bf1954b8f45bde02047c235513c7663857b9506369c7"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


