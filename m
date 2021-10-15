Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFE2C43219
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 05:09:39 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.5529.1634274577979718148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 22:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wFM8tfJT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634274570; i=@fujitsu.com;
	bh=uQ8+D3LXXyYFLxzIZOx706I8bZAoRLALoieZKE/GUSU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wFM8tfJTa5AP6NQrEK2HtNRkoK0PlMddjUh0kbtU+X+ZES812azbz+B3V4709xmHS
	 4zc2OVD+moMEifNTEuWaNPbPnuE2F4nLoOqD07hN4WNYOxVF081t/vbAVFtn25U2Ca
	 BLmDb17h3pq/51CYwjpqF1qB+ansF1F5k+gq4TdSkZQGtobsl2ndEHG8Sc4ge3kF7k
	 9y8kSgUOotFdjXrygCC1npgdMj38YhrZdlt5Z0v35ehiZPgYRkDEmutF/8c0GkIxal
	 PO5FH01lyNzLzGhdVTzAt27l+KF/REKdtxzp3O4Tj30Ew7ymtqgIwIw5tKpEQBzlSv
	 eO5ZBV65KPqHg==
Received: from [100.113.7.205] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 61/3D-01506-90D09616;
 Fri, 15 Oct 2021 05:09:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORqMvJm5l
  osHqVvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF9ykSmghMcFf8arrI3MH5i72Lk4hASeMIo
  sfjaejYI5wKTxN+/86AyJxglVq77ydzFyMnBJqAj0fGimwXEFhHQl1g6ew9YXFjAQ2LZ1IusI
  DaLgKrEmfYmsBpeATeJX+ubwGokBBQkpjx8zwwRF5Q4OfMJWA2zgITEwRcvoGoUJbbvPMMCYV
  dIvD58CSquJnH13CbmCYx8s5C0z0LSvoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6JrqGxgV5
  ilW6SXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMw+FIKWZp2MP5+9UHvEKMkB5OSKC8D
  c2aiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnezj8ZiUKCRanpqRVpmTnASIBJS3DwKInwJnEBt
  fIWFyTmFmemQ6ROMSpKifNGcAMlBEASGaV5cG2w6LvEKCslzMvIwMAgxFOQWpSbWYIq/4pRnI
  NRSZg3EWQKT2ZeCdz0V0CLmYAW//bLAFlckoiQkmpg4vklOW9a54sX1+zV5MpijYSOcx/K0+f
  YqnPxF49+X/3p2EtOPZey+26e9Vr+s2bZx63/fToXv9/xYfnG96wzlpuWXN0/I9DH5kWT3mrD
  lVbifpxCHcqPfsxy41k9ubj/tare8gNHPv57Gi2qW7NaWur/BH59vYNSOS+P+aWanvybJTGn7
  9WNHerfRbp/Hsnjuu7yMot9qeEXnZSQH7+F6tesc59RpvnRpT44tWEp+8J9rktebzx59IHCos
  CcEpO9G5nffH2c/XZ6mdTln/0Ros/9PixcrVl366nIPV395lczeYJ9QnZVNTPFmWzwWPPxbuU
  CQan54S0LlVo2uB5TU1KaFHqq7p6qrMnOh5cXflNiKc5INNRiLipOBADPeuSROQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1634274569!908461!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26230 invoked from network); 15 Oct 2021 05:09:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Oct 2021 05:09:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0D6AE100229
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:09:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 01379100225
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:09:29 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 15 Oct 2021 06:09:18 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-nmap: upgrade 1.5.0 -> 1.5.1
Date: Sat, 16 Oct 2021 01:09:13 +0800
Message-ID: <1634317753-4486-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 05:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93322

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-nmap_1.5.0.bb => python3-nmap_1.5.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.5.0.bb => python3-nmap_1.5.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb b/meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb
index a3523b7dfe..ed0e980c8d 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.5.1.bb
@@ -8,8 +8,7 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[md5sum] = "3a43dd0f56ade8c76c7c6f994604212d"
-SRC_URI[sha256sum] = "b52744e0c9944c567733b8deb60d6363e17233ee40466edfb1b09a5780576f9a"
+SRC_URI[sha256sum] = "0e6667153a84938bdc0e95a64cd86397b4c46724c422873ea8f1d007d248926a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


