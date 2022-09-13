Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2286C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:18:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3060.1663064316748579883
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K08ayEFj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064314; i=@fujitsu.com;
	bh=7lU+wZXdKawxZBUrJAhaRTu24wzFCHK7AIxHOFdXU8w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K08ayEFjr2M5X9AEhnMmSawFDcDOJsg81OAgi5KEQs1gB7q2X80QvQ7PUyVmpYjLD
	 ce4wfC7m+Wyq/G8VSRXc/VXPNbCgKNjZFxDrh1vcngS9E7z9M+SADx2CiJgdswM/v+
	 6LA+jFh2cqyNG1YNNXmjd3s8U5FRfkCvuY4kpVOBDhJ5u28R5/H1L0TMNMe7DY/Njp
	 XtJ860UvU77jVt9+OwhK32MF2rMgcSXVMPmEk0+p5t9GPhQE0UskF4FKksu4Xh+iVZ
	 rs3bqXR8xYQxx9VDugVzsd0Q1NR0Yerl2YPnvXo4ifPNn25sJJDiu6mObhNxf9wFZh
	 KVybr9/5Gb1ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8OxWfdXhEK
  ywafPkhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bK92vYC85wVOx++oWlgfETexcjF4eQwANG
  idfzN7NCOJeZJP58mAeVOcAosWjfS8YuRk4ONgFdiRc/FrOA2CIC+hJLZ+9hBrGFBWwkFi3/D
  FbDIqAq0b/1H1gNr4C7xNwJP8DiEgIKElMevmeGiAtKnJz5BKyGWUBC4uCLF0BxDqAaRYnZ0+
  UhyiskGqcfYoKw1SSuntvEPIGRbxaS7llIuhcwMq1itE0qykzPKMlNzMzRNTQw0DU0NAXSRrq
  GpsZ6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgSGYUpw2cwfjln2/9A4x
  SnIwKYnyRnopJAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0PAcoJFqWmp1akZeYA4wEmLcHBo
  yTCyxMMlOYtLkjMLc5Mh0idYrTkmDr7335mjuVgcubXtgPMQix5+XmpUuK8M72BGgRAGjJK8+
  DGwWL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXokwoCk8mXklcFtfAR3EBHSQkbU8yEE
  liQgpqQamCqd3qgl/n3aYHLyi9/Pnvx3CPJO5XknPDquSPeW0+IwsW0njQr0Lc4z2/fteYPDh
  t9s5UZ/H74PXbkxlCpU5Gbpn+pl9i0+tZV2U6BHsNonr6jORF31bWi/z6ewvZLWZHFjyr9CTo
  WuZzwO+H+UvT0k/LU3UunAqcT3fFxnujMjEsH0Vdn/tw/kXRpTExhpMTVu7cG7ers3Gd/Uu//
  Z06N/YWJ90Zd2Ok4z7C7pa1OcJlq7U29gau9rlx/RNq+zOiM0LeG97UuojnyBT0I7VZzQP+ia
  5FkcfU83aNkvewlZl6eY7Ly4r+f0p3/j4+6pfd3qZsv+bTFnyLvbAzSlfFb69evdFZtFu3syi
  f2zTNZRYijMSDbWYi4oTAclcDN5UAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1663064314!150328!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31296 invoked from network); 13 Sep 2022 10:18:34 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:18:34 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D14137B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:18:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C404C73
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:18:33 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:18:32 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 2.0.3 -> 2.0.4
Date: Tue, 13 Sep 2022 18:18:25 +0800
Message-ID: <1663064305-5308-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:18:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98774

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.0.3.bb => tree_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.0.3.bb => tree_2.0.4.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.3.bb b/meta-oe/recipes-support/tree/tree_2.0.4.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.0.3.bb
rename to meta-oe/recipes-support/tree/tree_2.0.4.bb
index c5f3364a37..5ef5336835 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.3.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.4.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[sha256sum] = "ba14e77b5f9dc7f8250c3f702ec5b6be2f93cd0fa87311bab3239676866a3b1d"
+SRC_URI[sha256sum] = "b0ea92197849579a3f09a50dbefc3d4708caf555d304a830e16e20b73b4ffa74"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


