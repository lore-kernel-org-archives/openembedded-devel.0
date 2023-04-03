Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40613C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.66274.1680516261362230149
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oU9GGoii;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516259; i=@fujitsu.com;
	bh=/EdPCOFTtkoRRcM+xIs0ebM7t5CSSD7vrLGrAeo3VhU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oU9GGoiiWNFqqjkrBoR2ayeexr2AfEHFKdRfJhwh3kGhHExM1LL6ryOPHZ8qjDjj+
	 Ksso+RZvvyi+GYhnIRNqTM3vFz9SdVTDaxVjLTbTcBiV8OhIpUWuL842+bPeaAzF9h
	 Ti1LVO8LRBJa+vayDDWPLJGsGZk45kOGrCKmRTji46HDPtFh2MFeLVQHiVYiaUYlW6
	 9kui6qPoS5gin/cXEz3d0o2jNRmoB7+WrsCFzeaz/WITbYssXX9vOBo6ZP5gbpJN72
	 VSy7LdMEpAP/iEzAO7po1snlXML7NDe5mtfqzwy2uHV+nrSGAnagqVlkRigaLUguT4
	 vFxaFjalaQU3g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXfxEq0
  Ug0kXuCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyGnossBRO5K2Z+ecTcwLidq4uRi0NI4CGj
  RPflZiYI5zKTxLTN+5khnN2MEmsenGLtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggTmJf110WEJsFKH58zwTGLkYODl4BJ4lHs0tAwhICChJTHr4Ha+UUcJa4PeM0WLkQUM
  mP658ZQWxeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4
  LSfsCRqZVjGbFqUVlqUW65npJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIHBm1KcyrmDcWXfX71DjJIcTEqivIL1WilCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHjnLQLKCRalpqdWpGXmACMJJi3BwaMkwqu4ACjNW1yQmFucmQ6ROsWoKCXOexqkTwAkkV
  GaB9cGi95LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5xRYDTeHJzCuBm/4KaDET0OLWKA2
  QxSWJCCmpBiaftx6uHEx2eWV1Bez2p4/tkjDWd6m/3yv30mWphvOd+fMZ5U3rZZnsPvyIm1o+
  h0/+mo3Ja7HZr9OcL332OiRSMLW3cN2lT68sbxVopimmnrSNb74Q/ay2V242p/qUvvDz7QeuC
  n4PbGuvV3d54ycScziIv75irZuV0anntxwtPRvTHUStbhjnXSo+0bafu3zhnt6tBnlMvbc9D6
  5o2LA9ON+dLe212JQGDds3y0W2WyUtri3wm1r15Hf3tp6FjDaFnoeu5MYVbLy2YN3p2w4JGo9
  s9nwMLd7T2PThzqGdvfPO7RP5Hpt5RT39s8q0vmnzGZdV7t30nPsbZwXnBU65fDM3Lt4a2fns
  LxYJK7EUZyQaajEXFScCAEl8bwVZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1680516258!1030136!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22857 invoked from network); 3 Apr 2023 10:04:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:04:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9B432162
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:18 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8E3777C
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:04:17 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.81.0 -> 2.83.0
Date: Mon, 3 Apr 2023 18:04:01 +0800
Message-ID: <1680516244-30936-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
References: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101915

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.81.0.bb => python3-google-api-python-client_2.83.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.81.0.bb => python3-google-api-python-client_2.83.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb
index d471d9aaa..3dc69404a 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.81.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.83.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8faab0b9b19d3797b455d33320c643253b6761fd0d3f3adb54792ab155d0795a"
+SRC_URI[sha256sum] = "d07509f1b2d2b2427363b454db996f7a15e1751a48cfcaf28427050560dd51cf"
 
 inherit pypi setuptools3
 
-- 
2.34.1


