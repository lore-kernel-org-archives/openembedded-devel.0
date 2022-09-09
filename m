Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F67C54EE9
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 01:25:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.1429.1662686703172253264
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 18:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c4AIk7/M;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662686701; i=@fujitsu.com;
	bh=poqqPWWZ6t9MoP1k8BcMiGRUI8td6VvTOFhmuP1GOIc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=c4AIk7/M9z4iSwrg1qe1czl85W1dqwvVplPvz8Ohdpau6CyCBqvC9+WEKmoT4vjyh
	 g/5LB5LHjAlmuzUgCWtWAVLWAhBBo2nnDR9GrgluJf8LX6BvxPZs4M+c4kvIK3Owfs
	 uvU239QBBsvriYzyKNjXyV498VnXh1f4tX+NDa27Deo7z4mt3UWTxOtsHss9R3MRYa
	 dquC5ouMvzrJR5CTaUfxhE9njjAl+CQhV0r1ShNTlkQHcu0YNdG0grdUn2Tf51HCsP
	 EvOVaBfT9E7zhYfqUI3ABl7EGVVuf8Uhw11gcmOm3/M0GJUnrPnV2lpRU+6M2XDMKo
	 Py5MT0MHIGmRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8OxWffNVKl
  kg+dnBCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oynj4+zFXRxVfRv+M3ewDiDs4uRi0NI4AGj
  xOZZrYxdjJxAzmUmiVfv/CAS+xklehpfsYMk2AR0JV78WMwCYosI6Essnb2HGcQWFvCW2PtwD
  1gNi4CKxPX7t9hAbF4Bd4mjC/YygdgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0g0Tj8E1aomcfXcJuYJjHyzkHTPQtK9gJFpFaNVUlFmekZJbmJmjq6hgYGuoaGprrG
  lroWRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuck6KXl1qyiREYeinF6kE7GL+t+Kl3iFGS
  g0lJlPdpv1SyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQney5OAcoJFqempFWmZOcA4gElLcPAoi
  fDaTgZK8xYXJOYWZ6ZDpE4xKkqJ88ZMAUoIgCQySvPg2mCxd4lRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMK8LyBSezLwSuOmvgBYzAS3eGigOsrgkESEl1cBkMl148oTjIhlSth/O7OP2nhF
  y0q08YeuZg+WhVsveM7+cwqzvdmjf2agjcefebjZ7uvRML+f7E4ErX9+9s+mxcMv5G4EbMvNU
  swpMPt3Y6yVsd0jh4kyzLauvNj7T6avZ/U3jModJ+KV1i0NvKUQnHnIQPuWrwT8vtuFN09SZp
  +fIuGhpt075NYm554b/j5YNT9pWCWbkOy3LX3YzYu2sVkn2fZ++CEmq1kW9Z6uK5GouXi/pVm
  lj0ul01unxVNkrRrUaP9u/f3iatXPbIeW/Z6LSaitC9Q6//XLmykbjDs32s8fK5n9Y/GiTRNs
  rDh4TGZ/D8xSccswn77XvfjLv18NrZsEm90v0P9lGMRr0KbEUZyQaajEXFScCAOYA9604AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1662686700!30291!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11291 invoked from network); 9 Sep 2022 01:25:00 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2022 01:25:00 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 024CE7B
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:00 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E99EF73
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:24:59 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 9 Sep 2022 02:24:58 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-natsort: upgrade 8.1.0 -> 8.2.0
Date: Fri, 9 Sep 2022 09:24:41 +0800
Message-ID: <1662686681-2412-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 01:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98725

Changelog:
===========
 Auto-coerce pathlib.Path objects to str since it is the least astonishing behavior
 Reduce strictness of type hints to avoid over-constraining client code

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-natsort_8.1.0.bb => python3-natsort_8.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_8.1.0.bb => python3-natsort_8.2.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb b/meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb
index 1ba40d3a14..bc142195ed 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "c7c1f3f27c375719a4dfcab353909fe39f26c2032a062a8c80cc844eaaca0445"
+SRC_URI[sha256sum] = "57f85b72c688b09e053cdac302dd5b5b53df5f73ae20b4874fcbffd8bf783d11"
 
 inherit pypi setuptools3
 
-- 
2.25.1


