Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AD4C4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:47:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.152452.1672123625310307520
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NVj9wMJS;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123623; i=@fujitsu.com;
	bh=WugcUJ8HmPVPmKHYxPM6mbuK1XlClnqTXioZsJgv5L4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NVj9wMJSmDpUX4j4MdwFTFycNN1zKt9A0+7ff86+hMYZUb88GG/0UVAE/ZcLPqBfH
	 Se8sysYwJLXImvUr/dOcJ19kqM/lvidKcynfLHuXf3jwpLpy8zfjab02zv7ROBlZ50
	 YZh8nP+j/zGQsoi6XZHit6dj3sNOcjmIF8aY52fRGHU810MZAZQxgkhTC6HSq8oRZJ
	 zC7jHCH5eNDxzgz/rnYaURlEz3+YhyuRkZOyk67imf+L3SLfd7WLaQTayzJUmN0uQU
	 YmWi+CL1aEcOrkhHdEAYTA1wAaPDQAK3UiFNaHKyiXRp/EXfVZityLuK0hjvP2+0l8
	 23CqyYk6LavjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqPt8yqp
  kgz9LOCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oymVR+ZCw5xVXSfns/SwHiUs4uRi0NI4Amj
  xPmPx5khnOtMEndXzWGDcPYwSpzofczSxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8Std0/AalgEVCWurnoJ1ssr4CSx+98aJhBbQkBBYsrD92C9nALOElf2dzOC2EJANX
  tXnWCFqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1QY1U03i6rlNzBMYBWchaZ+FpH0
  BI9MqRtPi1KKy1CJdI72kosz0jJLcxMwcvcQq3US91FLd8tTiEqBMYnmxXmpxsV5xZW5yTope
  XmrJJkZg8KYUK3zfwdi99I/eIUZJDiYlUV6p7lXJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4S
  ycB5QSLUtNTK9Iyc4CRBJOW4OBREoFo5S0uSMwtzkyHSJ1iVJQS5/0K0icAksgozYNrg0XvJU
  ZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvOog43ky80rgpr8CWswEtPjDoZUgi0sSEVJSDUz
  yd4/unBVU0cAt7HDUqXISQ7V9VCSvg+pknc83bQ5MeZ/Kvzd62rlNU/e0KbPyvPv0Zu21Hj7B
  jQZB6zIdnL2WcG/bpzzNvSblffOfSYqXi3SvsvNEvhftS9ksoxxatng37+7mojzxU89yWv6Xc
  L/Mun0qptLNcdLXmEkeFtyBmt9jt3P66UtOud33urhM7FzPIbuEjqBjXMkzXi65NeObgKdK14
  7K5f061yTV9WetMwj/xCl+3/+3dCWPk7RjhW1QPGNs+qO81Pr1J+bu6DU3TufyC5Wur7LnC1n
  kpckS7FrK8tykTYS7wNy80YXVcevBOAGWCMOaGTw1JkzTp02eVLzmxc1TL67zrLqqxFKckWio
  xVxUnAgAI3VcnlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1672123623!20742!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4020 invoked from network); 27 Dec 2022 06:47:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:47:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D193A100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C539D100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:47:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.166 -> 2.4.167
Date: Tue, 27 Dec 2022 14:46:23 +0800
Message-ID: <1672123586-32004-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
References: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100271

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Bump objects.
- Bump changelog.
- Bump version.
- Bump objects.
- Bump dependencies, move to poetry 1.3.
- Bump certifi.
- Bump deps.
- Bump deps.
- Re-order classes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.166.bb => python3-pymisp_2.4.167.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.166.bb => python3-pymisp_2.4.167.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb
index 0efcea0b6..b4680e35d 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.166.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.167.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "24c52813876dd88a92b9fcc4b6c2cd259d80d733"
+SRCREV = "29dc2d6d1aa7919f50db256525bf66aa52b585ec"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.25.1


