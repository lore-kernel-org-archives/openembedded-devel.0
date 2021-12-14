Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC0FC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 03:40:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.21499.1639453242514172960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 19:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zJfVYN3/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639453240; i=@fujitsu.com;
	bh=AN4Zz/xsBPYLLaNgmkocYuKC507ozO+fCKLXt/2ihZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zJfVYN3/krw8f1mxDw4cnmS1OkcaEgPRYkRBCmf/CCg4XI45wY7jraSU0QO4fnPsk
	 9nu7QhdHpJ44OVZZR1dWv8s5O1XxSCtVdhQE3Sqb7UNIyzjcipbgcYkwkmYVotwhJy
	 8bvMiwI6yJ+r/b8yYJirfG5g9T1kZAGC96e2mup3y0xFQOIx5bYOe11Jcp0qihegm6
	 734qdP8ssLHGFBILgQj4DyL2Ygyszq+n/f083GSLx5X9q7V7gxj+7bYZt4As/jjNyO
	 gfmVefyeW7Q4BNT5DdtnZLJsmQjNDKYWQpr1fSpot3uyeQ7Dnc7mjubIR8dmrJdjVn
	 OOq8/DrpBs0hg==
Received: from [100.115.39.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 29/43-16537-73218B16;
 Tue, 14 Dec 2021 03:40:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSddcaEe
  iQedCUYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFgwbGgm9cFdeXrGBqYGzj6mLk4hASeMIo
  8b35P2sXIyeQc4FJ4ukLRYjECUaJZ8c62EESbAJqEtNv3QArEhHQl1g6ew8ziM0soCLx4ncPW
  I2wQJDE9VdzwGwWAVWJcyt+MILYvAJOEj3H14LZEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYrROKspMzyjJTczM0TU0MNA
  1NDTVNbbUNTIw0Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzLlGL1EzsY
  n678qXeIUZKDSUmUd++f7YlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHi7BHYkCgkWpaanVqRl5
  gBjBCYtwcGjJMIbwwOU5i0uSMwtzkyHSJ1i1OVonrR8O7MQS15+XqqUOC8LH1CRAEhRRmke3A
  hYvF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMwrJQg0hSczrwRu0yugI5iAjjiWux3kiJJ
  EhJRUA1P9Cx6BqDh7hel30oMesdfXHGf1yeu+Xanalij+wT32Uipr6VWJaSt7eKXlr6Q237Vc
  uUd8gduN2a5rZk3ctsgn3+77tJmLZI/cOBQTZfjYWuHe5qnnrYLOV0dGWalZzm5dfCYi60ld9
  7evysJMwednbPtSNOGf1JLJj3Iv9J2K/f05/ces0/993kkXn03KWfMj6qLPQ4Xrx6okJkaf+n
  mb8+X1n9Y6ZQEh61inJrhNXv7geIu5jmuN2N+meP07jk7OKh31937ul97G4J4TrxayQVK47p2
  zl5RHVOO+x4esU05EzTh07Hzokqcz8j+e4q5sebc+wNCgb3s804PFjZPf1+Z9/tIyKZN1HuPG
  CTeVWIozEg21mIuKEwHVBDZoUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1639453239!53772!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17096 invoked from network); 14 Dec 2021 03:40:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Dec 2021 03:40:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 066E61000FC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 03:40:39 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id ED83E1000FB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 03:40:38 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 03:40:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 10.1.0 ->
 10.1.1
Date: Tue, 14 Dec 2021 11:40:05 +0800
Message-ID: <1639453205-29629-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 03:40:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94349

Changelog:
=====================
HA Lovelace controller: Prevent sending connect message twice (#559)
Bump black from 21.11b0 to 21.11b1 (#562)
Catch zeroconf errors (#564)
Bump black from 21.10b0 to 21.11b0 (#561)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_10.1.0.bb => python3-pychromecast_10.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_10.1.0.bb => python3-pychromecast_10.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb
index d6f72d5c0..185193992 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_10.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "ff6e196bd8d46ce648eb3739f3ab04168e287b167fc82abe1216d8fca21772f7"
+SRC_URI[sha256sum] = "33a47d551ae8b6f93129564828e72e7f4dcb26c9f8812328870cf300ee45438f"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


