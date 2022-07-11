Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB34CCA480
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:49:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.26177.1657529350597167561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r5i25tS/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657529348; i=@fujitsu.com;
	bh=L72txKpxXMs/7K46roC/VOl+8pzLP/2Oxx63vFOR1Q0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=r5i25tS/rLB4cEQLb3xNksD6zpvbsOiCBDzDblyQmhir8aJMfGI8w5o42w6T1WTBY
	 jtof3H8Cnnxyrpy7RZY0HlEjAiny6i1IOgywvXr90oHSqrAD3Pe2ls9q/T7eHgoWv6
	 2g530zhHMD5kAtU1v1IjHnZHSN0DAEySWtgdMHkeT0R74K+vfMAlOm3QCoKxTSZ90g
	 XkSQa8dOGoI75rC7cHCRMeGJFSnkLvVp9biFBC058P0SJlJqIAe5eabIa31V7m854f
	 RtUHSbwBnayTM69oQ6ULT1kym6dWd55ZKNBDRiKNGcCFNGyaHxq6EYjbVeoDPjR7OF
	 j1edI+ohDTTyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpMvy5HS
  SwdZOOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePwu1XsBbM4Kx53nWBqYFzG0cXIxSEk8JBR
  4sirVSwQzhUmiVXvjkE5exglzl96AORwcrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0sYCdx6NQXJhCbRUBVYufph0A2BwevgJPEh+50kLCEgILElIfvwVo5BZwlPu37BDZSCKik48
  0zNhCbV0BQ4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXVNdIyNTvcQq3US91FLd8tTiEl1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwCBOKWZ9uINxcd9PvUOMkhxMSqK8widPJwnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4P3yCCgnWJSanlqRlpkDjCiYtAQHj5II79UTQGne4oLE3OLMdIjUKUZdjplf2w4wC7
  Hk5eelSonzHgGZIQBSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzOj8GmsK
  TmVcCt+kV0BFMQEfEpZwAOaIkESEl1cAUqrX3Z4/+qvLjvNsTeD4bn3uaGdcZ+erZrKnyd9aF
  cARHHteUuPdQ+8XTnG1uX67zR+w6HtIfckzz04YVkRrTP7VGqQu/d9y6NHn7kaOaaYsfqH5YE
  1sk6h/n35fR2aY5y+zq5NPaUw7/KGVoUFxX+ml5yJovs6/MLMjb0iM/v1Dz34b105kzY/Qj8r
  Y8XPj6sLyiwaWIzYYHc98+vVtTUBLuqDLHf+kTY//Jm5+u+O7we/fMvEOCAcxsURMrTtf+so5
  LFJRY01PkN8dzOWvpbNtXpj/O1ruc2SSW277ENmVa2fQemxgp6/buf1kLK4O0Yh5fd34hE/Wx
  qyXeYHNCrZ35db9HfXdOzN/9/aO2EktxRqKhFnNRcSIAQyS1bWkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1657529348!7626!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4024 invoked from network); 11 Jul 2022 08:49:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Jul 2022 08:49:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 159281AF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0A8411AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 09:49:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Jul 2022 09:49:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libraw: upgrade 0.20.2 -> 0.21
Date: Mon, 11 Jul 2022 16:45:14 +0800
Message-ID: <1657529116-24181-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
References: <1657529116-24181-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 08:49:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97807

License-Update: Copyright year updated to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libraw/{libraw_0.20.2.bb => libraw_0.21.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.20.2.bb => libraw_0.21.bb} (63%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb b/meta-oe/recipes-support/libraw/libraw_0.21.bb
similarity index 63%
rename from meta-oe/recipes-support/libraw/libraw_0.20.2.bb
rename to meta-oe/recipes-support/libraw/libraw_0.21.bb
index 1940864a2..997f7ad44 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.20.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.21.bb
@@ -1,9 +1,9 @@
 SUMMARY = "raw image decoder"
 LICENSE = "LGPL-2.1-only | CDDL-1.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=74c9dffdc42805f9c0de2f97df6031fc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1501ae0aa3c8544e63f08d6f7bf88a6f"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=master;protocol=https"
-SRCREV = "0209b6a2caec189e6d1a9b21c10e9e49f46e5a92"
+SRCREV = "9b946d94bd65d744538926c2b12957864e187b9b"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.25.1


