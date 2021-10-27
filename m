Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2BDC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 05:32:20 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web12.7805.1635312738714498060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 22:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h9Pwvz5r;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635312737; i=@fujitsu.com;
	bh=PV8w7c3KHypm1pCSe79S3U66L32304lpS6B70yw6BPs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h9Pwvz5rl647cjb6fINxFKWvabyAkAL6tU8kW5AZ1AqQrEqZCq5elJAb159pLCL8e
	 q3F/F56a0YV5e9mAqGlp+X5KkUOZBFA4/smTRTVtw9jNL78F1IDOzzo7GlUdkKSKec
	 Ji0PHPNksEad51MeTDij08G1F+nYZAfCOBCp0FWuBaHc8G7Kt/jxMvo+oEwCy+gU5r
	 6Mq7ZGMPUW18XP+Qp0fXz6h3mM6KcFmwd+banZHa3zf1jhDLNsBE5OnXQUCMiTZOZl
	 1ckduiizRvVWn5hTvjYJ6DAxslu7hEyFkRJSzbA5+lWciv//SpZSUTZclDLbBEQqLn
	 xdtHcYXdiDyQw==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id E4/05-30013-064E8716;
 Wed, 27 Oct 2021 05:32:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRopvwpCL
  R4MQOXouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP5h+NsBdOEKu4t+8/WwPiWv4uRi0NIYDaT
  xI+nX9kgnD2MEsuePWbsYuTkYBPQlTj3eC07iC0ioC+xdPYeZhBbWMBHYu2PbjCbRUBVYt7ah
  WA2r4C7xP6la1hBbAkBBYkpD99DxQUlTs58wgJiMwtISBx88QIozgFUoygxe7o8RHmFxOvDl5
  gnMPLMQtIxC0nHAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaWQGxiopdYpZuol1qqW55aXKJ
  rqJdYXqxXXJmbnJOil5dasokRGEYpBQcm7GDc//qD3iFGSQ4mJVFe320ViUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeBUeAeUEi1LTUyvSMnOAIQ2TluDgURLhPQGS5i0uSMwtzkyHSJ1i1OV49
  3PxImYhlrz8vFQpcd57N4GKBECKMkrz4EbA4usSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  HeeyCreDLzSuA2vQI6ggnoCGYlsCNKEhFSUg1M+6d5rGtryZQ8V2v9Ufqnw6nbtfoPu0PW5Nw
  oyO1RLb2478dS/YVhfTNK9k8U4irutFddvPiu3yVPjttOyQZN20VfPt/24UJsG3vYM7UDwS6/
  Y7KVViSqZF/gsnoQXLDrYNIEztWvvyxL3eb76al4T69NYqJvdu7iHnaN6YWf7hrHLijq7NtSs
  UUo0rJj538Zhpruj5uvb21kmp782k3NedptgeNtD5/HF1pMeLvT7JGfxPG8czvqTaPzPR3WTB
  S6Wr7I0ezlZ2v9+KlFYWrXZm4Xka+8mb724HOv/fv9a7j4/FaUVu/LXsE2+Yz3QlthPa3AXiu
  v0jsK62+82OcXfveaVPBh10DFXwv2B5gpsRRnJBpqMRcVJwIAKIK/9CoDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-265.messagelabs.com!1635312735!1693519!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4272 invoked from network); 27 Oct 2021 05:32:16 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Oct 2021 05:32:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19R5WFJJ003460
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 06:32:15 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 27 Oct 2021 06:32:14 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 1.1.1 -> 1.1.2
Date: Wed, 27 Oct 2021 22:32:13 +0800
Message-ID: <1635345133-3545-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 05:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93622

1.1.2 (2021-09-29)
==================

- Fix a potential crash due to a reference counting error when Python
  subclasses of ``greenlet.greenlet`` were deallocated. The crash
  became more common on Python 3.10; on earlier versions, silent
  memory corruption could result. See `issue 245
  <https://github.com/python-greenlet/greenlet/issues/245>`_. Patch by
  fygao-wish.
- Fix a leak of a list object when the last reference to a greenlet
  was deleted from some other thread than the one to which it
  belonged. For this to work correctly, you must call a greenlet API
  like ``getcurrent()`` before the thread owning the greenlet exits:
  this is a long-standing limitation that can also lead to the leak of
  a thread's main greenlet if not called; we hope to lift this
  limitation. Note that in some cases this may also fix leaks of
  greenlet objects themselves. See `issue 251
  <https://github.com/python-greenlet/greenlet/issues/251>`_.
- Python 3.10: Tracing or profiling into a spawned greenlet didn't
  work as expected. See `issue 256
  <https://github.com/python-greenlet/greenlet/issues/256>`_, reported
  by Joe Rickerby.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-greenlet_1.1.1.bb => python3-greenlet_1.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.1.1.bb => python3-greenlet_1.1.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
index 9d014ec7a..07c1436bf 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "c0f22774cd8294078bdf7392ac73cf00bfa1e5e0ed644bd064fdabc5f2a2f481"
+SRC_URI[sha256sum] = "e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df76a0767e356b1744a"
 
 inherit pypi distutils3 setuptools3
-- 
2.25.1


