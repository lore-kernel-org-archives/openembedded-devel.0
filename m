Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19F2C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:23:22 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.42642.1635765801803891221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=C8/BFXrn;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635765799; i=@fujitsu.com;
	bh=WPJsCxHjqwfLw89LFHAP2M5P34sEpf8Zzj0qSSUHYFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=C8/BFXrnavF49gxnUA9DMO6SBTGDN6U9W1PG4K49zZzcL+ORH6cuccerKyX7A5xoB
	 aqX8F+cdx5ANiENGSl8FeVnQwSZqLqIC1CgW8j8LGEQr/QcC6Br+wFNB8HXVowH9km
	 UibDZIdwrQEfCr1mdLNDiKw+wBOSFkldS+K2mpUnyTZAFp1dACz4giyB7CfNXtd0Wa
	 gkM0JHRsIcP2kWSUxlWK3RtIzCzDbFoMIVZLhDepO7gfxWb58FuhhJnFUzRSxOTmka
	 Tviq3Avr3lsAcAFHAisfdNiCLJ20n5xW5FImHXZVffLnzIXm/2+QMKExFoPSNDjlFp
	 6cJk87hn2osHA==
Received: from [100.112.196.248] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id CA/B0-09147-72ECF716;
 Mon, 01 Nov 2021 11:23:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSVftXH2
  iweIXlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0brpm7Wgt0cFTN3hTQwXmPvYuTkEBJ4wihx
  YWM6hH2RSWL2dpkuRi4g+wSjxN8fB5hAEmwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43QM2S
  FjATmLfp3NgcRag+JEnp8DqeQWcJJ60LAOrkRBQkJjy8D1YDaeAs8Spu3eB4hxAy5wkLvRqQ5
  QLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyVWre6DiqtJXD23iXkCo+AsJO2zkLQvYGRaxWi
  RVJSZnlGSm5iZo2toYKBraGika2hprmtkYqmXWKWbpJdaqlueWlyia6iXWF6sV1yZm5yTopeX
  WrKJERi6KQVHf+5gfPj6g94hRkkOJiVR3qil9YlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhTz
  gDlBItS01Mr0jJzgHEEk5bg4FES4V1+EijNW1yQmFucmQ6ROsWoKCXOewWkTwAkkVGaB9cGi9
  1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5mc8CTeHJzCuBm/4KaDET0OJ9YjUgi0sSEVJ
  SDUwGaYynpvVcf8T2bz33+4crPOolxQ/wzBeK6am2ao+L0LI8vX7ryzP2M278NRNML75p371B
  Zd8h/ic53P35zcJv2FzZn9+xvLh+eVjjnvD7N5ZJzV537ZCfSM9XtZCVJSWy+f6fu4vmfu9VE
  p716XRL2c616/8UZnuaPU4yX50UdMn59UfxkgyLdY8fr/M97LuOm0Xc+LfPFf28rs1bxPfs61
  Hmr9816fihsOON6cn+TmGpPfEhPidmZBeceufCziXPdnDrFWtp466pZhc2Lt/Amfk0fMnpS0G
  GLl/3WJ8I5OV7LvhikZXm9n2/nm2Zwrbvj57Jh8mnC3km1Boud7hwP+D6g7zTLR/2amlvK+xV
  YinOSDTUYi4qTgQAWcTtQFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-287.messagelabs.com!1635765798!3437324!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15103 invoked from network); 1 Nov 2021 11:23:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2021 11:23:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7CFF8100468
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 11:23:18 +0000 (GMT)
Received: from R01UKEXCASM224.r01.fujitsu.local (unknown [10.182.185.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 70F2410044F
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 11:23:18 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 1 Nov 2021 11:22:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.41.0 -> 1.41.1
Date: Mon, 1 Nov 2021 19:22:27 +0800
Message-ID: <1635765747-37718-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
References: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:23:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93698

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.41.0.bb => grpc_1.41.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.41.0.bb => grpc_1.41.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
index f961c533e0..8a9e762734 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.41.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "fc662b7964384b701af5bd3ce6994d2180080eb4"
+SRCREV_grpc = "635693ce624f3b3a89e5a764f0664958ef08b2b9"
 BRANCH = "v1.41.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-revert-db88fb0ee826e73323e06ac6166ac038ee71f6a.patch \
-- 
2.25.1


