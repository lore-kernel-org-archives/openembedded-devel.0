Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C414C54EBE
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:25:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.16672.1673414736446653214
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EHRHuRtC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414734; i=@fujitsu.com;
	bh=bPAlRiR2CDiybFh1PCrgDCEb/cyJchzZPJerufl5Zjc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EHRHuRtCH+O3YoiZ0KZTcvZg5TJm0BGNFg+qMvSgjUvoDS+NTbFTAIAvGM7Tn2iQ+
	 mom4lDOYCRMfAdwbb6/3adpieETS6muWoky/+X1mz4IxX0q6r+rpl8qHsvBZ/jS4ox
	 ufy2e/qAhxLQrO0jOQrgSSL3SkJIA9brV1H3NkMtjcITKbaBmg0sBdA2sop2qPFZhe
	 LTkpMSjDZWNCxrxW4zcuGx683pm+TUEzw4tP5bPdM2MMn2Ig9n8li36iAKCkw/fZLX
	 ej714fqnWxEhjPyHZJn2UwPhdcNpKQgE/oP35EuMIQTvd/2AMeSBBbFT9s9gUwFr7r
	 OmTGUKUfeA2fQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8OxWdfXY1+
  ywbTThhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXr/msBRcVK3qvfWNqYHwi38XIxSEk8IBR
  YvmxX+wQzhUmiXmdqxghnL2MEnN7LrB0MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSwQJ7Hk5W0wm0VAVeL2th1g9bwCThI7/54Aq5cQUJCY8vA9mM0p4CzROOErK4gtBFSzav
  paJoh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjObFqUVlqUW6hkZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBAZxSnHx3B2Pn8j96hxglOZiURHnzJPYlC/El5adUZiQWZ8QXleakFh9ilOHgUJLgV
  XEFygkWpaanVqRl5gCjCSYtwcGjJMJb6wiU5i0uSMwtzkyHSJ1iVJQS53V2B0oIgCQySvPg2m
  ARfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC+zM9AUnsy8Erjpr4AWMwEtPty1F2RxSSJ
  CSqqBKcixgLmueGk2n/+fg4EctRebCp7MjP3X+Vkucc9nwdKv3keUZF62T43hP8Sw6ETqp3sO
  apHs0exypt/Sdp3/1pSwo/K/0OfABzeP3loVdcu2Umqmm8Xf05blOTr7WOOEC988cT/4qUnyV
  skmVxPjmSpF36bt9uir/aRl/qMudO72F0mOJVnpl2YlTFple2z5QuOb7DG7rBoyxKzXTZ69f6
  JmzO0Xr+NjRatOB7G9u/Rk0StuZz63QD8rBWt+N6njRanWx7aedvr20eB0Wa5y2vLn7Klzq7V
  ltaw+SdtViGmubN+eJrUwdzFDannEt5X7Uj2bSjb8iY4ViH/rvt7L7vPes4Y6HIcPl1w8nlGi
  xFKckWioxVxUnAgAgaOx81sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-745.messagelabs.com!1673414733!501190!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10476 invoked from network); 11 Jan 2023 05:25:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:25:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3D1B07B
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:33 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3149173
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:25:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:25:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.70.0 -> 2.71.0
Date: Wed, 11 Jan 2023 13:25:14 +0800
Message-ID: <1673414714-13796-5-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100532

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 accesscontextmanager: Update the api https://togithub.com/googleapis/google-api-python-client/commit/038fdb69dcb6ea01f6eb56901ff0e76e6bbaf3ab
 alertcenter: Update the api https://togithub.com/googleapis/google-api-python-client/commit/6057d89b613fb2a30ac2d26b90933ad0afa083d1
 androidenterprise: Update the api https://togithub.com/googleapis/google-api-python-client/commit/ec22103603074d33ad2a41bed36debc63b3bb528
 apigee: Update the api https://togithub.com/googleapis/google-api-python-client/commit/43f435c459205c8305f248efe78e6bd72a1b95c3
 batch: Update the api https://togithub.com/googleapis/google-api-python-client/commit/3dd983b5616c058887d38e9423388d236acc27dc
 clouddeploy: Update the api https://togithub.com/googleapis/google-api-python-client/commit/9a176a474cfd18a4b53d9b6b78bb432e6dd4cb0b
 compute: Update the api https://togithub.com/googleapis/google-api-python-client/commit/bba3627ef5ae35a101b223b3da2739224e1598aa
 container: Update the api https://togithub.com/googleapis/google-api-python-client/commit/98d6112970c5236cff5f36bf543a166ea27ca74c 
 contentwarehouse: Update the api https://togithub.com/googleapis/google-api-python-client/commit/00fa4bb30f92fdc325b23bd71b3ebd57fdcce4c7 
 datafusion: Update the api https://togithub.com/googleapis/google-api-python-client/commit/db1dddc7ca75258fde5cc59997599ce57ad8f01d 
 datamigration: Update the api https://togithub.com/googleapis/google-api-python-client/commit/12effe4a38299bb6f1fc61afeb1359200e9eff0b 
 datapipelines: Update the api https://togithub.com/googleapis/google-api-python-client/commit/91b60afaa437d7b29a96d83d3b89e3e855a81598 
 dataplex: Update the api https://togithub.com/googleapis/google-api-python-client/commit/04bafe3e118a1bbb2c75fc7f4e2e105f04bd4434 
 dataproc: Update the api https://togithub.com/googleapis/google-api-python-client/commit/1ad16fafbdfbf4d983112e5e811ea75f3727e67a 
 datastream: Update the api https://togithub.com/googleapis/google-api-python-client/commit/30f292141f98047d5acd526297f3f0e5bb79536e 
 firestore: Update the api https://togithub.com/googleapis/google-api-python-client/commit/89b34a91c7b56b03d59648bb582d3db1c5e06a4a 
 gmail: Update the api https://togithub.com/googleapis/google-api-python-client/commit/a4ca99c42e5c618e57071a800f49d784a0bb6eea 
 notebooks: Update the api https://togithub.com/googleapis/google-api-python-client/commit/f732fd307f07f53afc5344620456d0e662f81624 
 retail: Update the api https://togithub.com/googleapis/google-api-python-client/commit/d94dee346b3ae88d9d28bd97098bd2aba8093850 
 speech: Update the api https://togithub.com/googleapis/google-api-python-client/commit/339a5d6c9cf9ecdcfe6c1ac33ae2ede71973584e 
 texttospeech: Update the api https://togithub.com/googleapis/google-api-python-client/commit/ee942d9363c422443d9ec24c0dac8e373b37721f 
 workloadmanager: Update the api https://togithub.com/googleapis/google-api-python-client/commit/93f0e30afae73ea3ce888783de0a6bf53604e40d 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.70.0.bb => python3-google-api-python-client_2.71.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.70.0.bb => python3-google-api-python-client_2.71.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb
index 0e0a14ad0..6cfec6f71 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.71.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "262de094d5a30d337f59e66581019fed45b698c078397ac48dd323c0968236e7"
+SRC_URI[sha256sum] = "9412ad3445518fa9d24d02c673a70b07c9d124990f44763cdf4f5304ca5b4d08"
 
 inherit pypi setuptools3
 
-- 
2.25.1


