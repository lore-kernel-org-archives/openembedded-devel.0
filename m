Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D37C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:31:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.39483.1681115466233902968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=feg9Fowg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115464; i=@fujitsu.com;
	bh=xGNijZxN+9NFuwfqUKknh1HYCHrMmT4QYgmXVCZa/6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=feg9FowgA3RtSmEUhRyM38f21bRXhMaLZugowoPG0N/7X+LX8wMVm78KK/8hJFz6k
	 vMxPxxQE3fczdmdELJdU7iDfyLwJKA93H3/L9KuHvw70gkAHLV9MbRu0elIr9bx0Gr
	 RyEJ4+AAZ+XK2gJIDf/jEN3KImtTQjFNK7vSRmJWTAHyxXYcilEla5oGeyWu4tJqcM
	 rdgys4NHnIzcFzwLULi+MiDk4PDqfqiUxuXtdlMH8i+s2lXWI5c6C0A4WhrL3/BZt9
	 zuavoRTOKVreHFx9cv6BFmr8j2FFkw0wOUMlittIm57XaxPWic/ydnuDzMiB7iZ0g1
	 jGON+KMRpwtGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqOtx0jj
  FYO0MUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPSsfdMBau5KtbevMrewHiIs4uRi0NI4Amj
  xPuz5xghnOtMEjPPdrN2MXICOXsYJeb8LAWx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhYIkmi+9IGpi5GDg0VAVeLSrGyQMK+Ak8SOnmeMILaEgILElIfvwVo5BZwldi6fBLXKSe
  LbwYWsEPWCEidnPmGBGC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhNi1OLylKLdI30kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkp
  enmpJZsYgYGbUqzav4Nxbe9fvUOMkhxMSqK8XVzGKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  BceAMoJFqWmp1akZeYAowgmLcHBoyTCW3EMKM1bXJCYW5yZDpE6xagoJc7begIoIQCSyCjNg2
  uDRe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK82w4DTeHJzCuBm/4KaDET0GIuFwOQxSW
  JCCmpBqYpAp39/UtkY+4d9jb/6xDwXi3gcN4N66olHSt2hHzjW8578EM4U6lqF4fUG6eKmR85
  eS5rpd/0LvxatKP2yK63uTNWNeh+czA09Lh6rOD0z9i8HR2WPf8Z8xTkbRUjeIreMyVzH7D9M
  afKpO7CksmzzhlsKwiYeHV/it2rZ65NZxbVeTtd2DGxP5u/dbWuopPbh6LQFv6NJ7v3NEzatj
  6Uo8t0sfaDyCZx47t207QfnrzRmbT7lqr/4fBzXVqNsVWeVovc9267amm0w0Tv6OnfR49uE2R
  zswuxvBrw+EjmNT2rSaUs71y9ed0U9xgEOrOJe66Wbj715FDa1htV+6aESRwUmML4d++Tkze+
  fFBiKc5INNRiLipOBADUcrfDVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1681115464!289009!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8222 invoked from network); 10 Apr 2023 08:31:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:31:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0FF951001B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:04 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 043C41001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:31:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:31:02 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.6 -> 13.0.7
Date: Mon, 10 Apr 2023 16:30:45 +0800
Message-ID: <1681115447-24458-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
References: <1681115447-24458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Wait longer when attempting to play media
 Bump black from 23.1.0 to 23.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.6.bb => python3-pychromecast_13.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.6.bb => python3-pychromecast_13.0.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb
index 2d9efa390..c27d490f4 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "149dad28cbed2296b5074c326662d9cb0093b834b417cb9ee05828e97b282e73"
+SRC_URI[sha256sum] = "0de98e9e5be43269dd41efb16126ab0d5ba941ca4acae024329712851c0c0324"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


