Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92553C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:06:50 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.8944.1678889200455860765
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vbfUCQ+p;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889198; i=@fujitsu.com;
	bh=DNzyISgKwWjNEwU7E1ALA/esb+wda6XOVOUfIgib+XQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vbfUCQ+p2jBBAszkuowY0Xe/jEAzF45dWvOTdJQc2W4/tPhmqyDYytZx8/h7WyoF4
	 U1HMpWeXdsjRCBT6pjelX59pclQSHIvipRXBl2vlseazFl9yixf4K/QyC5EOXqvA79
	 cksJVffy9bXyECMunKC3LK0ccdb6oIQgxJI1juH2cXxxv8PQu/m6mXHYcWMhEv62Gn
	 /fvhjo+dLDxAGAIlh7Y+h8FoY/+aJ7udkR46yGFPIt8fDhmdgK6ghGyTG5+lXoBcP0
	 GgZk0KGSr0eL9caVCQ3HUzLhxwWXUBC3+/Z2AteT43NnJgmIvvd/ZNqkeG+/mRDtgy
	 9KWdO+VtAjLXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpPvugmC
  KwdROcYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePNpWlMBYs4K961r2RuYDzA0cXIxSEk8JBR
  4tLOpawQzhUmibc7tjJCOHsYJe4e+8DcxcjJwSYgJXHj/n82EFtEQF9i6ew9YHFmARWJF7972
  EFsYQFvifnT74LVsAioSnQ1PwazeQWcJJa/OgtmSwgoSEx5+B6sl1PAWeLFydMsILYQUM2ixS
  2sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA3N9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelmLl8B+P2vr96hxglOZiURHn/rBFIEeJLyk+pzEgszogvKs1JLT7EKMPBoSTB+
  ++MYIqQYFFqempFWmYOMJZg0hIcPEoivKnngdK8xQWJucWZ6RCpU4yKUuK8f0ESAiCJjNI8uD
  ZY/F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7DGQ7T2ZeCdz0V0CLmYAW884TAFlckoi
  QkmpgEn4c13dwhdq3az/K790QK26Vsg1r/h/o55s803PpPvMPqpvldEvn7mJ2ulqjtSM6zqc/
  d23S8XTJVYcylSTv7CjxWKN6SUnCKPYNm/D+IwoTxd9zNQW4zp7h/3G/54LlKfUT03jOTdBI5
  NzezbpyjRCT2sZHes+ibnsrn7o02WtO25SybWGTuRk+GtR+s4vcvlz1/gEGo/fzzPedC9brda
  5/9ndl4Y+lPoGT0rjvN37Q+7p6voLWW4FtP+rPrTLLX6y2cE2o8qEVvhcEGzyiGmSENbe8m9F
  XmFl27eK3ijePp05YE5jMt7npVeqWTE692SYz/qVKs3O8Y5XKckpVeV+qElq748bVgnmfFuhd
  VmIpzkg01GIuKk4EAFmWIgdaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1678889198!166159!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10601 invoked from network); 15 Mar 2023 14:06:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:06:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F39681AD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:37 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E88871AC
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:06:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-msgpack: upgrade 1.0.4 -> 1.0.5
Date: Wed, 15 Mar 2023 22:06:06 +0800
Message-ID: <1678889166-20681-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
References: <1678889166-20681-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101547

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-msgpack_1.0.4.bb => python3-msgpack_1.0.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.4.bb => python3-msgpack_1.0.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb
index a796d7cb5..3965dad8e 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "f5d869c18f030202eb412f08b28d2afeea553d6613aee89e200d7aca7ef01f5f"
+SRC_URI[sha256sum] = "c075544284eadc5cddc70f4757331d99dcbc16b2bbd4849d15f8aae4cf36d31c"
 
 RDEPENDS:${PN}:class-target += "\
     ${PYTHON_PN}-io \
-- 
2.34.1


