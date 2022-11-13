Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116D7C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:18:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.306.1668309490265385092
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yVDLndEp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309488; i=@fujitsu.com;
	bh=TBNItGVVLpnI/LznX9yTz8BJGON/vF3WlUqxQldPIR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yVDLndEp5roCWkzFeovDBv7WaAC2Tqwma4cdf4j/mXGQQnAoNWYR4yfVd/VouM+B+
	 Oa31hb6KO85TgmAXytKUkDuYcuhvnyc5+tw6X7Eer9GCqr/7bDMyFdSv1a3tZKHKQ8
	 vtq4uZP3+foYpF+p5jtkAg1Rjqmqjk2EjzSaqzU3RTTHjFW9XgEFq9hWj7jlT1RL4Y
	 1EijMPqK+40vVlHR3WWjwrzSOqNo6qs2Kvx7DNsNi38hqLE8C9ThtlukuCCuhDXgYV
	 BQfZnpn0R+p7PEkfQDL6FhkU//Uo228iqd0dMnqorx+e7iXWdFX6gba9a5otbbVaXX
	 zVb8COkblZ7Xg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8OxWfd9YkG
  ywZfHPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aTWZ2MBd1cFTNu3mZpYOzn7GLk4hASeMgo
  sfTremYI5zKTRN+5zWwQzh5GiS+b/rF3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsICPxPdz/xhBbBYBVYmGVRBxXgEniddP21hBbAkBBYkpD9+D9XIKOEu8OTIFLC4EVNP/4h
  8zRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUMDvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9
  vNSSTYzA8E0pVunbwfh22R+9Q4ySHExKorxp1/OThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw/
  o4sSBYSLEpNT61Iy8wBxhJMWoKDR0mEt8IOKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5MyvbQ
  eYhVjy8vNSpcR5ZycANQiANGSU5sGNg8X7JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvGu
  jgabwZOaVwG19BXQQE9BB3yPzQA4qSURISTUwhV5caxySwMl4IEFjVsXjeo+0Io3QTZ8CjB23
  35VpXfLYTbfEO2lRcGB34b2aE6Z9y/hucLOe5dYyedxu77Dirnn2z+Wcq66u2qnQN6E/783rL
  7zvhRf+Sptv/lDdqTlWNmulrfzLfqtGJie7vZuduK9u7Pw+f/X2z6wLDrueTs6pLToZkn9GN+
  hrMMcuT8Ge4Km57pqqbLdv7v5VEHTm/cTlf6VPugkYpM3WY8hdFOvG8GV2WeqKNQdsdM9l7kz
  jf2u3UfLzlztt1o9a9Qtf+Z+8zlH0Mi0kZN6tyLCjnaIKclePs2UuvuEr8zBFyUvug9L85hSW
  1PnsKqcnHT5d8Odiq/7Ri138LbPlVi5XYinOSDTUYi4qTgQAhM5d5nIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1668309487!380393!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1565 invoked from network); 13 Nov 2022 03:18:07 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:18:07 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EBF6D142
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DFC657B
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:18:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 2.0.0 -> 2.0.1
Date: Sun, 13 Nov 2022 11:17:28 +0800
Message-ID: <1668309448-15438-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
References: <1668309448-15438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99576

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Python 3.11: Fix a memory leak. See issue 328 and gevent issue 1924.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_2.0.0.bb => python3-greenlet_2.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_2.0.0.bb => python3-greenlet_2.0.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
index b65a70e28..629d9d359 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "6c66f0da8049ee3c126b762768179820d4c0ae0ca46ae489039e4da2fae39a52"
+SRC_URI[sha256sum] = "42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67"
 
 inherit pypi setuptools3
-- 
2.25.1


