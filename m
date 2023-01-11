Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21201C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:25:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.16721.1673414731865979386
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XrAaYN5d;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414730; i=@fujitsu.com;
	bh=YMhlzQadDe9jt1u5zSk0s078vfBm2pq8AmoDCq22lVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XrAaYN5dIBzxKUb/Gv3Duk0Isp87+gfcm9pVRND+u2BNxAvG7Wa6uFtwWcRN74XNo
	 dz0GKsK/72KFCD6/1jjsA89j9dsJl39IWO6j/ieIsxCP5D+jaZhafALPDAsyBHHjm5
	 PU5dkK+k7+uc1EN4D/r7fcJ0hWhCFIxKdRFBvmKMwwmQm6Zy3+OSOjav6EoP+OLaD7
	 saUN6/hX9VIJ/HlMLmV1IsGmqIylI5EB2PuOUuYcRYIGSopY0qz400P2rQ/dNZAaic
	 6Xz09b6jUQhGgfSU2dqP+Z2kXbYKEHwZHQsGs1FRURJQDAEbO7yBxC3e6QhSxKqHBk
	 pAj9VU+CTyECQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSdfTY1+
  ywdM9khYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a5VT9YCtZwVfR1bWdvYNzH2cXIxSEk8IRR
  YtKyQ+wQzg0midYbexghnL2MElcWXWDtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAR2Ln5B0sIDaLgKrEtPsvwOp5BZwk7hzYDxaXEFCQmPLwPVgvp4CzROOEr2DzhYBqVk
  1fywRRLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqTqVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFuoYWeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiB4ZtSzPJgB+OOZX/0DjFKcjApifLmSexLFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBq
  +IKlBMsSk1PrUjLzAHGEkxagoNHSYS31hEozVtckJhbnJkOkTrFqCglzuvsDpQQAElklObBtc
  Hi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5mZ6ApPJl5JXDTXwEtZgJafLhrL8jikkS
  ElFQDE9+bqRYxW219b82ofPDltPSyxsO/2WQEVV6zcvjNOr92nmCS4lf3KM1b8398nBR77/y/
  /AXV1/w5fvnKxdxge30lekm28M6TAusOvd+0tsvLv/t90dZrsw7fCL3Zm7f8xWndxHez3jqHC
  9vPKq7plEnkvnrx+jtf5foorYCiqbfW31pen76l2iBPYX3SrpMb+IKFtSbPPRXVtKjsnIHf0q
  2JTetZz9y7I7jLP2d56YvluiE72jy2Wmg52Z417ErPUNZZ4Lj+/LX5/1vq68SW9Qfxzc+82qP
  WG/N/qqC2TciWuxufayVbNSnJPdBUMrmV3vZWR1sh2+pn2eS2CaWp1ZVaX9N0cn8I6n+V9fQO
  VmIpzkg01GIuKk4EAGJrNYtaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1673414729!486083!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31200 invoked from network); 11 Jan 2023 05:25:29 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:25:29 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0B1A51000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F32D41000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:25:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.0.3 -> 7.0.4
Date: Wed, 11 Jan 2023 13:25:12 +0800
Message-ID: <1673414714-13796-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
References: <1673414714-13796-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100530

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
-Performance: an internal cache of file names was accidentally disabled,
 resulting in sometimes drastic reductions in performance.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.0.3.bb => python3-coverage_7.0.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.0.3.bb => python3-coverage_7.0.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb b/meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb
index 7e9b262d1..1fe99a92c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "d5be4e93acce64f516bf4fd239c0e6118fc913c93fa1a3f52d15bdcc60d97b2d"
+SRC_URI[sha256sum] = "f6c4ad409a0caf7e2e12e203348b1a9b19c514e7d078520973147bf2d3dcbc6f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


