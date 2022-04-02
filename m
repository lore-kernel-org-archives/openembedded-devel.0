Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C7AC49ED8
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.2647.1649137235965653522
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HfgU03y3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137234; i=@fujitsu.com;
	bh=AJJYnoMPsCDnap+QnwTqAimcVEQG0x9QnR4raLHYvVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HfgU03y32EXtzWwbzE7I0Ws8kOPCd97fzjrd6TIvbyzKzzuXMx/1jqsFojFBB0Vza
	 va7aCgIqgftLE6obano1op/geY+3UVGvQHt84lCU4fhpr6c2sjAIlQ8kitwdU3oDXA
	 lvzo/+wFJTovI0awf7YVIbEskdYvIJ/H00xdKqJMBoKFoIhNCglgdqNf2TfPm8oDpW
	 P3hgYPt8DOcR1p4jCYbqccBmbxF74URhIAvXdJmhAUuqfhCUMnk16+NLnB2k/NibmV
	 AOLfmMw4BuUMuB61Mz4uba4Y2BEXzSK+BvHqdOPY3Ixt3dNMjaxlae+jEEVeFv3CWl
	 F0ILBAveIiikA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqBt4zTv
  JYGWbgcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF0yxPWgnucFce/PWFsYGzg7GLk4hASeMIo
  sfLReRYI5wKTRP/VFjYIZzejxJJbv4AynBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3D3
  sXIwSEs4COxebc8iMkCFN6wpgqkglfASeLE40OMILaEgILElIfvwTo5BZwlnu94zwRiCwHVnL
  n/mxmiXlDi5MwnLBDTJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2VSUWZ6RkluYmaOrqGBga6hoamuoa6ppV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmAApxQzWu9g7Oj7qXeIUZKDSUmU94yrd5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd6TZ4FygkWp6akVaZk5wGiCSUtw8CiJ8B65CJTmLS5IzC3OTIdInWJUlBLnvXkFKCEAks
  gozYNrg0XwJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvP9ApvBk5pXATX8FtJgJaPG7M54
  gi0sSEVJSDUyKGu9Cv9h9+33O8cqEveUxjzv+M5x85uqVbHTKtLI8rU5EcvlC8cliie+yErwd
  PwpP+Nb2yLN7w5HK9DqGc3maMlaTzv2w+/52Dksh5+It03sOTBXbvHfqAr2553bYXj15NCg0f
  8H/S4/LlnTUiuaGnAwyv+47K6VRVkSlWGXy+hO8ip+7Zc6WHrgrHMvH+TFtguc86Vv8Wxpzth
  lkXwmt0FS6LZD6oUHuvNq0Y8oLtiQvs7zZELR55ayfD9V3p6ytyvP8P1XBsmze5jPzXzam/xB
  ombXve8urSRP5T4lHXz546HFidGbds0VP9Kw87yzSabb9FB+TNi1ifckm1qM+61//K+oR3eJv
  d1f75KQ2JZbijERDLeai4kQA89cMxFsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1649137233!369813!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27567 invoked from network); 5 Apr 2022 05:40:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:40:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3E5F91001B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0CF8A1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:40:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-thrift: upgrade 0.15.0 -> 0.16.0
Date: Sat, 2 Apr 2022 20:36:49 +0800
Message-ID: <1648903009-19854-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
References: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96409

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.15.0.bb => python3-thrift_0.16.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.15.0.bb => python3-thrift_0.16.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
index 78cbba6b27..6eb896d1d2 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.16.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "87c8205a71cf8bbb111cb99b1f7495070fbc9cabb671669568854210da5b3e29"
+SRC_URI[sha256sum] = "2b5b6488fcded21f9d312aa23c9ff6a0195d0f6ae26ddbd5ad9e3e25dfc14408"
 
 inherit pypi setuptools3
 
-- 
2.25.1


