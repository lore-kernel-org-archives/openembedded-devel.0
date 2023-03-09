Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F80C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:46:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.9518.1678355203189947018
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PVBLW7u4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355201; i=@fujitsu.com;
	bh=XpADT+uHmpS4iPyrSFzdhFSW5fwNOHc78mAqAEMJEZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PVBLW7u4kidh2TFFRNdjYBViqXF2ZUviR7ZzLPCG0rUiuT4qYrCUgi8a23reC1Ndu
	 jjy1aICTAAtwTgCsZMwScojFCIqEbh2m0TbYi+GnXQefugs2yq54HFiRFJba/a9dEG
	 Kt30bY8qCtuUkZrNMgGYwGa78VTRxh2YithoLsTnIhHeR9+pfSIEcOt+bc6pbk5/KG
	 D6Fm3SwSpiKPzRtph8ysacfq0Se2ZmMd9EMGdMpCe0doFRjhhC5S3Mspb6Hnt7Lv0T
	 cMEZ6G2Uc4uPXaQn02pAKoDMccupJRj6AeqVQmHsDyOclkBb5vN12Y+jhx+s+H/MN6
	 Gv6lIovYcN98Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSZdxNWe
  KwednjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bf7QnsBYe5K75dPsnUwLiPq4uRi0NI4Amj
  xPG7/ewQzg0miRuzl7NCOHsYJd6+vguU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphgQCJ38e+sIDYLEDxPxufgdm8Ak4Ss75uBuuVEFCQmPLwPVgvp4CzxJTv3UwgthBQzZd3re
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOxKidYPv6BsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YzYpTi8pSi3Qt9ZKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJS
  SzYxAsM3pTj57A7Go31/9Q4xSnIwKYnydrNxpgjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4DVfB
  pQTLEpNT61Iy8wBxhJMWoKDR0mEt382UJq3uCAxtzgzHSJ1ilFRSpw3cSVQQgAkkVGaB9cGi9
  9LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5V4BM4cnMK4Gb/gpoMRPQ4l1bOEAWlyQipKQ
  amGLVTN+0nD/tNt3hobsrf+Cr3UlvDver/VssvvO5bKy/X9qStz/2B55+yp2WYer9/7T5i3n/
  Wp+l1d3hK51xwCG1Y3v1PsWUbRrW8WnORQI1enwcCm9Yw3919k89fC3yvPDDvl2O/8MSHkZuX
  hNW84qj8cJny6rDWskmHU+2GxosXLxkQW9FqtreSR73DzJktfx8WssjLmNip+KUyvL8/sGYqk
  OV91bEH9npZ3moj3Xuvsv9TXe2qH+d9iV6tdm/RQdnrxTsFfx/fn1O5e6Xvw4nT/lvrZUlYs9
  85k/GkzmzFUvtEidpNe6t+jS17iGnzLOHpkxLe/uKVq34Nj9oSUz/snVdHTevxehX2zCvYVdi
  Kc5INNRiLipOBAA4EQo8WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1678355200!519863!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26775 invoked from network); 9 Mar 2023 09:46:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:46:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 698531000EE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5DD911000DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:46:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:46:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/11] python3-tqdm: upgrade 4.64.1 -> 4.65.0
Date: Thu, 9 Mar 2023 17:45:54 +0800
Message-ID: <1678355155-32741-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
References: <1678355155-32741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101454

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
add Python 3.11 and drop Python 3.6 support (#1439, #1419, #502 <- #720, #620)
misc code & docs tidy
fix & update CI workflows & tests

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.64.1.bb => python3-tqdm_4.65.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.64.1.bb => python3-tqdm_4.65.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb
index cb3b56aa8..f54b5c41e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.64.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.65.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=1672e2674934fd93a31c09cf17f34100"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=cfdbc9dcca7dc9fb600347958b7d5c4f"
 
-SRC_URI[sha256sum] = "5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4"
+SRC_URI[sha256sum] = "1871fb68a86b8fb3b59ca4cdd3dcccbc7e6d613eeed31f4c332531977b89beb5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


