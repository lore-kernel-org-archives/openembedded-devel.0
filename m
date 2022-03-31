Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44893C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 08:14:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4597.1648714469885699061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 01:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eL18mmco;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648714468; i=@fujitsu.com;
	bh=4phTlZbLNUBF2z1prdEgeRcVe1Kjsx+L59vjdmnjj/Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eL18mmcoMwmKieVNY60l2xV0FGY6Bs/d3fxDXv5d7coLRicMUTeWNIkyO00xdlq7j
	 N/F49eDxkM+KY/MMqZxKqHCdJ5SNBBwqyzhTr+FB/VU/0nC5uAqQZJ+9+7fCHRnEAT
	 oJphwbbyqXGX4rbiRdVdN40mwyU7xJnvoc8xeJ6Ncs4avfPVoOqzAkO43EKhcTeK4V
	 uCl9ZKW3/BVHMSQOGrec5RGnFtDnWRjmqi3uU0t6Wnt4EkuwTfqOcU46V+1DtgwU5C
	 0gKt/BmIzHOSb0svy8qQQGbFhDh0zImgBKw2nFNym7TYK5nqzfE6KrClBE2kqP8rYe
	 MmyXek4VcR3Zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfdxkmu
  SwbrFxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bP9DmsBU+5K3ac28XawNjF3cXIxSEk8IRR
  4kzjDlYI5wKTxPznD9kgnJOMEnPP9bB3MXJysAmoSzy++ZoRxBYR0JdYOnsPM4jNLKAq0X1xD
  ViNsECWRMfxk2wgNgtQ/NuvnywgNq+Au8SnQ81gcQkBBYkpD98D9XJwcAp4SGxpcQYJCwGVTP
  uzjRmiXFDi5MwnLBDjJSQOvnjBDNGqJHFixUcmCLtC4vXhS1BxNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXUNdY0MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOKWY8fQOxk19P/UOMUpyMCmJ8joFuCYJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuCtA8aFkGBRanpqRVpmDjCiYNISHDxKIryOIGne4oLE3OLMdIjUKUZFKXFe30SghABIIq
  M0D64NFsWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzZoCM58nMK4Gb/gpoMRPQ4rrHjiC
  LSxIRUlINTI5rQiSKy/pNVte2Tlwsec+4leOg4mudJNed6afflbzde2pjTdfmLx/+x38r/lso
  7DAxU5FJX79v1YMO1ss5D021WRm31P7anvO9Pdnc+4hbZLufxLfZRdWODuuXz9BR5RdNj5hdf
  aryxSE3QVEuoU9yF22N126arDAzVU47lUVt09aHMs36prP1FuvxzBF72+X7zV7nW86aCN5Dko
  +3taSdva8cWt8wmedXP99Vv2+bXswy3i2SEsW8Lbrczc36u2bOE/b3i4y4/X5/bbo064/9/GC
  3VWdO6spzzEqvv9s9g2kBm1Acq2Om94xpd99lfD7ixPHKR6/94tKtpy5ek1v3TSrV8k34ne3V
  l1+yKLEUZyQaajEXFScCAEwHhB1dAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-27.tower-591.messagelabs.com!1648714467!163882!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1921 invoked from network); 31 Mar 2022 08:14:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-27.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 Mar 2022 08:14:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 595BF100460
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:14:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 440A4100441
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 09:14:27 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 09:14:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/5] [oe] [meta-python] [PATCH]
 python3-google-api-python-client: upgrade 2.36.0 -> 2.42.0
Date: Thu, 31 Mar 2022 16:13:26 +0800
Message-ID: <1648714408-12048-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648714408-12048-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 08:14:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96289

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
https://github.com/googleapis/google-api-python-client/blob/main/CHANGELOG.md

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ent_2.36.0.bb => python3-google-api-python-client_2.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.36.0.bb => python3-google-api-python-client_2.42.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb
index 502ebad3f0..8fcf669952 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "533c69e8ddce6630a2ce5b98348f6a58a23df49cb92040a0086315df979404af"
+SRC_URI[sha256sum] = "7bf58b665b635d06adb47797a9a4f73482e739e02ed036cd960dc7c183361f67"
 
 inherit pypi setuptools3
 
-- 
2.25.1


