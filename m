Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D313EC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:24:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8737.1642663481557188015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hZn4DauQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642663479; i=@fujitsu.com;
	bh=bivgNRcjmcpbdIrE+hxxvIkfz7ExJJ0sGxti9pAIP5o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hZn4DauQ129H/ee347FhfbImTkZcNdNYS+fXiScC50eIwZ6jlTKUik6Gn/27bIFlq
	 PnqqoMrc/D2QT+IRyxBWNh9oEctyt6D/ZpX5OBfVff7reJX+nrrilUUip1zV4BEeU0
	 Jnqvvwo7XXyrCu9+ARXHnesQzjjn3v3vSSgaPrWLLC78CdKK6ldX+K3Pszzq8kZUQv
	 5OSyeSpYDuQ9vF6oO1nbl5GrINMUP827qvu/Kq3cV2iKO0WOdN5rFn7CffHPSzAZvi
	 nAmlSHp2UYS7gcT4EFGPsKoI44YSTZ2XM1WoGL3GbFD8nBOJa0U3QuxEbdXcFEp7+s
	 IuhQSwnTZLiUg==
Received: from [100.115.32.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id BC/AB-27579-73E09E16;
 Thu, 20 Jan 2022 07:24:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSdec72W
  iwaZFkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bBrkvMBUuEKpYd38fYwHhDoIuRi0NI4Amj
  xP2OvWwQzgUmiWMtR5m6GDmBnJOMEg1TLEFsNgF1icc3XzOC2CIC+hJLZ+9hBrGZBVQlui+uY
  QexhQWyJCbu/sEGYrMAxQ/+/A5WwyvgLjFx7k4WEFtCQEFiysP3YHFOAQ+JV0eXMEPscpf4cW
  oLI0S9oMTJmU9YIOZLSBx88YIZoldJ4sSKj0wQdoXE68OXoOJqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpb6BqaGOglVukm6qWW6panFpfoGukllhfrpRYX6xVX
  5ibnpOjlpZZsYgSGcUqxWs8OxhOrfuodYpTkYFIS5b3I9jJRiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgRvCQ9QTrAoNT21Ii0zBxhTMGkJDh4lEd4XIGne4oLE3OLMdIjUKUZFKXFefl6ghABIIq
  M0D64NFseXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzuoBM4cnMK4Gb/gpoMRPQ4v5nz0A
  WlyQipKQamAp+3qnomrLakfN63voH/Pr+t92EJdJev4gMbrGZ/erA0ptVXHP2Gza9f77KpljZ
  dZ5p+dWti8pL6+WrIyNXuf3hkfs9O95Ca//NywXvtvvOfReobe7xm6EyUvP5Ay2GL9Mt5fyWZ
  Wi9+qGntXvbFf6FcwMVf8XWSJ51KbruF1f2YBr/1m3VT3onX29KbTOW4t8tG3r5VOqs3azKC3
  M87Zc9e5VtYak+rdW/96fmwqog06TPUVps1z/k2p9bJGFbkZ3+W3qLa5fSzgopN5U7b1r+nZh
  Qb3vri6uzquuNvfuv6ZQkyR2feZ/pypc1D/UbDWMvM82/ETN3lvqdqIccBzr6t4lvVWOZ8KLt
  lvLu60osxRmJhlrMRcWJAKe/LK1eAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1642663479!70318!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12111 invoked from network); 20 Jan 2022 07:24:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Jan 2022 07:24:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 104AB100456
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:39 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 03BAA100441
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:24:39 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 20 Jan 2022 07:24:16 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 5/5] [oe] [meta-python] [PATCH]
 python3-google-api-python-client: upgrade 2.33.0 -> 2.36.0
Date: Thu, 20 Jan 2022 15:22:24 +0800
Message-ID: <1642663344-16829-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1642663344-16829-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Jan 2022 07:24:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94954

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
====================================================================
see changes at
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Features
analyticsadmin: update the api 981bbe3 (4d5c983)
artifactregistry: update the api 0d1152f (4d5c983)
content: update the api 195bfc2 (4d5c983)
datapipelines: update the api 3bb1937 (4d5c983)
dataproc: update the api 2fc3a16 (4d5c983)
datastream: update the api d51a6ee (4d5c983)
displayvideo: update the api 459a636 (4d5c983)
drive: update the api 92ec7cf (4d5c983)
eventarc: update the api 8fd4b62 (4d5c983)
metastore: update the api b7f92e4 (4d5c983)
ondemandscanning: update the api e8a2008 (4d5c983)
osconfig: update the api 974f389 (4d5c983)
privateca: update the api f48c528 (4d5c983)
recaptchaenterprise: update the api edd3d24 (4d5c983)
redis: update the api 0a68f42 (4d5c983)
run: update the api 59c518f (4d5c983)
sasportal: update the api 1517d9d (4d5c983)
servicedirectory: update the api 298a0e1 (4d5c983)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ent_2.33.0.bb => python3-google-api-python-client_2.36.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.33.0.bb => python3-google-api-python-client_2.36.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb
index 913c3719fd..502ebad3f0 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "38e98611794632a12479fafbabe0b5027e8fcfc412e8375f1b23db0bc0209181"
+SRC_URI[sha256sum] = "533c69e8ddce6630a2ce5b98348f6a58a23df49cb92040a0086315df979404af"
 
 inherit pypi setuptools3
 
-- 
2.25.1


