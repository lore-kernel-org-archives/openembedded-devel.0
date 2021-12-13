Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9DBC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:18:00 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.10791.1639401479471022806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V/fu46sP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401477; i=@fujitsu.com;
	bh=/sofD73lHkPQHR9JNd7P41KppBtwq4BosLKT5xjGWc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V/fu46sPztHneDpLM4NlTQPNHJVeMRwd05F2IaN7zx2Myqwocr1b6S99i+SsuLoSB
	 HTzPgIjcW7DRCNex1pz/3UZGpw3BVjWU5+RYY6F4d1qy/ylGOwL6uFDLs5oO6BQo3h
	 pY8Eqcp+1VkUl3XkctupehntiKcqs0ARM/uQ7keoBE8Kqrr+PE2NdHBpz/B/Z8DXTq
	 MFJx5M24+UEO4825cZnnI4kUAVzfg9VfTPdcNYTTOCiKRaKtY9hTI+IT05SMI548q8
	 3tFJBRxZ7eNcwbGizM8LECrTvLVphidvLOwSQJPXU3HzfsjrBSu9iEKjZ1mjLsEFdw
	 up4WvsGzJUHMw==
Received: from [100.115.71.165] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 CB/CE-11258-50847B16; Mon, 13 Dec 2021 13:17:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqMvqsT3
  RYNo/OYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPr1VdsBV3cFU+PtjE2MM7m6mLk4hASeMIo
  MXfbHeYuRk4g5wKTxOvVJhCJE4wSPb/3gyXYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0s4CPR8v81WJxFQFXixLVuFhCbV8BJYmrXVbBeCQEFiSkP34PVcAo4S7xddYQJYrGTRMesO2
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGO2SijLTM0pyEzNzdA0NDHQNDU11zSx0DU2M9RKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBwZxS7NK/g/F+30+9Q4ySHExKorzBrNsThfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnw/jYHygkWpaanVqRl5gAjCyYtwcGjJMLb7QiU5i0uSMwtzkyHSJ1iVJQS553lBpQQAE
  lklObBtcGi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5kkPE8mXklcNNfAS1mAlrMWLk
  ZZHFJIkJKqoFpzZtzTJs2290seMC6UH6Jce/e3Acmims7WIN23XpwNUSnX3Zv9+b+8sdpf5PX
  LLdg1jYteZJw8ErMbkextVt2lu55fmvvklfb19Z8UjUzinz30t1ouamX/ttpms3iLiccWw76d
  SxJVU2RnX9a8vjblLh1qqtXfez+UMtanShRwqDLXJt5vaTXbMqz/pddcxuCf+w3Tfs+92fPfq
  EP6w98eNIqHm4g9EGfI7r3p3u0/vFqxnjm3/UidreOhIdPcQl848niy3nqvf5NmW9f56cZhTX
  eUwleuXJXcRCXuNC8NdwTcpwPC3/26BXpuO55z+aMpuHLy6X92fHCd3MYtS7un/3H7nrFqZA5
  wqd0jfWVWIozEg21mIuKEwERpNFQYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-532.messagelabs.com!1639401477!16326!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27926 invoked from network); 13 Dec 2021 13:17:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:17:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F1CC810024B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:17:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E3F5210023C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:17:56 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:17:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-scrypt: upgrade 0.8.18 -> 0.8.19
Date: Mon, 13 Dec 2021 21:17:26 +0800
Message-ID: <1639401446-27788-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639401446-27788-1-git-send-email-wangmy@fujitsu.com>
References: <1639401446-27788-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 13:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94328

License-Update: year update to 2021.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-scrypt_0.8.18.bb => python3-scrypt_0.8.19.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.18.bb => python3-scrypt_0.8.19.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb
index 691742d6d..f0a9e1615 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.18.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.19.bb
@@ -1,11 +1,11 @@
 DESCRIPTION = "Bindings for the scrypt key derivation function library"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ddf47d0ff1849bce3257ccbc1fd275c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05b5ac2824a7ae7489193b0f6a6f2cd1"
 HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "bcf04257af12e6d52974d177a7b08e314b66f350a73f9b6f7b232d69a6a1e041"
+SRC_URI[sha256sum] = "ad143035ae0cf5e97c4b399f4e4686adf442c5f0f06f9f198a0cc6c091335fb7"
 
 inherit pypi ptest setuptools3 dos2unix
 
-- 
2.25.1


