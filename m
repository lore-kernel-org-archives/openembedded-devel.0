Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27712C25B0E
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:58:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.24634.1660705085630149618
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KB50ZodC;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705083; i=@fujitsu.com;
	bh=6/VUm2fOgu6vJYar5SkhpvKXqhztO/+hFUl+Mb84k6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KB50ZodCoHJzGZMujdMBPbc7agLMhgjkX5ZfDyATgmIKSxMhDxFdla8iUCszYxTEB
	 y6pFkKBvS4e9BHoxcNc8yebMnUmvNXmHmfjk332Fy8QzPbfDFAicxduj5oFtOfQudI
	 URGgpzMOJ7gphdTstXUqSedLI2TcqLtBGDXap662oX+Rf42NBTYKeplHsKKvZHG8io
	 ZCPD95hX/NlLJoQf8sH2iCkTpw2jgY0w63jDekUxP6tFvrc1eDKUhcpcTyZozPOF27
	 u/0tIKnkgqrtiFt8pVh9tRBrjuAkZa1Crbn5XsH3KnkaiEeWkObQI+qL6swY3ooalk
	 JOVy5NSGFZaAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqGsd+Sf
  J4N4yAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWwTtMBcc5Ks4uOczcwPiGvYuRk0NI4Amj
  xJKviV2MXED2dSaJ709aWCGcPYwS7+ffZQKpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  rBJwgLeEu/udrKA2CwCqhKd746wgdi8Ak4SB6/2g9kSAgoSUx6+B+vlFHCW+DZ7J1CcA2iZk8
  TcqeYQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiRkztkGNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2FLXwkgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67M
  Tc5J0ctLLdnECAzhlGL1oB2M31b81DvEKMnBpCTK28/0J0mILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO+3cKCcYFFqempFWmYOMJ5g0hIcPEoivLIBQGne4oLE3OLMdIjUKUZFKXHetz5ACQGQRE
  ZpHlwbLIYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm/Q6ynSczrwRu+iugxUxAi49d/A2
  yuCQRISXVwCRhUfFN+nVgicjjkG2es+rqVW8dkNL3O12Tr9XV5GEiLHq/O2CK7BTLC5Y2yQL/
  OF+s2F37XZ51uaQl37uLxa9c+vmUSzR11qv8zzBleM72q3PibJVod1vWmljjRq6jHBozOUJ0F
  25ynrnQvaFlUUPC39uHj9/7Lfu1J6vgbtRjo6O/3INPu0os/9ow7VRf0VJPUZV6/m5T62XcC7
  hSYht9RP+zaCYu9VwdsJT7yT3rL5VKenah0q8jtOu2We7zXNOy9/33xx4FU3oOdk7sESzu+pO
  kw/qOe4mZgNmf5PWrTwscU14yzz6v12u5YtOqS3pfbmo9mJS/zHeZxJWVB5l1wjX/sTCcUc+f
  NC9fiaU4I9FQi7moOBEAqj5xa1wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1660705083!15631!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3835 invoked from network); 17 Aug 2022 02:58:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:58:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EA97C100192
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DE8E9100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:58:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 23.2.0 -> 23.2.1
Date: Wed, 17 Aug 2022 10:57:37 +0800
Message-ID: <1660705060-17241-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
References: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98280

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_23.2.0.bb => python3-pyzmq_23.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_23.2.0.bb => python3-pyzmq_23.2.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
index 003f35d916..40cb22b5e1 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_23.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_23.2.1.bb
@@ -13,7 +13,7 @@ SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "a51f12a8719aad9dcfb55d456022f16b90abc8dde7d3ca93ce3120b40e3fa169"
+SRC_URI[sha256sum] = "2b381aa867ece7d0a82f30a0c7f3d4387b7cf2e0697e33efaa5bed6c5784abcd"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.25.1


