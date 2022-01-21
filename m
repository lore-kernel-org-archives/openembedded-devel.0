Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A702BC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 00:36:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.5135.1642725370165751149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JGU3uJxH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642725367; i=@fujitsu.com;
	bh=YlJqzqFmjp4JmAwUuUctfPxMP97CO/jgu6JB45skm4o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JGU3uJxHGb7CQ5ZXDwxdqI4E4Y8noiiQw+yufFDic3w9pnDVciD1vnm8IofRwX8UY
	 yCGNmpNztprh6yO2eEuj9D8Alw7z3oHuxYYQQB4EOXtzvQeFGxixZ/qdbVavqhj+OO
	 b0Th7PFOK2d/3edND18rl0EjJ1wj5SqUz/w/5fQwaobP/Gtv5fM3AVku5R73kFm2ow
	 ias0d1F2Ev16o6YkP/oRUCPI93P0B0Ifd51UjWoDF0bVO2Wy4dAhcHKxj6Fg3wggot
	 uB7+ERqjD2c9aLO+HfFl07WF+m1af6eIRvyRuSAiRotn58T0gmX2SumLOl1TkFE0em
	 btXZug1g9+eoA==
Received: from [100.115.1.29] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 2E/E1-02997-7FFF9E16;
 Fri, 21 Jan 2022 00:36:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxRff7/5e
  JBv03uS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozWdc8YCw5zVjSeWsXUwHiBo4uRi0NIYCaT
  xPneXewQzglGifaTh4EcTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O4BqxEW8JI4ff06I
  4jNIqAqse37aSCbg4NXwEni5XlRkLCEgILElIfvwVo5BZwl1k74yAJSIgRUsvuDPUiYV0BQ4u
  TMJywQ0yUkDr54wQzRqigx+3IzC4RdITFrVhvTBEb+WUhaZiFpWcDItIrRKqkoMz2jJDcxM0f
  X0MBA19DQVBdImproJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmRKMcOs
  HYyz+n7qHWKU5GBSEuUtXvEyUYgvKT+lMiOxOCO+qDQntfgQowwHh5IE762/QDnBotT01Iq0z
  BxgdMCkJTh4lER4X/8BSvMWFyTmFmemQ6ROMYZzvFm7ZBEzx1sw2XbvLpBsB5MzFxxczcwxC0
  zebz8EJB+ASCGWvPy8VClxXsd/QOMEQMZllObBLYNF/yVGWSlhXkYGBgYhnoLUotzMElT5V4z
  iHIxKwrwPQabwZOaVwN30CuhcJqBz+589Azm3JBEhJdXAxLZrmvCLQkmDe98MLkUJqyUox+xh
  Pc1iWCO+YH1062RmkfPvr3LzCcU73zx0qzjDICXgFJNWk0sYo67C3Is3HiqfvWUstlXg69sHG
  84cUAipmXxiW7X74rTn5THzMmQuu9h9V41Ojp8quefi7ncTTW7le/7hq5W9umQrm+iVUDX2Gi
  7GlhmvixsF9GqcGS0qSiy+bV3j4f7E3Yi/xOWK3OLz8vp2id++lWRczFCeecNnvqJGHOOLc3o
  JRwU092g+MOh0NLxwMHr/xcts1/s49ud//Kzn06km6dWckbp4hoK724O4wKT4yHqVS3enO806
  /ZU/un9vwFe2qzeSLqQcdgld9vtMRaunoFPCiWtKLMUZiYZazEXFiQCm0qE/eQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1642725366!48449!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 456 invoked from network); 21 Jan 2022 00:36:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Jan 2022 00:36:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20L0a1eb009230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 00:36:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 21 Jan 2022 00:36:02 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sdbus-c++-libsystemd: upgrade 249 -> 250.3
Date: Fri, 21 Jan 2022 08:35:50 +0800
Message-ID: <1642725351-24004-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
References: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 00:36:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94961

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...us-c++-libsystemd_249.bb => sdbus-c++-libsystemd_250.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_249.bb => sdbus-c++-libsystemd_250.3.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
index a3ef6a747..0cd96f528 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
@@ -10,8 +10,8 @@ inherit meson pkgconfig
 
 DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jinja2-native"
 
-SRCREV = "00b0393e65252bf631670604f58b844780b08c50"
-SRCBRANCH = "v249-stable"
+SRCREV = "1b003bbc806198dbdd57b405d968f30565495e70"
+SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://static-libsystemd-pkgconfig.patch \
            "
-- 
2.25.1


